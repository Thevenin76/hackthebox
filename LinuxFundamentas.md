LINUX
=====
whoami 		Displays current username.
id 		Returns users identity
hostname 	Sets or prints the name of current host system.
uname 		Prints basic information about the operating system name and system hardware.
pwd 		Returns working directory name.
ifconfig 	The ifconfig utility is used to assign or to view an address to a network interface and/or configure network interface parameters.
ip 		Ip is a utility to show or manipulate routing, network devices, interfaces and tunnels.
netstat 	Shows network status.
ss 		Another utility to investigate sockets.
ps 		Shows process status.
who 		Displays who is logged in.
env 		Prints environment or sets and executes command.
lsblk 		Lists block devices.
lsusb 		Lists USB devices
lsof 		Lists opened files.
lspci 		Lists PCI devices.

SSH
===
ssh [username]@[IP address]

Apache offers the possibility to create web pages dynamically using server-side scripting languages. Commonly used scripting languages are PHP, Perl, or Ruby. Other languages are Python, JavaScript, Lua, and .NET, which can be used for this. We can install the Apache webserver with the following command.


akelarre@htb[/htb]$ python3 -m http.server

Serving HTTP on 0.0.0.0 port 8000 (http://0.0.0.0:8000/) ...


FIND
===
-type f	Hereby, we define the type of the searched object. In this case, 'f' stands for 'file'.
-name *.conf	With '-name', we indicate the name of the file we are looking for. The asterisk (*) stands for 'all' files with the '.conf' extension.
-user root	This option filters all files whose owner is the root user.
-size +20k	We can then filter all the located files and specify that we only want to see the files that are larger than 20 KiB.
-newermt 2020-03-03	With this option, we set the date. Only files newer than the specified date will be presented.
-exec ls -al {} \;	This option executes the specified command, using the curly brackets as placeholders for each result. The backslash escapes the next character from being interpreted by the shell because otherwise, the semicolon would terminate the command and not reach the redirection.
2>/dev/null	This is a STDERR redirection to the 'null device', which we will come back to in the next section. This redirection ensures that no errors are displayed in the terminal. This redirection must not be an option of the 'find' command.



htb-student@nixfund:~$ find / -name *.conf -size +25k -size -28k -newermt 2020-03-03 2>/dev/null | xargs ls -l
-rw-r--r-- 1 root root 27422 Jun 12  2020 /usr/share/drirc.d/00-mesa-defaults.conf
