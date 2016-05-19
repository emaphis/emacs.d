* Installing emacs in a local directory from source on an rpm based distro *


I like to compile install and run the latest emacs to my local home dir.  Here is how I did it.
If you follow these directions, replace UserName with your accounts name.


* install dev tools on a new Fedora installation *
```
# yum groupinstall "Development Tools"
```


* install emacs compile and installation dependencies. *
```
# yum-builddep emacs
```


* down load latest emacs source package from [gnu](http://ftp.gnu.org/gnu/emacs/) or [emacs pretest] (http://alpha.gnu.org/gnu/emacs/pretest/)

* unpack
```
tar -xvf emacs.whatever.tar.xz
```


* cd into the unpacked emacs source directory

* run configure (with my ops)
```
$ ./configure --prefix=/home/UserName/emacs --bindir=/home/UserName/bin --with-x-toolkit=gtk3 --with-dbus --with-gif --with-jpeg --with-png --with-rsvg --with-tiff --with-xft --with-xpm --with-gpm=no
```
of course with your one home directory and ops

make sure  '/usr/UserName/bin' is in your PATH

* run make *
```
$ make
```


* test drive :-)
```
$ ./src/emacs
```


* now install in your local directories *
 ```
 $ make install
 ```


Now you have a setup that's easy to experiment with.

