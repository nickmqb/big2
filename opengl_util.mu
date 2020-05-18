:pi = 3.1415926535

sin(f float) float #Foreign("sinf")
cos(f float) float #Foreign("cosf")
sqrt(f float) float #Foreign("sqrtf")
pow(x float, y float) float #Foreign("powf")

Vector2 struct {
	x float
	y float
	
	cons(x float, y float) {
		return Vector2 { x: x, y: y }
	}

	add(a Vector2, b Vector2) {
		return Vector2(a.x + b.x, a.y + b.y)
	}

	invert(v Vector2) {
		return Vector2(1 / v.x, 1 / v.y)
	}
}

Vector3 struct {
	x float
	y float
	z float
	
	cons(x float, y float, z float) {
		return Vector3 { x: x, y: y, z: z }
	}
}

Matrix struct {
	m00 float
	m01 float
	m02 float
	m03 float
	m10 float
	m11 float
	m12 float
	m13 float
	m20 float
	m21 float
	m22 float
	m23 float
	m30 float
	m31 float
	m32 float
	m33 float

	rotationZ(angle float) {
		return Matrix {
			m00: cos(angle), m10: -sin(angle),
			m01: sin(angle), m11: cos(angle),
			m22: 1,
			m33: 1
		}
	}

	ortho(x0 float, y0 float, x1 float, y1 float) {
		w := x1 - x0
		h := y1 - y0
		return Matrix {
			m00: 2 / w, m30: -(x0 + x1) / w,
			m11: 2 / h, m31: -(y0 + y1) / h,
			m22: 1,
			m33: 1
		}			
	}

	identity() {
		return Matrix { m00: 1, m11: 1, m22: 1, m33: 1 }
	}

	scale(s float) {
		return Matrix { m00: s, m11: s, m22: s, m33: 1 }
	}

	mulv3(m Matrix, v Vector3) {
		return Vector3 {
			x: m.m00 * v.x + m.m10 * v.y + m.m20 * v.z + m.m30,
			y: m.m01 * v.x + m.m11 * v.y + m.m21 * v.z + m.m31,
			z: m.m02 * v.x + m.m12 * v.y + m.m22 * v.z + m.m32,
		}
	}

	mul(a Matrix, b Matrix) {
		return Matrix {
			m00: a.m00 * b.m00 + a.m10 * b.m01 + a.m20 * b.m02 + a.m30 * b.m03,
			m01: a.m01 * b.m00 + a.m11 * b.m01 + a.m21 * b.m02 + a.m31 * b.m03,
			m02: a.m02 * b.m00 + a.m12 * b.m01 + a.m22 * b.m02 + a.m32 * b.m03,
			m03: a.m03 * b.m00 + a.m13 * b.m01 + a.m23 * b.m02 + a.m33 * b.m03,

			m10: a.m00 * b.m10 + a.m10 * b.m11 + a.m20 * b.m12 + a.m30 * b.m13,
			m11: a.m01 * b.m10 + a.m11 * b.m11 + a.m21 * b.m12 + a.m31 * b.m13,
			m12: a.m02 * b.m10 + a.m12 * b.m11 + a.m22 * b.m12 + a.m32 * b.m13,
			m13: a.m03 * b.m10 + a.m13 * b.m11 + a.m23 * b.m12 + a.m33 * b.m13,

			m20: a.m00 * b.m20 + a.m10 * b.m21 + a.m20 * b.m22 + a.m30 * b.m23,
			m21: a.m01 * b.m20 + a.m11 * b.m21 + a.m21 * b.m22 + a.m31 * b.m23,
			m22: a.m02 * b.m20 + a.m12 * b.m21 + a.m22 * b.m22 + a.m32 * b.m23,
			m23: a.m03 * b.m20 + a.m13 * b.m21 + a.m23 * b.m22 + a.m33 * b.m23,

			m30: a.m00 * b.m30 + a.m10 * b.m31 + a.m20 * b.m32 + a.m30 * b.m33,
			m31: a.m01 * b.m30 + a.m11 * b.m31 + a.m21 * b.m32 + a.m31 * b.m33,
			m32: a.m02 * b.m30 + a.m12 * b.m31 + a.m22 * b.m32 + a.m32 * b.m33,
			m33: a.m03 * b.m30 + a.m13 * b.m31 + a.m23 * b.m32 + a.m33 * b.m33,
		}
	}
}

createShader(type uint, s string) {
	id := glCreateShader(type)
	glShaderSource(id, 1, pointer_cast(ref s.dataPtr, **sbyte), ref s.length)
	glCompileShader(id)
	status := 0
	glGetShaderiv(id, GL_COMPILE_STATUS, ref status)
	assert(cast(status, uint) == GL_TRUE)
	return id
}

createProgram(vs uint, ps uint) {
	id := glCreateProgram()
	glAttachShader(id, vs)
	glAttachShader(id, ps)
	glLinkProgram(id)
	status := 0
	glGetProgramiv(id, GL_LINK_STATUS, ref status)
	assert(cast(status, uint) == GL_TRUE)
	glDetachShader(id, vs)
	glDetachShader(id, ps)
	return id
}

IntVector2 struct {
	x int
	y int

	cons(x int, y int) {
		return IntVector2 { x: x, y: y }
	}

	toVector2(v IntVector2) {
		return Vector2(v.x, v.y)
	}
}

IntBox2 struct {
	x0 int
	y0 int
	x1 int
	y1 int

	cons(x0 int, y0 int, x1 int, y1 int) {
		return IntBox2 { x0: x0, y0: y0, x1: x1, y1: y1 }
	}

	fromXYWidthHeight(x int, y int, w int, h int) {
		return IntBox2 { x0: x, y0: y, x1: x + w, y1: y + h }
	}
}

ByteColor4 struct {
	r byte
	g byte
	b byte
	a byte
	
	cons(r byte, g byte, b byte, a byte) {
		return ByteColor4 { r: r, g: g, b: b, a: a }
	}

	rgb(r byte, g byte, b byte) {
		return ByteColor4 { r: r, g: g, b: b, a: 255 }
	}

	floatRgba(r float, g float, b float, a float) {
		return ByteColor4(floatComponentToByte(r), floatComponentToByte(g), floatComponentToByte(b), floatComponentToByte(a))
	}

	floatComponentToByte(f float) {
		n := cast(f * 255.0 + .5, int)
		if n <= 0 {
			return 0_b
		} else if n >= 255 {
			return 255_b
		}
		return cast(n, byte)
	}
}

copyPixels(from Array<byte>, fromStride int, bytesPerPixel int, fromX0 int, fromY0 int, fromX1 int, fromY1 int, to Array<byte>, toStride int, toX int, toY int) {
	for y := fromY0; y < fromY1 {
		for x := fromX0; x < fromX1 {
			f := y * fromStride + x * bytesPerPixel
			t := (y - fromY0 + toY) * toStride + (x - fromX0 + toX) * bytesPerPixel
			for i := 0; i < bytesPerPixel {
				to[t + i] = from[f + i]
			}
		}
	}
}

Texture struct #RefType {
	id uint
	size IntVector2
	format uint
}

createTexture(w int, h int, internalformat int, format uint) {
	textureID := 0_u
	glGenTextures(1, ref textureID)
	glBindTexture(GL_TEXTURE_2D, textureID)

	glTexImage2D(
		GL_TEXTURE_2D,
		0,
		internalformat,
		w,
		h,
		0,
		format,
		GL_UNSIGNED_BYTE,
		null)

	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, checked_cast(GL_CLAMP_TO_EDGE, int))
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, checked_cast(GL_CLAMP_TO_EDGE, int))
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, checked_cast(GL_NEAREST, int))
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, checked_cast(GL_NEAREST, int))

	return Texture { id: textureID, size: IntVector2(w, h), format: format }
}

updateTexture(tex Texture, dataPtr pointer) {
	glBindTexture(GL_TEXTURE_2D, tex.id)
	glPixelStorei(GL_UNPACK_ALIGNMENT, 1)
	glTexSubImage2D(
		GL_TEXTURE_2D,
		0,
		0, 0, tex.size.x, tex.size.y,
		tex.format,
		GL_UNSIGNED_BYTE,
		dataPtr)
}

deleteTexture(tex Texture) {
	if tex == null {
		return
	}
	glDeleteTextures(1, ref tex.id)
}
