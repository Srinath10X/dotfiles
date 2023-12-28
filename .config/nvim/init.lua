require("srinath.lazy") --> Loading Plugins first
require("srinath.core.options") --> Loading options from core
require("srinath.core.keymaps") --> Loading keymaps from core
require("srinath.plugins.cmp") --> cmp config
require("srinath.plugins.treesitter") --> treesitter config
require("srinath.plugins.lsp.lspsaga") --> configuring lspsaga
require("srinath.plugins.lsp.lsp") --> lsp config
require("srinath.plugins.lsp.null_ls") --> setting up null_ls
require("srinath.plugins.lsp.mason") --> mason lsp config
require("srinath.plugins.neovide") --> neovide config for zoom in and zoom out
