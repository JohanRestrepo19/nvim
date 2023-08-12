local themes = {
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
