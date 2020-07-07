SecureRandom {
	:provider ulong #ThreadLocal

	getBytes(buffer Array<byte>) {
		if provider == 0 {
			result := CryptAcquireContextA(ref provider, null, null, PROV_RSA_FULL, 0)
			if result == 0 {
				assert(GetLastError() == NTE_BAD_KEYSET)
				result = CryptAcquireContextA(ref provider, null, null, PROV_RSA_FULL, CRYPT_NEWKEYSET)
				assert(result != 0)
			}
		}
		assert(CryptGenRandom(provider, checked_cast(buffer.count, uint), pointer_cast(buffer.dataPtr, *byte)) != 0)
	}

	shuffle(data Array<T>) {
		random := Array<uint>(data.count)
		getBytes(ref Array<byte> { dataPtr: random.dataPtr, count: data.count * sizeof(int) })

		for i := 0; i < data.count - 1 {
			j := cast(random[i] % cast(data.count - i, uint), int) + i
			h := data[j]
			data[j] = data[i]
			data[i] = h
		}
	}
}
