# This is a repository of my config files for Neovim.

### **CAUTION**: Neovim >= v0.7.2 *is required*

### Dependencies

**Install *git*, *npm* and [*ripgrep*](https://github.com/BurntSushi/ripgrep)**

**Linux**:
* Install build-essential.

**Windows**:
* Install [llvm-mingw](https://github.com/mstorsjo/llvm-mingw)
and add the bin folder to path.

### Installation

**Windows**

Delete these folders if they exist.

* ~\AppData\Local\nvim\
* ~\AppData\Local\nvim-data\
* ~\AppData\Local\temp\nvim\

Then run this command in git bash:
```
git clone --depth 1 https://github.com/Hitesh-Aggarwal/nvim.git ~/AppData/Local/nvim/
```

or powershell:
```
git clone --depth 1 https://github.com/Hitesh-Aggarwal/nvim.git $home\AppData\Local\nvim\
```

**Linux**

Delete these folders if they exist.

* ~/.config/nvim/
* ~/.local/share/nvim/
* ~/.cache/nvim/

```
git clone --depth 1 https://github.com/Hitesh-Aggarwal/nvim.git ~/.config/nvim/
```

First run of nvim will install packer and all the plugins.
Language servers need to be installed manually as required using :MasonInstall \<langservername\>
and then added to comp.lua
