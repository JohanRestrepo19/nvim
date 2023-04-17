require 'nighteye.options'
require 'nighteye.base'
require 'nighteye.maps'
require 'nighteye.autocommands'
require 'nighteye.plugins'
require 'nighteye.colorschemes.gruvbox'

local has = vim.fn.has
local is_wsl = has "wsl"
if is_wsl then require 'nighteye.wsl' end
