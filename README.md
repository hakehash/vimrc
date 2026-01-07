# vimrc
My dotfiles of [Vim](https://github.com/vim/vim), [Neovim](https://github.com/neovim/neovim), [nvi](https://fossies.org/linux/privat/old/nvi-1.81.6.tar.gz/), elvis, and nano, which compatible with Cygwin and WSL.  
There is no error detected even if you are using vim.tiny!  
(Of course I strongly recommend you to use Huge version of Vim :)  

## Installation
### for Vim users
If you do not have [Vim](https://github.com/vim/vim) yet, you can install it by executing:

    sudo apt install build-essential gettext libncurses-dev libcanberra-dev libcanberra-pulse libgtk-3-dev libx11-dev libxt-dev xsel
    git clone https://github.com/vim/vim.git
    cd vim
    ./configure CFLAGS=-fPIC --with-features=huge --enable-multibyte --with-x --enable-gui=gtk3 --enable-fail-if-missing
    make -j$(nproc) && sudo make install
    cd /usr/local/bin
    sudo ln -s vim vi

To share clipboard between Windows and Vim on WSL2, you need [VcXsrv](https://sourceforge.net/projects/vcxsrv/) and add following environment variables to .bashrc:

    export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
    export LIBGL_ALWAYS_INDIRECT=0
    export LIBGL_ALWAYS_SOFTWARE=0

If the /etc/resolv.conf is not contains valid IP address, use following instead:

    export DISPLAY=$(ip route show | grep -i default | awk '{print $3}'):0
    export LIBGL_ALWAYS_INDIRECT=0
    export LIBGL_ALWAYS_SOFTWARE=0

And to play [killersheep](https://github.com/vim/killersheep), you also need [PulseAudio](https://www.freedesktop.org/wiki/Software/PulseAudio/Ports/Windows/Support/) and add following to .bashrc:

    export PULSE_SERVER=tcp:$(grep nameserver /etc/resolv.conf | awk '{print $2}')

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

If your Vim is running on DOS, rename **.vimrc** and **.exrc** to **_vimrc** and **_exrc** respectively.

### for Neovim users
Copy **.config/nvim/init.vim**, **.exrc**, and **.vimrc** to your home directory.

    cp .exrc .vimrc ~
    mkdir -p ~/.config/nvim
    cp .config/nvim/init.vim ~/.config/nvim/

If you use [Neovim](https://github.com/neovim/neovim) on Windows, copy **init.vim** to following directory:

    %USERPROFILE%\AppData\Local\nvim\

### for nvi users
Copy **.exrc** and **.nexrc** to your home directory.

    cp .exrc .nexrc ~

### for elvis users
Copy **.exrc** and **.elvisrc** to your home directory.

    cp .exrc .elvisrc ~

### for BusyBox vi users
BustBox vi supports `$HOME/.exrc` since [2021-08-20](https://git.busybox.net/busybox/commit/?id=f9217cd235c2a139ae22cf549c7614724f1fc6cf).  
Copy and rename .exrc_busybox to your home directory.

    cp .exrc_busybox ~/.exrc

### for nano users
Copy **.nanorc** to your home directory.

    cp .nanorc ~

### for Emacs users
I like [Vim](https://github.com/vim/vim) but my employer restricts to use it so I started to use Emacs. As a casual user of Emacs, I install only 4 plugins - [ddskk](https://github.com/skk-dev/ddskk), [evil](https://github.com/emacs-evil/evil), [evil-numbers](https://github.com/cofi/evil-numbers) and [undo-fu](https://codeberg.org/ideasman42/emacs-undo-fu) (for Emacs 27 or earlier). [goto-chg](https://github.com/emacs-evil/goto-chg) is also needed.

    sudo apt install libgnutls28-dev libncurses-dev libxpm-dev libxaw7-dev xaw3dg-dev libgif-dev libtiff-dev libgccjit-12-dev ncurses-term libwebkit2gtk-4.1-dev
    curl -L -O http://ftpmirror.gnu.org/emacs/emacs-29.3.tar.xz
    tar xf emacs-29.3.tar.xz
    cd emacs-29.3
    ./autogen.sh
    ./configure --with-pop --with-mailutils --with-x-toolkit=lucid --with-native-compilation
    make -j$(nproc)
    sudo make install
    TERM=xterm-direct emacs -nw

## See also
Syntax files & ftplugins: [https://github.com/hakehash/.vim](https://github.com/hakehash/.vim)

Japanese Vim Documents:  [https://github.com/vim-jp/vimdoc-ja](https://github.com/vim-jp/vimdoc-ja)

Russian Vim Documents: [https://sourceforge.net/projects/ruvim2/](https://sourceforge.net/projects/ruvim2/)

eskk.vim: [https://github.com/vim-skk/eskk.vim](https://github.com/vim-skk/eskk.vim)

russian-jcuken-jp: [https://github.com/mpenkov/russian-jcuken-jp.vim](https://github.com/mpenkov/russian-jcuken-jp.vim)

