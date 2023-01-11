# This is a repository of my config files for Neovim.

### **CAUTION**: Neovim >= v0.8 _is required_

### Dependencies

**Install _git_, _npm_ and [_ripgrep_](https://github.com/BurntSushi/ripgrep)**

**Linux**:

- Install build-essential.

**Windows**:

- Install [llvm-mingw](https://github.com/mstorsjo/llvm-mingw)
  and add the bin folder to path.

### Installation

**Windows**

Delete these folders if they exist.

- ~\AppData\Local\nvim\
- ~\AppData\Local\nvim-data\
- ~\AppData\Local\temp\nvim\

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

- ~/.config/nvim/
- ~/.local/share/nvim/
- ~/.cache/nvim/

```
git clone --depth 1 https://github.com/Hitesh-Aggarwal/nvim.git ~/.config/nvim/
```

First run of neovim will install lazy and all the plugins.
