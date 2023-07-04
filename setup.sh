https://taskfile.dev/installation/

echo "===== Installing Task to manage the dotfiles environment. ====="
sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b /usr/local/bin/

echo "===== Task installed. Running task --list for a preview of what to install in this environment. ====="

task --list
