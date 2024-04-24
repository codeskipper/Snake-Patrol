# Snake-Patrol
Scan for python installations on macOS, and run CVE-2015-20107.py script to report if patching is needed

Make sure to run this from an app with Full Disk Access permission - i.e. ensure iTerm.app has
Full Disk Access enabled in Apple System Settings, Security & Privacy Privacy & Security.

Clone this repo

cd into the cloned repo directory

run
```
./Snake-Patrol.zsh
```


Example output:
```
lrwxr-xr-x  1 root  wheel  10 Apr 11 14:08 /usr/local/munki/Python.framework/Versions/3.10/bin/python3 -> python3.10
=====CVE-2015-20107.py START=====
python_path:/usr/local/munki/Python.framework/Versions/3.10/bin/python3 python_version:3.10.11
Warning encountered trying to use unquoted mailcap path: Refusing to use mailcap with filename "'$(xterm);#.txt". Use a safe temporary filename.
CVE-2015-20107 patched OK, exiting without error.
=====CVE-2015-20107.py STOP=====


lrwxrwxr-x  1 root  wheel  9 Jan 22 10:02 /usr/local/munki/Python.framework/Versions/3.9/bin/python3 -> python3.9
=====CVE-2015-20107.py START=====
python_path:/usr/local/munki/Python.framework/Versions/3.9/bin/python3 python_version:3.9.7
No error encountered importing unquoted mailcap path...!
CVE-2015-20107 NOT patched, PLEASE UPDATE OR UNINSTALL THIS PYTHON VERSION!
=====CVE-2015-20107.py STOP=====
```
