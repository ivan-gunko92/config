```
#!/bin/sh

set -e
export user=
export dir=

cd /opt/
if [ ! -d "${user}" ]; then
  sudo dir="${dir}" mkdir "${user}"
  sudo dir="${dir}" user="${user}" chown "${user}" "${dir}"
fi
cd "${user}"/
if [ ! -d config ]; then
  git clone https://github.com/ivan-gunko92/config.git
fi
cd config/
git submodule update --init --recursive
export PATTERN="BY \`make config bashrc\` FROM \`$(pwd)\`"
if ! grep -q "${PATTERN}" ~/.bashrc; then
  str="source $(pwd)/bashrc.sh # ${PATTERN}"
  echo "${str}" >> ~/.bashrc
  echo "Added line to ~/.bashrc: ${str}"
fi
```

```
cd /tmp
vim init.sh
sudo chmod +rx init.sh
```

# TODO

- def user and dir
- make
