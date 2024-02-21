return {
    "willothy/nvim-cokeline",
    dependencies = {
        "nvim-lua/plenary.nvim",       -- Required for v0.4.0+
        "nvim-tree/nvim-web-devicons", -- If you want devicons
        "stevearc/resession.nvim"      -- Optional, for persistent history
    },
    opts = {
        components = {
            {
                text = function(buffer)
                    local _text = ''
                    if buffer.index > 1 then _text = ' ' end
                    if buffer.is_focused then
                        _text = _text .. ''
                    end
                    return _text
                end,
                fg = function(buffer)
                    if buffer.is_focused then
                        return 'NONE'
                    elseif buffer.is_first then
                        return 'NONE'
                    end
                end,
                bg = function(buffer)
                    if buffer.is_focused then
                        if buffer.is_first then
                            return 'NONE'
                        else
                            return 'NONE'
                        end
                    elseif buffer.is_first then
                        return 'NONE'
                    end
                end
            },
            {
                text = function(buffer)
                    return " " .. buffer.devicon.icon
                end,
                fg = function(buffer)
                    if buffer.is_focused then
                        return buffer.devicon.color
                    end
                end
            },
            {
                text = function(buffer)
                    return buffer.unique_prefix .. buffer.filename
                end,
                fg = function(buffer)
                    if (buffer.diagnostics.errors > 0) then
                        return '#C95157'
                    end
                end,
                style = function(buffer)
                    local text_style = 'NONE'
                    if buffer.is_focused then
                        text_style = 'bold'
                    end
                    if buffer.diagnostics.errors > 0 then
                        if text_style ~= 'NONE' then
                            text_style = text_style .. ',underline'
                        else
                            text_style = 'underline'
                        end
                    end
                    return text_style
                end
            },
            {
                text = function(buffer)
                    local errors = buffer.diagnostics.errors
                    local icons = require('user.core.icons')
                    if buffer.diagnostics.errors > 0 then
                        errors = ' ' .. icons.diagnostics.Error
                    else
                        errors = ' '
                    end
                    return errors .. ' '
                end,
                fg = function(buffer)
                    if buffer.diagnostics.errors > 0 then
                        return '#DB121B'
                    end
                end
            },
            {
                text = '',
                delete_buffer_on_left_click = true
            },
            {
                text = function(buffer)
                    if buffer.is_focused then
                        return ''
                    else
                        return ' '
                    end
                end,
                fg = function(buffer)
                    if buffer.is_focused then
                        return 'NONE'
                    elseif buffer.is_last then
                        return 'NONE'
                    else
                        return 'NONE'
                    end
                end,
                bg = function(buffer)
                    if buffer.is_focused then
                        if buffer.is_last then
                            return 'NONE'
                        else
                            return 'NONE'
                        end
                    elseif buffer.is_last then
                        return 'NONE'
                    end
                end
            }
        },
    }
}
