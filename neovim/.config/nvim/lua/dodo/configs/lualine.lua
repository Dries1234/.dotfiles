local M = {}

M.config = function()
    local git_blame = require('gitblame')
    require('lualine').setup {

        options = { theme = 'catppuccin' },
        sections = {
            lualine_c = {
                'filename',
                { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available }
            }
        }
    }
end

return M
