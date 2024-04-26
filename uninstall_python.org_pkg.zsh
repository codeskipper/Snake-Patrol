#!/usr/bin/env zsh
## uninstall_python.org_pkg.zsh

# Uninstall script for macOS packages from python.org
# Thanks to h2ppy for https://stackoverflow.com/a/73687306/4326287
# formatted as script with version number as argument, and expanded remove pkg receipts as well

# script must run as root, call it using sudo
if [ "$( id -u )" -ne 0 ]; then
  echo "Please run this script as root or using sudo!"
  exit 1
fi



# Script needs the version of Python that you want to delete as argument 1, MUST format as x.yy e.g. '3.10'
python_version_number="$1"
if [[ ! "$python_version_number" =~ ^[23].[0123456789]{1,2}$ ]]; then
  echo "Please format the Python version number to be uninstalled as x.yy"
  exit 1
fi

echo "Setting out to uninstall a python.org installed package version $python_version_number"

# remove the framework version
rm -rf /Library/Frameworks/Python.framework/Versions/${python_version_number}/

# remove the IDLE launcher folder
rm -rf "/Applications/Python ${python_version_number}/"

# remove (orphaned) symlinks
cd /usr/local/bin && ls -l | grep "/Library/Frameworks/Python.framework/Versions/${python_version_number}" | awk '{print $9}' | xargs rm

# remove pkg receipts
python_receipts=$( pkgutil --pkgs | grep -E org\.python\.Python\.Python.+\-${python_version_number} )
while IFS= read -r i
  do
    echo "removing pkg receipt for $i"
    pkgutil --forget "$i"
  done <<<"$python_receipts"
