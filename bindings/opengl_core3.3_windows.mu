:glActiveTexture_procAddress fun<uint, void> #Mutable
glActiveTexture(texture uint) void {
	if glActiveTexture_procAddress == null {
		glActiveTexture_procAddress = pointer_cast(wglGetProcAddressChecked("glActiveTexture"), fun<uint, void>)
	}
	glActiveTexture_procAddress(texture)
}

:glAttachShader_procAddress fun<uint, uint, void> #Mutable
glAttachShader(program uint, shader uint) void {
	if glAttachShader_procAddress == null {
		glAttachShader_procAddress = pointer_cast(wglGetProcAddressChecked("glAttachShader"), fun<uint, uint, void>)
	}
	glAttachShader_procAddress(program, shader)
}

:glBeginConditionalRender_procAddress fun<uint, uint, void> #Mutable
glBeginConditionalRender(id uint, mode uint) void {
	if glBeginConditionalRender_procAddress == null {
		glBeginConditionalRender_procAddress = pointer_cast(wglGetProcAddressChecked("glBeginConditionalRender"), fun<uint, uint, void>)
	}
	glBeginConditionalRender_procAddress(id, mode)
}

:glBeginQuery_procAddress fun<uint, uint, void> #Mutable
glBeginQuery(target uint, id uint) void {
	if glBeginQuery_procAddress == null {
		glBeginQuery_procAddress = pointer_cast(wglGetProcAddressChecked("glBeginQuery"), fun<uint, uint, void>)
	}
	glBeginQuery_procAddress(target, id)
}

:glBeginTransformFeedback_procAddress fun<uint, void> #Mutable
glBeginTransformFeedback(primitiveMode uint) void {
	if glBeginTransformFeedback_procAddress == null {
		glBeginTransformFeedback_procAddress = pointer_cast(wglGetProcAddressChecked("glBeginTransformFeedback"), fun<uint, void>)
	}
	glBeginTransformFeedback_procAddress(primitiveMode)
}

:glBindAttribLocation_procAddress fun<uint, uint, *sbyte, void> #Mutable
glBindAttribLocation(program uint, index uint, name *sbyte) void {
	if glBindAttribLocation_procAddress == null {
		glBindAttribLocation_procAddress = pointer_cast(wglGetProcAddressChecked("glBindAttribLocation"), fun<uint, uint, *sbyte, void>)
	}
	glBindAttribLocation_procAddress(program, index, name)
}

:glBindBuffer_procAddress fun<uint, uint, void> #Mutable
glBindBuffer(target uint, buffer uint) void {
	if glBindBuffer_procAddress == null {
		glBindBuffer_procAddress = pointer_cast(wglGetProcAddressChecked("glBindBuffer"), fun<uint, uint, void>)
	}
	glBindBuffer_procAddress(target, buffer)
}

:glBindBufferBase_procAddress fun<uint, uint, uint, void> #Mutable
glBindBufferBase(target uint, index uint, buffer uint) void {
	if glBindBufferBase_procAddress == null {
		glBindBufferBase_procAddress = pointer_cast(wglGetProcAddressChecked("glBindBufferBase"), fun<uint, uint, uint, void>)
	}
	glBindBufferBase_procAddress(target, index, buffer)
}

:glBindBufferRange_procAddress fun<uint, uint, uint, ssize, ssize, void> #Mutable
glBindBufferRange(target uint, index uint, buffer uint, offset ssize, size ssize) void {
	if glBindBufferRange_procAddress == null {
		glBindBufferRange_procAddress = pointer_cast(wglGetProcAddressChecked("glBindBufferRange"), fun<uint, uint, uint, ssize, ssize, void>)
	}
	glBindBufferRange_procAddress(target, index, buffer, offset, size)
}

:glBindFragDataLocation_procAddress fun<uint, uint, *sbyte, void> #Mutable
glBindFragDataLocation(program uint, color uint, name *sbyte) void {
	if glBindFragDataLocation_procAddress == null {
		glBindFragDataLocation_procAddress = pointer_cast(wglGetProcAddressChecked("glBindFragDataLocation"), fun<uint, uint, *sbyte, void>)
	}
	glBindFragDataLocation_procAddress(program, color, name)
}

:glBindFragDataLocationIndexed_procAddress fun<uint, uint, uint, *sbyte, void> #Mutable
glBindFragDataLocationIndexed(program uint, colorNumber uint, index uint, name *sbyte) void {
	if glBindFragDataLocationIndexed_procAddress == null {
		glBindFragDataLocationIndexed_procAddress = pointer_cast(wglGetProcAddressChecked("glBindFragDataLocationIndexed"), fun<uint, uint, uint, *sbyte, void>)
	}
	glBindFragDataLocationIndexed_procAddress(program, colorNumber, index, name)
}

:glBindFramebuffer_procAddress fun<uint, uint, void> #Mutable
glBindFramebuffer(target uint, framebuffer uint) void {
	if glBindFramebuffer_procAddress == null {
		glBindFramebuffer_procAddress = pointer_cast(wglGetProcAddressChecked("glBindFramebuffer"), fun<uint, uint, void>)
	}
	glBindFramebuffer_procAddress(target, framebuffer)
}

:glBindRenderbuffer_procAddress fun<uint, uint, void> #Mutable
glBindRenderbuffer(target uint, renderbuffer uint) void {
	if glBindRenderbuffer_procAddress == null {
		glBindRenderbuffer_procAddress = pointer_cast(wglGetProcAddressChecked("glBindRenderbuffer"), fun<uint, uint, void>)
	}
	glBindRenderbuffer_procAddress(target, renderbuffer)
}

:glBindSampler_procAddress fun<uint, uint, void> #Mutable
glBindSampler(unit uint, sampler uint) void {
	if glBindSampler_procAddress == null {
		glBindSampler_procAddress = pointer_cast(wglGetProcAddressChecked("glBindSampler"), fun<uint, uint, void>)
	}
	glBindSampler_procAddress(unit, sampler)
}

:glBindVertexArray_procAddress fun<uint, void> #Mutable
glBindVertexArray(array uint) void {
	if glBindVertexArray_procAddress == null {
		glBindVertexArray_procAddress = pointer_cast(wglGetProcAddressChecked("glBindVertexArray"), fun<uint, void>)
	}
	glBindVertexArray_procAddress(array)
}

:glBlendColor_procAddress fun<float, float, float, float, void> #Mutable
glBlendColor(red float, green float, blue float, alpha float) void {
	if glBlendColor_procAddress == null {
		glBlendColor_procAddress = pointer_cast(wglGetProcAddressChecked("glBlendColor"), fun<float, float, float, float, void>)
	}
	glBlendColor_procAddress(red, green, blue, alpha)
}

:glBlendEquation_procAddress fun<uint, void> #Mutable
glBlendEquation(mode uint) void {
	if glBlendEquation_procAddress == null {
		glBlendEquation_procAddress = pointer_cast(wglGetProcAddressChecked("glBlendEquation"), fun<uint, void>)
	}
	glBlendEquation_procAddress(mode)
}

:glBlendEquationSeparate_procAddress fun<uint, uint, void> #Mutable
glBlendEquationSeparate(modeRGB uint, modeAlpha uint) void {
	if glBlendEquationSeparate_procAddress == null {
		glBlendEquationSeparate_procAddress = pointer_cast(wglGetProcAddressChecked("glBlendEquationSeparate"), fun<uint, uint, void>)
	}
	glBlendEquationSeparate_procAddress(modeRGB, modeAlpha)
}

:glBlendFuncSeparate_procAddress fun<uint, uint, uint, uint, void> #Mutable
glBlendFuncSeparate(sfactorRGB uint, dfactorRGB uint, sfactorAlpha uint, dfactorAlpha uint) void {
	if glBlendFuncSeparate_procAddress == null {
		glBlendFuncSeparate_procAddress = pointer_cast(wglGetProcAddressChecked("glBlendFuncSeparate"), fun<uint, uint, uint, uint, void>)
	}
	glBlendFuncSeparate_procAddress(sfactorRGB, dfactorRGB, sfactorAlpha, dfactorAlpha)
}

:glBlitFramebuffer_procAddress fun<int, int, int, int, int, int, int, int, uint, uint, void> #Mutable
glBlitFramebuffer(srcX0 int, srcY0 int, srcX1 int, srcY1 int, dstX0 int, dstY0 int, dstX1 int, dstY1 int, mask uint, filter uint) void {
	if glBlitFramebuffer_procAddress == null {
		glBlitFramebuffer_procAddress = pointer_cast(wglGetProcAddressChecked("glBlitFramebuffer"), fun<int, int, int, int, int, int, int, int, uint, uint, void>)
	}
	glBlitFramebuffer_procAddress(srcX0, srcY0, srcX1, srcY1, dstX0, dstY0, dstX1, dstY1, mask, filter)
}

:glBufferData_procAddress fun<uint, ssize, pointer, uint, void> #Mutable
glBufferData(target uint, size ssize, data pointer, usage uint) void {
	if glBufferData_procAddress == null {
		glBufferData_procAddress = pointer_cast(wglGetProcAddressChecked("glBufferData"), fun<uint, ssize, pointer, uint, void>)
	}
	glBufferData_procAddress(target, size, data, usage)
}

:glBufferSubData_procAddress fun<uint, ssize, ssize, pointer, void> #Mutable
glBufferSubData(target uint, offset ssize, size ssize, data pointer) void {
	if glBufferSubData_procAddress == null {
		glBufferSubData_procAddress = pointer_cast(wglGetProcAddressChecked("glBufferSubData"), fun<uint, ssize, ssize, pointer, void>)
	}
	glBufferSubData_procAddress(target, offset, size, data)
}

:glCheckFramebufferStatus_procAddress fun<uint, uint> #Mutable
glCheckFramebufferStatus(target uint) uint {
	if glCheckFramebufferStatus_procAddress == null {
		glCheckFramebufferStatus_procAddress = pointer_cast(wglGetProcAddressChecked("glCheckFramebufferStatus"), fun<uint, uint>)
	}
	return glCheckFramebufferStatus_procAddress(target)
}

:glClampColor_procAddress fun<uint, uint, void> #Mutable
glClampColor(target uint, clamp uint) void {
	if glClampColor_procAddress == null {
		glClampColor_procAddress = pointer_cast(wglGetProcAddressChecked("glClampColor"), fun<uint, uint, void>)
	}
	glClampColor_procAddress(target, clamp)
}

:glClearBufferfi_procAddress fun<uint, int, float, int, void> #Mutable
glClearBufferfi(buffer uint, drawbuffer int, depth float, stencil int) void {
	if glClearBufferfi_procAddress == null {
		glClearBufferfi_procAddress = pointer_cast(wglGetProcAddressChecked("glClearBufferfi"), fun<uint, int, float, int, void>)
	}
	glClearBufferfi_procAddress(buffer, drawbuffer, depth, stencil)
}

:glClearBufferfv_procAddress fun<uint, int, *float, void> #Mutable
glClearBufferfv(buffer uint, drawbuffer int, value *float) void {
	if glClearBufferfv_procAddress == null {
		glClearBufferfv_procAddress = pointer_cast(wglGetProcAddressChecked("glClearBufferfv"), fun<uint, int, *float, void>)
	}
	glClearBufferfv_procAddress(buffer, drawbuffer, value)
}

:glClearBufferiv_procAddress fun<uint, int, *int, void> #Mutable
glClearBufferiv(buffer uint, drawbuffer int, value *int) void {
	if glClearBufferiv_procAddress == null {
		glClearBufferiv_procAddress = pointer_cast(wglGetProcAddressChecked("glClearBufferiv"), fun<uint, int, *int, void>)
	}
	glClearBufferiv_procAddress(buffer, drawbuffer, value)
}

:glClearBufferuiv_procAddress fun<uint, int, *uint, void> #Mutable
glClearBufferuiv(buffer uint, drawbuffer int, value *uint) void {
	if glClearBufferuiv_procAddress == null {
		glClearBufferuiv_procAddress = pointer_cast(wglGetProcAddressChecked("glClearBufferuiv"), fun<uint, int, *uint, void>)
	}
	glClearBufferuiv_procAddress(buffer, drawbuffer, value)
}

:glClientWaitSync_procAddress fun<pointer, uint, ulong, uint> #Mutable
glClientWaitSync(sync pointer, flags uint, timeout ulong) uint {
	if glClientWaitSync_procAddress == null {
		glClientWaitSync_procAddress = pointer_cast(wglGetProcAddressChecked("glClientWaitSync"), fun<pointer, uint, ulong, uint>)
	}
	return glClientWaitSync_procAddress(sync, flags, timeout)
}

:glColorMaski_procAddress fun<uint, bool, bool, bool, bool, void> #Mutable
glColorMaski(index uint, r bool, g bool, b bool, a bool) void {
	if glColorMaski_procAddress == null {
		glColorMaski_procAddress = pointer_cast(wglGetProcAddressChecked("glColorMaski"), fun<uint, bool, bool, bool, bool, void>)
	}
	glColorMaski_procAddress(index, r, g, b, a)
}

:glColorP3ui_procAddress fun<uint, uint, void> #Mutable
glColorP3ui(type uint, color uint) void {
	if glColorP3ui_procAddress == null {
		glColorP3ui_procAddress = pointer_cast(wglGetProcAddressChecked("glColorP3ui"), fun<uint, uint, void>)
	}
	glColorP3ui_procAddress(type, color)
}

:glColorP3uiv_procAddress fun<uint, *uint, void> #Mutable
glColorP3uiv(type uint, color *uint) void {
	if glColorP3uiv_procAddress == null {
		glColorP3uiv_procAddress = pointer_cast(wglGetProcAddressChecked("glColorP3uiv"), fun<uint, *uint, void>)
	}
	glColorP3uiv_procAddress(type, color)
}

:glColorP4ui_procAddress fun<uint, uint, void> #Mutable
glColorP4ui(type uint, color uint) void {
	if glColorP4ui_procAddress == null {
		glColorP4ui_procAddress = pointer_cast(wglGetProcAddressChecked("glColorP4ui"), fun<uint, uint, void>)
	}
	glColorP4ui_procAddress(type, color)
}

:glColorP4uiv_procAddress fun<uint, *uint, void> #Mutable
glColorP4uiv(type uint, color *uint) void {
	if glColorP4uiv_procAddress == null {
		glColorP4uiv_procAddress = pointer_cast(wglGetProcAddressChecked("glColorP4uiv"), fun<uint, *uint, void>)
	}
	glColorP4uiv_procAddress(type, color)
}

:glCompileShader_procAddress fun<uint, void> #Mutable
glCompileShader(shader uint) void {
	if glCompileShader_procAddress == null {
		glCompileShader_procAddress = pointer_cast(wglGetProcAddressChecked("glCompileShader"), fun<uint, void>)
	}
	glCompileShader_procAddress(shader)
}

:glCompressedTexImage1D_procAddress fun<uint, int, uint, int, int, int, pointer, void> #Mutable
glCompressedTexImage1D(target uint, level int, internalformat uint, width int, border int, imageSize int, data pointer) void {
	if glCompressedTexImage1D_procAddress == null {
		glCompressedTexImage1D_procAddress = pointer_cast(wglGetProcAddressChecked("glCompressedTexImage1D"), fun<uint, int, uint, int, int, int, pointer, void>)
	}
	glCompressedTexImage1D_procAddress(target, level, internalformat, width, border, imageSize, data)
}

:glCompressedTexImage2D_procAddress fun<uint, int, uint, int, int, int, int, pointer, void> #Mutable
glCompressedTexImage2D(target uint, level int, internalformat uint, width int, height int, border int, imageSize int, data pointer) void {
	if glCompressedTexImage2D_procAddress == null {
		glCompressedTexImage2D_procAddress = pointer_cast(wglGetProcAddressChecked("glCompressedTexImage2D"), fun<uint, int, uint, int, int, int, int, pointer, void>)
	}
	glCompressedTexImage2D_procAddress(target, level, internalformat, width, height, border, imageSize, data)
}

:glCompressedTexImage3D_procAddress fun<uint, int, uint, int, int, int, int, int, pointer, void> #Mutable
glCompressedTexImage3D(target uint, level int, internalformat uint, width int, height int, depth int, border int, imageSize int, data pointer) void {
	if glCompressedTexImage3D_procAddress == null {
		glCompressedTexImage3D_procAddress = pointer_cast(wglGetProcAddressChecked("glCompressedTexImage3D"), fun<uint, int, uint, int, int, int, int, int, pointer, void>)
	}
	glCompressedTexImage3D_procAddress(target, level, internalformat, width, height, depth, border, imageSize, data)
}

:glCompressedTexSubImage1D_procAddress fun<uint, int, int, int, uint, int, pointer, void> #Mutable
glCompressedTexSubImage1D(target uint, level int, xoffset int, width int, format uint, imageSize int, data pointer) void {
	if glCompressedTexSubImage1D_procAddress == null {
		glCompressedTexSubImage1D_procAddress = pointer_cast(wglGetProcAddressChecked("glCompressedTexSubImage1D"), fun<uint, int, int, int, uint, int, pointer, void>)
	}
	glCompressedTexSubImage1D_procAddress(target, level, xoffset, width, format, imageSize, data)
}

:glCompressedTexSubImage2D_procAddress fun<uint, int, int, int, int, int, uint, int, pointer, void> #Mutable
glCompressedTexSubImage2D(target uint, level int, xoffset int, yoffset int, width int, height int, format uint, imageSize int, data pointer) void {
	if glCompressedTexSubImage2D_procAddress == null {
		glCompressedTexSubImage2D_procAddress = pointer_cast(wglGetProcAddressChecked("glCompressedTexSubImage2D"), fun<uint, int, int, int, int, int, uint, int, pointer, void>)
	}
	glCompressedTexSubImage2D_procAddress(target, level, xoffset, yoffset, width, height, format, imageSize, data)
}

:glCompressedTexSubImage3D_procAddress fun<uint, int, int, int, int, int, int, int, uint, int, pointer, void> #Mutable
glCompressedTexSubImage3D(target uint, level int, xoffset int, yoffset int, zoffset int, width int, height int, depth int, format uint, imageSize int, data pointer) void {
	if glCompressedTexSubImage3D_procAddress == null {
		glCompressedTexSubImage3D_procAddress = pointer_cast(wglGetProcAddressChecked("glCompressedTexSubImage3D"), fun<uint, int, int, int, int, int, int, int, uint, int, pointer, void>)
	}
	glCompressedTexSubImage3D_procAddress(target, level, xoffset, yoffset, zoffset, width, height, depth, format, imageSize, data)
}

:glCopyBufferSubData_procAddress fun<uint, uint, ssize, ssize, ssize, void> #Mutable
glCopyBufferSubData(readTarget uint, writeTarget uint, readOffset ssize, writeOffset ssize, size ssize) void {
	if glCopyBufferSubData_procAddress == null {
		glCopyBufferSubData_procAddress = pointer_cast(wglGetProcAddressChecked("glCopyBufferSubData"), fun<uint, uint, ssize, ssize, ssize, void>)
	}
	glCopyBufferSubData_procAddress(readTarget, writeTarget, readOffset, writeOffset, size)
}

:glCopyTexSubImage3D_procAddress fun<uint, int, int, int, int, int, int, int, int, void> #Mutable
glCopyTexSubImage3D(target uint, level int, xoffset int, yoffset int, zoffset int, x int, y int, width int, height int) void {
	if glCopyTexSubImage3D_procAddress == null {
		glCopyTexSubImage3D_procAddress = pointer_cast(wglGetProcAddressChecked("glCopyTexSubImage3D"), fun<uint, int, int, int, int, int, int, int, int, void>)
	}
	glCopyTexSubImage3D_procAddress(target, level, xoffset, yoffset, zoffset, x, y, width, height)
}

:glCreateProgram_procAddress fun<uint> #Mutable
glCreateProgram() uint {
	if glCreateProgram_procAddress == null {
		glCreateProgram_procAddress = pointer_cast(wglGetProcAddressChecked("glCreateProgram"), fun<uint>)
	}
	return glCreateProgram_procAddress()
}

:glCreateShader_procAddress fun<uint, uint> #Mutable
glCreateShader(type uint) uint {
	if glCreateShader_procAddress == null {
		glCreateShader_procAddress = pointer_cast(wglGetProcAddressChecked("glCreateShader"), fun<uint, uint>)
	}
	return glCreateShader_procAddress(type)
}

:glDeleteBuffers_procAddress fun<int, *uint, void> #Mutable
glDeleteBuffers(n int, buffers *uint) void {
	if glDeleteBuffers_procAddress == null {
		glDeleteBuffers_procAddress = pointer_cast(wglGetProcAddressChecked("glDeleteBuffers"), fun<int, *uint, void>)
	}
	glDeleteBuffers_procAddress(n, buffers)
}

:glDeleteFramebuffers_procAddress fun<int, *uint, void> #Mutable
glDeleteFramebuffers(n int, framebuffers *uint) void {
	if glDeleteFramebuffers_procAddress == null {
		glDeleteFramebuffers_procAddress = pointer_cast(wglGetProcAddressChecked("glDeleteFramebuffers"), fun<int, *uint, void>)
	}
	glDeleteFramebuffers_procAddress(n, framebuffers)
}

:glDeleteProgram_procAddress fun<uint, void> #Mutable
glDeleteProgram(program uint) void {
	if glDeleteProgram_procAddress == null {
		glDeleteProgram_procAddress = pointer_cast(wglGetProcAddressChecked("glDeleteProgram"), fun<uint, void>)
	}
	glDeleteProgram_procAddress(program)
}

:glDeleteQueries_procAddress fun<int, *uint, void> #Mutable
glDeleteQueries(n int, ids *uint) void {
	if glDeleteQueries_procAddress == null {
		glDeleteQueries_procAddress = pointer_cast(wglGetProcAddressChecked("glDeleteQueries"), fun<int, *uint, void>)
	}
	glDeleteQueries_procAddress(n, ids)
}

:glDeleteRenderbuffers_procAddress fun<int, *uint, void> #Mutable
glDeleteRenderbuffers(n int, renderbuffers *uint) void {
	if glDeleteRenderbuffers_procAddress == null {
		glDeleteRenderbuffers_procAddress = pointer_cast(wglGetProcAddressChecked("glDeleteRenderbuffers"), fun<int, *uint, void>)
	}
	glDeleteRenderbuffers_procAddress(n, renderbuffers)
}

:glDeleteSamplers_procAddress fun<int, *uint, void> #Mutable
glDeleteSamplers(count int, samplers *uint) void {
	if glDeleteSamplers_procAddress == null {
		glDeleteSamplers_procAddress = pointer_cast(wglGetProcAddressChecked("glDeleteSamplers"), fun<int, *uint, void>)
	}
	glDeleteSamplers_procAddress(count, samplers)
}

:glDeleteShader_procAddress fun<uint, void> #Mutable
glDeleteShader(shader uint) void {
	if glDeleteShader_procAddress == null {
		glDeleteShader_procAddress = pointer_cast(wglGetProcAddressChecked("glDeleteShader"), fun<uint, void>)
	}
	glDeleteShader_procAddress(shader)
}

:glDeleteSync_procAddress fun<pointer, void> #Mutable
glDeleteSync(sync pointer) void {
	if glDeleteSync_procAddress == null {
		glDeleteSync_procAddress = pointer_cast(wglGetProcAddressChecked("glDeleteSync"), fun<pointer, void>)
	}
	glDeleteSync_procAddress(sync)
}

:glDeleteVertexArrays_procAddress fun<int, *uint, void> #Mutable
glDeleteVertexArrays(n int, arrays *uint) void {
	if glDeleteVertexArrays_procAddress == null {
		glDeleteVertexArrays_procAddress = pointer_cast(wglGetProcAddressChecked("glDeleteVertexArrays"), fun<int, *uint, void>)
	}
	glDeleteVertexArrays_procAddress(n, arrays)
}

:glDetachShader_procAddress fun<uint, uint, void> #Mutable
glDetachShader(program uint, shader uint) void {
	if glDetachShader_procAddress == null {
		glDetachShader_procAddress = pointer_cast(wglGetProcAddressChecked("glDetachShader"), fun<uint, uint, void>)
	}
	glDetachShader_procAddress(program, shader)
}

:glDisableVertexAttribArray_procAddress fun<uint, void> #Mutable
glDisableVertexAttribArray(index uint) void {
	if glDisableVertexAttribArray_procAddress == null {
		glDisableVertexAttribArray_procAddress = pointer_cast(wglGetProcAddressChecked("glDisableVertexAttribArray"), fun<uint, void>)
	}
	glDisableVertexAttribArray_procAddress(index)
}

:glDisablei_procAddress fun<uint, uint, void> #Mutable
glDisablei(target uint, index uint) void {
	if glDisablei_procAddress == null {
		glDisablei_procAddress = pointer_cast(wglGetProcAddressChecked("glDisablei"), fun<uint, uint, void>)
	}
	glDisablei_procAddress(target, index)
}

:glDrawArraysInstanced_procAddress fun<uint, int, int, int, void> #Mutable
glDrawArraysInstanced(mode uint, first int, count int, instancecount int) void {
	if glDrawArraysInstanced_procAddress == null {
		glDrawArraysInstanced_procAddress = pointer_cast(wglGetProcAddressChecked("glDrawArraysInstanced"), fun<uint, int, int, int, void>)
	}
	glDrawArraysInstanced_procAddress(mode, first, count, instancecount)
}

:glDrawBuffers_procAddress fun<int, *uint, void> #Mutable
glDrawBuffers(n int, bufs *uint) void {
	if glDrawBuffers_procAddress == null {
		glDrawBuffers_procAddress = pointer_cast(wglGetProcAddressChecked("glDrawBuffers"), fun<int, *uint, void>)
	}
	glDrawBuffers_procAddress(n, bufs)
}

:glDrawElementsBaseVertex_procAddress fun<uint, int, uint, pointer, int, void> #Mutable
glDrawElementsBaseVertex(mode uint, count int, type uint, indices pointer, basevertex int) void {
	if glDrawElementsBaseVertex_procAddress == null {
		glDrawElementsBaseVertex_procAddress = pointer_cast(wglGetProcAddressChecked("glDrawElementsBaseVertex"), fun<uint, int, uint, pointer, int, void>)
	}
	glDrawElementsBaseVertex_procAddress(mode, count, type, indices, basevertex)
}

:glDrawElementsInstanced_procAddress fun<uint, int, uint, pointer, int, void> #Mutable
glDrawElementsInstanced(mode uint, count int, type uint, indices pointer, instancecount int) void {
	if glDrawElementsInstanced_procAddress == null {
		glDrawElementsInstanced_procAddress = pointer_cast(wglGetProcAddressChecked("glDrawElementsInstanced"), fun<uint, int, uint, pointer, int, void>)
	}
	glDrawElementsInstanced_procAddress(mode, count, type, indices, instancecount)
}

:glDrawElementsInstancedBaseVertex_procAddress fun<uint, int, uint, pointer, int, int, void> #Mutable
glDrawElementsInstancedBaseVertex(mode uint, count int, type uint, indices pointer, instancecount int, basevertex int) void {
	if glDrawElementsInstancedBaseVertex_procAddress == null {
		glDrawElementsInstancedBaseVertex_procAddress = pointer_cast(wglGetProcAddressChecked("glDrawElementsInstancedBaseVertex"), fun<uint, int, uint, pointer, int, int, void>)
	}
	glDrawElementsInstancedBaseVertex_procAddress(mode, count, type, indices, instancecount, basevertex)
}

:glDrawRangeElements_procAddress fun<uint, uint, uint, int, uint, pointer, void> #Mutable
glDrawRangeElements(mode uint, start uint, end uint, count int, type uint, indices pointer) void {
	if glDrawRangeElements_procAddress == null {
		glDrawRangeElements_procAddress = pointer_cast(wglGetProcAddressChecked("glDrawRangeElements"), fun<uint, uint, uint, int, uint, pointer, void>)
	}
	glDrawRangeElements_procAddress(mode, start, end, count, type, indices)
}

:glDrawRangeElementsBaseVertex_procAddress fun<uint, uint, uint, int, uint, pointer, int, void> #Mutable
glDrawRangeElementsBaseVertex(mode uint, start uint, end uint, count int, type uint, indices pointer, basevertex int) void {
	if glDrawRangeElementsBaseVertex_procAddress == null {
		glDrawRangeElementsBaseVertex_procAddress = pointer_cast(wglGetProcAddressChecked("glDrawRangeElementsBaseVertex"), fun<uint, uint, uint, int, uint, pointer, int, void>)
	}
	glDrawRangeElementsBaseVertex_procAddress(mode, start, end, count, type, indices, basevertex)
}

:glEnableVertexAttribArray_procAddress fun<uint, void> #Mutable
glEnableVertexAttribArray(index uint) void {
	if glEnableVertexAttribArray_procAddress == null {
		glEnableVertexAttribArray_procAddress = pointer_cast(wglGetProcAddressChecked("glEnableVertexAttribArray"), fun<uint, void>)
	}
	glEnableVertexAttribArray_procAddress(index)
}

:glEnablei_procAddress fun<uint, uint, void> #Mutable
glEnablei(target uint, index uint) void {
	if glEnablei_procAddress == null {
		glEnablei_procAddress = pointer_cast(wglGetProcAddressChecked("glEnablei"), fun<uint, uint, void>)
	}
	glEnablei_procAddress(target, index)
}

:glEndConditionalRender_procAddress fun<void> #Mutable
glEndConditionalRender() void {
	if glEndConditionalRender_procAddress == null {
		glEndConditionalRender_procAddress = pointer_cast(wglGetProcAddressChecked("glEndConditionalRender"), fun<void>)
	}
	glEndConditionalRender_procAddress()
}

:glEndQuery_procAddress fun<uint, void> #Mutable
glEndQuery(target uint) void {
	if glEndQuery_procAddress == null {
		glEndQuery_procAddress = pointer_cast(wglGetProcAddressChecked("glEndQuery"), fun<uint, void>)
	}
	glEndQuery_procAddress(target)
}

:glEndTransformFeedback_procAddress fun<void> #Mutable
glEndTransformFeedback() void {
	if glEndTransformFeedback_procAddress == null {
		glEndTransformFeedback_procAddress = pointer_cast(wglGetProcAddressChecked("glEndTransformFeedback"), fun<void>)
	}
	glEndTransformFeedback_procAddress()
}

:glFenceSync_procAddress fun<uint, uint, pointer> #Mutable
glFenceSync(condition uint, flags uint) pointer {
	if glFenceSync_procAddress == null {
		glFenceSync_procAddress = pointer_cast(wglGetProcAddressChecked("glFenceSync"), fun<uint, uint, pointer>)
	}
	return glFenceSync_procAddress(condition, flags)
}

:glFlushMappedBufferRange_procAddress fun<uint, ssize, ssize, void> #Mutable
glFlushMappedBufferRange(target uint, offset ssize, length ssize) void {
	if glFlushMappedBufferRange_procAddress == null {
		glFlushMappedBufferRange_procAddress = pointer_cast(wglGetProcAddressChecked("glFlushMappedBufferRange"), fun<uint, ssize, ssize, void>)
	}
	glFlushMappedBufferRange_procAddress(target, offset, length)
}

:glFramebufferRenderbuffer_procAddress fun<uint, uint, uint, uint, void> #Mutable
glFramebufferRenderbuffer(target uint, attachment uint, renderbuffertarget uint, renderbuffer uint) void {
	if glFramebufferRenderbuffer_procAddress == null {
		glFramebufferRenderbuffer_procAddress = pointer_cast(wglGetProcAddressChecked("glFramebufferRenderbuffer"), fun<uint, uint, uint, uint, void>)
	}
	glFramebufferRenderbuffer_procAddress(target, attachment, renderbuffertarget, renderbuffer)
}

:glFramebufferTexture_procAddress fun<uint, uint, uint, int, void> #Mutable
glFramebufferTexture(target uint, attachment uint, texture uint, level int) void {
	if glFramebufferTexture_procAddress == null {
		glFramebufferTexture_procAddress = pointer_cast(wglGetProcAddressChecked("glFramebufferTexture"), fun<uint, uint, uint, int, void>)
	}
	glFramebufferTexture_procAddress(target, attachment, texture, level)
}

:glFramebufferTexture1D_procAddress fun<uint, uint, uint, uint, int, void> #Mutable
glFramebufferTexture1D(target uint, attachment uint, textarget uint, texture uint, level int) void {
	if glFramebufferTexture1D_procAddress == null {
		glFramebufferTexture1D_procAddress = pointer_cast(wglGetProcAddressChecked("glFramebufferTexture1D"), fun<uint, uint, uint, uint, int, void>)
	}
	glFramebufferTexture1D_procAddress(target, attachment, textarget, texture, level)
}

:glFramebufferTexture2D_procAddress fun<uint, uint, uint, uint, int, void> #Mutable
glFramebufferTexture2D(target uint, attachment uint, textarget uint, texture uint, level int) void {
	if glFramebufferTexture2D_procAddress == null {
		glFramebufferTexture2D_procAddress = pointer_cast(wglGetProcAddressChecked("glFramebufferTexture2D"), fun<uint, uint, uint, uint, int, void>)
	}
	glFramebufferTexture2D_procAddress(target, attachment, textarget, texture, level)
}

:glFramebufferTexture3D_procAddress fun<uint, uint, uint, uint, int, int, void> #Mutable
glFramebufferTexture3D(target uint, attachment uint, textarget uint, texture uint, level int, zoffset int) void {
	if glFramebufferTexture3D_procAddress == null {
		glFramebufferTexture3D_procAddress = pointer_cast(wglGetProcAddressChecked("glFramebufferTexture3D"), fun<uint, uint, uint, uint, int, int, void>)
	}
	glFramebufferTexture3D_procAddress(target, attachment, textarget, texture, level, zoffset)
}

:glFramebufferTextureLayer_procAddress fun<uint, uint, uint, int, int, void> #Mutable
glFramebufferTextureLayer(target uint, attachment uint, texture uint, level int, layer int) void {
	if glFramebufferTextureLayer_procAddress == null {
		glFramebufferTextureLayer_procAddress = pointer_cast(wglGetProcAddressChecked("glFramebufferTextureLayer"), fun<uint, uint, uint, int, int, void>)
	}
	glFramebufferTextureLayer_procAddress(target, attachment, texture, level, layer)
}

:glGenBuffers_procAddress fun<int, *uint, void> #Mutable
glGenBuffers(n int, buffers *uint) void {
	if glGenBuffers_procAddress == null {
		glGenBuffers_procAddress = pointer_cast(wglGetProcAddressChecked("glGenBuffers"), fun<int, *uint, void>)
	}
	glGenBuffers_procAddress(n, buffers)
}

:glGenFramebuffers_procAddress fun<int, *uint, void> #Mutable
glGenFramebuffers(n int, framebuffers *uint) void {
	if glGenFramebuffers_procAddress == null {
		glGenFramebuffers_procAddress = pointer_cast(wglGetProcAddressChecked("glGenFramebuffers"), fun<int, *uint, void>)
	}
	glGenFramebuffers_procAddress(n, framebuffers)
}

:glGenQueries_procAddress fun<int, *uint, void> #Mutable
glGenQueries(n int, ids *uint) void {
	if glGenQueries_procAddress == null {
		glGenQueries_procAddress = pointer_cast(wglGetProcAddressChecked("glGenQueries"), fun<int, *uint, void>)
	}
	glGenQueries_procAddress(n, ids)
}

:glGenRenderbuffers_procAddress fun<int, *uint, void> #Mutable
glGenRenderbuffers(n int, renderbuffers *uint) void {
	if glGenRenderbuffers_procAddress == null {
		glGenRenderbuffers_procAddress = pointer_cast(wglGetProcAddressChecked("glGenRenderbuffers"), fun<int, *uint, void>)
	}
	glGenRenderbuffers_procAddress(n, renderbuffers)
}

:glGenSamplers_procAddress fun<int, *uint, void> #Mutable
glGenSamplers(count int, samplers *uint) void {
	if glGenSamplers_procAddress == null {
		glGenSamplers_procAddress = pointer_cast(wglGetProcAddressChecked("glGenSamplers"), fun<int, *uint, void>)
	}
	glGenSamplers_procAddress(count, samplers)
}

:glGenVertexArrays_procAddress fun<int, *uint, void> #Mutable
glGenVertexArrays(n int, arrays *uint) void {
	if glGenVertexArrays_procAddress == null {
		glGenVertexArrays_procAddress = pointer_cast(wglGetProcAddressChecked("glGenVertexArrays"), fun<int, *uint, void>)
	}
	glGenVertexArrays_procAddress(n, arrays)
}

:glGenerateMipmap_procAddress fun<uint, void> #Mutable
glGenerateMipmap(target uint) void {
	if glGenerateMipmap_procAddress == null {
		glGenerateMipmap_procAddress = pointer_cast(wglGetProcAddressChecked("glGenerateMipmap"), fun<uint, void>)
	}
	glGenerateMipmap_procAddress(target)
}

:glGetActiveAttrib_procAddress fun<uint, uint, int, *int, *int, *uint, *sbyte, void> #Mutable
glGetActiveAttrib(program uint, index uint, bufSize int, length *int, size *int, type *uint, name *sbyte) void {
	if glGetActiveAttrib_procAddress == null {
		glGetActiveAttrib_procAddress = pointer_cast(wglGetProcAddressChecked("glGetActiveAttrib"), fun<uint, uint, int, *int, *int, *uint, *sbyte, void>)
	}
	glGetActiveAttrib_procAddress(program, index, bufSize, length, size, type, name)
}

:glGetActiveUniform_procAddress fun<uint, uint, int, *int, *int, *uint, *sbyte, void> #Mutable
glGetActiveUniform(program uint, index uint, bufSize int, length *int, size *int, type *uint, name *sbyte) void {
	if glGetActiveUniform_procAddress == null {
		glGetActiveUniform_procAddress = pointer_cast(wglGetProcAddressChecked("glGetActiveUniform"), fun<uint, uint, int, *int, *int, *uint, *sbyte, void>)
	}
	glGetActiveUniform_procAddress(program, index, bufSize, length, size, type, name)
}

:glGetActiveUniformBlockName_procAddress fun<uint, uint, int, *int, *sbyte, void> #Mutable
glGetActiveUniformBlockName(program uint, uniformBlockIndex uint, bufSize int, length *int, uniformBlockName *sbyte) void {
	if glGetActiveUniformBlockName_procAddress == null {
		glGetActiveUniformBlockName_procAddress = pointer_cast(wglGetProcAddressChecked("glGetActiveUniformBlockName"), fun<uint, uint, int, *int, *sbyte, void>)
	}
	glGetActiveUniformBlockName_procAddress(program, uniformBlockIndex, bufSize, length, uniformBlockName)
}

:glGetActiveUniformBlockiv_procAddress fun<uint, uint, uint, *int, void> #Mutable
glGetActiveUniformBlockiv(program uint, uniformBlockIndex uint, pname uint, params *int) void {
	if glGetActiveUniformBlockiv_procAddress == null {
		glGetActiveUniformBlockiv_procAddress = pointer_cast(wglGetProcAddressChecked("glGetActiveUniformBlockiv"), fun<uint, uint, uint, *int, void>)
	}
	glGetActiveUniformBlockiv_procAddress(program, uniformBlockIndex, pname, params)
}

:glGetActiveUniformName_procAddress fun<uint, uint, int, *int, *sbyte, void> #Mutable
glGetActiveUniformName(program uint, uniformIndex uint, bufSize int, length *int, uniformName *sbyte) void {
	if glGetActiveUniformName_procAddress == null {
		glGetActiveUniformName_procAddress = pointer_cast(wglGetProcAddressChecked("glGetActiveUniformName"), fun<uint, uint, int, *int, *sbyte, void>)
	}
	glGetActiveUniformName_procAddress(program, uniformIndex, bufSize, length, uniformName)
}

:glGetActiveUniformsiv_procAddress fun<uint, int, *uint, uint, *int, void> #Mutable
glGetActiveUniformsiv(program uint, uniformCount int, uniformIndices *uint, pname uint, params *int) void {
	if glGetActiveUniformsiv_procAddress == null {
		glGetActiveUniformsiv_procAddress = pointer_cast(wglGetProcAddressChecked("glGetActiveUniformsiv"), fun<uint, int, *uint, uint, *int, void>)
	}
	glGetActiveUniformsiv_procAddress(program, uniformCount, uniformIndices, pname, params)
}

:glGetAttachedShaders_procAddress fun<uint, int, *int, *uint, void> #Mutable
glGetAttachedShaders(program uint, maxCount int, count *int, shaders *uint) void {
	if glGetAttachedShaders_procAddress == null {
		glGetAttachedShaders_procAddress = pointer_cast(wglGetProcAddressChecked("glGetAttachedShaders"), fun<uint, int, *int, *uint, void>)
	}
	glGetAttachedShaders_procAddress(program, maxCount, count, shaders)
}

:glGetAttribLocation_procAddress fun<uint, *sbyte, int> #Mutable
glGetAttribLocation(program uint, name *sbyte) int {
	if glGetAttribLocation_procAddress == null {
		glGetAttribLocation_procAddress = pointer_cast(wglGetProcAddressChecked("glGetAttribLocation"), fun<uint, *sbyte, int>)
	}
	return glGetAttribLocation_procAddress(program, name)
}

:glGetBooleani_v_procAddress fun<uint, uint, *bool, void> #Mutable
glGetBooleani_v(target uint, index uint, data *bool) void {
	if glGetBooleani_v_procAddress == null {
		glGetBooleani_v_procAddress = pointer_cast(wglGetProcAddressChecked("glGetBooleani_v"), fun<uint, uint, *bool, void>)
	}
	glGetBooleani_v_procAddress(target, index, data)
}

:glGetBufferParameteri64v_procAddress fun<uint, uint, *long, void> #Mutable
glGetBufferParameteri64v(target uint, pname uint, params *long) void {
	if glGetBufferParameteri64v_procAddress == null {
		glGetBufferParameteri64v_procAddress = pointer_cast(wglGetProcAddressChecked("glGetBufferParameteri64v"), fun<uint, uint, *long, void>)
	}
	glGetBufferParameteri64v_procAddress(target, pname, params)
}

:glGetBufferParameteriv_procAddress fun<uint, uint, *int, void> #Mutable
glGetBufferParameteriv(target uint, pname uint, params *int) void {
	if glGetBufferParameteriv_procAddress == null {
		glGetBufferParameteriv_procAddress = pointer_cast(wglGetProcAddressChecked("glGetBufferParameteriv"), fun<uint, uint, *int, void>)
	}
	glGetBufferParameteriv_procAddress(target, pname, params)
}

:glGetBufferPointerv_procAddress fun<uint, uint, *pointer, void> #Mutable
glGetBufferPointerv(target uint, pname uint, params *pointer) void {
	if glGetBufferPointerv_procAddress == null {
		glGetBufferPointerv_procAddress = pointer_cast(wglGetProcAddressChecked("glGetBufferPointerv"), fun<uint, uint, *pointer, void>)
	}
	glGetBufferPointerv_procAddress(target, pname, params)
}

:glGetBufferSubData_procAddress fun<uint, ssize, ssize, pointer, void> #Mutable
glGetBufferSubData(target uint, offset ssize, size ssize, data pointer) void {
	if glGetBufferSubData_procAddress == null {
		glGetBufferSubData_procAddress = pointer_cast(wglGetProcAddressChecked("glGetBufferSubData"), fun<uint, ssize, ssize, pointer, void>)
	}
	glGetBufferSubData_procAddress(target, offset, size, data)
}

:glGetCompressedTexImage_procAddress fun<uint, int, pointer, void> #Mutable
glGetCompressedTexImage(target uint, level int, img pointer) void {
	if glGetCompressedTexImage_procAddress == null {
		glGetCompressedTexImage_procAddress = pointer_cast(wglGetProcAddressChecked("glGetCompressedTexImage"), fun<uint, int, pointer, void>)
	}
	glGetCompressedTexImage_procAddress(target, level, img)
}

:glGetFragDataIndex_procAddress fun<uint, *sbyte, int> #Mutable
glGetFragDataIndex(program uint, name *sbyte) int {
	if glGetFragDataIndex_procAddress == null {
		glGetFragDataIndex_procAddress = pointer_cast(wglGetProcAddressChecked("glGetFragDataIndex"), fun<uint, *sbyte, int>)
	}
	return glGetFragDataIndex_procAddress(program, name)
}

:glGetFragDataLocation_procAddress fun<uint, *sbyte, int> #Mutable
glGetFragDataLocation(program uint, name *sbyte) int {
	if glGetFragDataLocation_procAddress == null {
		glGetFragDataLocation_procAddress = pointer_cast(wglGetProcAddressChecked("glGetFragDataLocation"), fun<uint, *sbyte, int>)
	}
	return glGetFragDataLocation_procAddress(program, name)
}

:glGetFramebufferAttachmentParameteriv_procAddress fun<uint, uint, uint, *int, void> #Mutable
glGetFramebufferAttachmentParameteriv(target uint, attachment uint, pname uint, params *int) void {
	if glGetFramebufferAttachmentParameteriv_procAddress == null {
		glGetFramebufferAttachmentParameteriv_procAddress = pointer_cast(wglGetProcAddressChecked("glGetFramebufferAttachmentParameteriv"), fun<uint, uint, uint, *int, void>)
	}
	glGetFramebufferAttachmentParameteriv_procAddress(target, attachment, pname, params)
}

:glGetInteger64i_v_procAddress fun<uint, uint, *long, void> #Mutable
glGetInteger64i_v(target uint, index uint, data *long) void {
	if glGetInteger64i_v_procAddress == null {
		glGetInteger64i_v_procAddress = pointer_cast(wglGetProcAddressChecked("glGetInteger64i_v"), fun<uint, uint, *long, void>)
	}
	glGetInteger64i_v_procAddress(target, index, data)
}

:glGetInteger64v_procAddress fun<uint, *long, void> #Mutable
glGetInteger64v(pname uint, data *long) void {
	if glGetInteger64v_procAddress == null {
		glGetInteger64v_procAddress = pointer_cast(wglGetProcAddressChecked("glGetInteger64v"), fun<uint, *long, void>)
	}
	glGetInteger64v_procAddress(pname, data)
}

:glGetIntegeri_v_procAddress fun<uint, uint, *int, void> #Mutable
glGetIntegeri_v(target uint, index uint, data *int) void {
	if glGetIntegeri_v_procAddress == null {
		glGetIntegeri_v_procAddress = pointer_cast(wglGetProcAddressChecked("glGetIntegeri_v"), fun<uint, uint, *int, void>)
	}
	glGetIntegeri_v_procAddress(target, index, data)
}

:glGetMultisamplefv_procAddress fun<uint, uint, *float, void> #Mutable
glGetMultisamplefv(pname uint, index uint, val *float) void {
	if glGetMultisamplefv_procAddress == null {
		glGetMultisamplefv_procAddress = pointer_cast(wglGetProcAddressChecked("glGetMultisamplefv"), fun<uint, uint, *float, void>)
	}
	glGetMultisamplefv_procAddress(pname, index, val)
}

:glGetProgramInfoLog_procAddress fun<uint, int, *int, *sbyte, void> #Mutable
glGetProgramInfoLog(program uint, bufSize int, length *int, infoLog *sbyte) void {
	if glGetProgramInfoLog_procAddress == null {
		glGetProgramInfoLog_procAddress = pointer_cast(wglGetProcAddressChecked("glGetProgramInfoLog"), fun<uint, int, *int, *sbyte, void>)
	}
	glGetProgramInfoLog_procAddress(program, bufSize, length, infoLog)
}

:glGetProgramiv_procAddress fun<uint, uint, *int, void> #Mutable
glGetProgramiv(program uint, pname uint, params *int) void {
	if glGetProgramiv_procAddress == null {
		glGetProgramiv_procAddress = pointer_cast(wglGetProcAddressChecked("glGetProgramiv"), fun<uint, uint, *int, void>)
	}
	glGetProgramiv_procAddress(program, pname, params)
}

:glGetQueryObjecti64v_procAddress fun<uint, uint, *long, void> #Mutable
glGetQueryObjecti64v(id uint, pname uint, params *long) void {
	if glGetQueryObjecti64v_procAddress == null {
		glGetQueryObjecti64v_procAddress = pointer_cast(wglGetProcAddressChecked("glGetQueryObjecti64v"), fun<uint, uint, *long, void>)
	}
	glGetQueryObjecti64v_procAddress(id, pname, params)
}

:glGetQueryObjectiv_procAddress fun<uint, uint, *int, void> #Mutable
glGetQueryObjectiv(id uint, pname uint, params *int) void {
	if glGetQueryObjectiv_procAddress == null {
		glGetQueryObjectiv_procAddress = pointer_cast(wglGetProcAddressChecked("glGetQueryObjectiv"), fun<uint, uint, *int, void>)
	}
	glGetQueryObjectiv_procAddress(id, pname, params)
}

:glGetQueryObjectui64v_procAddress fun<uint, uint, *ulong, void> #Mutable
glGetQueryObjectui64v(id uint, pname uint, params *ulong) void {
	if glGetQueryObjectui64v_procAddress == null {
		glGetQueryObjectui64v_procAddress = pointer_cast(wglGetProcAddressChecked("glGetQueryObjectui64v"), fun<uint, uint, *ulong, void>)
	}
	glGetQueryObjectui64v_procAddress(id, pname, params)
}

:glGetQueryObjectuiv_procAddress fun<uint, uint, *uint, void> #Mutable
glGetQueryObjectuiv(id uint, pname uint, params *uint) void {
	if glGetQueryObjectuiv_procAddress == null {
		glGetQueryObjectuiv_procAddress = pointer_cast(wglGetProcAddressChecked("glGetQueryObjectuiv"), fun<uint, uint, *uint, void>)
	}
	glGetQueryObjectuiv_procAddress(id, pname, params)
}

:glGetQueryiv_procAddress fun<uint, uint, *int, void> #Mutable
glGetQueryiv(target uint, pname uint, params *int) void {
	if glGetQueryiv_procAddress == null {
		glGetQueryiv_procAddress = pointer_cast(wglGetProcAddressChecked("glGetQueryiv"), fun<uint, uint, *int, void>)
	}
	glGetQueryiv_procAddress(target, pname, params)
}

:glGetRenderbufferParameteriv_procAddress fun<uint, uint, *int, void> #Mutable
glGetRenderbufferParameteriv(target uint, pname uint, params *int) void {
	if glGetRenderbufferParameteriv_procAddress == null {
		glGetRenderbufferParameteriv_procAddress = pointer_cast(wglGetProcAddressChecked("glGetRenderbufferParameteriv"), fun<uint, uint, *int, void>)
	}
	glGetRenderbufferParameteriv_procAddress(target, pname, params)
}

:glGetSamplerParameterIiv_procAddress fun<uint, uint, *int, void> #Mutable
glGetSamplerParameterIiv(sampler uint, pname uint, params *int) void {
	if glGetSamplerParameterIiv_procAddress == null {
		glGetSamplerParameterIiv_procAddress = pointer_cast(wglGetProcAddressChecked("glGetSamplerParameterIiv"), fun<uint, uint, *int, void>)
	}
	glGetSamplerParameterIiv_procAddress(sampler, pname, params)
}

:glGetSamplerParameterIuiv_procAddress fun<uint, uint, *uint, void> #Mutable
glGetSamplerParameterIuiv(sampler uint, pname uint, params *uint) void {
	if glGetSamplerParameterIuiv_procAddress == null {
		glGetSamplerParameterIuiv_procAddress = pointer_cast(wglGetProcAddressChecked("glGetSamplerParameterIuiv"), fun<uint, uint, *uint, void>)
	}
	glGetSamplerParameterIuiv_procAddress(sampler, pname, params)
}

:glGetSamplerParameterfv_procAddress fun<uint, uint, *float, void> #Mutable
glGetSamplerParameterfv(sampler uint, pname uint, params *float) void {
	if glGetSamplerParameterfv_procAddress == null {
		glGetSamplerParameterfv_procAddress = pointer_cast(wglGetProcAddressChecked("glGetSamplerParameterfv"), fun<uint, uint, *float, void>)
	}
	glGetSamplerParameterfv_procAddress(sampler, pname, params)
}

:glGetSamplerParameteriv_procAddress fun<uint, uint, *int, void> #Mutable
glGetSamplerParameteriv(sampler uint, pname uint, params *int) void {
	if glGetSamplerParameteriv_procAddress == null {
		glGetSamplerParameteriv_procAddress = pointer_cast(wglGetProcAddressChecked("glGetSamplerParameteriv"), fun<uint, uint, *int, void>)
	}
	glGetSamplerParameteriv_procAddress(sampler, pname, params)
}

:glGetShaderInfoLog_procAddress fun<uint, int, *int, *sbyte, void> #Mutable
glGetShaderInfoLog(shader uint, bufSize int, length *int, infoLog *sbyte) void {
	if glGetShaderInfoLog_procAddress == null {
		glGetShaderInfoLog_procAddress = pointer_cast(wglGetProcAddressChecked("glGetShaderInfoLog"), fun<uint, int, *int, *sbyte, void>)
	}
	glGetShaderInfoLog_procAddress(shader, bufSize, length, infoLog)
}

:glGetShaderSource_procAddress fun<uint, int, *int, *sbyte, void> #Mutable
glGetShaderSource(shader uint, bufSize int, length *int, source *sbyte) void {
	if glGetShaderSource_procAddress == null {
		glGetShaderSource_procAddress = pointer_cast(wglGetProcAddressChecked("glGetShaderSource"), fun<uint, int, *int, *sbyte, void>)
	}
	glGetShaderSource_procAddress(shader, bufSize, length, source)
}

:glGetShaderiv_procAddress fun<uint, uint, *int, void> #Mutable
glGetShaderiv(shader uint, pname uint, params *int) void {
	if glGetShaderiv_procAddress == null {
		glGetShaderiv_procAddress = pointer_cast(wglGetProcAddressChecked("glGetShaderiv"), fun<uint, uint, *int, void>)
	}
	glGetShaderiv_procAddress(shader, pname, params)
}

:glGetStringi_procAddress fun<uint, uint, *byte> #Mutable
glGetStringi(name uint, index uint) *byte {
	if glGetStringi_procAddress == null {
		glGetStringi_procAddress = pointer_cast(wglGetProcAddressChecked("glGetStringi"), fun<uint, uint, *byte>)
	}
	return glGetStringi_procAddress(name, index)
}

:glGetSynciv_procAddress fun<pointer, uint, int, *int, *int, void> #Mutable
glGetSynciv(sync pointer, pname uint, count int, length *int, values *int) void {
	if glGetSynciv_procAddress == null {
		glGetSynciv_procAddress = pointer_cast(wglGetProcAddressChecked("glGetSynciv"), fun<pointer, uint, int, *int, *int, void>)
	}
	glGetSynciv_procAddress(sync, pname, count, length, values)
}

:glGetTexParameterIiv_procAddress fun<uint, uint, *int, void> #Mutable
glGetTexParameterIiv(target uint, pname uint, params *int) void {
	if glGetTexParameterIiv_procAddress == null {
		glGetTexParameterIiv_procAddress = pointer_cast(wglGetProcAddressChecked("glGetTexParameterIiv"), fun<uint, uint, *int, void>)
	}
	glGetTexParameterIiv_procAddress(target, pname, params)
}

:glGetTexParameterIuiv_procAddress fun<uint, uint, *uint, void> #Mutable
glGetTexParameterIuiv(target uint, pname uint, params *uint) void {
	if glGetTexParameterIuiv_procAddress == null {
		glGetTexParameterIuiv_procAddress = pointer_cast(wglGetProcAddressChecked("glGetTexParameterIuiv"), fun<uint, uint, *uint, void>)
	}
	glGetTexParameterIuiv_procAddress(target, pname, params)
}

:glGetTransformFeedbackVarying_procAddress fun<uint, uint, int, *int, *int, *uint, *sbyte, void> #Mutable
glGetTransformFeedbackVarying(program uint, index uint, bufSize int, length *int, size *int, type *uint, name *sbyte) void {
	if glGetTransformFeedbackVarying_procAddress == null {
		glGetTransformFeedbackVarying_procAddress = pointer_cast(wglGetProcAddressChecked("glGetTransformFeedbackVarying"), fun<uint, uint, int, *int, *int, *uint, *sbyte, void>)
	}
	glGetTransformFeedbackVarying_procAddress(program, index, bufSize, length, size, type, name)
}

:glGetUniformBlockIndex_procAddress fun<uint, *sbyte, uint> #Mutable
glGetUniformBlockIndex(program uint, uniformBlockName *sbyte) uint {
	if glGetUniformBlockIndex_procAddress == null {
		glGetUniformBlockIndex_procAddress = pointer_cast(wglGetProcAddressChecked("glGetUniformBlockIndex"), fun<uint, *sbyte, uint>)
	}
	return glGetUniformBlockIndex_procAddress(program, uniformBlockName)
}

:glGetUniformIndices_procAddress fun<uint, int, **sbyte, *uint, void> #Mutable
glGetUniformIndices(program uint, uniformCount int, uniformNames **sbyte, uniformIndices *uint) void {
	if glGetUniformIndices_procAddress == null {
		glGetUniformIndices_procAddress = pointer_cast(wglGetProcAddressChecked("glGetUniformIndices"), fun<uint, int, **sbyte, *uint, void>)
	}
	glGetUniformIndices_procAddress(program, uniformCount, uniformNames, uniformIndices)
}

:glGetUniformLocation_procAddress fun<uint, *sbyte, int> #Mutable
glGetUniformLocation(program uint, name *sbyte) int {
	if glGetUniformLocation_procAddress == null {
		glGetUniformLocation_procAddress = pointer_cast(wglGetProcAddressChecked("glGetUniformLocation"), fun<uint, *sbyte, int>)
	}
	return glGetUniformLocation_procAddress(program, name)
}

:glGetUniformfv_procAddress fun<uint, int, *float, void> #Mutable
glGetUniformfv(program uint, location int, params *float) void {
	if glGetUniformfv_procAddress == null {
		glGetUniformfv_procAddress = pointer_cast(wglGetProcAddressChecked("glGetUniformfv"), fun<uint, int, *float, void>)
	}
	glGetUniformfv_procAddress(program, location, params)
}

:glGetUniformiv_procAddress fun<uint, int, *int, void> #Mutable
glGetUniformiv(program uint, location int, params *int) void {
	if glGetUniformiv_procAddress == null {
		glGetUniformiv_procAddress = pointer_cast(wglGetProcAddressChecked("glGetUniformiv"), fun<uint, int, *int, void>)
	}
	glGetUniformiv_procAddress(program, location, params)
}

:glGetUniformuiv_procAddress fun<uint, int, *uint, void> #Mutable
glGetUniformuiv(program uint, location int, params *uint) void {
	if glGetUniformuiv_procAddress == null {
		glGetUniformuiv_procAddress = pointer_cast(wglGetProcAddressChecked("glGetUniformuiv"), fun<uint, int, *uint, void>)
	}
	glGetUniformuiv_procAddress(program, location, params)
}

:glGetVertexAttribIiv_procAddress fun<uint, uint, *int, void> #Mutable
glGetVertexAttribIiv(index uint, pname uint, params *int) void {
	if glGetVertexAttribIiv_procAddress == null {
		glGetVertexAttribIiv_procAddress = pointer_cast(wglGetProcAddressChecked("glGetVertexAttribIiv"), fun<uint, uint, *int, void>)
	}
	glGetVertexAttribIiv_procAddress(index, pname, params)
}

:glGetVertexAttribIuiv_procAddress fun<uint, uint, *uint, void> #Mutable
glGetVertexAttribIuiv(index uint, pname uint, params *uint) void {
	if glGetVertexAttribIuiv_procAddress == null {
		glGetVertexAttribIuiv_procAddress = pointer_cast(wglGetProcAddressChecked("glGetVertexAttribIuiv"), fun<uint, uint, *uint, void>)
	}
	glGetVertexAttribIuiv_procAddress(index, pname, params)
}

:glGetVertexAttribPointerv_procAddress fun<uint, uint, *pointer, void> #Mutable
glGetVertexAttribPointerv(index uint, pname uint, pointer *pointer) void {
	if glGetVertexAttribPointerv_procAddress == null {
		glGetVertexAttribPointerv_procAddress = pointer_cast(wglGetProcAddressChecked("glGetVertexAttribPointerv"), fun<uint, uint, *pointer, void>)
	}
	glGetVertexAttribPointerv_procAddress(index, pname, pointer)
}

:glGetVertexAttribdv_procAddress fun<uint, uint, *double, void> #Mutable
glGetVertexAttribdv(index uint, pname uint, params *double) void {
	if glGetVertexAttribdv_procAddress == null {
		glGetVertexAttribdv_procAddress = pointer_cast(wglGetProcAddressChecked("glGetVertexAttribdv"), fun<uint, uint, *double, void>)
	}
	glGetVertexAttribdv_procAddress(index, pname, params)
}

:glGetVertexAttribfv_procAddress fun<uint, uint, *float, void> #Mutable
glGetVertexAttribfv(index uint, pname uint, params *float) void {
	if glGetVertexAttribfv_procAddress == null {
		glGetVertexAttribfv_procAddress = pointer_cast(wglGetProcAddressChecked("glGetVertexAttribfv"), fun<uint, uint, *float, void>)
	}
	glGetVertexAttribfv_procAddress(index, pname, params)
}

:glGetVertexAttribiv_procAddress fun<uint, uint, *int, void> #Mutable
glGetVertexAttribiv(index uint, pname uint, params *int) void {
	if glGetVertexAttribiv_procAddress == null {
		glGetVertexAttribiv_procAddress = pointer_cast(wglGetProcAddressChecked("glGetVertexAttribiv"), fun<uint, uint, *int, void>)
	}
	glGetVertexAttribiv_procAddress(index, pname, params)
}

:glIsBuffer_procAddress fun<uint, bool> #Mutable
glIsBuffer(buffer uint) bool {
	if glIsBuffer_procAddress == null {
		glIsBuffer_procAddress = pointer_cast(wglGetProcAddressChecked("glIsBuffer"), fun<uint, bool>)
	}
	return glIsBuffer_procAddress(buffer)
}

:glIsEnabledi_procAddress fun<uint, uint, bool> #Mutable
glIsEnabledi(target uint, index uint) bool {
	if glIsEnabledi_procAddress == null {
		glIsEnabledi_procAddress = pointer_cast(wglGetProcAddressChecked("glIsEnabledi"), fun<uint, uint, bool>)
	}
	return glIsEnabledi_procAddress(target, index)
}

:glIsFramebuffer_procAddress fun<uint, bool> #Mutable
glIsFramebuffer(framebuffer uint) bool {
	if glIsFramebuffer_procAddress == null {
		glIsFramebuffer_procAddress = pointer_cast(wglGetProcAddressChecked("glIsFramebuffer"), fun<uint, bool>)
	}
	return glIsFramebuffer_procAddress(framebuffer)
}

:glIsProgram_procAddress fun<uint, bool> #Mutable
glIsProgram(program uint) bool {
	if glIsProgram_procAddress == null {
		glIsProgram_procAddress = pointer_cast(wglGetProcAddressChecked("glIsProgram"), fun<uint, bool>)
	}
	return glIsProgram_procAddress(program)
}

:glIsQuery_procAddress fun<uint, bool> #Mutable
glIsQuery(id uint) bool {
	if glIsQuery_procAddress == null {
		glIsQuery_procAddress = pointer_cast(wglGetProcAddressChecked("glIsQuery"), fun<uint, bool>)
	}
	return glIsQuery_procAddress(id)
}

:glIsRenderbuffer_procAddress fun<uint, bool> #Mutable
glIsRenderbuffer(renderbuffer uint) bool {
	if glIsRenderbuffer_procAddress == null {
		glIsRenderbuffer_procAddress = pointer_cast(wglGetProcAddressChecked("glIsRenderbuffer"), fun<uint, bool>)
	}
	return glIsRenderbuffer_procAddress(renderbuffer)
}

:glIsSampler_procAddress fun<uint, bool> #Mutable
glIsSampler(sampler uint) bool {
	if glIsSampler_procAddress == null {
		glIsSampler_procAddress = pointer_cast(wglGetProcAddressChecked("glIsSampler"), fun<uint, bool>)
	}
	return glIsSampler_procAddress(sampler)
}

:glIsShader_procAddress fun<uint, bool> #Mutable
glIsShader(shader uint) bool {
	if glIsShader_procAddress == null {
		glIsShader_procAddress = pointer_cast(wglGetProcAddressChecked("glIsShader"), fun<uint, bool>)
	}
	return glIsShader_procAddress(shader)
}

:glIsSync_procAddress fun<pointer, bool> #Mutable
glIsSync(sync pointer) bool {
	if glIsSync_procAddress == null {
		glIsSync_procAddress = pointer_cast(wglGetProcAddressChecked("glIsSync"), fun<pointer, bool>)
	}
	return glIsSync_procAddress(sync)
}

:glIsVertexArray_procAddress fun<uint, bool> #Mutable
glIsVertexArray(array uint) bool {
	if glIsVertexArray_procAddress == null {
		glIsVertexArray_procAddress = pointer_cast(wglGetProcAddressChecked("glIsVertexArray"), fun<uint, bool>)
	}
	return glIsVertexArray_procAddress(array)
}

:glLinkProgram_procAddress fun<uint, void> #Mutable
glLinkProgram(program uint) void {
	if glLinkProgram_procAddress == null {
		glLinkProgram_procAddress = pointer_cast(wglGetProcAddressChecked("glLinkProgram"), fun<uint, void>)
	}
	glLinkProgram_procAddress(program)
}

:glMapBuffer_procAddress fun<uint, uint, pointer> #Mutable
glMapBuffer(target uint, access uint) pointer {
	if glMapBuffer_procAddress == null {
		glMapBuffer_procAddress = pointer_cast(wglGetProcAddressChecked("glMapBuffer"), fun<uint, uint, pointer>)
	}
	return glMapBuffer_procAddress(target, access)
}

:glMapBufferRange_procAddress fun<uint, ssize, ssize, uint, pointer> #Mutable
glMapBufferRange(target uint, offset ssize, length ssize, access uint) pointer {
	if glMapBufferRange_procAddress == null {
		glMapBufferRange_procAddress = pointer_cast(wglGetProcAddressChecked("glMapBufferRange"), fun<uint, ssize, ssize, uint, pointer>)
	}
	return glMapBufferRange_procAddress(target, offset, length, access)
}

:glMultiDrawArrays_procAddress fun<uint, *int, *int, int, void> #Mutable
glMultiDrawArrays(mode uint, first *int, count *int, drawcount int) void {
	if glMultiDrawArrays_procAddress == null {
		glMultiDrawArrays_procAddress = pointer_cast(wglGetProcAddressChecked("glMultiDrawArrays"), fun<uint, *int, *int, int, void>)
	}
	glMultiDrawArrays_procAddress(mode, first, count, drawcount)
}

:glMultiDrawElements_procAddress fun<uint, *int, uint, *pointer, int, void> #Mutable
glMultiDrawElements(mode uint, count *int, type uint, indices *pointer, drawcount int) void {
	if glMultiDrawElements_procAddress == null {
		glMultiDrawElements_procAddress = pointer_cast(wglGetProcAddressChecked("glMultiDrawElements"), fun<uint, *int, uint, *pointer, int, void>)
	}
	glMultiDrawElements_procAddress(mode, count, type, indices, drawcount)
}

:glMultiDrawElementsBaseVertex_procAddress fun<uint, *int, uint, *pointer, int, *int, void> #Mutable
glMultiDrawElementsBaseVertex(mode uint, count *int, type uint, indices *pointer, drawcount int, basevertex *int) void {
	if glMultiDrawElementsBaseVertex_procAddress == null {
		glMultiDrawElementsBaseVertex_procAddress = pointer_cast(wglGetProcAddressChecked("glMultiDrawElementsBaseVertex"), fun<uint, *int, uint, *pointer, int, *int, void>)
	}
	glMultiDrawElementsBaseVertex_procAddress(mode, count, type, indices, drawcount, basevertex)
}

:glMultiTexCoordP1ui_procAddress fun<uint, uint, uint, void> #Mutable
glMultiTexCoordP1ui(texture uint, type uint, coords uint) void {
	if glMultiTexCoordP1ui_procAddress == null {
		glMultiTexCoordP1ui_procAddress = pointer_cast(wglGetProcAddressChecked("glMultiTexCoordP1ui"), fun<uint, uint, uint, void>)
	}
	glMultiTexCoordP1ui_procAddress(texture, type, coords)
}

:glMultiTexCoordP1uiv_procAddress fun<uint, uint, *uint, void> #Mutable
glMultiTexCoordP1uiv(texture uint, type uint, coords *uint) void {
	if glMultiTexCoordP1uiv_procAddress == null {
		glMultiTexCoordP1uiv_procAddress = pointer_cast(wglGetProcAddressChecked("glMultiTexCoordP1uiv"), fun<uint, uint, *uint, void>)
	}
	glMultiTexCoordP1uiv_procAddress(texture, type, coords)
}

:glMultiTexCoordP2ui_procAddress fun<uint, uint, uint, void> #Mutable
glMultiTexCoordP2ui(texture uint, type uint, coords uint) void {
	if glMultiTexCoordP2ui_procAddress == null {
		glMultiTexCoordP2ui_procAddress = pointer_cast(wglGetProcAddressChecked("glMultiTexCoordP2ui"), fun<uint, uint, uint, void>)
	}
	glMultiTexCoordP2ui_procAddress(texture, type, coords)
}

:glMultiTexCoordP2uiv_procAddress fun<uint, uint, *uint, void> #Mutable
glMultiTexCoordP2uiv(texture uint, type uint, coords *uint) void {
	if glMultiTexCoordP2uiv_procAddress == null {
		glMultiTexCoordP2uiv_procAddress = pointer_cast(wglGetProcAddressChecked("glMultiTexCoordP2uiv"), fun<uint, uint, *uint, void>)
	}
	glMultiTexCoordP2uiv_procAddress(texture, type, coords)
}

:glMultiTexCoordP3ui_procAddress fun<uint, uint, uint, void> #Mutable
glMultiTexCoordP3ui(texture uint, type uint, coords uint) void {
	if glMultiTexCoordP3ui_procAddress == null {
		glMultiTexCoordP3ui_procAddress = pointer_cast(wglGetProcAddressChecked("glMultiTexCoordP3ui"), fun<uint, uint, uint, void>)
	}
	glMultiTexCoordP3ui_procAddress(texture, type, coords)
}

:glMultiTexCoordP3uiv_procAddress fun<uint, uint, *uint, void> #Mutable
glMultiTexCoordP3uiv(texture uint, type uint, coords *uint) void {
	if glMultiTexCoordP3uiv_procAddress == null {
		glMultiTexCoordP3uiv_procAddress = pointer_cast(wglGetProcAddressChecked("glMultiTexCoordP3uiv"), fun<uint, uint, *uint, void>)
	}
	glMultiTexCoordP3uiv_procAddress(texture, type, coords)
}

:glMultiTexCoordP4ui_procAddress fun<uint, uint, uint, void> #Mutable
glMultiTexCoordP4ui(texture uint, type uint, coords uint) void {
	if glMultiTexCoordP4ui_procAddress == null {
		glMultiTexCoordP4ui_procAddress = pointer_cast(wglGetProcAddressChecked("glMultiTexCoordP4ui"), fun<uint, uint, uint, void>)
	}
	glMultiTexCoordP4ui_procAddress(texture, type, coords)
}

:glMultiTexCoordP4uiv_procAddress fun<uint, uint, *uint, void> #Mutable
glMultiTexCoordP4uiv(texture uint, type uint, coords *uint) void {
	if glMultiTexCoordP4uiv_procAddress == null {
		glMultiTexCoordP4uiv_procAddress = pointer_cast(wglGetProcAddressChecked("glMultiTexCoordP4uiv"), fun<uint, uint, *uint, void>)
	}
	glMultiTexCoordP4uiv_procAddress(texture, type, coords)
}

:glNormalP3ui_procAddress fun<uint, uint, void> #Mutable
glNormalP3ui(type uint, coords uint) void {
	if glNormalP3ui_procAddress == null {
		glNormalP3ui_procAddress = pointer_cast(wglGetProcAddressChecked("glNormalP3ui"), fun<uint, uint, void>)
	}
	glNormalP3ui_procAddress(type, coords)
}

:glNormalP3uiv_procAddress fun<uint, *uint, void> #Mutable
glNormalP3uiv(type uint, coords *uint) void {
	if glNormalP3uiv_procAddress == null {
		glNormalP3uiv_procAddress = pointer_cast(wglGetProcAddressChecked("glNormalP3uiv"), fun<uint, *uint, void>)
	}
	glNormalP3uiv_procAddress(type, coords)
}

:glPointParameterf_procAddress fun<uint, float, void> #Mutable
glPointParameterf(pname uint, param float) void {
	if glPointParameterf_procAddress == null {
		glPointParameterf_procAddress = pointer_cast(wglGetProcAddressChecked("glPointParameterf"), fun<uint, float, void>)
	}
	glPointParameterf_procAddress(pname, param)
}

:glPointParameterfv_procAddress fun<uint, *float, void> #Mutable
glPointParameterfv(pname uint, params *float) void {
	if glPointParameterfv_procAddress == null {
		glPointParameterfv_procAddress = pointer_cast(wglGetProcAddressChecked("glPointParameterfv"), fun<uint, *float, void>)
	}
	glPointParameterfv_procAddress(pname, params)
}

:glPointParameteri_procAddress fun<uint, int, void> #Mutable
glPointParameteri(pname uint, param int) void {
	if glPointParameteri_procAddress == null {
		glPointParameteri_procAddress = pointer_cast(wglGetProcAddressChecked("glPointParameteri"), fun<uint, int, void>)
	}
	glPointParameteri_procAddress(pname, param)
}

:glPointParameteriv_procAddress fun<uint, *int, void> #Mutable
glPointParameteriv(pname uint, params *int) void {
	if glPointParameteriv_procAddress == null {
		glPointParameteriv_procAddress = pointer_cast(wglGetProcAddressChecked("glPointParameteriv"), fun<uint, *int, void>)
	}
	glPointParameteriv_procAddress(pname, params)
}

:glPrimitiveRestartIndex_procAddress fun<uint, void> #Mutable
glPrimitiveRestartIndex(index uint) void {
	if glPrimitiveRestartIndex_procAddress == null {
		glPrimitiveRestartIndex_procAddress = pointer_cast(wglGetProcAddressChecked("glPrimitiveRestartIndex"), fun<uint, void>)
	}
	glPrimitiveRestartIndex_procAddress(index)
}

:glProvokingVertex_procAddress fun<uint, void> #Mutable
glProvokingVertex(mode uint) void {
	if glProvokingVertex_procAddress == null {
		glProvokingVertex_procAddress = pointer_cast(wglGetProcAddressChecked("glProvokingVertex"), fun<uint, void>)
	}
	glProvokingVertex_procAddress(mode)
}

:glQueryCounter_procAddress fun<uint, uint, void> #Mutable
glQueryCounter(id uint, target uint) void {
	if glQueryCounter_procAddress == null {
		glQueryCounter_procAddress = pointer_cast(wglGetProcAddressChecked("glQueryCounter"), fun<uint, uint, void>)
	}
	glQueryCounter_procAddress(id, target)
}

:glRenderbufferStorage_procAddress fun<uint, uint, int, int, void> #Mutable
glRenderbufferStorage(target uint, internalformat uint, width int, height int) void {
	if glRenderbufferStorage_procAddress == null {
		glRenderbufferStorage_procAddress = pointer_cast(wglGetProcAddressChecked("glRenderbufferStorage"), fun<uint, uint, int, int, void>)
	}
	glRenderbufferStorage_procAddress(target, internalformat, width, height)
}

:glRenderbufferStorageMultisample_procAddress fun<uint, int, uint, int, int, void> #Mutable
glRenderbufferStorageMultisample(target uint, samples int, internalformat uint, width int, height int) void {
	if glRenderbufferStorageMultisample_procAddress == null {
		glRenderbufferStorageMultisample_procAddress = pointer_cast(wglGetProcAddressChecked("glRenderbufferStorageMultisample"), fun<uint, int, uint, int, int, void>)
	}
	glRenderbufferStorageMultisample_procAddress(target, samples, internalformat, width, height)
}

:glSampleCoverage_procAddress fun<float, bool, void> #Mutable
glSampleCoverage(value float, invert bool) void {
	if glSampleCoverage_procAddress == null {
		glSampleCoverage_procAddress = pointer_cast(wglGetProcAddressChecked("glSampleCoverage"), fun<float, bool, void>)
	}
	glSampleCoverage_procAddress(value, invert)
}

:glSampleMaski_procAddress fun<uint, uint, void> #Mutable
glSampleMaski(maskNumber uint, mask uint) void {
	if glSampleMaski_procAddress == null {
		glSampleMaski_procAddress = pointer_cast(wglGetProcAddressChecked("glSampleMaski"), fun<uint, uint, void>)
	}
	glSampleMaski_procAddress(maskNumber, mask)
}

:glSamplerParameterIiv_procAddress fun<uint, uint, *int, void> #Mutable
glSamplerParameterIiv(sampler uint, pname uint, param *int) void {
	if glSamplerParameterIiv_procAddress == null {
		glSamplerParameterIiv_procAddress = pointer_cast(wglGetProcAddressChecked("glSamplerParameterIiv"), fun<uint, uint, *int, void>)
	}
	glSamplerParameterIiv_procAddress(sampler, pname, param)
}

:glSamplerParameterIuiv_procAddress fun<uint, uint, *uint, void> #Mutable
glSamplerParameterIuiv(sampler uint, pname uint, param *uint) void {
	if glSamplerParameterIuiv_procAddress == null {
		glSamplerParameterIuiv_procAddress = pointer_cast(wglGetProcAddressChecked("glSamplerParameterIuiv"), fun<uint, uint, *uint, void>)
	}
	glSamplerParameterIuiv_procAddress(sampler, pname, param)
}

:glSamplerParameterf_procAddress fun<uint, uint, float, void> #Mutable
glSamplerParameterf(sampler uint, pname uint, param float) void {
	if glSamplerParameterf_procAddress == null {
		glSamplerParameterf_procAddress = pointer_cast(wglGetProcAddressChecked("glSamplerParameterf"), fun<uint, uint, float, void>)
	}
	glSamplerParameterf_procAddress(sampler, pname, param)
}

:glSamplerParameterfv_procAddress fun<uint, uint, *float, void> #Mutable
glSamplerParameterfv(sampler uint, pname uint, param *float) void {
	if glSamplerParameterfv_procAddress == null {
		glSamplerParameterfv_procAddress = pointer_cast(wglGetProcAddressChecked("glSamplerParameterfv"), fun<uint, uint, *float, void>)
	}
	glSamplerParameterfv_procAddress(sampler, pname, param)
}

:glSamplerParameteri_procAddress fun<uint, uint, int, void> #Mutable
glSamplerParameteri(sampler uint, pname uint, param int) void {
	if glSamplerParameteri_procAddress == null {
		glSamplerParameteri_procAddress = pointer_cast(wglGetProcAddressChecked("glSamplerParameteri"), fun<uint, uint, int, void>)
	}
	glSamplerParameteri_procAddress(sampler, pname, param)
}

:glSamplerParameteriv_procAddress fun<uint, uint, *int, void> #Mutable
glSamplerParameteriv(sampler uint, pname uint, param *int) void {
	if glSamplerParameteriv_procAddress == null {
		glSamplerParameteriv_procAddress = pointer_cast(wglGetProcAddressChecked("glSamplerParameteriv"), fun<uint, uint, *int, void>)
	}
	glSamplerParameteriv_procAddress(sampler, pname, param)
}

:glSecondaryColorP3ui_procAddress fun<uint, uint, void> #Mutable
glSecondaryColorP3ui(type uint, color uint) void {
	if glSecondaryColorP3ui_procAddress == null {
		glSecondaryColorP3ui_procAddress = pointer_cast(wglGetProcAddressChecked("glSecondaryColorP3ui"), fun<uint, uint, void>)
	}
	glSecondaryColorP3ui_procAddress(type, color)
}

:glSecondaryColorP3uiv_procAddress fun<uint, *uint, void> #Mutable
glSecondaryColorP3uiv(type uint, color *uint) void {
	if glSecondaryColorP3uiv_procAddress == null {
		glSecondaryColorP3uiv_procAddress = pointer_cast(wglGetProcAddressChecked("glSecondaryColorP3uiv"), fun<uint, *uint, void>)
	}
	glSecondaryColorP3uiv_procAddress(type, color)
}

:glShaderSource_procAddress fun<uint, int, **sbyte, *int, void> #Mutable
glShaderSource(shader uint, count int, string_ **sbyte, length *int) void {
	if glShaderSource_procAddress == null {
		glShaderSource_procAddress = pointer_cast(wglGetProcAddressChecked("glShaderSource"), fun<uint, int, **sbyte, *int, void>)
	}
	glShaderSource_procAddress(shader, count, string_, length)
}

:glStencilFuncSeparate_procAddress fun<uint, uint, int, uint, void> #Mutable
glStencilFuncSeparate(face uint, func uint, ref_ int, mask uint) void {
	if glStencilFuncSeparate_procAddress == null {
		glStencilFuncSeparate_procAddress = pointer_cast(wglGetProcAddressChecked("glStencilFuncSeparate"), fun<uint, uint, int, uint, void>)
	}
	glStencilFuncSeparate_procAddress(face, func, ref_, mask)
}

:glStencilMaskSeparate_procAddress fun<uint, uint, void> #Mutable
glStencilMaskSeparate(face uint, mask uint) void {
	if glStencilMaskSeparate_procAddress == null {
		glStencilMaskSeparate_procAddress = pointer_cast(wglGetProcAddressChecked("glStencilMaskSeparate"), fun<uint, uint, void>)
	}
	glStencilMaskSeparate_procAddress(face, mask)
}

:glStencilOpSeparate_procAddress fun<uint, uint, uint, uint, void> #Mutable
glStencilOpSeparate(face uint, sfail uint, dpfail uint, dppass uint) void {
	if glStencilOpSeparate_procAddress == null {
		glStencilOpSeparate_procAddress = pointer_cast(wglGetProcAddressChecked("glStencilOpSeparate"), fun<uint, uint, uint, uint, void>)
	}
	glStencilOpSeparate_procAddress(face, sfail, dpfail, dppass)
}

:glTexBuffer_procAddress fun<uint, uint, uint, void> #Mutable
glTexBuffer(target uint, internalformat uint, buffer uint) void {
	if glTexBuffer_procAddress == null {
		glTexBuffer_procAddress = pointer_cast(wglGetProcAddressChecked("glTexBuffer"), fun<uint, uint, uint, void>)
	}
	glTexBuffer_procAddress(target, internalformat, buffer)
}

:glTexCoordP1ui_procAddress fun<uint, uint, void> #Mutable
glTexCoordP1ui(type uint, coords uint) void {
	if glTexCoordP1ui_procAddress == null {
		glTexCoordP1ui_procAddress = pointer_cast(wglGetProcAddressChecked("glTexCoordP1ui"), fun<uint, uint, void>)
	}
	glTexCoordP1ui_procAddress(type, coords)
}

:glTexCoordP1uiv_procAddress fun<uint, *uint, void> #Mutable
glTexCoordP1uiv(type uint, coords *uint) void {
	if glTexCoordP1uiv_procAddress == null {
		glTexCoordP1uiv_procAddress = pointer_cast(wglGetProcAddressChecked("glTexCoordP1uiv"), fun<uint, *uint, void>)
	}
	glTexCoordP1uiv_procAddress(type, coords)
}

:glTexCoordP2ui_procAddress fun<uint, uint, void> #Mutable
glTexCoordP2ui(type uint, coords uint) void {
	if glTexCoordP2ui_procAddress == null {
		glTexCoordP2ui_procAddress = pointer_cast(wglGetProcAddressChecked("glTexCoordP2ui"), fun<uint, uint, void>)
	}
	glTexCoordP2ui_procAddress(type, coords)
}

:glTexCoordP2uiv_procAddress fun<uint, *uint, void> #Mutable
glTexCoordP2uiv(type uint, coords *uint) void {
	if glTexCoordP2uiv_procAddress == null {
		glTexCoordP2uiv_procAddress = pointer_cast(wglGetProcAddressChecked("glTexCoordP2uiv"), fun<uint, *uint, void>)
	}
	glTexCoordP2uiv_procAddress(type, coords)
}

:glTexCoordP3ui_procAddress fun<uint, uint, void> #Mutable
glTexCoordP3ui(type uint, coords uint) void {
	if glTexCoordP3ui_procAddress == null {
		glTexCoordP3ui_procAddress = pointer_cast(wglGetProcAddressChecked("glTexCoordP3ui"), fun<uint, uint, void>)
	}
	glTexCoordP3ui_procAddress(type, coords)
}

:glTexCoordP3uiv_procAddress fun<uint, *uint, void> #Mutable
glTexCoordP3uiv(type uint, coords *uint) void {
	if glTexCoordP3uiv_procAddress == null {
		glTexCoordP3uiv_procAddress = pointer_cast(wglGetProcAddressChecked("glTexCoordP3uiv"), fun<uint, *uint, void>)
	}
	glTexCoordP3uiv_procAddress(type, coords)
}

:glTexCoordP4ui_procAddress fun<uint, uint, void> #Mutable
glTexCoordP4ui(type uint, coords uint) void {
	if glTexCoordP4ui_procAddress == null {
		glTexCoordP4ui_procAddress = pointer_cast(wglGetProcAddressChecked("glTexCoordP4ui"), fun<uint, uint, void>)
	}
	glTexCoordP4ui_procAddress(type, coords)
}

:glTexCoordP4uiv_procAddress fun<uint, *uint, void> #Mutable
glTexCoordP4uiv(type uint, coords *uint) void {
	if glTexCoordP4uiv_procAddress == null {
		glTexCoordP4uiv_procAddress = pointer_cast(wglGetProcAddressChecked("glTexCoordP4uiv"), fun<uint, *uint, void>)
	}
	glTexCoordP4uiv_procAddress(type, coords)
}

:glTexImage2DMultisample_procAddress fun<uint, int, uint, int, int, bool, void> #Mutable
glTexImage2DMultisample(target uint, samples int, internalformat uint, width int, height int, fixedsamplelocations bool) void {
	if glTexImage2DMultisample_procAddress == null {
		glTexImage2DMultisample_procAddress = pointer_cast(wglGetProcAddressChecked("glTexImage2DMultisample"), fun<uint, int, uint, int, int, bool, void>)
	}
	glTexImage2DMultisample_procAddress(target, samples, internalformat, width, height, fixedsamplelocations)
}

:glTexImage3D_procAddress fun<uint, int, int, int, int, int, int, uint, uint, pointer, void> #Mutable
glTexImage3D(target uint, level int, internalformat int, width int, height int, depth int, border int, format uint, type uint, pixels pointer) void {
	if glTexImage3D_procAddress == null {
		glTexImage3D_procAddress = pointer_cast(wglGetProcAddressChecked("glTexImage3D"), fun<uint, int, int, int, int, int, int, uint, uint, pointer, void>)
	}
	glTexImage3D_procAddress(target, level, internalformat, width, height, depth, border, format, type, pixels)
}

:glTexImage3DMultisample_procAddress fun<uint, int, uint, int, int, int, bool, void> #Mutable
glTexImage3DMultisample(target uint, samples int, internalformat uint, width int, height int, depth int, fixedsamplelocations bool) void {
	if glTexImage3DMultisample_procAddress == null {
		glTexImage3DMultisample_procAddress = pointer_cast(wglGetProcAddressChecked("glTexImage3DMultisample"), fun<uint, int, uint, int, int, int, bool, void>)
	}
	glTexImage3DMultisample_procAddress(target, samples, internalformat, width, height, depth, fixedsamplelocations)
}

:glTexParameterIiv_procAddress fun<uint, uint, *int, void> #Mutable
glTexParameterIiv(target uint, pname uint, params *int) void {
	if glTexParameterIiv_procAddress == null {
		glTexParameterIiv_procAddress = pointer_cast(wglGetProcAddressChecked("glTexParameterIiv"), fun<uint, uint, *int, void>)
	}
	glTexParameterIiv_procAddress(target, pname, params)
}

:glTexParameterIuiv_procAddress fun<uint, uint, *uint, void> #Mutable
glTexParameterIuiv(target uint, pname uint, params *uint) void {
	if glTexParameterIuiv_procAddress == null {
		glTexParameterIuiv_procAddress = pointer_cast(wglGetProcAddressChecked("glTexParameterIuiv"), fun<uint, uint, *uint, void>)
	}
	glTexParameterIuiv_procAddress(target, pname, params)
}

:glTexSubImage3D_procAddress fun<uint, int, int, int, int, int, int, int, uint, uint, pointer, void> #Mutable
glTexSubImage3D(target uint, level int, xoffset int, yoffset int, zoffset int, width int, height int, depth int, format uint, type uint, pixels pointer) void {
	if glTexSubImage3D_procAddress == null {
		glTexSubImage3D_procAddress = pointer_cast(wglGetProcAddressChecked("glTexSubImage3D"), fun<uint, int, int, int, int, int, int, int, uint, uint, pointer, void>)
	}
	glTexSubImage3D_procAddress(target, level, xoffset, yoffset, zoffset, width, height, depth, format, type, pixels)
}

:glTransformFeedbackVaryings_procAddress fun<uint, int, **sbyte, uint, void> #Mutable
glTransformFeedbackVaryings(program uint, count int, varyings **sbyte, bufferMode uint) void {
	if glTransformFeedbackVaryings_procAddress == null {
		glTransformFeedbackVaryings_procAddress = pointer_cast(wglGetProcAddressChecked("glTransformFeedbackVaryings"), fun<uint, int, **sbyte, uint, void>)
	}
	glTransformFeedbackVaryings_procAddress(program, count, varyings, bufferMode)
}

:glUniform1f_procAddress fun<int, float, void> #Mutable
glUniform1f(location int, v0 float) void {
	if glUniform1f_procAddress == null {
		glUniform1f_procAddress = pointer_cast(wglGetProcAddressChecked("glUniform1f"), fun<int, float, void>)
	}
	glUniform1f_procAddress(location, v0)
}

:glUniform1fv_procAddress fun<int, int, *float, void> #Mutable
glUniform1fv(location int, count int, value *float) void {
	if glUniform1fv_procAddress == null {
		glUniform1fv_procAddress = pointer_cast(wglGetProcAddressChecked("glUniform1fv"), fun<int, int, *float, void>)
	}
	glUniform1fv_procAddress(location, count, value)
}

:glUniform1i_procAddress fun<int, int, void> #Mutable
glUniform1i(location int, v0 int) void {
	if glUniform1i_procAddress == null {
		glUniform1i_procAddress = pointer_cast(wglGetProcAddressChecked("glUniform1i"), fun<int, int, void>)
	}
	glUniform1i_procAddress(location, v0)
}

:glUniform1iv_procAddress fun<int, int, *int, void> #Mutable
glUniform1iv(location int, count int, value *int) void {
	if glUniform1iv_procAddress == null {
		glUniform1iv_procAddress = pointer_cast(wglGetProcAddressChecked("glUniform1iv"), fun<int, int, *int, void>)
	}
	glUniform1iv_procAddress(location, count, value)
}

:glUniform1ui_procAddress fun<int, uint, void> #Mutable
glUniform1ui(location int, v0 uint) void {
	if glUniform1ui_procAddress == null {
		glUniform1ui_procAddress = pointer_cast(wglGetProcAddressChecked("glUniform1ui"), fun<int, uint, void>)
	}
	glUniform1ui_procAddress(location, v0)
}

:glUniform1uiv_procAddress fun<int, int, *uint, void> #Mutable
glUniform1uiv(location int, count int, value *uint) void {
	if glUniform1uiv_procAddress == null {
		glUniform1uiv_procAddress = pointer_cast(wglGetProcAddressChecked("glUniform1uiv"), fun<int, int, *uint, void>)
	}
	glUniform1uiv_procAddress(location, count, value)
}

:glUniform2f_procAddress fun<int, float, float, void> #Mutable
glUniform2f(location int, v0 float, v1 float) void {
	if glUniform2f_procAddress == null {
		glUniform2f_procAddress = pointer_cast(wglGetProcAddressChecked("glUniform2f"), fun<int, float, float, void>)
	}
	glUniform2f_procAddress(location, v0, v1)
}

:glUniform2fv_procAddress fun<int, int, *float, void> #Mutable
glUniform2fv(location int, count int, value *float) void {
	if glUniform2fv_procAddress == null {
		glUniform2fv_procAddress = pointer_cast(wglGetProcAddressChecked("glUniform2fv"), fun<int, int, *float, void>)
	}
	glUniform2fv_procAddress(location, count, value)
}

:glUniform2i_procAddress fun<int, int, int, void> #Mutable
glUniform2i(location int, v0 int, v1 int) void {
	if glUniform2i_procAddress == null {
		glUniform2i_procAddress = pointer_cast(wglGetProcAddressChecked("glUniform2i"), fun<int, int, int, void>)
	}
	glUniform2i_procAddress(location, v0, v1)
}

:glUniform2iv_procAddress fun<int, int, *int, void> #Mutable
glUniform2iv(location int, count int, value *int) void {
	if glUniform2iv_procAddress == null {
		glUniform2iv_procAddress = pointer_cast(wglGetProcAddressChecked("glUniform2iv"), fun<int, int, *int, void>)
	}
	glUniform2iv_procAddress(location, count, value)
}

:glUniform2ui_procAddress fun<int, uint, uint, void> #Mutable
glUniform2ui(location int, v0 uint, v1 uint) void {
	if glUniform2ui_procAddress == null {
		glUniform2ui_procAddress = pointer_cast(wglGetProcAddressChecked("glUniform2ui"), fun<int, uint, uint, void>)
	}
	glUniform2ui_procAddress(location, v0, v1)
}

:glUniform2uiv_procAddress fun<int, int, *uint, void> #Mutable
glUniform2uiv(location int, count int, value *uint) void {
	if glUniform2uiv_procAddress == null {
		glUniform2uiv_procAddress = pointer_cast(wglGetProcAddressChecked("glUniform2uiv"), fun<int, int, *uint, void>)
	}
	glUniform2uiv_procAddress(location, count, value)
}

:glUniform3f_procAddress fun<int, float, float, float, void> #Mutable
glUniform3f(location int, v0 float, v1 float, v2 float) void {
	if glUniform3f_procAddress == null {
		glUniform3f_procAddress = pointer_cast(wglGetProcAddressChecked("glUniform3f"), fun<int, float, float, float, void>)
	}
	glUniform3f_procAddress(location, v0, v1, v2)
}

:glUniform3fv_procAddress fun<int, int, *float, void> #Mutable
glUniform3fv(location int, count int, value *float) void {
	if glUniform3fv_procAddress == null {
		glUniform3fv_procAddress = pointer_cast(wglGetProcAddressChecked("glUniform3fv"), fun<int, int, *float, void>)
	}
	glUniform3fv_procAddress(location, count, value)
}

:glUniform3i_procAddress fun<int, int, int, int, void> #Mutable
glUniform3i(location int, v0 int, v1 int, v2 int) void {
	if glUniform3i_procAddress == null {
		glUniform3i_procAddress = pointer_cast(wglGetProcAddressChecked("glUniform3i"), fun<int, int, int, int, void>)
	}
	glUniform3i_procAddress(location, v0, v1, v2)
}

:glUniform3iv_procAddress fun<int, int, *int, void> #Mutable
glUniform3iv(location int, count int, value *int) void {
	if glUniform3iv_procAddress == null {
		glUniform3iv_procAddress = pointer_cast(wglGetProcAddressChecked("glUniform3iv"), fun<int, int, *int, void>)
	}
	glUniform3iv_procAddress(location, count, value)
}

:glUniform3ui_procAddress fun<int, uint, uint, uint, void> #Mutable
glUniform3ui(location int, v0 uint, v1 uint, v2 uint) void {
	if glUniform3ui_procAddress == null {
		glUniform3ui_procAddress = pointer_cast(wglGetProcAddressChecked("glUniform3ui"), fun<int, uint, uint, uint, void>)
	}
	glUniform3ui_procAddress(location, v0, v1, v2)
}

:glUniform3uiv_procAddress fun<int, int, *uint, void> #Mutable
glUniform3uiv(location int, count int, value *uint) void {
	if glUniform3uiv_procAddress == null {
		glUniform3uiv_procAddress = pointer_cast(wglGetProcAddressChecked("glUniform3uiv"), fun<int, int, *uint, void>)
	}
	glUniform3uiv_procAddress(location, count, value)
}

:glUniform4f_procAddress fun<int, float, float, float, float, void> #Mutable
glUniform4f(location int, v0 float, v1 float, v2 float, v3 float) void {
	if glUniform4f_procAddress == null {
		glUniform4f_procAddress = pointer_cast(wglGetProcAddressChecked("glUniform4f"), fun<int, float, float, float, float, void>)
	}
	glUniform4f_procAddress(location, v0, v1, v2, v3)
}

:glUniform4fv_procAddress fun<int, int, *float, void> #Mutable
glUniform4fv(location int, count int, value *float) void {
	if glUniform4fv_procAddress == null {
		glUniform4fv_procAddress = pointer_cast(wglGetProcAddressChecked("glUniform4fv"), fun<int, int, *float, void>)
	}
	glUniform4fv_procAddress(location, count, value)
}

:glUniform4i_procAddress fun<int, int, int, int, int, void> #Mutable
glUniform4i(location int, v0 int, v1 int, v2 int, v3 int) void {
	if glUniform4i_procAddress == null {
		glUniform4i_procAddress = pointer_cast(wglGetProcAddressChecked("glUniform4i"), fun<int, int, int, int, int, void>)
	}
	glUniform4i_procAddress(location, v0, v1, v2, v3)
}

:glUniform4iv_procAddress fun<int, int, *int, void> #Mutable
glUniform4iv(location int, count int, value *int) void {
	if glUniform4iv_procAddress == null {
		glUniform4iv_procAddress = pointer_cast(wglGetProcAddressChecked("glUniform4iv"), fun<int, int, *int, void>)
	}
	glUniform4iv_procAddress(location, count, value)
}

:glUniform4ui_procAddress fun<int, uint, uint, uint, uint, void> #Mutable
glUniform4ui(location int, v0 uint, v1 uint, v2 uint, v3 uint) void {
	if glUniform4ui_procAddress == null {
		glUniform4ui_procAddress = pointer_cast(wglGetProcAddressChecked("glUniform4ui"), fun<int, uint, uint, uint, uint, void>)
	}
	glUniform4ui_procAddress(location, v0, v1, v2, v3)
}

:glUniform4uiv_procAddress fun<int, int, *uint, void> #Mutable
glUniform4uiv(location int, count int, value *uint) void {
	if glUniform4uiv_procAddress == null {
		glUniform4uiv_procAddress = pointer_cast(wglGetProcAddressChecked("glUniform4uiv"), fun<int, int, *uint, void>)
	}
	glUniform4uiv_procAddress(location, count, value)
}

:glUniformBlockBinding_procAddress fun<uint, uint, uint, void> #Mutable
glUniformBlockBinding(program uint, uniformBlockIndex uint, uniformBlockBinding uint) void {
	if glUniformBlockBinding_procAddress == null {
		glUniformBlockBinding_procAddress = pointer_cast(wglGetProcAddressChecked("glUniformBlockBinding"), fun<uint, uint, uint, void>)
	}
	glUniformBlockBinding_procAddress(program, uniformBlockIndex, uniformBlockBinding)
}

:glUniformMatrix2fv_procAddress fun<int, int, bool, *float, void> #Mutable
glUniformMatrix2fv(location int, count int, transpose bool, value *float) void {
	if glUniformMatrix2fv_procAddress == null {
		glUniformMatrix2fv_procAddress = pointer_cast(wglGetProcAddressChecked("glUniformMatrix2fv"), fun<int, int, bool, *float, void>)
	}
	glUniformMatrix2fv_procAddress(location, count, transpose, value)
}

:glUniformMatrix2x3fv_procAddress fun<int, int, bool, *float, void> #Mutable
glUniformMatrix2x3fv(location int, count int, transpose bool, value *float) void {
	if glUniformMatrix2x3fv_procAddress == null {
		glUniformMatrix2x3fv_procAddress = pointer_cast(wglGetProcAddressChecked("glUniformMatrix2x3fv"), fun<int, int, bool, *float, void>)
	}
	glUniformMatrix2x3fv_procAddress(location, count, transpose, value)
}

:glUniformMatrix2x4fv_procAddress fun<int, int, bool, *float, void> #Mutable
glUniformMatrix2x4fv(location int, count int, transpose bool, value *float) void {
	if glUniformMatrix2x4fv_procAddress == null {
		glUniformMatrix2x4fv_procAddress = pointer_cast(wglGetProcAddressChecked("glUniformMatrix2x4fv"), fun<int, int, bool, *float, void>)
	}
	glUniformMatrix2x4fv_procAddress(location, count, transpose, value)
}

:glUniformMatrix3fv_procAddress fun<int, int, bool, *float, void> #Mutable
glUniformMatrix3fv(location int, count int, transpose bool, value *float) void {
	if glUniformMatrix3fv_procAddress == null {
		glUniformMatrix3fv_procAddress = pointer_cast(wglGetProcAddressChecked("glUniformMatrix3fv"), fun<int, int, bool, *float, void>)
	}
	glUniformMatrix3fv_procAddress(location, count, transpose, value)
}

:glUniformMatrix3x2fv_procAddress fun<int, int, bool, *float, void> #Mutable
glUniformMatrix3x2fv(location int, count int, transpose bool, value *float) void {
	if glUniformMatrix3x2fv_procAddress == null {
		glUniformMatrix3x2fv_procAddress = pointer_cast(wglGetProcAddressChecked("glUniformMatrix3x2fv"), fun<int, int, bool, *float, void>)
	}
	glUniformMatrix3x2fv_procAddress(location, count, transpose, value)
}

:glUniformMatrix3x4fv_procAddress fun<int, int, bool, *float, void> #Mutable
glUniformMatrix3x4fv(location int, count int, transpose bool, value *float) void {
	if glUniformMatrix3x4fv_procAddress == null {
		glUniformMatrix3x4fv_procAddress = pointer_cast(wglGetProcAddressChecked("glUniformMatrix3x4fv"), fun<int, int, bool, *float, void>)
	}
	glUniformMatrix3x4fv_procAddress(location, count, transpose, value)
}

:glUniformMatrix4fv_procAddress fun<int, int, bool, *float, void> #Mutable
glUniformMatrix4fv(location int, count int, transpose bool, value *float) void {
	if glUniformMatrix4fv_procAddress == null {
		glUniformMatrix4fv_procAddress = pointer_cast(wglGetProcAddressChecked("glUniformMatrix4fv"), fun<int, int, bool, *float, void>)
	}
	glUniformMatrix4fv_procAddress(location, count, transpose, value)
}

:glUniformMatrix4x2fv_procAddress fun<int, int, bool, *float, void> #Mutable
glUniformMatrix4x2fv(location int, count int, transpose bool, value *float) void {
	if glUniformMatrix4x2fv_procAddress == null {
		glUniformMatrix4x2fv_procAddress = pointer_cast(wglGetProcAddressChecked("glUniformMatrix4x2fv"), fun<int, int, bool, *float, void>)
	}
	glUniformMatrix4x2fv_procAddress(location, count, transpose, value)
}

:glUniformMatrix4x3fv_procAddress fun<int, int, bool, *float, void> #Mutable
glUniformMatrix4x3fv(location int, count int, transpose bool, value *float) void {
	if glUniformMatrix4x3fv_procAddress == null {
		glUniformMatrix4x3fv_procAddress = pointer_cast(wglGetProcAddressChecked("glUniformMatrix4x3fv"), fun<int, int, bool, *float, void>)
	}
	glUniformMatrix4x3fv_procAddress(location, count, transpose, value)
}

:glUnmapBuffer_procAddress fun<uint, bool> #Mutable
glUnmapBuffer(target uint) bool {
	if glUnmapBuffer_procAddress == null {
		glUnmapBuffer_procAddress = pointer_cast(wglGetProcAddressChecked("glUnmapBuffer"), fun<uint, bool>)
	}
	return glUnmapBuffer_procAddress(target)
}

:glUseProgram_procAddress fun<uint, void> #Mutable
glUseProgram(program uint) void {
	if glUseProgram_procAddress == null {
		glUseProgram_procAddress = pointer_cast(wglGetProcAddressChecked("glUseProgram"), fun<uint, void>)
	}
	glUseProgram_procAddress(program)
}

:glValidateProgram_procAddress fun<uint, void> #Mutable
glValidateProgram(program uint) void {
	if glValidateProgram_procAddress == null {
		glValidateProgram_procAddress = pointer_cast(wglGetProcAddressChecked("glValidateProgram"), fun<uint, void>)
	}
	glValidateProgram_procAddress(program)
}

:glVertexAttrib1d_procAddress fun<uint, double, void> #Mutable
glVertexAttrib1d(index uint, x double) void {
	if glVertexAttrib1d_procAddress == null {
		glVertexAttrib1d_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttrib1d"), fun<uint, double, void>)
	}
	glVertexAttrib1d_procAddress(index, x)
}

:glVertexAttrib1dv_procAddress fun<uint, *double, void> #Mutable
glVertexAttrib1dv(index uint, v *double) void {
	if glVertexAttrib1dv_procAddress == null {
		glVertexAttrib1dv_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttrib1dv"), fun<uint, *double, void>)
	}
	glVertexAttrib1dv_procAddress(index, v)
}

:glVertexAttrib1f_procAddress fun<uint, float, void> #Mutable
glVertexAttrib1f(index uint, x float) void {
	if glVertexAttrib1f_procAddress == null {
		glVertexAttrib1f_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttrib1f"), fun<uint, float, void>)
	}
	glVertexAttrib1f_procAddress(index, x)
}

:glVertexAttrib1fv_procAddress fun<uint, *float, void> #Mutable
glVertexAttrib1fv(index uint, v *float) void {
	if glVertexAttrib1fv_procAddress == null {
		glVertexAttrib1fv_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttrib1fv"), fun<uint, *float, void>)
	}
	glVertexAttrib1fv_procAddress(index, v)
}

:glVertexAttrib1s_procAddress fun<uint, short, void> #Mutable
glVertexAttrib1s(index uint, x short) void {
	if glVertexAttrib1s_procAddress == null {
		glVertexAttrib1s_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttrib1s"), fun<uint, short, void>)
	}
	glVertexAttrib1s_procAddress(index, x)
}

:glVertexAttrib1sv_procAddress fun<uint, *short, void> #Mutable
glVertexAttrib1sv(index uint, v *short) void {
	if glVertexAttrib1sv_procAddress == null {
		glVertexAttrib1sv_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttrib1sv"), fun<uint, *short, void>)
	}
	glVertexAttrib1sv_procAddress(index, v)
}

:glVertexAttrib2d_procAddress fun<uint, double, double, void> #Mutable
glVertexAttrib2d(index uint, x double, y double) void {
	if glVertexAttrib2d_procAddress == null {
		glVertexAttrib2d_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttrib2d"), fun<uint, double, double, void>)
	}
	glVertexAttrib2d_procAddress(index, x, y)
}

:glVertexAttrib2dv_procAddress fun<uint, *double, void> #Mutable
glVertexAttrib2dv(index uint, v *double) void {
	if glVertexAttrib2dv_procAddress == null {
		glVertexAttrib2dv_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttrib2dv"), fun<uint, *double, void>)
	}
	glVertexAttrib2dv_procAddress(index, v)
}

:glVertexAttrib2f_procAddress fun<uint, float, float, void> #Mutable
glVertexAttrib2f(index uint, x float, y float) void {
	if glVertexAttrib2f_procAddress == null {
		glVertexAttrib2f_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttrib2f"), fun<uint, float, float, void>)
	}
	glVertexAttrib2f_procAddress(index, x, y)
}

:glVertexAttrib2fv_procAddress fun<uint, *float, void> #Mutable
glVertexAttrib2fv(index uint, v *float) void {
	if glVertexAttrib2fv_procAddress == null {
		glVertexAttrib2fv_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttrib2fv"), fun<uint, *float, void>)
	}
	glVertexAttrib2fv_procAddress(index, v)
}

:glVertexAttrib2s_procAddress fun<uint, short, short, void> #Mutable
glVertexAttrib2s(index uint, x short, y short) void {
	if glVertexAttrib2s_procAddress == null {
		glVertexAttrib2s_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttrib2s"), fun<uint, short, short, void>)
	}
	glVertexAttrib2s_procAddress(index, x, y)
}

:glVertexAttrib2sv_procAddress fun<uint, *short, void> #Mutable
glVertexAttrib2sv(index uint, v *short) void {
	if glVertexAttrib2sv_procAddress == null {
		glVertexAttrib2sv_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttrib2sv"), fun<uint, *short, void>)
	}
	glVertexAttrib2sv_procAddress(index, v)
}

:glVertexAttrib3d_procAddress fun<uint, double, double, double, void> #Mutable
glVertexAttrib3d(index uint, x double, y double, z double) void {
	if glVertexAttrib3d_procAddress == null {
		glVertexAttrib3d_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttrib3d"), fun<uint, double, double, double, void>)
	}
	glVertexAttrib3d_procAddress(index, x, y, z)
}

:glVertexAttrib3dv_procAddress fun<uint, *double, void> #Mutable
glVertexAttrib3dv(index uint, v *double) void {
	if glVertexAttrib3dv_procAddress == null {
		glVertexAttrib3dv_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttrib3dv"), fun<uint, *double, void>)
	}
	glVertexAttrib3dv_procAddress(index, v)
}

:glVertexAttrib3f_procAddress fun<uint, float, float, float, void> #Mutable
glVertexAttrib3f(index uint, x float, y float, z float) void {
	if glVertexAttrib3f_procAddress == null {
		glVertexAttrib3f_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttrib3f"), fun<uint, float, float, float, void>)
	}
	glVertexAttrib3f_procAddress(index, x, y, z)
}

:glVertexAttrib3fv_procAddress fun<uint, *float, void> #Mutable
glVertexAttrib3fv(index uint, v *float) void {
	if glVertexAttrib3fv_procAddress == null {
		glVertexAttrib3fv_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttrib3fv"), fun<uint, *float, void>)
	}
	glVertexAttrib3fv_procAddress(index, v)
}

:glVertexAttrib3s_procAddress fun<uint, short, short, short, void> #Mutable
glVertexAttrib3s(index uint, x short, y short, z short) void {
	if glVertexAttrib3s_procAddress == null {
		glVertexAttrib3s_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttrib3s"), fun<uint, short, short, short, void>)
	}
	glVertexAttrib3s_procAddress(index, x, y, z)
}

:glVertexAttrib3sv_procAddress fun<uint, *short, void> #Mutable
glVertexAttrib3sv(index uint, v *short) void {
	if glVertexAttrib3sv_procAddress == null {
		glVertexAttrib3sv_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttrib3sv"), fun<uint, *short, void>)
	}
	glVertexAttrib3sv_procAddress(index, v)
}

:glVertexAttrib4Nbv_procAddress fun<uint, *sbyte, void> #Mutable
glVertexAttrib4Nbv(index uint, v *sbyte) void {
	if glVertexAttrib4Nbv_procAddress == null {
		glVertexAttrib4Nbv_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttrib4Nbv"), fun<uint, *sbyte, void>)
	}
	glVertexAttrib4Nbv_procAddress(index, v)
}

:glVertexAttrib4Niv_procAddress fun<uint, *int, void> #Mutable
glVertexAttrib4Niv(index uint, v *int) void {
	if glVertexAttrib4Niv_procAddress == null {
		glVertexAttrib4Niv_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttrib4Niv"), fun<uint, *int, void>)
	}
	glVertexAttrib4Niv_procAddress(index, v)
}

:glVertexAttrib4Nsv_procAddress fun<uint, *short, void> #Mutable
glVertexAttrib4Nsv(index uint, v *short) void {
	if glVertexAttrib4Nsv_procAddress == null {
		glVertexAttrib4Nsv_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttrib4Nsv"), fun<uint, *short, void>)
	}
	glVertexAttrib4Nsv_procAddress(index, v)
}

:glVertexAttrib4Nub_procAddress fun<uint, byte, byte, byte, byte, void> #Mutable
glVertexAttrib4Nub(index uint, x byte, y byte, z byte, w byte) void {
	if glVertexAttrib4Nub_procAddress == null {
		glVertexAttrib4Nub_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttrib4Nub"), fun<uint, byte, byte, byte, byte, void>)
	}
	glVertexAttrib4Nub_procAddress(index, x, y, z, w)
}

:glVertexAttrib4Nubv_procAddress fun<uint, *byte, void> #Mutable
glVertexAttrib4Nubv(index uint, v *byte) void {
	if glVertexAttrib4Nubv_procAddress == null {
		glVertexAttrib4Nubv_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttrib4Nubv"), fun<uint, *byte, void>)
	}
	glVertexAttrib4Nubv_procAddress(index, v)
}

:glVertexAttrib4Nuiv_procAddress fun<uint, *uint, void> #Mutable
glVertexAttrib4Nuiv(index uint, v *uint) void {
	if glVertexAttrib4Nuiv_procAddress == null {
		glVertexAttrib4Nuiv_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttrib4Nuiv"), fun<uint, *uint, void>)
	}
	glVertexAttrib4Nuiv_procAddress(index, v)
}

:glVertexAttrib4Nusv_procAddress fun<uint, *ushort, void> #Mutable
glVertexAttrib4Nusv(index uint, v *ushort) void {
	if glVertexAttrib4Nusv_procAddress == null {
		glVertexAttrib4Nusv_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttrib4Nusv"), fun<uint, *ushort, void>)
	}
	glVertexAttrib4Nusv_procAddress(index, v)
}

:glVertexAttrib4bv_procAddress fun<uint, *sbyte, void> #Mutable
glVertexAttrib4bv(index uint, v *sbyte) void {
	if glVertexAttrib4bv_procAddress == null {
		glVertexAttrib4bv_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttrib4bv"), fun<uint, *sbyte, void>)
	}
	glVertexAttrib4bv_procAddress(index, v)
}

:glVertexAttrib4d_procAddress fun<uint, double, double, double, double, void> #Mutable
glVertexAttrib4d(index uint, x double, y double, z double, w double) void {
	if glVertexAttrib4d_procAddress == null {
		glVertexAttrib4d_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttrib4d"), fun<uint, double, double, double, double, void>)
	}
	glVertexAttrib4d_procAddress(index, x, y, z, w)
}

:glVertexAttrib4dv_procAddress fun<uint, *double, void> #Mutable
glVertexAttrib4dv(index uint, v *double) void {
	if glVertexAttrib4dv_procAddress == null {
		glVertexAttrib4dv_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttrib4dv"), fun<uint, *double, void>)
	}
	glVertexAttrib4dv_procAddress(index, v)
}

:glVertexAttrib4f_procAddress fun<uint, float, float, float, float, void> #Mutable
glVertexAttrib4f(index uint, x float, y float, z float, w float) void {
	if glVertexAttrib4f_procAddress == null {
		glVertexAttrib4f_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttrib4f"), fun<uint, float, float, float, float, void>)
	}
	glVertexAttrib4f_procAddress(index, x, y, z, w)
}

:glVertexAttrib4fv_procAddress fun<uint, *float, void> #Mutable
glVertexAttrib4fv(index uint, v *float) void {
	if glVertexAttrib4fv_procAddress == null {
		glVertexAttrib4fv_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttrib4fv"), fun<uint, *float, void>)
	}
	glVertexAttrib4fv_procAddress(index, v)
}

:glVertexAttrib4iv_procAddress fun<uint, *int, void> #Mutable
glVertexAttrib4iv(index uint, v *int) void {
	if glVertexAttrib4iv_procAddress == null {
		glVertexAttrib4iv_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttrib4iv"), fun<uint, *int, void>)
	}
	glVertexAttrib4iv_procAddress(index, v)
}

:glVertexAttrib4s_procAddress fun<uint, short, short, short, short, void> #Mutable
glVertexAttrib4s(index uint, x short, y short, z short, w short) void {
	if glVertexAttrib4s_procAddress == null {
		glVertexAttrib4s_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttrib4s"), fun<uint, short, short, short, short, void>)
	}
	glVertexAttrib4s_procAddress(index, x, y, z, w)
}

:glVertexAttrib4sv_procAddress fun<uint, *short, void> #Mutable
glVertexAttrib4sv(index uint, v *short) void {
	if glVertexAttrib4sv_procAddress == null {
		glVertexAttrib4sv_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttrib4sv"), fun<uint, *short, void>)
	}
	glVertexAttrib4sv_procAddress(index, v)
}

:glVertexAttrib4ubv_procAddress fun<uint, *byte, void> #Mutable
glVertexAttrib4ubv(index uint, v *byte) void {
	if glVertexAttrib4ubv_procAddress == null {
		glVertexAttrib4ubv_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttrib4ubv"), fun<uint, *byte, void>)
	}
	glVertexAttrib4ubv_procAddress(index, v)
}

:glVertexAttrib4uiv_procAddress fun<uint, *uint, void> #Mutable
glVertexAttrib4uiv(index uint, v *uint) void {
	if glVertexAttrib4uiv_procAddress == null {
		glVertexAttrib4uiv_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttrib4uiv"), fun<uint, *uint, void>)
	}
	glVertexAttrib4uiv_procAddress(index, v)
}

:glVertexAttrib4usv_procAddress fun<uint, *ushort, void> #Mutable
glVertexAttrib4usv(index uint, v *ushort) void {
	if glVertexAttrib4usv_procAddress == null {
		glVertexAttrib4usv_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttrib4usv"), fun<uint, *ushort, void>)
	}
	glVertexAttrib4usv_procAddress(index, v)
}

:glVertexAttribDivisor_procAddress fun<uint, uint, void> #Mutable
glVertexAttribDivisor(index uint, divisor uint) void {
	if glVertexAttribDivisor_procAddress == null {
		glVertexAttribDivisor_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttribDivisor"), fun<uint, uint, void>)
	}
	glVertexAttribDivisor_procAddress(index, divisor)
}

:glVertexAttribI1i_procAddress fun<uint, int, void> #Mutable
glVertexAttribI1i(index uint, x int) void {
	if glVertexAttribI1i_procAddress == null {
		glVertexAttribI1i_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttribI1i"), fun<uint, int, void>)
	}
	glVertexAttribI1i_procAddress(index, x)
}

:glVertexAttribI1iv_procAddress fun<uint, *int, void> #Mutable
glVertexAttribI1iv(index uint, v *int) void {
	if glVertexAttribI1iv_procAddress == null {
		glVertexAttribI1iv_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttribI1iv"), fun<uint, *int, void>)
	}
	glVertexAttribI1iv_procAddress(index, v)
}

:glVertexAttribI1ui_procAddress fun<uint, uint, void> #Mutable
glVertexAttribI1ui(index uint, x uint) void {
	if glVertexAttribI1ui_procAddress == null {
		glVertexAttribI1ui_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttribI1ui"), fun<uint, uint, void>)
	}
	glVertexAttribI1ui_procAddress(index, x)
}

:glVertexAttribI1uiv_procAddress fun<uint, *uint, void> #Mutable
glVertexAttribI1uiv(index uint, v *uint) void {
	if glVertexAttribI1uiv_procAddress == null {
		glVertexAttribI1uiv_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttribI1uiv"), fun<uint, *uint, void>)
	}
	glVertexAttribI1uiv_procAddress(index, v)
}

:glVertexAttribI2i_procAddress fun<uint, int, int, void> #Mutable
glVertexAttribI2i(index uint, x int, y int) void {
	if glVertexAttribI2i_procAddress == null {
		glVertexAttribI2i_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttribI2i"), fun<uint, int, int, void>)
	}
	glVertexAttribI2i_procAddress(index, x, y)
}

:glVertexAttribI2iv_procAddress fun<uint, *int, void> #Mutable
glVertexAttribI2iv(index uint, v *int) void {
	if glVertexAttribI2iv_procAddress == null {
		glVertexAttribI2iv_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttribI2iv"), fun<uint, *int, void>)
	}
	glVertexAttribI2iv_procAddress(index, v)
}

:glVertexAttribI2ui_procAddress fun<uint, uint, uint, void> #Mutable
glVertexAttribI2ui(index uint, x uint, y uint) void {
	if glVertexAttribI2ui_procAddress == null {
		glVertexAttribI2ui_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttribI2ui"), fun<uint, uint, uint, void>)
	}
	glVertexAttribI2ui_procAddress(index, x, y)
}

:glVertexAttribI2uiv_procAddress fun<uint, *uint, void> #Mutable
glVertexAttribI2uiv(index uint, v *uint) void {
	if glVertexAttribI2uiv_procAddress == null {
		glVertexAttribI2uiv_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttribI2uiv"), fun<uint, *uint, void>)
	}
	glVertexAttribI2uiv_procAddress(index, v)
}

:glVertexAttribI3i_procAddress fun<uint, int, int, int, void> #Mutable
glVertexAttribI3i(index uint, x int, y int, z int) void {
	if glVertexAttribI3i_procAddress == null {
		glVertexAttribI3i_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttribI3i"), fun<uint, int, int, int, void>)
	}
	glVertexAttribI3i_procAddress(index, x, y, z)
}

:glVertexAttribI3iv_procAddress fun<uint, *int, void> #Mutable
glVertexAttribI3iv(index uint, v *int) void {
	if glVertexAttribI3iv_procAddress == null {
		glVertexAttribI3iv_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttribI3iv"), fun<uint, *int, void>)
	}
	glVertexAttribI3iv_procAddress(index, v)
}

:glVertexAttribI3ui_procAddress fun<uint, uint, uint, uint, void> #Mutable
glVertexAttribI3ui(index uint, x uint, y uint, z uint) void {
	if glVertexAttribI3ui_procAddress == null {
		glVertexAttribI3ui_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttribI3ui"), fun<uint, uint, uint, uint, void>)
	}
	glVertexAttribI3ui_procAddress(index, x, y, z)
}

:glVertexAttribI3uiv_procAddress fun<uint, *uint, void> #Mutable
glVertexAttribI3uiv(index uint, v *uint) void {
	if glVertexAttribI3uiv_procAddress == null {
		glVertexAttribI3uiv_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttribI3uiv"), fun<uint, *uint, void>)
	}
	glVertexAttribI3uiv_procAddress(index, v)
}

:glVertexAttribI4bv_procAddress fun<uint, *sbyte, void> #Mutable
glVertexAttribI4bv(index uint, v *sbyte) void {
	if glVertexAttribI4bv_procAddress == null {
		glVertexAttribI4bv_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttribI4bv"), fun<uint, *sbyte, void>)
	}
	glVertexAttribI4bv_procAddress(index, v)
}

:glVertexAttribI4i_procAddress fun<uint, int, int, int, int, void> #Mutable
glVertexAttribI4i(index uint, x int, y int, z int, w int) void {
	if glVertexAttribI4i_procAddress == null {
		glVertexAttribI4i_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttribI4i"), fun<uint, int, int, int, int, void>)
	}
	glVertexAttribI4i_procAddress(index, x, y, z, w)
}

:glVertexAttribI4iv_procAddress fun<uint, *int, void> #Mutable
glVertexAttribI4iv(index uint, v *int) void {
	if glVertexAttribI4iv_procAddress == null {
		glVertexAttribI4iv_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttribI4iv"), fun<uint, *int, void>)
	}
	glVertexAttribI4iv_procAddress(index, v)
}

:glVertexAttribI4sv_procAddress fun<uint, *short, void> #Mutable
glVertexAttribI4sv(index uint, v *short) void {
	if glVertexAttribI4sv_procAddress == null {
		glVertexAttribI4sv_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttribI4sv"), fun<uint, *short, void>)
	}
	glVertexAttribI4sv_procAddress(index, v)
}

:glVertexAttribI4ubv_procAddress fun<uint, *byte, void> #Mutable
glVertexAttribI4ubv(index uint, v *byte) void {
	if glVertexAttribI4ubv_procAddress == null {
		glVertexAttribI4ubv_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttribI4ubv"), fun<uint, *byte, void>)
	}
	glVertexAttribI4ubv_procAddress(index, v)
}

:glVertexAttribI4ui_procAddress fun<uint, uint, uint, uint, uint, void> #Mutable
glVertexAttribI4ui(index uint, x uint, y uint, z uint, w uint) void {
	if glVertexAttribI4ui_procAddress == null {
		glVertexAttribI4ui_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttribI4ui"), fun<uint, uint, uint, uint, uint, void>)
	}
	glVertexAttribI4ui_procAddress(index, x, y, z, w)
}

:glVertexAttribI4uiv_procAddress fun<uint, *uint, void> #Mutable
glVertexAttribI4uiv(index uint, v *uint) void {
	if glVertexAttribI4uiv_procAddress == null {
		glVertexAttribI4uiv_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttribI4uiv"), fun<uint, *uint, void>)
	}
	glVertexAttribI4uiv_procAddress(index, v)
}

:glVertexAttribI4usv_procAddress fun<uint, *ushort, void> #Mutable
glVertexAttribI4usv(index uint, v *ushort) void {
	if glVertexAttribI4usv_procAddress == null {
		glVertexAttribI4usv_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttribI4usv"), fun<uint, *ushort, void>)
	}
	glVertexAttribI4usv_procAddress(index, v)
}

:glVertexAttribIPointer_procAddress fun<uint, int, uint, int, pointer, void> #Mutable
glVertexAttribIPointer(index uint, size int, type uint, stride int, pointer pointer) void {
	if glVertexAttribIPointer_procAddress == null {
		glVertexAttribIPointer_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttribIPointer"), fun<uint, int, uint, int, pointer, void>)
	}
	glVertexAttribIPointer_procAddress(index, size, type, stride, pointer)
}

:glVertexAttribP1ui_procAddress fun<uint, uint, bool, uint, void> #Mutable
glVertexAttribP1ui(index uint, type uint, normalized bool, value uint) void {
	if glVertexAttribP1ui_procAddress == null {
		glVertexAttribP1ui_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttribP1ui"), fun<uint, uint, bool, uint, void>)
	}
	glVertexAttribP1ui_procAddress(index, type, normalized, value)
}

:glVertexAttribP1uiv_procAddress fun<uint, uint, bool, *uint, void> #Mutable
glVertexAttribP1uiv(index uint, type uint, normalized bool, value *uint) void {
	if glVertexAttribP1uiv_procAddress == null {
		glVertexAttribP1uiv_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttribP1uiv"), fun<uint, uint, bool, *uint, void>)
	}
	glVertexAttribP1uiv_procAddress(index, type, normalized, value)
}

:glVertexAttribP2ui_procAddress fun<uint, uint, bool, uint, void> #Mutable
glVertexAttribP2ui(index uint, type uint, normalized bool, value uint) void {
	if glVertexAttribP2ui_procAddress == null {
		glVertexAttribP2ui_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttribP2ui"), fun<uint, uint, bool, uint, void>)
	}
	glVertexAttribP2ui_procAddress(index, type, normalized, value)
}

:glVertexAttribP2uiv_procAddress fun<uint, uint, bool, *uint, void> #Mutable
glVertexAttribP2uiv(index uint, type uint, normalized bool, value *uint) void {
	if glVertexAttribP2uiv_procAddress == null {
		glVertexAttribP2uiv_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttribP2uiv"), fun<uint, uint, bool, *uint, void>)
	}
	glVertexAttribP2uiv_procAddress(index, type, normalized, value)
}

:glVertexAttribP3ui_procAddress fun<uint, uint, bool, uint, void> #Mutable
glVertexAttribP3ui(index uint, type uint, normalized bool, value uint) void {
	if glVertexAttribP3ui_procAddress == null {
		glVertexAttribP3ui_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttribP3ui"), fun<uint, uint, bool, uint, void>)
	}
	glVertexAttribP3ui_procAddress(index, type, normalized, value)
}

:glVertexAttribP3uiv_procAddress fun<uint, uint, bool, *uint, void> #Mutable
glVertexAttribP3uiv(index uint, type uint, normalized bool, value *uint) void {
	if glVertexAttribP3uiv_procAddress == null {
		glVertexAttribP3uiv_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttribP3uiv"), fun<uint, uint, bool, *uint, void>)
	}
	glVertexAttribP3uiv_procAddress(index, type, normalized, value)
}

:glVertexAttribP4ui_procAddress fun<uint, uint, bool, uint, void> #Mutable
glVertexAttribP4ui(index uint, type uint, normalized bool, value uint) void {
	if glVertexAttribP4ui_procAddress == null {
		glVertexAttribP4ui_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttribP4ui"), fun<uint, uint, bool, uint, void>)
	}
	glVertexAttribP4ui_procAddress(index, type, normalized, value)
}

:glVertexAttribP4uiv_procAddress fun<uint, uint, bool, *uint, void> #Mutable
glVertexAttribP4uiv(index uint, type uint, normalized bool, value *uint) void {
	if glVertexAttribP4uiv_procAddress == null {
		glVertexAttribP4uiv_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttribP4uiv"), fun<uint, uint, bool, *uint, void>)
	}
	glVertexAttribP4uiv_procAddress(index, type, normalized, value)
}

:glVertexAttribPointer_procAddress fun<uint, int, uint, bool, int, pointer, void> #Mutable
glVertexAttribPointer(index uint, size int, type uint, normalized bool, stride int, pointer pointer) void {
	if glVertexAttribPointer_procAddress == null {
		glVertexAttribPointer_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexAttribPointer"), fun<uint, int, uint, bool, int, pointer, void>)
	}
	glVertexAttribPointer_procAddress(index, size, type, normalized, stride, pointer)
}

:glVertexP2ui_procAddress fun<uint, uint, void> #Mutable
glVertexP2ui(type uint, value uint) void {
	if glVertexP2ui_procAddress == null {
		glVertexP2ui_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexP2ui"), fun<uint, uint, void>)
	}
	glVertexP2ui_procAddress(type, value)
}

:glVertexP2uiv_procAddress fun<uint, *uint, void> #Mutable
glVertexP2uiv(type uint, value *uint) void {
	if glVertexP2uiv_procAddress == null {
		glVertexP2uiv_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexP2uiv"), fun<uint, *uint, void>)
	}
	glVertexP2uiv_procAddress(type, value)
}

:glVertexP3ui_procAddress fun<uint, uint, void> #Mutable
glVertexP3ui(type uint, value uint) void {
	if glVertexP3ui_procAddress == null {
		glVertexP3ui_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexP3ui"), fun<uint, uint, void>)
	}
	glVertexP3ui_procAddress(type, value)
}

:glVertexP3uiv_procAddress fun<uint, *uint, void> #Mutable
glVertexP3uiv(type uint, value *uint) void {
	if glVertexP3uiv_procAddress == null {
		glVertexP3uiv_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexP3uiv"), fun<uint, *uint, void>)
	}
	glVertexP3uiv_procAddress(type, value)
}

:glVertexP4ui_procAddress fun<uint, uint, void> #Mutable
glVertexP4ui(type uint, value uint) void {
	if glVertexP4ui_procAddress == null {
		glVertexP4ui_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexP4ui"), fun<uint, uint, void>)
	}
	glVertexP4ui_procAddress(type, value)
}

:glVertexP4uiv_procAddress fun<uint, *uint, void> #Mutable
glVertexP4uiv(type uint, value *uint) void {
	if glVertexP4uiv_procAddress == null {
		glVertexP4uiv_procAddress = pointer_cast(wglGetProcAddressChecked("glVertexP4uiv"), fun<uint, *uint, void>)
	}
	glVertexP4uiv_procAddress(type, value)
}

:glWaitSync_procAddress fun<pointer, uint, ulong, void> #Mutable
glWaitSync(sync pointer, flags uint, timeout ulong) void {
	if glWaitSync_procAddress == null {
		glWaitSync_procAddress = pointer_cast(wglGetProcAddressChecked("glWaitSync"), fun<pointer, uint, ulong, void>)
	}
	glWaitSync_procAddress(sync, flags, timeout)
}

:GL_CONTEXT_FLAG_FORWARD_COMPATIBLE_BIT = 0x00000001_u
:GL_CONTEXT_CORE_PROFILE_BIT = 0x00000001_u
:GL_CONTEXT_COMPATIBILITY_PROFILE_BIT = 0x00000002_u
:GL_MAP_READ_BIT = 0x0001_u
:GL_MAP_WRITE_BIT = 0x0002_u
:GL_MAP_INVALIDATE_RANGE_BIT = 0x0004_u
:GL_MAP_INVALIDATE_BUFFER_BIT = 0x0008_u
:GL_MAP_FLUSH_EXPLICIT_BIT = 0x0010_u
:GL_MAP_UNSYNCHRONIZED_BIT = 0x0020_u
:GL_SYNC_FLUSH_COMMANDS_BIT = 0x00000001_u
:GL_INVALID_INDEX = 0xFFFFFFFF_u
:GL_TIMEOUT_IGNORED = 0xFFFFFFFFFFFFFFFF_uL
:GL_LINES_ADJACENCY = 0x000A_u
:GL_LINE_STRIP_ADJACENCY = 0x000B_u
:GL_TRIANGLES_ADJACENCY = 0x000C_u
:GL_TRIANGLE_STRIP_ADJACENCY = 0x000D_u
:GL_INVALID_FRAMEBUFFER_OPERATION = 0x0506_u
:GL_SMOOTH_POINT_SIZE_RANGE = 0x0B12_u
:GL_SMOOTH_POINT_SIZE_GRANULARITY = 0x0B13_u
:GL_SMOOTH_LINE_WIDTH_RANGE = 0x0B22_u
:GL_SMOOTH_LINE_WIDTH_GRANULARITY = 0x0B23_u
:GL_MAX_CLIP_DISTANCES = 0x0D32_u
:GL_HALF_FLOAT = 0x140B_u
:GL_CLIP_DISTANCE0 = 0x3000_u
:GL_CLIP_DISTANCE1 = 0x3001_u
:GL_CLIP_DISTANCE2 = 0x3002_u
:GL_CLIP_DISTANCE3 = 0x3003_u
:GL_CLIP_DISTANCE4 = 0x3004_u
:GL_CLIP_DISTANCE5 = 0x3005_u
:GL_CLIP_DISTANCE6 = 0x3006_u
:GL_CLIP_DISTANCE7 = 0x3007_u
:GL_CONSTANT_COLOR = 0x8001_u
:GL_ONE_MINUS_CONSTANT_COLOR = 0x8002_u
:GL_CONSTANT_ALPHA = 0x8003_u
:GL_ONE_MINUS_CONSTANT_ALPHA = 0x8004_u
:GL_BLEND_COLOR = 0x8005_u
:GL_FUNC_ADD = 0x8006_u
:GL_MIN = 0x8007_u
:GL_MAX = 0x8008_u
:GL_BLEND_EQUATION = 0x8009_u
:GL_BLEND_EQUATION_RGB = 0x8009_u
:GL_FUNC_SUBTRACT = 0x800A_u
:GL_FUNC_REVERSE_SUBTRACT = 0x800B_u
:GL_UNSIGNED_BYTE_3_3_2 = 0x8032_u
:GL_UNSIGNED_SHORT_4_4_4_4 = 0x8033_u
:GL_UNSIGNED_SHORT_5_5_5_1 = 0x8034_u
:GL_UNSIGNED_INT_8_8_8_8 = 0x8035_u
:GL_UNSIGNED_INT_10_10_10_2 = 0x8036_u
:GL_TEXTURE_BINDING_3D = 0x806A_u
:GL_PACK_SKIP_IMAGES = 0x806B_u
:GL_PACK_IMAGE_HEIGHT = 0x806C_u
:GL_UNPACK_SKIP_IMAGES = 0x806D_u
:GL_UNPACK_IMAGE_HEIGHT = 0x806E_u
:GL_TEXTURE_3D = 0x806F_u
:GL_PROXY_TEXTURE_3D = 0x8070_u
:GL_TEXTURE_DEPTH = 0x8071_u
:GL_TEXTURE_WRAP_R = 0x8072_u
:GL_MAX_3D_TEXTURE_SIZE = 0x8073_u
:GL_MULTISAMPLE = 0x809D_u
:GL_SAMPLE_ALPHA_TO_COVERAGE = 0x809E_u
:GL_SAMPLE_ALPHA_TO_ONE = 0x809F_u
:GL_SAMPLE_COVERAGE = 0x80A0_u
:GL_SAMPLE_BUFFERS = 0x80A8_u
:GL_SAMPLES = 0x80A9_u
:GL_SAMPLE_COVERAGE_VALUE = 0x80AA_u
:GL_SAMPLE_COVERAGE_INVERT = 0x80AB_u
:GL_BLEND_DST_RGB = 0x80C8_u
:GL_BLEND_SRC_RGB = 0x80C9_u
:GL_BLEND_DST_ALPHA = 0x80CA_u
:GL_BLEND_SRC_ALPHA = 0x80CB_u
:GL_BGR = 0x80E0_u
:GL_BGRA = 0x80E1_u
:GL_MAX_ELEMENTS_VERTICES = 0x80E8_u
:GL_MAX_ELEMENTS_INDICES = 0x80E9_u
:GL_POINT_FADE_THRESHOLD_SIZE = 0x8128_u
:GL_CLAMP_TO_BORDER = 0x812D_u
:GL_CLAMP_TO_EDGE = 0x812F_u
:GL_TEXTURE_MIN_LOD = 0x813A_u
:GL_TEXTURE_MAX_LOD = 0x813B_u
:GL_TEXTURE_BASE_LEVEL = 0x813C_u
:GL_TEXTURE_MAX_LEVEL = 0x813D_u
:GL_DEPTH_COMPONENT16 = 0x81A5_u
:GL_DEPTH_COMPONENT24 = 0x81A6_u
:GL_DEPTH_COMPONENT32 = 0x81A7_u
:GL_FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING = 0x8210_u
:GL_FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE = 0x8211_u
:GL_FRAMEBUFFER_ATTACHMENT_RED_SIZE = 0x8212_u
:GL_FRAMEBUFFER_ATTACHMENT_GREEN_SIZE = 0x8213_u
:GL_FRAMEBUFFER_ATTACHMENT_BLUE_SIZE = 0x8214_u
:GL_FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE = 0x8215_u
:GL_FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE = 0x8216_u
:GL_FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE = 0x8217_u
:GL_FRAMEBUFFER_DEFAULT = 0x8218_u
:GL_FRAMEBUFFER_UNDEFINED = 0x8219_u
:GL_DEPTH_STENCIL_ATTACHMENT = 0x821A_u
:GL_MAJOR_VERSION = 0x821B_u
:GL_MINOR_VERSION = 0x821C_u
:GL_NUM_EXTENSIONS = 0x821D_u
:GL_CONTEXT_FLAGS = 0x821E_u
:GL_COMPRESSED_RED = 0x8225_u
:GL_COMPRESSED_RG = 0x8226_u
:GL_RG = 0x8227_u
:GL_RG_INTEGER = 0x8228_u
:GL_R8 = 0x8229_u
:GL_R16 = 0x822A_u
:GL_RG8 = 0x822B_u
:GL_RG16 = 0x822C_u
:GL_R16F = 0x822D_u
:GL_R32F = 0x822E_u
:GL_RG16F = 0x822F_u
:GL_RG32F = 0x8230_u
:GL_R8I = 0x8231_u
:GL_R8UI = 0x8232_u
:GL_R16I = 0x8233_u
:GL_R16UI = 0x8234_u
:GL_R32I = 0x8235_u
:GL_R32UI = 0x8236_u
:GL_RG8I = 0x8237_u
:GL_RG8UI = 0x8238_u
:GL_RG16I = 0x8239_u
:GL_RG16UI = 0x823A_u
:GL_RG32I = 0x823B_u
:GL_RG32UI = 0x823C_u
:GL_UNSIGNED_BYTE_2_3_3_REV = 0x8362_u
:GL_UNSIGNED_SHORT_5_6_5 = 0x8363_u
:GL_UNSIGNED_SHORT_5_6_5_REV = 0x8364_u
:GL_UNSIGNED_SHORT_4_4_4_4_REV = 0x8365_u
:GL_UNSIGNED_SHORT_1_5_5_5_REV = 0x8366_u
:GL_UNSIGNED_INT_8_8_8_8_REV = 0x8367_u
:GL_UNSIGNED_INT_2_10_10_10_REV = 0x8368_u
:GL_MIRRORED_REPEAT = 0x8370_u
:GL_ALIASED_LINE_WIDTH_RANGE = 0x846E_u
:GL_TEXTURE0 = 0x84C0_u
:GL_TEXTURE1 = 0x84C1_u
:GL_TEXTURE2 = 0x84C2_u
:GL_TEXTURE3 = 0x84C3_u
:GL_TEXTURE4 = 0x84C4_u
:GL_TEXTURE5 = 0x84C5_u
:GL_TEXTURE6 = 0x84C6_u
:GL_TEXTURE7 = 0x84C7_u
:GL_TEXTURE8 = 0x84C8_u
:GL_TEXTURE9 = 0x84C9_u
:GL_TEXTURE10 = 0x84CA_u
:GL_TEXTURE11 = 0x84CB_u
:GL_TEXTURE12 = 0x84CC_u
:GL_TEXTURE13 = 0x84CD_u
:GL_TEXTURE14 = 0x84CE_u
:GL_TEXTURE15 = 0x84CF_u
:GL_TEXTURE16 = 0x84D0_u
:GL_TEXTURE17 = 0x84D1_u
:GL_TEXTURE18 = 0x84D2_u
:GL_TEXTURE19 = 0x84D3_u
:GL_TEXTURE20 = 0x84D4_u
:GL_TEXTURE21 = 0x84D5_u
:GL_TEXTURE22 = 0x84D6_u
:GL_TEXTURE23 = 0x84D7_u
:GL_TEXTURE24 = 0x84D8_u
:GL_TEXTURE25 = 0x84D9_u
:GL_TEXTURE26 = 0x84DA_u
:GL_TEXTURE27 = 0x84DB_u
:GL_TEXTURE28 = 0x84DC_u
:GL_TEXTURE29 = 0x84DD_u
:GL_TEXTURE30 = 0x84DE_u
:GL_TEXTURE31 = 0x84DF_u
:GL_ACTIVE_TEXTURE = 0x84E0_u
:GL_MAX_RENDERBUFFER_SIZE = 0x84E8_u
:GL_COMPRESSED_RGB = 0x84ED_u
:GL_COMPRESSED_RGBA = 0x84EE_u
:GL_TEXTURE_COMPRESSION_HINT = 0x84EF_u
:GL_TEXTURE_RECTANGLE = 0x84F5_u
:GL_TEXTURE_BINDING_RECTANGLE = 0x84F6_u
:GL_PROXY_TEXTURE_RECTANGLE = 0x84F7_u
:GL_MAX_RECTANGLE_TEXTURE_SIZE = 0x84F8_u
:GL_DEPTH_STENCIL = 0x84F9_u
:GL_UNSIGNED_INT_24_8 = 0x84FA_u
:GL_MAX_TEXTURE_LOD_BIAS = 0x84FD_u
:GL_TEXTURE_LOD_BIAS = 0x8501_u
:GL_INCR_WRAP = 0x8507_u
:GL_DECR_WRAP = 0x8508_u
:GL_TEXTURE_CUBE_MAP = 0x8513_u
:GL_TEXTURE_BINDING_CUBE_MAP = 0x8514_u
:GL_TEXTURE_CUBE_MAP_POSITIVE_X = 0x8515_u
:GL_TEXTURE_CUBE_MAP_NEGATIVE_X = 0x8516_u
:GL_TEXTURE_CUBE_MAP_POSITIVE_Y = 0x8517_u
:GL_TEXTURE_CUBE_MAP_NEGATIVE_Y = 0x8518_u
:GL_TEXTURE_CUBE_MAP_POSITIVE_Z = 0x8519_u
:GL_TEXTURE_CUBE_MAP_NEGATIVE_Z = 0x851A_u
:GL_PROXY_TEXTURE_CUBE_MAP = 0x851B_u
:GL_MAX_CUBE_MAP_TEXTURE_SIZE = 0x851C_u
:GL_SRC1_ALPHA = 0x8589_u
:GL_VERTEX_ARRAY_BINDING = 0x85B5_u
:GL_VERTEX_ATTRIB_ARRAY_ENABLED = 0x8622_u
:GL_VERTEX_ATTRIB_ARRAY_SIZE = 0x8623_u
:GL_VERTEX_ATTRIB_ARRAY_STRIDE = 0x8624_u
:GL_VERTEX_ATTRIB_ARRAY_TYPE = 0x8625_u
:GL_CURRENT_VERTEX_ATTRIB = 0x8626_u
:GL_VERTEX_PROGRAM_POINT_SIZE = 0x8642_u
:GL_PROGRAM_POINT_SIZE = 0x8642_u
:GL_VERTEX_ATTRIB_ARRAY_POINTER = 0x8645_u
:GL_DEPTH_CLAMP = 0x864F_u
:GL_TEXTURE_COMPRESSED_IMAGE_SIZE = 0x86A0_u
:GL_TEXTURE_COMPRESSED = 0x86A1_u
:GL_NUM_COMPRESSED_TEXTURE_FORMATS = 0x86A2_u
:GL_COMPRESSED_TEXTURE_FORMATS = 0x86A3_u
:GL_BUFFER_SIZE = 0x8764_u
:GL_BUFFER_USAGE = 0x8765_u
:GL_STENCIL_BACK_FUNC = 0x8800_u
:GL_STENCIL_BACK_FAIL = 0x8801_u
:GL_STENCIL_BACK_PASS_DEPTH_FAIL = 0x8802_u
:GL_STENCIL_BACK_PASS_DEPTH_PASS = 0x8803_u
:GL_RGBA32F = 0x8814_u
:GL_RGB32F = 0x8815_u
:GL_RGBA16F = 0x881A_u
:GL_RGB16F = 0x881B_u
:GL_MAX_DRAW_BUFFERS = 0x8824_u
:GL_DRAW_BUFFER0 = 0x8825_u
:GL_DRAW_BUFFER1 = 0x8826_u
:GL_DRAW_BUFFER2 = 0x8827_u
:GL_DRAW_BUFFER3 = 0x8828_u
:GL_DRAW_BUFFER4 = 0x8829_u
:GL_DRAW_BUFFER5 = 0x882A_u
:GL_DRAW_BUFFER6 = 0x882B_u
:GL_DRAW_BUFFER7 = 0x882C_u
:GL_DRAW_BUFFER8 = 0x882D_u
:GL_DRAW_BUFFER9 = 0x882E_u
:GL_DRAW_BUFFER10 = 0x882F_u
:GL_DRAW_BUFFER11 = 0x8830_u
:GL_DRAW_BUFFER12 = 0x8831_u
:GL_DRAW_BUFFER13 = 0x8832_u
:GL_DRAW_BUFFER14 = 0x8833_u
:GL_DRAW_BUFFER15 = 0x8834_u
:GL_BLEND_EQUATION_ALPHA = 0x883D_u
:GL_TEXTURE_DEPTH_SIZE = 0x884A_u
:GL_TEXTURE_COMPARE_MODE = 0x884C_u
:GL_TEXTURE_COMPARE_FUNC = 0x884D_u
:GL_COMPARE_REF_TO_TEXTURE = 0x884E_u
:GL_TEXTURE_CUBE_MAP_SEAMLESS = 0x884F_u
:GL_QUERY_COUNTER_BITS = 0x8864_u
:GL_CURRENT_QUERY = 0x8865_u
:GL_QUERY_RESULT = 0x8866_u
:GL_QUERY_RESULT_AVAILABLE = 0x8867_u
:GL_MAX_VERTEX_ATTRIBS = 0x8869_u
:GL_VERTEX_ATTRIB_ARRAY_NORMALIZED = 0x886A_u
:GL_MAX_TEXTURE_IMAGE_UNITS = 0x8872_u
:GL_ARRAY_BUFFER = 0x8892_u
:GL_ELEMENT_ARRAY_BUFFER = 0x8893_u
:GL_ARRAY_BUFFER_BINDING = 0x8894_u
:GL_ELEMENT_ARRAY_BUFFER_BINDING = 0x8895_u
:GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING = 0x889F_u
:GL_READ_ONLY = 0x88B8_u
:GL_WRITE_ONLY = 0x88B9_u
:GL_READ_WRITE = 0x88BA_u
:GL_BUFFER_ACCESS = 0x88BB_u
:GL_BUFFER_MAPPED = 0x88BC_u
:GL_BUFFER_MAP_POINTER = 0x88BD_u
:GL_TIME_ELAPSED = 0x88BF_u
:GL_STREAM_DRAW = 0x88E0_u
:GL_STREAM_READ = 0x88E1_u
:GL_STREAM_COPY = 0x88E2_u
:GL_STATIC_DRAW = 0x88E4_u
:GL_STATIC_READ = 0x88E5_u
:GL_STATIC_COPY = 0x88E6_u
:GL_DYNAMIC_DRAW = 0x88E8_u
:GL_DYNAMIC_READ = 0x88E9_u
:GL_DYNAMIC_COPY = 0x88EA_u
:GL_PIXEL_PACK_BUFFER = 0x88EB_u
:GL_PIXEL_UNPACK_BUFFER = 0x88EC_u
:GL_PIXEL_PACK_BUFFER_BINDING = 0x88ED_u
:GL_PIXEL_UNPACK_BUFFER_BINDING = 0x88EF_u
:GL_DEPTH24_STENCIL8 = 0x88F0_u
:GL_TEXTURE_STENCIL_SIZE = 0x88F1_u
:GL_SRC1_COLOR = 0x88F9_u
:GL_ONE_MINUS_SRC1_COLOR = 0x88FA_u
:GL_ONE_MINUS_SRC1_ALPHA = 0x88FB_u
:GL_MAX_DUAL_SOURCE_DRAW_BUFFERS = 0x88FC_u
:GL_VERTEX_ATTRIB_ARRAY_INTEGER = 0x88FD_u
:GL_VERTEX_ATTRIB_ARRAY_DIVISOR = 0x88FE_u
:GL_MAX_ARRAY_TEXTURE_LAYERS = 0x88FF_u
:GL_MIN_PROGRAM_TEXEL_OFFSET = 0x8904_u
:GL_MAX_PROGRAM_TEXEL_OFFSET = 0x8905_u
:GL_SAMPLES_PASSED = 0x8914_u
:GL_GEOMETRY_VERTICES_OUT = 0x8916_u
:GL_GEOMETRY_INPUT_TYPE = 0x8917_u
:GL_GEOMETRY_OUTPUT_TYPE = 0x8918_u
:GL_SAMPLER_BINDING = 0x8919_u
:GL_CLAMP_READ_COLOR = 0x891C_u
:GL_FIXED_ONLY = 0x891D_u
:GL_UNIFORM_BUFFER = 0x8A11_u
:GL_UNIFORM_BUFFER_BINDING = 0x8A28_u
:GL_UNIFORM_BUFFER_START = 0x8A29_u
:GL_UNIFORM_BUFFER_SIZE = 0x8A2A_u
:GL_MAX_VERTEX_UNIFORM_BLOCKS = 0x8A2B_u
:GL_MAX_GEOMETRY_UNIFORM_BLOCKS = 0x8A2C_u
:GL_MAX_FRAGMENT_UNIFORM_BLOCKS = 0x8A2D_u
:GL_MAX_COMBINED_UNIFORM_BLOCKS = 0x8A2E_u
:GL_MAX_UNIFORM_BUFFER_BINDINGS = 0x8A2F_u
:GL_MAX_UNIFORM_BLOCK_SIZE = 0x8A30_u
:GL_MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS = 0x8A31_u
:GL_MAX_COMBINED_GEOMETRY_UNIFORM_COMPONENTS = 0x8A32_u
:GL_MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS = 0x8A33_u
:GL_UNIFORM_BUFFER_OFFSET_ALIGNMENT = 0x8A34_u
:GL_ACTIVE_UNIFORM_BLOCK_MAX_NAME_LENGTH = 0x8A35_u
:GL_ACTIVE_UNIFORM_BLOCKS = 0x8A36_u
:GL_UNIFORM_TYPE = 0x8A37_u
:GL_UNIFORM_SIZE = 0x8A38_u
:GL_UNIFORM_NAME_LENGTH = 0x8A39_u
:GL_UNIFORM_BLOCK_INDEX = 0x8A3A_u
:GL_UNIFORM_OFFSET = 0x8A3B_u
:GL_UNIFORM_ARRAY_STRIDE = 0x8A3C_u
:GL_UNIFORM_MATRIX_STRIDE = 0x8A3D_u
:GL_UNIFORM_IS_ROW_MAJOR = 0x8A3E_u
:GL_UNIFORM_BLOCK_BINDING = 0x8A3F_u
:GL_UNIFORM_BLOCK_DATA_SIZE = 0x8A40_u
:GL_UNIFORM_BLOCK_NAME_LENGTH = 0x8A41_u
:GL_UNIFORM_BLOCK_ACTIVE_UNIFORMS = 0x8A42_u
:GL_UNIFORM_BLOCK_ACTIVE_UNIFORM_INDICES = 0x8A43_u
:GL_UNIFORM_BLOCK_REFERENCED_BY_VERTEX_SHADER = 0x8A44_u
:GL_UNIFORM_BLOCK_REFERENCED_BY_GEOMETRY_SHADER = 0x8A45_u
:GL_UNIFORM_BLOCK_REFERENCED_BY_FRAGMENT_SHADER = 0x8A46_u
:GL_FRAGMENT_SHADER = 0x8B30_u
:GL_VERTEX_SHADER = 0x8B31_u
:GL_MAX_FRAGMENT_UNIFORM_COMPONENTS = 0x8B49_u
:GL_MAX_VERTEX_UNIFORM_COMPONENTS = 0x8B4A_u
:GL_MAX_VARYING_FLOATS = 0x8B4B_u
:GL_MAX_VARYING_COMPONENTS = 0x8B4B_u
:GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS = 0x8B4C_u
:GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS = 0x8B4D_u
:GL_SHADER_TYPE = 0x8B4F_u
:GL_FLOAT_VEC2 = 0x8B50_u
:GL_FLOAT_VEC3 = 0x8B51_u
:GL_FLOAT_VEC4 = 0x8B52_u
:GL_INT_VEC2 = 0x8B53_u
:GL_INT_VEC3 = 0x8B54_u
:GL_INT_VEC4 = 0x8B55_u
:GL_BOOL = 0x8B56_u
:GL_BOOL_VEC2 = 0x8B57_u
:GL_BOOL_VEC3 = 0x8B58_u
:GL_BOOL_VEC4 = 0x8B59_u
:GL_FLOAT_MAT2 = 0x8B5A_u
:GL_FLOAT_MAT3 = 0x8B5B_u
:GL_FLOAT_MAT4 = 0x8B5C_u
:GL_SAMPLER_1D = 0x8B5D_u
:GL_SAMPLER_2D = 0x8B5E_u
:GL_SAMPLER_3D = 0x8B5F_u
:GL_SAMPLER_CUBE = 0x8B60_u
:GL_SAMPLER_1D_SHADOW = 0x8B61_u
:GL_SAMPLER_2D_SHADOW = 0x8B62_u
:GL_SAMPLER_2D_RECT = 0x8B63_u
:GL_SAMPLER_2D_RECT_SHADOW = 0x8B64_u
:GL_FLOAT_MAT2x3 = 0x8B65_u
:GL_FLOAT_MAT2x4 = 0x8B66_u
:GL_FLOAT_MAT3x2 = 0x8B67_u
:GL_FLOAT_MAT3x4 = 0x8B68_u
:GL_FLOAT_MAT4x2 = 0x8B69_u
:GL_FLOAT_MAT4x3 = 0x8B6A_u
:GL_DELETE_STATUS = 0x8B80_u
:GL_COMPILE_STATUS = 0x8B81_u
:GL_LINK_STATUS = 0x8B82_u
:GL_VALIDATE_STATUS = 0x8B83_u
:GL_INFO_LOG_LENGTH = 0x8B84_u
:GL_ATTACHED_SHADERS = 0x8B85_u
:GL_ACTIVE_UNIFORMS = 0x8B86_u
:GL_ACTIVE_UNIFORM_MAX_LENGTH = 0x8B87_u
:GL_SHADER_SOURCE_LENGTH = 0x8B88_u
:GL_ACTIVE_ATTRIBUTES = 0x8B89_u
:GL_ACTIVE_ATTRIBUTE_MAX_LENGTH = 0x8B8A_u
:GL_FRAGMENT_SHADER_DERIVATIVE_HINT = 0x8B8B_u
:GL_SHADING_LANGUAGE_VERSION = 0x8B8C_u
:GL_CURRENT_PROGRAM = 0x8B8D_u
:GL_TEXTURE_RED_TYPE = 0x8C10_u
:GL_TEXTURE_GREEN_TYPE = 0x8C11_u
:GL_TEXTURE_BLUE_TYPE = 0x8C12_u
:GL_TEXTURE_ALPHA_TYPE = 0x8C13_u
:GL_TEXTURE_DEPTH_TYPE = 0x8C16_u
:GL_UNSIGNED_NORMALIZED = 0x8C17_u
:GL_TEXTURE_1D_ARRAY = 0x8C18_u
:GL_PROXY_TEXTURE_1D_ARRAY = 0x8C19_u
:GL_TEXTURE_2D_ARRAY = 0x8C1A_u
:GL_PROXY_TEXTURE_2D_ARRAY = 0x8C1B_u
:GL_TEXTURE_BINDING_1D_ARRAY = 0x8C1C_u
:GL_TEXTURE_BINDING_2D_ARRAY = 0x8C1D_u
:GL_MAX_GEOMETRY_TEXTURE_IMAGE_UNITS = 0x8C29_u
:GL_TEXTURE_BUFFER = 0x8C2A_u
:GL_MAX_TEXTURE_BUFFER_SIZE = 0x8C2B_u
:GL_TEXTURE_BINDING_BUFFER = 0x8C2C_u
:GL_TEXTURE_BUFFER_DATA_STORE_BINDING = 0x8C2D_u
:GL_ANY_SAMPLES_PASSED = 0x8C2F_u
:GL_R11F_G11F_B10F = 0x8C3A_u
:GL_UNSIGNED_INT_10F_11F_11F_REV = 0x8C3B_u
:GL_RGB9_E5 = 0x8C3D_u
:GL_UNSIGNED_INT_5_9_9_9_REV = 0x8C3E_u
:GL_TEXTURE_SHARED_SIZE = 0x8C3F_u
:GL_SRGB = 0x8C40_u
:GL_SRGB8 = 0x8C41_u
:GL_SRGB_ALPHA = 0x8C42_u
:GL_SRGB8_ALPHA8 = 0x8C43_u
:GL_COMPRESSED_SRGB = 0x8C48_u
:GL_COMPRESSED_SRGB_ALPHA = 0x8C49_u
:GL_TRANSFORM_FEEDBACK_VARYING_MAX_LENGTH = 0x8C76_u
:GL_TRANSFORM_FEEDBACK_BUFFER_MODE = 0x8C7F_u
:GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS = 0x8C80_u
:GL_TRANSFORM_FEEDBACK_VARYINGS = 0x8C83_u
:GL_TRANSFORM_FEEDBACK_BUFFER_START = 0x8C84_u
:GL_TRANSFORM_FEEDBACK_BUFFER_SIZE = 0x8C85_u
:GL_PRIMITIVES_GENERATED = 0x8C87_u
:GL_TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN = 0x8C88_u
:GL_RASTERIZER_DISCARD = 0x8C89_u
:GL_MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS = 0x8C8A_u
:GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS = 0x8C8B_u
:GL_INTERLEAVED_ATTRIBS = 0x8C8C_u
:GL_SEPARATE_ATTRIBS = 0x8C8D_u
:GL_TRANSFORM_FEEDBACK_BUFFER = 0x8C8E_u
:GL_TRANSFORM_FEEDBACK_BUFFER_BINDING = 0x8C8F_u
:GL_POINT_SPRITE_COORD_ORIGIN = 0x8CA0_u
:GL_LOWER_LEFT = 0x8CA1_u
:GL_UPPER_LEFT = 0x8CA2_u
:GL_STENCIL_BACK_REF = 0x8CA3_u
:GL_STENCIL_BACK_VALUE_MASK = 0x8CA4_u
:GL_STENCIL_BACK_WRITEMASK = 0x8CA5_u
:GL_DRAW_FRAMEBUFFER_BINDING = 0x8CA6_u
:GL_FRAMEBUFFER_BINDING = 0x8CA6_u
:GL_RENDERBUFFER_BINDING = 0x8CA7_u
:GL_READ_FRAMEBUFFER = 0x8CA8_u
:GL_DRAW_FRAMEBUFFER = 0x8CA9_u
:GL_READ_FRAMEBUFFER_BINDING = 0x8CAA_u
:GL_RENDERBUFFER_SAMPLES = 0x8CAB_u
:GL_DEPTH_COMPONENT32F = 0x8CAC_u
:GL_DEPTH32F_STENCIL8 = 0x8CAD_u
:GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE = 0x8CD0_u
:GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME = 0x8CD1_u
:GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL = 0x8CD2_u
:GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE = 0x8CD3_u
:GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER = 0x8CD4_u
:GL_FRAMEBUFFER_COMPLETE = 0x8CD5_u
:GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT = 0x8CD6_u
:GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT = 0x8CD7_u
:GL_FRAMEBUFFER_INCOMPLETE_DRAW_BUFFER = 0x8CDB_u
:GL_FRAMEBUFFER_INCOMPLETE_READ_BUFFER = 0x8CDC_u
:GL_FRAMEBUFFER_UNSUPPORTED = 0x8CDD_u
:GL_MAX_COLOR_ATTACHMENTS = 0x8CDF_u
:GL_COLOR_ATTACHMENT0 = 0x8CE0_u
:GL_COLOR_ATTACHMENT1 = 0x8CE1_u
:GL_COLOR_ATTACHMENT2 = 0x8CE2_u
:GL_COLOR_ATTACHMENT3 = 0x8CE3_u
:GL_COLOR_ATTACHMENT4 = 0x8CE4_u
:GL_COLOR_ATTACHMENT5 = 0x8CE5_u
:GL_COLOR_ATTACHMENT6 = 0x8CE6_u
:GL_COLOR_ATTACHMENT7 = 0x8CE7_u
:GL_COLOR_ATTACHMENT8 = 0x8CE8_u
:GL_COLOR_ATTACHMENT9 = 0x8CE9_u
:GL_COLOR_ATTACHMENT10 = 0x8CEA_u
:GL_COLOR_ATTACHMENT11 = 0x8CEB_u
:GL_COLOR_ATTACHMENT12 = 0x8CEC_u
:GL_COLOR_ATTACHMENT13 = 0x8CED_u
:GL_COLOR_ATTACHMENT14 = 0x8CEE_u
:GL_COLOR_ATTACHMENT15 = 0x8CEF_u
:GL_COLOR_ATTACHMENT16 = 0x8CF0_u
:GL_COLOR_ATTACHMENT17 = 0x8CF1_u
:GL_COLOR_ATTACHMENT18 = 0x8CF2_u
:GL_COLOR_ATTACHMENT19 = 0x8CF3_u
:GL_COLOR_ATTACHMENT20 = 0x8CF4_u
:GL_COLOR_ATTACHMENT21 = 0x8CF5_u
:GL_COLOR_ATTACHMENT22 = 0x8CF6_u
:GL_COLOR_ATTACHMENT23 = 0x8CF7_u
:GL_COLOR_ATTACHMENT24 = 0x8CF8_u
:GL_COLOR_ATTACHMENT25 = 0x8CF9_u
:GL_COLOR_ATTACHMENT26 = 0x8CFA_u
:GL_COLOR_ATTACHMENT27 = 0x8CFB_u
:GL_COLOR_ATTACHMENT28 = 0x8CFC_u
:GL_COLOR_ATTACHMENT29 = 0x8CFD_u
:GL_COLOR_ATTACHMENT30 = 0x8CFE_u
:GL_COLOR_ATTACHMENT31 = 0x8CFF_u
:GL_DEPTH_ATTACHMENT = 0x8D00_u
:GL_STENCIL_ATTACHMENT = 0x8D20_u
:GL_FRAMEBUFFER = 0x8D40_u
:GL_RENDERBUFFER = 0x8D41_u
:GL_RENDERBUFFER_WIDTH = 0x8D42_u
:GL_RENDERBUFFER_HEIGHT = 0x8D43_u
:GL_RENDERBUFFER_INTERNAL_FORMAT = 0x8D44_u
:GL_STENCIL_INDEX1 = 0x8D46_u
:GL_STENCIL_INDEX4 = 0x8D47_u
:GL_STENCIL_INDEX8 = 0x8D48_u
:GL_STENCIL_INDEX16 = 0x8D49_u
:GL_RENDERBUFFER_RED_SIZE = 0x8D50_u
:GL_RENDERBUFFER_GREEN_SIZE = 0x8D51_u
:GL_RENDERBUFFER_BLUE_SIZE = 0x8D52_u
:GL_RENDERBUFFER_ALPHA_SIZE = 0x8D53_u
:GL_RENDERBUFFER_DEPTH_SIZE = 0x8D54_u
:GL_RENDERBUFFER_STENCIL_SIZE = 0x8D55_u
:GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE = 0x8D56_u
:GL_MAX_SAMPLES = 0x8D57_u
:GL_RGBA32UI = 0x8D70_u
:GL_RGB32UI = 0x8D71_u
:GL_RGBA16UI = 0x8D76_u
:GL_RGB16UI = 0x8D77_u
:GL_RGBA8UI = 0x8D7C_u
:GL_RGB8UI = 0x8D7D_u
:GL_RGBA32I = 0x8D82_u
:GL_RGB32I = 0x8D83_u
:GL_RGBA16I = 0x8D88_u
:GL_RGB16I = 0x8D89_u
:GL_RGBA8I = 0x8D8E_u
:GL_RGB8I = 0x8D8F_u
:GL_RED_INTEGER = 0x8D94_u
:GL_GREEN_INTEGER = 0x8D95_u
:GL_BLUE_INTEGER = 0x8D96_u
:GL_RGB_INTEGER = 0x8D98_u
:GL_RGBA_INTEGER = 0x8D99_u
:GL_BGR_INTEGER = 0x8D9A_u
:GL_BGRA_INTEGER = 0x8D9B_u
:GL_INT_2_10_10_10_REV = 0x8D9F_u
:GL_FRAMEBUFFER_ATTACHMENT_LAYERED = 0x8DA7_u
:GL_FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS = 0x8DA8_u
:GL_FLOAT_32_UNSIGNED_INT_24_8_REV = 0x8DAD_u
:GL_FRAMEBUFFER_SRGB = 0x8DB9_u
:GL_COMPRESSED_RED_RGTC1 = 0x8DBB_u
:GL_COMPRESSED_SIGNED_RED_RGTC1 = 0x8DBC_u
:GL_COMPRESSED_RG_RGTC2 = 0x8DBD_u
:GL_COMPRESSED_SIGNED_RG_RGTC2 = 0x8DBE_u
:GL_SAMPLER_1D_ARRAY = 0x8DC0_u
:GL_SAMPLER_2D_ARRAY = 0x8DC1_u
:GL_SAMPLER_BUFFER = 0x8DC2_u
:GL_SAMPLER_1D_ARRAY_SHADOW = 0x8DC3_u
:GL_SAMPLER_2D_ARRAY_SHADOW = 0x8DC4_u
:GL_SAMPLER_CUBE_SHADOW = 0x8DC5_u
:GL_UNSIGNED_INT_VEC2 = 0x8DC6_u
:GL_UNSIGNED_INT_VEC3 = 0x8DC7_u
:GL_UNSIGNED_INT_VEC4 = 0x8DC8_u
:GL_INT_SAMPLER_1D = 0x8DC9_u
:GL_INT_SAMPLER_2D = 0x8DCA_u
:GL_INT_SAMPLER_3D = 0x8DCB_u
:GL_INT_SAMPLER_CUBE = 0x8DCC_u
:GL_INT_SAMPLER_2D_RECT = 0x8DCD_u
:GL_INT_SAMPLER_1D_ARRAY = 0x8DCE_u
:GL_INT_SAMPLER_2D_ARRAY = 0x8DCF_u
:GL_INT_SAMPLER_BUFFER = 0x8DD0_u
:GL_UNSIGNED_INT_SAMPLER_1D = 0x8DD1_u
:GL_UNSIGNED_INT_SAMPLER_2D = 0x8DD2_u
:GL_UNSIGNED_INT_SAMPLER_3D = 0x8DD3_u
:GL_UNSIGNED_INT_SAMPLER_CUBE = 0x8DD4_u
:GL_UNSIGNED_INT_SAMPLER_2D_RECT = 0x8DD5_u
:GL_UNSIGNED_INT_SAMPLER_1D_ARRAY = 0x8DD6_u
:GL_UNSIGNED_INT_SAMPLER_2D_ARRAY = 0x8DD7_u
:GL_UNSIGNED_INT_SAMPLER_BUFFER = 0x8DD8_u
:GL_GEOMETRY_SHADER = 0x8DD9_u
:GL_MAX_GEOMETRY_UNIFORM_COMPONENTS = 0x8DDF_u
:GL_MAX_GEOMETRY_OUTPUT_VERTICES = 0x8DE0_u
:GL_MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS = 0x8DE1_u
:GL_QUERY_WAIT = 0x8E13_u
:GL_QUERY_NO_WAIT = 0x8E14_u
:GL_QUERY_BY_REGION_WAIT = 0x8E15_u
:GL_QUERY_BY_REGION_NO_WAIT = 0x8E16_u
:GL_TIMESTAMP = 0x8E28_u
:GL_TEXTURE_SWIZZLE_R = 0x8E42_u
:GL_TEXTURE_SWIZZLE_G = 0x8E43_u
:GL_TEXTURE_SWIZZLE_B = 0x8E44_u
:GL_TEXTURE_SWIZZLE_A = 0x8E45_u
:GL_TEXTURE_SWIZZLE_RGBA = 0x8E46_u
:GL_QUADS_FOLLOW_PROVOKING_VERTEX_CONVENTION = 0x8E4C_u
:GL_FIRST_VERTEX_CONVENTION = 0x8E4D_u
:GL_LAST_VERTEX_CONVENTION = 0x8E4E_u
:GL_PROVOKING_VERTEX = 0x8E4F_u
:GL_SAMPLE_POSITION = 0x8E50_u
:GL_SAMPLE_MASK = 0x8E51_u
:GL_SAMPLE_MASK_VALUE = 0x8E52_u
:GL_MAX_SAMPLE_MASK_WORDS = 0x8E59_u
:GL_COPY_READ_BUFFER = 0x8F36_u
:GL_COPY_WRITE_BUFFER = 0x8F37_u
:GL_R8_SNORM = 0x8F94_u
:GL_RG8_SNORM = 0x8F95_u
:GL_RGB8_SNORM = 0x8F96_u
:GL_RGBA8_SNORM = 0x8F97_u
:GL_R16_SNORM = 0x8F98_u
:GL_RG16_SNORM = 0x8F99_u
:GL_RGB16_SNORM = 0x8F9A_u
:GL_RGBA16_SNORM = 0x8F9B_u
:GL_SIGNED_NORMALIZED = 0x8F9C_u
:GL_PRIMITIVE_RESTART = 0x8F9D_u
:GL_PRIMITIVE_RESTART_INDEX = 0x8F9E_u
:GL_RGB10_A2UI = 0x906F_u
:GL_TEXTURE_2D_MULTISAMPLE = 0x9100_u
:GL_PROXY_TEXTURE_2D_MULTISAMPLE = 0x9101_u
:GL_TEXTURE_2D_MULTISAMPLE_ARRAY = 0x9102_u
:GL_PROXY_TEXTURE_2D_MULTISAMPLE_ARRAY = 0x9103_u
:GL_TEXTURE_BINDING_2D_MULTISAMPLE = 0x9104_u
:GL_TEXTURE_BINDING_2D_MULTISAMPLE_ARRAY = 0x9105_u
:GL_TEXTURE_SAMPLES = 0x9106_u
:GL_TEXTURE_FIXED_SAMPLE_LOCATIONS = 0x9107_u
:GL_SAMPLER_2D_MULTISAMPLE = 0x9108_u
:GL_INT_SAMPLER_2D_MULTISAMPLE = 0x9109_u
:GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE = 0x910A_u
:GL_SAMPLER_2D_MULTISAMPLE_ARRAY = 0x910B_u
:GL_INT_SAMPLER_2D_MULTISAMPLE_ARRAY = 0x910C_u
:GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE_ARRAY = 0x910D_u
:GL_MAX_COLOR_TEXTURE_SAMPLES = 0x910E_u
:GL_MAX_DEPTH_TEXTURE_SAMPLES = 0x910F_u
:GL_MAX_INTEGER_SAMPLES = 0x9110_u
:GL_MAX_SERVER_WAIT_TIMEOUT = 0x9111_u
:GL_OBJECT_TYPE = 0x9112_u
:GL_SYNC_CONDITION = 0x9113_u
:GL_SYNC_STATUS = 0x9114_u
:GL_SYNC_FLAGS = 0x9115_u
:GL_SYNC_FENCE = 0x9116_u
:GL_SYNC_GPU_COMMANDS_COMPLETE = 0x9117_u
:GL_UNSIGNALED = 0x9118_u
:GL_SIGNALED = 0x9119_u
:GL_ALREADY_SIGNALED = 0x911A_u
:GL_TIMEOUT_EXPIRED = 0x911B_u
:GL_CONDITION_SATISFIED = 0x911C_u
:GL_WAIT_FAILED = 0x911D_u
:GL_BUFFER_ACCESS_FLAGS = 0x911F_u
:GL_BUFFER_MAP_LENGTH = 0x9120_u
:GL_BUFFER_MAP_OFFSET = 0x9121_u
:GL_MAX_VERTEX_OUTPUT_COMPONENTS = 0x9122_u
:GL_MAX_GEOMETRY_INPUT_COMPONENTS = 0x9123_u
:GL_MAX_GEOMETRY_OUTPUT_COMPONENTS = 0x9124_u
:GL_MAX_FRAGMENT_INPUT_COMPONENTS = 0x9125_u
:GL_CONTEXT_PROFILE_MASK = 0x9126_u
