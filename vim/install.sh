install_path=$(
  cd $(dirname $0)
  pwd
)
config_path=$(
  cd $install_path/..
  pwd
)
echo "====> Config file root path is: ${config_path}"

if ! command -v brew >/dev/null 2>&1; then
    echo "====> Command brew is not be installed, start to install"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "====> Commnad brew is already install"
fi

echo "====> Use brew to intall necessary"
brew install vim --with-override-system-vi
brew install neovim
brew install fcitx-remote-for-osx --with-input-method=osx-pinyin
brew install python
brew intalll python@2
brew install node
brew install ctags

echo "====> Create back up dir"

echo "====> Back up dir path is: ${config_path}/bak"
if [ ! -d $config_path/bak ]; then
    mkdir -p $config_path/bak
fi

if [ -f ~/.vimrc ]; then
    echo "====> Vim config file vimrc is exist, backup and delete it."
    mv ~/.vimrc $config_path/bak/vimrc.bak
fi
echo "====> Create vimrc link"
rm ~/.vimrc >/dev/null 2>&1
ln -s $config_path/vim/vimrc ~/.vimrc

if [ ! -d ~/.config/ ]; then
    mkdir ~/.config/
fi

if [ -d ~/.config/nvim ]; then
    echo "====> Neovim config dir nvim is exist, backup and delete it."
    mv ~/.config/nvim $config_path/bak/nvim_bak
fi

echo "====> Create neovim config file links"
rm -r ~/.config/nvim >/dev/null 2>&1
ln -s ~/.vim ~/.config/nvim

echo "====> Create neovim init file links"
rm ~/.config/nvim/init.vim >/dev/null 2>&1
ln -s ~/.vimrc ~/.config/nvim/init.vim

function install_from_file(){
    while read -r line
    do
        if [[ ! $line =~ "#" ]]; then
            echo "$2 $3 $4 $line"
            `$2 $3 $4 $line`
        fi
    done < $1
}

echo "====> Use pip to install package"
install_from_file $install_path/pip3_install /usr/local/bin/pip3 install

if command -v neovim >/dev/null 2>&1; then
    install_from_file $install_path/pip_install /usr/local/bin/pip install
fi

echo "====> Use gem to install package"
install_from_file $install_path/gem_install gem install

echo "====> Use npm to install package" 
install_from_file $install_path/npm_install npm install -g

echo "====> Use go to install package"
install_from_file $install_path/go_install go get -u

# 安装vim插件
echo "====> Install vim PlugInstall"
nvim -c +PlugInstall +UpdateRemotePlugins +qa
vim -c +PlugInstall +UpdateRemotePlugins +qa

