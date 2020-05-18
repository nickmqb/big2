wglGetProcAddressChecked(name cstring) {
	p := wglGetProcAddress(name)
	assert(p != null)
	return p
}

