# h = (g^x) % p
p = 100937
g = 47516
h = 63910 
R = IntegerModRing(p)

x = discrete_log(R(h), R(g))
print(x)