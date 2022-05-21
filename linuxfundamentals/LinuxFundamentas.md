
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

LINUX ARQUITECTURE
=================
Layer	Description
Hardware	Peripheral devices such as the system's RAM, hard drive, CPU, and others.
Kernel	The core of the Linux operating system whose function is to virtualize and control common computer hardware resources like CPU, allocated memory, accessed data, and others. The kernel gives each process its own virtual resources and prevents/mitigates conflicts between different processes.
Shell	A command-line interface (CLI), also known as a shell that a user can enter commands into to execute the kernel's functions.
System Utility	Makes available to the user all of the operating system's functionality.

LINUX STRUCTURE
===============
/	The top-level directory is the root filesystem and contains all of the files required to boot the operating system before other filesystems are mounted as well as the files required to boot the other filesystems. After boot, all of the other filesystems are mounted at standard mount points as subdirectories of the root.
/bin	Contains essential command binaries.
/boot	Consists of the static bootloader, kernel executable, and files required to boot the Linux OS.
/dev	Contains device files to facilitate access to every hardware device attached to the system.
/etc	Local system configuration files. Configuration files for installed applications may be saved here as well.
/home	Each user on the system has a subdirectory here for storage.
/lib	Shared library files that are required for system boot.
/media	External removable media devices such as USB drives are mounted here.
/mnt	Temporary mount point for regular filesystems.
/opt	Optional files such as third-party tools can be saved here.
/root	The home directory for the root user.
/sbin	This directory contains executables used for system administration (binary system files).
/tmp	The operating system and many programs use this directory to store temporary files. This directory is generally cleared upon system boot and may be deleted at other times without any warning.
/usr	Contains executables, libraries, man files, etc.
/var	This directory contains variable data files such as log files, email in-boxes, web application related files, cron files, and more.


TERMINALS
=========
Many different terminal emulators exist, such as **GNOME Terminal, XFCE4 Terminal, XTerm**, and many others. 
There are also so-called command-line interfaces that run as additional terminals in one terminal and thus are multiplexers. 
These multiplexers include **Tmux, GNU Screen**, and others. In short, a terminal serves as an interface to the shell interpreter.


Besides Bash, there also exist other shells like **Tcsh/Csh, Ksh, Zsh, Fish shell, and others.**


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


CUT
==
$ cat /etc/passwd | grep -v "false\|nologin" | cut -d":" -f1
$ cat /etc/passwd | grep -v "false\|nologin" | tr ":" " " | column -t
$ cat /etc/passwd | grep -v "false\|nologin" | tr ":" " " | awk '{print $1, $NF}'
