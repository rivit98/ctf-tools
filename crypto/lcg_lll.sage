# https://crypto.stackexchange.com/questions/37836/problem-with-lll-reduction-on-truncated-lcg-schemes
#Our high bytes (higher 48 bits)
Y = [
	0xab0fb3948d19000000000000,
	0x4b58b2de5524000000000000,
	0x9c7c1a90ed44000000000000,
	0x3fd2082b3696000000000000,
	0x2f8413e9dff5000000000000,
	0xd7a3f16e3737000000000000,
	0x26eca76e516c000000000000,
	0x24457f3649e8000000000000,
	0x236a0f838d9e000000000000,
	0x9de1ba4dfc03000000000000,
	0x58078e922547000000000000,
]

# Preparing table for equation
size = len(Y)
tab = [[0 for i in range(size)][:] for i in range(size)]
for i in range(1, size):
    tab[i][0] = a ^ i
    tab[i][i] = -1
tab[0][0] = p
L = matrix(tab)

B = L.LLL()
W1 = B * vector(Y)
W2 = vector([ round(RR(w) / p) * p - w for w in W1 ])
Z = list(B.solve_right(W2))
print(Z)