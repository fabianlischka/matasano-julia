import AES
import Crypto101

∙ = (AES.∙)
⊗ = (AES.⊗)

key_appA_128 = [0x2b,0x7e,0x15,0x16,0x28,0xae,0xd2,0xa6,0xab,0xf7,0x15,0x88,0x09,0xcf,0x4f,0x3c]
key_appA_192 = [0x8e,0x73,0xb0,0xf7,0xda,0x0e,0x64,0x52,0xc8,0x10,0xf3,0x2b,0x80,0x90,0x79,0xe5,0x62,0xf8,0xea,0xd2,0x52,0x2c,0x6b,0x7b]
key_appA_256 = [0x60,0x3d,0xeb,0x10,0x15,0xca,0x71,0xbe,0x2b,0x73,0xae,0xf0,0x85,0x7d,0x77,0x81,0x1f,0x35,0x2c,0x07,0x3b,0x61,0x08,0xd7,0x2d,0x98,0x10,0xa3,0x09,0x14,0xdf,0xf4]

# keyExpanded_appA_128 = UInt32[0x2b7e1516,0x28aed2a6,0xabf71588,0x09cf4f3c,0xa0fafe17,0x88542cb1,0x23a33939,0x2a6c7605,
#                               0xf2c295f2,0x7a96b943,0x5935807a,0x7359f67f,0x3d80477d,0x4716fe3e,0x1e237e44,0x6d7a883b,
#                               0xef44a541,0xa8525b7f,0xb671253b,0xdb0bad00,0xd4d1c6f8,0x7c839d87,0xcaf2b8bc,0x11f915bc,
#                               0x6d88a37a,0x110b3efd,0xdbf98641,0xca0093fd,0x4e54f70e,0x5f5fc9f3,0x84a64fb2,0x4ea6dc4f,
#                               0xead27321,0xb58dbad2,0x312bf560,0x7f8d292f,0xac7766f3,0x19fadc21,0x28d12941,0x575c006e,
#                               0xd014f9a8,0xc9ee2589,0xe13f0cc8,0xb6630ca6]

keyExpanded_appA_128_b = UInt8[
      0x2b,0x7e,0x15,0x16,0x28,0xae,0xd2,0xa6,0xab,0xf7,0x15,0x88,0x09,0xcf,0x4f,0x3c,0xa0,0xfa,0xfe,0x17,0x88,0x54,0x2c,0xb1,0x23,0xa3,0x39,0x39,0x2a,0x6c,0x76,0x05,
      0xf2,0xc2,0x95,0xf2,0x7a,0x96,0xb9,0x43,0x59,0x35,0x80,0x7a,0x73,0x59,0xf6,0x7f,0x3d,0x80,0x47,0x7d,0x47,0x16,0xfe,0x3e,0x1e,0x23,0x7e,0x44,0x6d,0x7a,0x88,0x3b,
      0xef,0x44,0xa5,0x41,0xa8,0x52,0x5b,0x7f,0xb6,0x71,0x25,0x3b,0xdb,0x0b,0xad,0x00,0xd4,0xd1,0xc6,0xf8,0x7c,0x83,0x9d,0x87,0xca,0xf2,0xb8,0xbc,0x11,0xf9,0x15,0xbc,
      0x6d,0x88,0xa3,0x7a,0x11,0x0b,0x3e,0xfd,0xdb,0xf9,0x86,0x41,0xca,0x00,0x93,0xfd,0x4e,0x54,0xf7,0x0e,0x5f,0x5f,0xc9,0xf3,0x84,0xa6,0x4f,0xb2,0x4e,0xa6,0xdc,0x4f,
      0xea,0xd2,0x73,0x21,0xb5,0x8d,0xba,0xd2,0x31,0x2b,0xf5,0x60,0x7f,0x8d,0x29,0x2f,0xac,0x77,0x66,0xf3,0x19,0xfa,0xdc,0x21,0x28,0xd1,0x29,0x41,0x57,0x5c,0x00,0x6e,
      0xd0,0x14,0xf9,0xa8,0xc9,0xee,0x25,0x89,0xe1,0x3f,0x0c,0xc8,0xb6,0x63,0x0c,0xa6]

a = [ 0xe7, 0x3a, 0x58, 0x8d ]

cipher128 = AES.AESBlock(key_appA_128)
cipher192 = AES.AESBlock(key_appA_192)
cipher256 = AES.AESBlock(key_appA_256)

# known reference values
# fips-197, Appendix B
example_plaintext_appB = [0x32, 0x43, 0xf6, 0xa8, 0x88, 0x5a, 0x30, 0x8d, 0x31, 0x31, 0x98, 0xa2, 0xe0, 0x37, 0x07, 0x34]
example_key_appB       = [0x2b, 0x7e, 0x15, 0x16, 0x28, 0xae, 0xd2, 0xa6, 0xab, 0xf7, 0x15, 0x88, 0x09, 0xcf, 0x4f, 0x3c]

# fips-197, Appendix C.1 AES-128 (Nk=4, Nr=10)
example_plaintext = hex2bytes("00112233445566778899aabbccddeeff")
example_key_128 = hex2bytes("000102030405060708090a0b0c0d0e0f")
example_cipher_ref_128 = hex2bytes("69c4e0d86a7b0430d8cdb78070b4c55a")

# C.2 AES-192 (Nk=6, Nr=12)
example_key_192 = hex2bytes("000102030405060708090a0b0c0d0e0f1011121314151617")
example_cipher_ref_192 = hex2bytes("dda97ca4864cdfe06eaf70a0ec0d7191")

# C.3 AES-256 (Nk=8, Nr=14)
example_key_256 = hex2bytes("000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f")
example_cipher_ref_256 = hex2bytes("8ea2b7ca516745bfeafc49904b496089")


# tests
println(0x57 ∙ 0x13 == 0x13 ∙ 0x57 == 0xfe)
println(AES.word( ([0x00, 0x00, 0x00, 0x01] ⊗ a)...) == AES.rotword(AES.word(a...)))
println(AES.keyexpansion(cipher128) == keyExpanded_appA_128_b)
println(AES.Sbox(0x53) == 0xed)
println(AES.encipher_block(AES.AESBlock(example_key_128), example_plaintext) == example_cipher_ref_128)
println(AES.encipher_block(AES.AESBlock(example_key_192), example_plaintext) == example_cipher_ref_192)
println(AES.encipher_block(AES.AESBlock(example_key_256), example_plaintext) == example_cipher_ref_256)


# complete encyption example
key = example_key_128
blockcipher = AES.AESBlock(key)
blockmode = AES.Blockmode_ECB()
padder = Crypto101.Padder1Bit( AES.blocklength_bytes(blockcipher) )
c = AES.Cipher( blockcipher, blockmode, padder)
plaintext = b"this is my first encryption test! Note: ECB is not recommended."
ciphertext = AES.encipher(c, plaintext)
plaintext_roundtrip = AES.decipher(c, ciphertext)
println(plaintext == plaintext_roundtrip)
ciphertext_ref = UInt8[0x74,0x68,0x69,0x73,0x20,0x69,0x73,0x20,0x6d,0x79,0x20,0x66,0x69,0x72,0x73,0x74,0x20,0x65,0x6e,0x63,0x72,0x79,0x70,0x74,0x69,0x6f,0x6e,0x20,0x74,0x65,0x73,0x74,0x21,0x20,0x4e,0x6f,0x74,0x65,0x3a,0x20,0x45,0x43,0x42,0x20,0x69,0x73,0x20,0x6e,0x6f,0x74,0x20,0x72,0x65,0x63,0x6f,0x6d,0x6d,0x65,0x6e,0x64,0x65,0x64,0x2e,0x80]
println(ciphertext == ciphertext_ref)


blockmode = AES.Blockmode_CBC(b"initvect12345678")
padder = Crypto101.PadderPKCS7( AES.blocklength_bytes(blockcipher) )
c = AES.Cipher( blockcipher, blockmode, padder)
plaintext = b"this is my second, and a bit longer encryption test, this time using CBC instead of ECB!"
ciphertext = AES.encipher(c, plaintext)
plaintext_roundtrip = AES.decipher(c, ciphertext)
println(plaintext == plaintext_roundtrip)
