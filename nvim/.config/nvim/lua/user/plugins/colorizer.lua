local M = {
  'norcalli/nvim-colorizer.lua',
}

function M.config()
  require 'colorizer'.setup {
    'css';
    'javascript';
    'scss';
    html = {
      mode = 'foreground';
    }
  }
end

return M
