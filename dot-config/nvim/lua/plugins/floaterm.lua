vim.g.floaterm_width = 0.8
vim.g.floaterm_height = 0.8

vim.g.floaterm_autoinsert = false                           -- not enter insert mode after opening a floaterm
vim.cmd([[autocmd FileType floaterm setlocal winblend=25]]) -- set transparency for floaterm

local function toggleFT()
    if vim.fn['floaterm#terminal#get_bufnr']("one&only") ~= -1 then
        vim.api.nvim_exec([[FloatermToggle]], false)
    else
        vim.api.nvim_exec([[FloatermNew! --name=one&only PS1="\u@\w\$ ";clear;]], false)
    end
end
vim.keymap.set("n", "<c-\\>", toggleFT)
