# vimrc
My dotfiles of Vim, Neovim, nvi, elvis, and nano, which compatible with Cygwin and WSL.  
There is no error detected even if you are using vim.tiny!  
(Of course I strongly recommend you to use Huge version of Vim :)  

## Installation
### for Vim users
If you do not have Vim yet, you can install it by executing:

    sudo apt install build-essential gettext libncurses-dev libgtk-3-dev libx11-dev libxt-dev
    git clone https://github.com/vim/vim.git
    cd vim
    ./configure CFLAGS=-fPIC --with-features=huge --enable-multibyte --with-x --enable-gui=gtk3 --enable-fail-if-missing
    make && sudo make install

And then, copy **.exrc** and **.vimrc** to your home directory.

    git clone https://github.com/hakehash/vimrc
    cd vimrc
    cp .exrc .vimrc ~
    cd
    git clone https://github.com/hakehash/.vim

### for Neovim users
Copy **.config/nvim/init.vim**, **.exrc**, and **.vimrc** to your home directory.

    cp .exrc .vimrc ~
    mkdir -p ~/.config/nvim
    cp .config/nvim/init.vim ~/.config/nvim/

### for nvi users
Copy **.exrc** and **.nexrc** to your home directory.

    cp .exrc .nexrc ~

### for elvis users
Copy **.exrc** and **.elvisrc** to your home directory.

    cp .exrc .elvisrc ~

### for nano users
Copy **.nanorc** to your home directory.

    cp .nanorc ~

## See also
Syntax files & ftplugins: [https://github.com/hakehash/.vim](https://github.com/hakehash/.vim)
