import pwn
e = pwn.ELF('./inst_prof')
e.write(0x88C, pwn.asm('nop;' * 5, os='linux', arch='amd64'))
e.save()