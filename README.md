**Custom Fork for Harish**
1. Install NVim
```
# OSX
brew install nvim

# Ubuntu
sudo snap install nvim --classic
```
2. Install NvChad setup
```
mkdir .config;
cd .config;
git clone https://github.com/devlibx/nvim-starter.git nvim
```

3. Install required tools

```
:MesonInstall lua-language-server
:MesonInstall rust-analyzer
:MesonInstall codelldb

# OSX
sh osx_setup.sh

# Ubuntu
sh linux_setup.sh
```


----
# Commands
```
# Open left side project tree
Ctrl + n
   'a' -> to add a new file on the tree


```





