local status, nord = pcall(require, 'nord')

if not status then
  print('Error with bufferline themes')
  return
end

local nord_highlights = nord.bufferline.highlights({
  italic = true,
  bold = true,
  fill = '#181C24'
})

local themes = {
  mocha = {
    separator = {
      fg = '#2c2d3d', -- Unselected buffer separator color (upper triangle side)
      bg = '#181825'  -- Unsleected buffer separator color (lower triangle side)
    },
    separator_selected = {
      fg = '#2c2d3d', --Selected buffer separator color
    },
    background = {
      fg = '#9f9fa3', -- Unselected buffer text color
      bg = "#181825", -- Unselected buffer background (inner rectangle)
    },
    buffer_selected = {
      fg = '#dfdfe0', -- Selected buffer text color
      bold = true,
    },
    fill = {
      bg = '#2c2d3d' -- Extra space for other tabs
    }
  },
  neosolarized = {
    separator = {
      fg = '#073642',
      bg = '#002b36'
    },
    separator_selected = {
      fg = '#073642'
    },
    background = {
      fg = '#657b83',
      bg = '#002b36'
    },
    buffer_selected = {
      fg = '#fdf6e3',
      bold = true
    },
    fill = {
      bg = '#073642'
    }
  },
  gruvbox = {
    separator = {
      fg = '#1d2021',
      bg = '#3d3d3d'
    },
    separator_selected = {
      fg = '#1d2021'
    },
    background = {
      fg = '#fdf6e3',
      bg = '#3d3d3d'
    },
    buffer_selected = {
      fg = '#fdf6e3',
      bold = true
    },
    fill = {
      bg = '#1d2021'
    }
  },
  onedark_pro = {
    separator = {
      fg = '#242424',
      bg = '#282C34'
    },
    separator_selected = {
      fg = '#242424'
    },
    background = {
      fg = '#9BA0AB',
      bg = '#282C34'
    },
    buffer_selected = {
      fg = '#9BA0AB',
      bold = true
    },
    fill = {
      bg = '#242424'
    }
  },
  kanagawa = {
    separator = {
      fg = '#2a2a37', -- Unselected buffer separator color (upper triangle side)
      bg = '#2d2d33'  -- Unsleected buffer separator color (lower triangle side)
    },
    separator_selected = {
      fg = '#2a2a37', --Selected buffer separator color
    },
    background = {
      fg = '#717C7C', -- Unselected buffer text color
      bg = '#2d2d33'  -- Unselected buffer background (inner rectangle)
    },
    buffer_selected = {
      fg = '#dcd7ba', -- Selected buffer text color
      bold = true
    },
    fill = {
      bg = '#2A2A37' -- Extra space for other tabs
    }
  },
  kanagawa_dragon = {
    separator = {
      fg = '#2d2d33', -- Unselected buffer separator color (upper triangle side)
      bg = '#1f1f28'  -- Unsleected buffer separator color (lower triangle side)
    },
    separator_selected = {
      fg = '#2d2d33', --Selected buffer separator color
    },
    background = {
      bg = '#1f1f28' -- Unselected buffer background (inner rectangle)
    },
    buffer_selected = {
      bold = true
    },
    fill = {
      bg = '#2d2d33' -- Extra space for other tabs
    }
  },
  nord = nord_highlights,
  highlights_based = {
    separator = {
      fg = { attribute = 'bg', highlight = 'TabLineFill' },
      bg = { attribute = 'bg', highlight = 'TabLine' }
    },
    separator_selected = {
      fg = { attribute = 'bg', highlight = 'TabLineFill' }
    },
    background = {
      fg = { attribute = 'fg', highlight = 'Title' },
      bg = { attribute = 'bg', highlight = 'TabLine' }
    },
    buffer_selected = {
      fg = { attribute = 'fg', highlight = 'Normal' },
      bold = true
    },
    fill = {
      bg = { attribute = 'bg', highlight = 'TabLineFill' }
    }
  },
  empty = {}
}

return themes
