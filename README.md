# vimrc
My dotfiles of [Vim](https://github.com/vim/vim), [Neovim](https://github.com/neovim/neovim), nvi, elvis, and nano, which compatible with Cygwin and WSL.  
There is no error detected even if you are using vim.tiny!  
(Of course I strongly recommend you to use Huge version of Vim :)  

## Installation
### for Vim users
If you do not have [Vim](https://github.com/vim/vim) yet, you can install it by executing:

    sudo apt install build-essential gettext libncurses-dev libcanberra-dev libgtk-3-dev libx11-dev libxt-dev xsel
    git clone https://github.com/vim/vim.git
    cd vim
    ./configure CFLAGS=-fPIC --with-features=huge --enable-multibyte --with-x --enable-gui=gtk3 --enable-fail-if-missing
    make -j$(nproc) && sudo make install
    cd /usr/local/bin
    sudo ln -s vim vi

If you do not need GUI environment (e.g. build on Raspberry Pi):

    sudo apt install build-essential gettext libncurses-dev libcanberra-dev
    git clone https://github.com/vim/vim.git
    cd vim
    ./configure CFLAGS=-fPIC --with-features=huge --enable-multibyte --without-x --disable-gui --enable-fail-if-missing
    make -j$(nproc) && sudo make install

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

If you use [Neovim](https://github.com/neovim/neovim) on Windows, copy **init.vim** to following directory:

    $HOME/AppData/Local/nvim/

### for nvi users
Copy **.exrc** and **.nexrc** to your home directory.

    cp .exrc .nexrc ~

### for elvis users
Copy **.exrc** and **.elvisrc** to your home directory.

    cp .exrc .elvisrc ~

### for nano users
Copy **.nanorc** to your home directory.

    cp .nanorc ~

### for Emacs users
I like [Vim](https://github.com/vim/vim) but my employer restricts to use [Vim](https://github.com/vim/vim) so I started to use Emacs. As a casual user of Emacs, I install only 3 plugins - [ddskk](https://github.com/skk-dev/ddskk), [evil](https://github.com/emacs-evil/evil) and [evil-numbers](https://github.com/cofi/evil-numbers).

    sudo apt install libgnutls28-dev libncurses-dev libxpm-dev libxaw7-dev libgif-dev libtiff-dev libgccjit-10-dev ncurses-term
    curl -O http://ftp.jaist.ac.jp/pub/GNU/emacs/emacs-28.1.tar.xz
    tar xf emacs-28.1.tar.xz
    cd emacs-28.1
    ./autogen.sh
    ./configure --with-mailutils --with-x-toolkit=lucid --with-native-compilation
    make -j$(nproc)
    sudo make install
    TERM=xterm-direct emacs -nw

## See also
Syntax files & ftplugins: [https://github.com/hakehash/.vim](https://github.com/hakehash/.vim)

Japanese Vim Documents:  [https://github.com/vim-jp/vimdoc-ja](https://github.com/vim-jp/vimdoc-ja)

Russian Vim Documents: [https://sourceforge.net/projects/ruvim2/](https://sourceforge.net/projects/ruvim2/)

eskk.vim: [https://github.com/vim-skk/eskk.vim](https://github.com/vim-skk/eskk.vim)
