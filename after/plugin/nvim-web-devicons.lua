local status, icons = pcall(require, 'nvim-web-devicons')
if not status then return end

icons.setup {
  override = {
    sh = {
      icon = '',
      color = '#428850',
      cterm_color = '59',
      name = 'Sh',
    },
    py = {
      icon = '',
      color = '#428850',
      cterm_color = '94',
      name = 'Py',
    },

  },
  color_icons = true,
  default = true,
  strict = true,
  override_by_filename = {
    ['.gitattributes'] = {
      icon = '',
      color = '#e24329',
      cterm_color = '59',
      name = 'GitAttributes',
    },
    ['.gitconfig'] = {
      icon = '',
      color = '#e24329',
      cterm_color = '59',
      name = 'GitConfig',
    },
    ['.gitignore'] = {
      icon = '',
      color = '#e24329',
      cterm_color = '59',
      name = 'GitIgnore',
    },
    ['.gitlab-ci.yml'] = {
      icon = '',
      color = '#e24329',
      cterm_color = '166',
      name = 'GitlabCI',
    },
    ['.gitmodules'] = {
      icon = '',
      color = '#e24329',
      cterm_color = '59',
      name = 'GitModules',
    },
    ['diff'] = {
      icon = '',
      color = '#e24329',
      cterm_color = '59',
      name = 'Diff',
    },
  }

}
