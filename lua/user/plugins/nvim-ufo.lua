return {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    config = function()
        require("ufo").setup()
        local keymap = vim.keymap.set
        -- ufo
        keymap('n', 'zr', require('ufo').openAllFolds, { silent = true })
        keymap('n', 'zm', require('ufo').closeAllFolds, { silent = true })
        keymap('n', 'zk', function()
            local winid = require('ufo').peekFoldedLinesUnderCursor()
            if not winid then
                vim.lsp.buf.hover()
            end
        end, { silent = true })
    end
}
