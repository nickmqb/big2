Box2 struct {
	x0 float
	y0 float
	x1 float
	y1 float

	cons(x0 float, y0 float, x1 float, y1 float) {
		return Box2 { x0: x0, y0: y0, x1: x1, y1: y1 }
	}

	fromSize(x float, y float, w float, h float) {
		return Box2 { x0: x, y0: y, x1: x + w, y1: y + h }
	}

	scale2(b Box2, s Vector2) {
		return Box2 { x0: b.x0 * s.x, y0: b.y0 * s.y, x1: b.x1 * s.x, y1: b.y1 * s.y }
	}
}

Image struct {
	width int
	height int
	data pointer

	cons(width int, height int) {
		return Image { width: width, height: height, data: ::currentAllocator.alloc(CheckedMath.mulPositiveInt(width, height)) }
	}

	drawImage(target Image, source Image, tx int, ty int) {
		assert(0 <= tx && tx + source.width <= target.width)
		assert(0 <= ty && ty + source.height <= target.height)
		tp := transmute(target.data, usize)
		sp := transmute(source.data, usize)
		tstride := checked_cast(target.width * 4, uint)
		sstride := checked_cast(source.width * 4, uint)
		for y := 0; y < source.height {
			from := sp + cast(y, uint) * sstride
			to := tp + cast(ty + y, uint) * tstride + cast(tx, uint) * 4_u
			Memory.memcpy(transmute(to, pointer), transmute(from, pointer), sstride)
		}
	}
}

ByteColor4 {
	:black ByteColor4 #Mutable
	:white ByteColor4 #Mutable
	:gold ByteColor4 #Mutable
	:lime ByteColor4 #Mutable

	static_init() {
		black = ByteColor4.rgb(0, 0, 0)
		white = ByteColor4.rgb(255, 255, 255)
		gold = ByteColor4.rgb(255, 236, 96)
		lime = ByteColor4.rgb(0, 255, 0)
	}
}

loadPng(filename cstring) {
	x := 0
	y := 0
	channels := 0
	data := stbi_load(filename, ref x, ref y, ref channels, 4)
	assert(data != null)
	return Image { width: x, height: y, data: pointer_cast(data, pointer) }
}

createTextureFromImage(image *Image) {
	textureID := 0_u
	glGenTextures(1, ref textureID)
	glBindTexture(GL_TEXTURE_2D, textureID)

	glPixelStorei(GL_UNPACK_ALIGNMENT, 4)
	glTexImage2D(
		GL_TEXTURE_2D,
		0,
		cast(GL_RGBA8, int),
		image.width,
		image.height,
		0,
		GL_RGBA,
		GL_UNSIGNED_BYTE,
		image.data)

	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, checked_cast(GL_CLAMP_TO_EDGE, int))
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, checked_cast(GL_CLAMP_TO_EDGE, int))
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, checked_cast(GL_NEAREST, int))
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, checked_cast(GL_NEAREST, int))

	return Texture { id: textureID, size: IntVector2(image.width, image.height), format: GL_RGBA }
}


CharInfo struct {
	bounds IntBox2
	offset IntVector2
	advance int
}


StringIndex struct {
	s string
	index int
}

readToken(si *StringIndex) {
	while si.index < si.s.length && si.s[si.index] == ' ' {
		si.index += 1
	}
	if si.index == si.s.length {
		return ""
	}
	from := si.index
	while si.index < si.s.length && si.s[si.index] != ' ' {
		si.index += 1
	}
	return si.s.slice(from, si.index)
}


FontInfo struct #RefType {
	chars Array<CharInfo>
	height int
	
	parseValue(s string, name string) {
		assert(s.startsWith(name))
		index := s.indexOfChar('=')
		assert(index >= 0)
		return int.tryParse(s.slice(index + 1, s.length)).unwrap()
	}

	from(desc string) {
		result := FontInfo { chars: new Array<CharInfo>(256) }

		lines := desc.split('\n')
		for ln in lines {
			if !ln.startsWith("char ") {
				continue
			}
			si := ref StringIndex { s: ln }
			assert(readToken(si) == "char")
			id := parseValue(readToken(si), "id=")
			assert(32 <= id && id < 256)
			x := parseValue(readToken(si), "x=")
			y := parseValue(readToken(si), "y=")
			w := parseValue(readToken(si), "width=")
			h := parseValue(readToken(si), "height=")
			xo := parseValue(readToken(si), "xoffset=")
			yo := parseValue(readToken(si), "yoffset=")
			xa := parseValue(readToken(si), "xadvance=")
			
			result.chars[id] = CharInfo {
				bounds: IntBox2.fromXYWidthHeight(x, y, w, h),
				offset: IntVector2(xo, yo),
				advance: xa,
			}

			if id > 32 {
				result.height = max(result.height, yo + h)
			}
		}

		return result
	}

	getTextSize(fontInfo FontInfo, s string) {
		x := 0
		for i := 0; i < s.length {
			ch := s[i]
			id := transmute(ch, int)
			ci := fontInfo.chars[id]
			if id <= 32 {
				x += fontInfo.chars[32].advance
				continue
			}
			x += ci.advance
		}
		return IntVector2 { x: x, y: fontInfo.height } 
	}

}


VertexPos2fColor4b struct {
	pos Vector2
	color ByteColor4

	cons(x float, y float, color ByteColor4) {
		return VertexPos2fColor4b { pos: Vector2(x, y), color: color }
	}
}

VertexPos2fTex2fColor4b struct {
	pos Vector2
	tex Vector2
	color ByteColor4

	cons(x float, y float, tx float, ty float, color ByteColor4) {
		return VertexPos2fTex2fColor4b { pos: Vector2(x, y), tex: Vector2(tx, ty), color: color }
	}
}


VertexPos2fColor4b_Buffer struct #RefType {
	vao uint
	vbo uint

	:maxNumVertices = 16384

	init() {
		s := new VertexPos2fColor4b_Buffer{}

		glGenVertexArrays(1, ref s.vao)
		glGenBuffers(1, ref s.vbo)
		
		glBindVertexArray(s.vao)
		glBindBuffer(GL_ARRAY_BUFFER, s.vbo)
		glBufferData(GL_ARRAY_BUFFER, sizeof(VertexPos2fColor4b) * maxNumVertices, null, GL_DYNAMIC_DRAW)

		glVertexAttribPointer(0, 2, GL_FLOAT, false, sizeof(VertexPos2fColor4b), null)
		glEnableVertexAttribArray(0)

		glVertexAttribPointer(1, 4, GL_UNSIGNED_BYTE, true, sizeof(VertexPos2fColor4b), transmute(8, pointer))
		glEnableVertexAttribArray(1)

		return s
	}

	render(s VertexPos2fColor4b_Buffer, vertices FixedCapList<VertexPos2fColor4b>) {
		assert(vertices.count <= maxNumVertices)

		if vertices.count == 0 {
			return
		}

		glBindVertexArray(s.vao)

		glBindBuffer(GL_ARRAY_BUFFER, s.vbo)
		glBufferSubData(GL_ARRAY_BUFFER, 0, sizeof(VertexPos2fColor4b) * vertices.count, vertices.dataPtr)

		glDrawArrays(GL_TRIANGLES, 0, vertices.count)
	}
}


ColorEffect struct #RefType {
	vs uint
	fs uint
	program uint
	u_transform int

	init() {
		s := new ColorEffect{}

		s.vs = createShader(GL_VERTEX_SHADER, readFile("runtime_files/color_vs.glsl", "vs"))
		s.fs = createShader(GL_FRAGMENT_SHADER, readFile("runtime_files/color_fs.glsl", "fs"))
		s.program = createProgram(s.vs, s.fs)
		s.u_transform = glGetUniformLocation(s.program, pointer_cast("transform\0".dataPtr, *sbyte))

		return s
	}

	begin(s ColorEffect, transform Matrix) {
		glUseProgram(s.program)
		glUniformMatrix4fv(s.u_transform, 1, false, ref transform.m00)
	}
}

GradientEffect struct #RefType {
	vs uint
	fs uint
	program uint
	u_transform int

	init() {
		s := new GradientEffect{}

		s.vs = createShader(GL_VERTEX_SHADER, readFile("runtime_files/gradient_vs.glsl", "vs"))
		s.fs = createShader(GL_FRAGMENT_SHADER, readFile("runtime_files/color_fs.glsl", "fs"))
		s.program = createProgram(s.vs, s.fs)
		s.u_transform = glGetUniformLocation(s.program, pointer_cast("transform\0".dataPtr, *sbyte))

		return s
	}

	begin(s GradientEffect, transform Matrix) {
		glUseProgram(s.program)
		glUniformMatrix4fv(s.u_transform, 1, false, ref transform.m00)
	}
}

TextEffect struct #RefType {
	vs uint
	fs uint
	program uint
	u_transform int
	u_sampler int
	vao uint
	vbo uint
	fontInfo FontInfo
	textureID uint

	:maxNumChars = 1024

	init() {
		s := new TextEffect{}

		s.vs = createShader(GL_VERTEX_SHADER, readFile("runtime_files/text_vs.glsl", "vs"))
		s.fs = createShader(GL_FRAGMENT_SHADER, readFile("runtime_files/text_fs.glsl", "fs"))
		s.textureID = loadTexture()
		s.program = createProgram(s.vs, s.fs)
		s.u_transform = glGetUniformLocation(s.program, pointer_cast("transform\0".dataPtr, *sbyte))
		s.u_sampler = glGetUniformLocation(s.program, pointer_cast("sampler\0".dataPtr, *sbyte))

		s.fontInfo = new FontInfo.from(readFile("runtime_files/marko_one.txt", "font"))

		glGenVertexArrays(1, ref s.vao)
		glGenBuffers(1, ref s.vbo)
		
		glBindVertexArray(s.vao)
		glBindBuffer(GL_ARRAY_BUFFER, s.vbo)
		glBufferData(GL_ARRAY_BUFFER, sizeof(VertexPos2fColor4b) * 6 * maxNumChars, null, GL_DYNAMIC_DRAW)

		glVertexAttribPointer(0, 2, GL_FLOAT, false, sizeof(VertexPos2fTex2fColor4b), null)
		glEnableVertexAttribArray(0)

		glVertexAttribPointer(1, 2, GL_FLOAT, false, sizeof(VertexPos2fTex2fColor4b), transmute(8, pointer))
		glEnableVertexAttribArray(1)

		glVertexAttribPointer(2, 4, GL_UNSIGNED_BYTE, true, sizeof(VertexPos2fTex2fColor4b), transmute(16, pointer))
		glEnableVertexAttribArray(2)

		return s
	}

	loadTexture() {
		textureID := 0_u
		glGenTextures(1, ref textureID)
		glBindTexture(GL_TEXTURE_2D, textureID)

		font := loadPng("runtime_files/marko_one_0.png")

		glPixelStorei(GL_UNPACK_ALIGNMENT, 4)
		glTexImage2D(
			GL_TEXTURE_2D,
			0,
			cast(GL_R8, int),
			font.width,
			font.height,
			0,
			GL_RGBA,
			GL_UNSIGNED_BYTE,
			font.data)

		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, checked_cast(GL_CLAMP_TO_EDGE, int))
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, checked_cast(GL_CLAMP_TO_EDGE, int))
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, checked_cast(GL_NEAREST, int))
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, checked_cast(GL_NEAREST, int))

		return textureID
	}

	begin(s TextEffect, transform Matrix) {
		glUseProgram(s.program)
		glUniformMatrix4fv(s.u_transform, 1, false, ref transform.m00)
		glUniform1i(s.u_sampler, 0)
	}

	render(s TextEffect, vertices FixedCapList<VertexPos2fTex2fColor4b>) {
		assert(vertices.count <= maxNumChars * 6)

		if vertices.count == 0 {
			return
		}

		glBindVertexArray(s.vao)

		glActiveTexture(GL_TEXTURE0)
		glBindTexture(GL_TEXTURE_2D, s.textureID)

		glBindBuffer(GL_ARRAY_BUFFER, s.vbo)
		glBufferSubData(GL_ARRAY_BUFFER, 0, sizeof(VertexPos2fTex2fColor4b) * vertices.count, vertices.dataPtr)

		glDrawArrays(GL_TRIANGLES, 0, vertices.count)
	}
}


SpriteEffect struct #RefType {
	vs uint
	fs uint
	program uint
	u_transform int
	u_sampler int
	vao uint
	vbo uint

	:maxNumSprites = 1024

	init() {
		s := new SpriteEffect{}

		s.vs = createShader(GL_VERTEX_SHADER, readFile("runtime_files/sprite_vs.glsl", "vs"))
		s.fs = createShader(GL_FRAGMENT_SHADER, readFile("runtime_files/sprite_fs.glsl", "fs"))
		s.program = createProgram(s.vs, s.fs)
		s.u_transform = glGetUniformLocation(s.program, pointer_cast("transform\0".dataPtr, *sbyte))
		s.u_sampler = glGetUniformLocation(s.program, pointer_cast("sampler\0".dataPtr, *sbyte))

		glGenVertexArrays(1, ref s.vao)
		glGenBuffers(1, ref s.vbo)
		
		glBindVertexArray(s.vao)
		glBindBuffer(GL_ARRAY_BUFFER, s.vbo)
		glBufferData(GL_ARRAY_BUFFER, sizeof(VertexPos2fTex2fColor4b) * 6 * maxNumSprites, null, GL_DYNAMIC_DRAW)

		glVertexAttribPointer(0, 2, GL_FLOAT, false, sizeof(VertexPos2fTex2fColor4b), null)
		glEnableVertexAttribArray(0)

		glVertexAttribPointer(1, 2, GL_FLOAT, false, sizeof(VertexPos2fTex2fColor4b), transmute(8, pointer))
		glEnableVertexAttribArray(1)

		glVertexAttribPointer(2, 4, GL_UNSIGNED_BYTE, true, sizeof(VertexPos2fTex2fColor4b), transmute(16, pointer))
		glEnableVertexAttribArray(2)

		return s
	}

	begin(s SpriteEffect, transform Matrix) {
		glUseProgram(s.program)
		glUniformMatrix4fv(s.u_transform, 1, false, ref transform.m00)
		glUniform1i(s.u_sampler, 0)
	}

	render(s SpriteEffect, vertices FixedCapList<VertexPos2fTex2fColor4b>, textureID uint) {
		assert(vertices.count <= maxNumSprites * 6)

		if vertices.count == 0 {
			return
		}

		glBindVertexArray(s.vao)

		glActiveTexture(GL_TEXTURE0)
		glBindTexture(GL_TEXTURE_2D, textureID)

		glBindBuffer(GL_ARRAY_BUFFER, s.vbo)
		glBufferSubData(GL_ARRAY_BUFFER, 0, sizeof(VertexPos2fTex2fColor4b) * vertices.count, vertices.dataPtr)

		glDrawArrays(GL_TRIANGLES, 0, vertices.count)
	}
}

GeometryHelper {
	rect(x0 float, y0 float, x1 float, y1 float, color ByteColor4, vertices FixedCapList<VertexPos2fColor4b>) {
		vertices.add(VertexPos2fColor4b(x0, y1, color))
		vertices.add(VertexPos2fColor4b(x0, y0, color))
		vertices.add(VertexPos2fColor4b(x1, y0, color))
		vertices.add(VertexPos2fColor4b(x0, y1, color))
		vertices.add(VertexPos2fColor4b(x1, y0, color))
		vertices.add(VertexPos2fColor4b(x1, y1, color))
	}

	mesh(x0 float, y0 float, x1 float, y1 float, xst int, yst int, color ByteColor4, vertices FixedCapList<VertexPos2fColor4b>) {
		dx := (x1 - x0) / xst
		dy := (y1 - y0) / yst
		for y := 0; y < yst {
			for x := 0; x < xst {
				rx := x0 + x * dx
				ry := y0 + y * dy
				rect(rx, ry, rx + dx, ry + dy, color, vertices)
			}
		}
	}

	border(x0 float, y0 float, x1 float, y1 float, thickness float, color ByteColor4, vertices FixedCapList<VertexPos2fColor4b>) {
		rect(x0, y0, x1, y0 + thickness, color, vertices)
		rect(x1 - thickness, y0 + thickness, x1, y1 - thickness, color, vertices)
		rect(x0, y1 - thickness, x1, y1, color, vertices)
		rect(x0, y0 + thickness, x0 + thickness, y1 - thickness, color, vertices)
	}

	texturedQuad(x0 float, y0 float, x1 float, y1 float, tx0 float, ty0 float, tx1 float, ty1 float, vertices FixedCapList<VertexPos2fTex2fColor4b>) {
		color := ByteColor4.rgb(255, 255, 255)
		vertices.add(VertexPos2fTex2fColor4b(x0, y1, tx0, ty1, color))
		vertices.add(VertexPos2fTex2fColor4b(x0, y0, tx0, ty0, color))
		vertices.add(VertexPos2fTex2fColor4b(x1, y0, tx1, ty0, color))
		vertices.add(VertexPos2fTex2fColor4b(x0, y1, tx0, ty1, color))
		vertices.add(VertexPos2fTex2fColor4b(x1, y0, tx1, ty0, color))
		vertices.add(VertexPos2fTex2fColor4b(x1, y1, tx1, ty1, color))
	}

	sprite(x float, y float, scale float, texCoords Box2, texSize IntVector2, vertices FixedCapList<VertexPos2fTex2fColor4b>) {
		w := texCoords.x1 - texCoords.x0
		h := texCoords.y1 - texCoords.y0
		box := texCoords.scale2(texSize.toVector2().invert())
		texturedQuad(x, y, x + w, y + h, box.x0, box.y0, box.x1, box.y1, vertices)
	}

	text(s string, x float, y float, color ByteColor4, scale float, fontInfo FontInfo, vertices FixedCapList<VertexPos2fTex2fColor4b>) {
		for i := 0; i < s.length {
			x += character(s[i], x, y, color, scale, fontInfo, vertices)
		}
	}

	character(ch char, x float, y float, color ByteColor4, scale float, fontInfo FontInfo, vertices FixedCapList<VertexPos2fTex2fColor4b>) {
		id := transmute(ch, int)
		if id <= 32 {
			return fontInfo.chars[32].advance * scale
		}

		ci := fontInfo.chars[id]
		x0 := x + ci.offset.x * scale
		x1 := x + (ci.bounds.x1 - ci.bounds.x0 + ci.offset.x) * scale
		y0 := y + ci.offset.y * scale
		y1 := y + ((ci.bounds.y1 - ci.bounds.y0) + ci.offset.y) * scale
		fw := 512.0
		fh := 512.0
		vertices.add(VertexPos2fTex2fColor4b(x0, y1, ci.bounds.x0 / fw, ci.bounds.y1 / fh, color))
		vertices.add(VertexPos2fTex2fColor4b(x0, y0, ci.bounds.x0 / fw, ci.bounds.y0 / fh, color))
		vertices.add(VertexPos2fTex2fColor4b(x1, y0, ci.bounds.x1 / fw, ci.bounds.y0 / fh, color))
		vertices.add(VertexPos2fTex2fColor4b(x0, y1, ci.bounds.x0 / fw, ci.bounds.y1 / fh, color))
		vertices.add(VertexPos2fTex2fColor4b(x1, y0, ci.bounds.x1 / fw, ci.bounds.y0 / fh, color))
		vertices.add(VertexPos2fTex2fColor4b(x1, y1, ci.bounds.x1 / fw, ci.bounds.y1 / fh, color))
		return ci.advance * scale
	}

	centeredText(s string, x float, y float, color ByteColor4, scale float, fontInfo FontInfo, vertices FixedCapList<VertexPos2fTex2fColor4b>) {
		size := fontInfo.getTextSize(s)
		GeometryHelper.text(s, x - size.x * .5 * scale, y - size.y * .5 * scale, color, scale, fontInfo, vertices)
	}
}