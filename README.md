# vimrc
My dotfiles of Vim, Neovim, nvi, and nano which compatible with Cygwin and WSL.  
There is no error detected even if you are using vim.tiny!  
(Of course I strongly recommend you to use Huge version of Vim :)  
Syntax files of BveTs Map and LS-PrePost are also included.

## Installation
### for Vim users
If you do not have Vim yet, you can install it by executing:

    sudo apt install build-essential libncurses5-dev libgtk-3-dev libx11-dev libxt-dev
    git clone https://github.com/vim/vim.git
    cd vim
    ./configure --with-features=huge --enable-multibyte --with-x --enable-gui=gtk3 --enable-fail-if-missing
    make && sudo make install
    
And then, copy **.exrc** and **.vimrc** to your home directory.

    git clone https://github.com/hakehash/vimrc
    cd vimrc
    cp .exrc .vimrc ~
    cp -r .vim/ ~/.vim/

### for Neovim users
Copy **.config/nvim/init.vim**, **.exrc**, and **.vimrc** to your home directory.

    cp .exrc .vimrc ~
    mkdir -p ~/.config/nvim
    cp .config/nvim/init.vim ~/.config/nvim/

### for nvi users
Copy **.nexrc**, **.exrc**, and **.vimrc** to your home directory.

`cp .nexrc .exrc .vimrc ~`

### for nano users
Copy **.nanorc** to your home directory.

`cp .nanorc ~`
