ip a
sudo dnfinstall httpd -y
yum --version
sudo yum install httpd -y
sudo systemctl enable httpd
sudo systemctl start httpd
sudo systemctl status httpd
echo "Hello DevOpsTribe!" | sudo tee /var/www/html/index.html
curl http_//localhost
curl http://localhost
exit
sudo poweroff
ip a
sudo ip addr add 192.168.100.11/24 dev enp0s8
sudo ip link set enp0s8 up
p
ping -c 3 192.168.100.11
curl 192.168.100.10
exit
ls
touch foo.log
chmod +w foo.log 
chmod +r foo.log 
chmod +w foo.log 
ls
ll
chmod +x foo.log 
sudo groupadd foo
chown foo foo.log
sudo groupadd foobar
chown :foo foo.log
sudo chown :foo foo.log
ls -l
ls 
ls dir_name
mkdir dir_name
ls
mkdir appunti 
ls 
mkdir {appunti,lucidi}
mkdir -p {appunti,lucidi}
rmdir dir_name
rmdir appunti
ls
cat > file_name
ls
cat file_name 
cat "HELP" > file_name 
cat > prova 
cat prova 
cat > prova
cat prova 
rm file_name 
ls
echo "ciao" > file1.txt
echo "ciao2" > file2.txt
echo "ciao3" > file3.txt
ls
cat file1.txt file2.txt file3.txt 
ls
more file.txt
more file1.txt
more -c file1.txt 
ld
ls
more
find /etc/ -atime n ù
find /etc/ -atime n 
find /etc/ -atime 10 
find /etc/ -mtime 10 
find ./ atime 10
find ./ -atime 10
find ./ -atime 3
find ./ -atime 1
find ./ -atime 
find ./ -atime 0
find ./ -sinze 10
find ./ -sine 10
find ./ -size 10
find ./name "name"
find ./ -name file1.txt 
find / -name file1.txt 
find ./ -name file1.txt 
find /usr/src -name "kernel"
find / -name "*.pdf"
sudo 
sudo root
find ./ -mtime -2 
find ./ -mtime 2
find ./ -mtime -2
find ./ -amin -2
find ./ -amin -120
ls
find ./ -size +1024 -size -2048
find . -newer test
find . -newer prova
find ./ -size +1024 -size -2048
find ./ -amin -n 120
find ./ -amin 120
find ./ -amin -120
-exec command {} \ 
action -exec command {} \
find / -name "*.tmp" -ok rm {} \
find /tmp -mtime +30 -exec rm {} \
find / -user lferrari
find / -user user2
grep -n ciao ./file1.txt 
grep -c ciao ./file1.txt 
grep -i CIAO ./file1.txt 
grep -w c ./file1.txt 
grep -q ao ./file.txt1
grep -q ao ./
grep -l ciao 
grep -l ciao ./
grep -l ciao .
grep -l ciao ./test1.txt
grep -l ciao ./file1.txt
grep -l ciao ./file2.txt
grep -l ciao ./file3.txt
cat file3.txt 
grep -l ciaox ./file2.txt
grep -l ciaox ./file1.txt
echo "Ciao la vita è bella" >> file1.txt 
cat file1.txt 
wc file1.txt 
wc -w file1.txt 
wc -l file1.txt 
wc -c file1.txt 
wc -m file1.txt 
wc -L file1.txt 
ps 
ls 1> pippo
ls
cat pippo 
ls 2> pippo
cat pippo
ls
list 2> pippo
cat pippo 
more < /etc/passwd
ls
ls >& file1
ls
cat file1
list >& file1
cat file1
ls >>& file1
ls abcdfr >& lserror
cat lserror 
abcfdef >& command
cat command 
mkdir /bin/miei >& ./miei
ls
cd miei 
cat ma
cat miei 
ls
ls /bin | grep '^c'
ls /etc | head -10
ls
ls -h
ls
ls /etc | head -7
ls /etc | head -7 | ls
ls /etc | head -7 | ls -l
ls /etc | head -7
ls /etc | head -7 > filecontenente7files.txt
cat filecontenente7files.txt 
cd /etc/
ls
ls -l
head -7
ls
cd ..
ls
cd usr/
ls
cd ..
ls
cd hom
cd home
ls
cd francesca/
ls
grep -n "string" ./
grep -n "string" .
grep -n "string" 
ls | grep -l string
ls | grep -l file
ls | grep -l file1
grep -l file1
ls | grep -l file1
ls -l | grep -l file1
ls
grep -l file ./
ls 
ls | head 
ls | head | grep string
ls | head | grep file
ls /bin
find
find -h
find --help
find -H 
find -H  help
find -H --help
find(1)
find
find -H
find -L
find
find --help
find /etc 
find /etc -atime 10
find /etc -atime 10 | head
sort -k
sort --help
find /etc | sort -k2,2M -k3,3n -k4,4
find /etc | sort -k2,2M -k3,3n -k4,4 | head > fileprova.txt
ls -luR /etc
ls -luR /etc 2> /dev/null | grep '^-' | sort -k6,6M -k7,7n -k8,8 | head -n10 > prova.txt
cat prova
cat prova.txt 
ls -luR /etc 2> /dev/null | grep '^-' | sort -k6,6M -k7,7n -k8,8 | head -n10 | awk 'print $9' > prova.txt
ls -luR /etc 2> /dev/null | grep '^-' | sort -k6,6M -k7,7n -k8,8 | head -n10 | awk '{print $9}' > prova.txt

ls -luR /etc 2> /dev/null | grep '^-' | sort -n > provanumero2.txt
cat provanumero2.txt 
ls -luR /etc 2> /dev/null | grep '^-' | sort -n | head -7 
ls -luR /etc 2> /dev/null | grep '^-' | sort -n | head -7 | awk '{print $9}' > provanumero2.txt
cat provanumero2.txt 
ls -luR /etc 2> /dev/null | grep '^-' | sort -n | tail -7 | awk '{print $9}' >> provanumero2.txt
cat provanumero2.txt 
ls -luR /etc 2> /dev/null | grep '^-' | sort -k6,6M -k7,7n -k8,8 | head -n10 | awk '{print $9}' > prova.txt
ls -lt
ls -lt /usr/sbin 
ls -lt
ls -lt /usr/sbin | awk '{print $9}' 
ls -lt /usr/sbin | awk '{print $9}' | head
ls -lt /usr/sbin | awk '{print $9}' | head -n8
ls -lt /usr/sbin | awk '{print $9}' | head -n8 > ultimamodifica.txt
cat ultimamodifica.txt 
ls -lt 
find /usr/sbin 
find /usr/sbin -type f -printf '%T@ %p\n' | sort -nr | head -n8 | awk '{print $2}' > lista_sbin.txt
cat lista_sbin.txt 
ls
touch file1.txt
cat file1
cat file1.txt 
touch  file1
cat file1
ls
touch file
cat file
rm file
ls
touch lucidi
rm lucidi
ls
touch
touch --help
touch -n
$HOME
/tmp
ls
ls -l
print $HOME
echo $HOME
echo /tmp
stat $HOME
stat /tmp/.X11-unix/X0
stat /dev/sda1
stat /dev/tty0
clear
stat $HOME
stat /tmp/ .X11-unix/X0
stat /tmp/.X11-unix/X0
stat /dev/sdal
stat /dev/sda1
stat /dev/tty0
touch file
man touch
touch -t file
touch -t 
touch --help
man touch
touch -t [[CC]YY]MMDDhhmm[.ss]
touch -t mm/dd/yyyy
touch -t 19700101000000 file.txt
touch -t 197001010000.00 file.txt
stat file.txt
mkdir dir1/dir2/dir3
mkdir dir1
cd dir1/
mkdir dir2
cd dir2/
mkdir dir3
ls
man mkdir
man rmdir
rm -a 
rm --help
cp --help
cp --help | less
man cp
man echo
man cat
man echo
man cat
ls
cd ..
ls
tac file1
tac file
tac file.txt
tac fileprova.txt 
cat fileprova.txt
ls -lt
cut -f1,7 -d ':' /etc/passwd
cut -f1,7 -d ':' /etc/passwd > users-shells.txt
sort -n /etc/passwd
sort -n -k 4 -t /etc/passwd
sort -n -k 4 -t : /etc/passwd
clear
sort -n -k 4 -t : /etc/passwd
sort -n /etc/passwd
sort -n -k 4 -t : /etc/passwd
clear 
sort -n -k 4 -t : /etc/passwd
grep *.log
find -name *.log
fine / -name *.log
find / -name *.log
find / -name "*.log"
find / -name "*html"
find / -regex "^.*\.html$"
find / -name "*html"
find / -regex "^.*\.html$"
find / -regex "^.*\.html?$"
find / -i -regex "^.*\.html?$"
find / -iregex "^.*\.html?$"
find / -size +1024 
find / -size +M
find / -size +1M
find / -printf "%p $s\n"
find / -printf "%p $s\n" | sort -nrk 2
find / -printf "%p $s\n" | sort -nrk 2 | head -n 10
find / -name *.trace
find / -name *.trace -ok rm {} \
find / -regex '^.*\.s?trace$' -exec rm -f '{}' \
grep -nRHi syscall /usr/include
ps 
ps --help
man ps
ps r
ps r | wc -l
find /var/log -dtime 
find /var/log -time 
find /var/log -atime
find /var/log -atime -30
ls
rm é
rm *
rm -r *
ls
git init
sudo yum install git
git init
ls
ls -l
ls la
ls -la
man git
git config --global user.name "francescamolella"
git config --global user.email francesca.molella@sourcesense.com
git config --list
nano prova.sh
ls
cat prova.sh 
git add .
git commit -m "new file"
git push -u origin main
git status
git push origin master
git remote add origin https://github.com/francescamolella1812/formazione_sou
git branch -M main
git push -u origin main
 sudo yum install gh
 sudo brew install gh
 sudo yum install brew
cat /.ssh
ls
git push -u origin main
exit
ls
exit
