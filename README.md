# SimpleZshTheme
A simple zsh theme (for oh-my-zsh), a.k.a `tuan` theme for short.

This theme favors readability and simplicity while providing a certain amount of necessary information for developers, esp. those who uses Python virtualenv.

## Screenshots
Without Python virtualenv prompt
![img](./img/screenshot_01.jpg)

With Python virtualenv prompt
![img](./img/screenshot_02.jpg)

Note in these screenshots:
- Terminal emulator: tilix
- Font: FiraCode Nerd Font Retina
- Theme for terminal (tilix): Dracula theme

# How to install (with Oh-my-zsh) (Linux)
1. Link file `tuan.zsh-theme` to `~/.oh-my-zsh/themes/`
    ```bash
    # Clone this repo
    cd SimpleZshTheme/
    ln -s tuan.zsh-theme  ~/.oh-my-zsh/themes/tuan.zsh-theme
    ```
2. Add/modify your `.zshrc` to add new theme:
    ```bash
    ZSH_THEME="tuan" 
    ```
3. Requirements:
- Oh-my-zsh installed in your system ([link](https://github.com/ohmyzsh/ohmyzsh)).
- A Nerd Font installed in your machine, e.g. Fira Code Nerd Font ([link](https://www.nerdfonts.com/font-downloads)). Choose `FiraCode Nerd Font` in your terminal emulator profile. Do the same in your VSCode editor.font and terminal.font settings if you want to use this theme on your VSCode terminal.
- [Optional] Dracula theme for your choice of terminal emulator, e.g. tilix, gnome-terminal, etc., and for VSCode (if you also use VSCode). Refer to Dracula theme [website](https://draculatheme.com/) for installation.

## Credits
- robbyrussell and the oh-my-zsh community.
- ChesterYue for his theme inspiration.
- The Nerd Fonts' authors and community.
- Dracula theme's authors and contributors.