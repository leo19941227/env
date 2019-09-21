![](https://i.imgur.com/xUB5R9w.png)

# Linux Environment
This repository includes four parts of settings:
- **env.sh** (for bash)
- **Hack font** (make vim/tmux colorschemes render correctly)
- **vimrc** (for vim)
- **tmux.conf** (for tmux)


## Clone the repository
In the following context, I assume that the `env` repository is cloned at `~/`.

```bash
~$ git clone https://github.com/leo19941227/env
```


## BASH
- The contents in `env.sh` is only desiged for my usecase, one **SHOULD NOT** plug-and-play my `env.sh`
- The settings in `env.sh` are independent to vim/tmux settings

Bash settings locate in `env.sh`. Try not to directly add the contents into `~/.bashrc`, cause this will lead to the difficulty of debugging. Instead, one should include only one line into `~/.bashrc`:

```bash
# ~/.bashrc
source ~/env/env.sh
```


## Hack font
- **Root privilege is NOT required**
- Supports Linux/Max/Windows

Since vim/tmux colorschemes frequently use rare symbols to draw a GUI-like terminal-based coding environment. We need to install an additional font package. Follow the installation guide from [Hack Official](https://github.com/source-foundry/Hack). It should help you get a char-rich terminal. (Remember to select **Hack** font for your terminal)


## VIM
The power of vim comes from the comprehensive support of package community. I use `Vundle` as my **vim package manager**. First install `Vundle`, and then install **vim packages**, which we need to open vim editor first

```bash
~$ bash env/vundle.sh
~$ ln -s env/vimrc .vimrc
~$ vim
```

Now the vim editor is opened, we can enter the installation command inside vim:

```vim
:PluginInstall
```

The installer will automatically install the required packages. After the installation, simply close the vim editor, and open it again. You should now have package supports


## TMUX
I use `tpm` as my **tmux package manager**. So we also need to first install `tpm` and other tmux packages.

```bash
~$ bash env/tpm.sh
~$ ln -s env/tmux.conf .tmux.conf
~$ tmux
```

Inside our first tmux session, we use a **tmux shorcut** for installation:

```
Ctrl + b + I
```

Here the first char `b` is lowercase, and `I` is uppercase, this is important. It seems nothing happens after pressing this shorcut, but tmux will handle the packages installation in the background. When the installation is completed, tmux will pop-up a window to notify you. After tmux packages installation, close the current session and reopen another session. Now you should get the support from tmux packages.


## Acknowledgement
Thanks [**Yist Lin**](https://github.com/yistLin) for very helpful tutorial and advices. Configurations of my vim/tmux highly reference to his idea. For a more advanced vim configuration, checkout his [github repo](https://github.com/yistLin/vimconfig).

