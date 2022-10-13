local map = vim.keymap.set
local opts = { silent=true, noremap=true, expr=true, replace_keycodes = false}


map('i', '<Tab>', 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<Tab>" : coc#refresh()', opts)
map("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
-- Use enter to complete
map("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
map("i", "<C-j>", "<Plug>(coc-snippets-expand-jump)")
-- Use Ctrl <Space> to trigger suggestion
map("i", "<C-space>", "coc#refresh()", {silent = true, expr = true})


-- Unchecked Defaults
-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
map("n", "[g", "<Plug>(coc-diagnostic-prev)", {silent = true})
map("n", "]g", "<Plug>(coc-diagnostic-next)", {silent = true})

-- GoTo code navigation.
map("n", "gd", "<Plug>(coc-definition)", {silent = true})
map("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
map("n", "gi", "<Plug>(coc-implementation)", {silent = true})
map("n", "gr", "<Plug>(coc-references)", {silent = true})


-- Use K to show documentation in preview window.
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
map("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})


-- Highlight the symbol and its references when holding the cursor.
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
})


-- Symbol renaming.
map("n", "<leader>rn", "<Plug>(coc-rename)", {silent = true})


-- Formatting selected code.
map("x", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})
map("n", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})


-- Setup formatexpr specified filetype(s).
vim.api.nvim_create_autocmd("FileType", {
    group = "CocGroup",
    pattern = "typescript,json",
    command = "setl formatexpr=CocAction('formatSelected')",
    desc = "Setup formatexpr specified filetype(s)."
})

-- Update signature help on jump placeholder.
vim.api.nvim_create_autocmd("User", {
    group = "CocGroup",
    pattern = "CocJumpPlaceholder",
    command = "call CocActionAsync('showSignatureHelp')",
    desc = "Update signature help on jump placeholder"
})


-- Applying codeAction to the selected region.
-- Example: `<leader>aap` for current paragraph
local opts = {silent = true, nowait = true}
map("x", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)
map("n", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)

-- Remap keys for applying codeAction to the current buffer.
map("n", "<leader>ac", "<Plug>(coc-codeaction)", opts)


-- Apply AutoFix to problem on the current line.
map("n", "<leader>qf", "<Plug>(coc-fix-current)", opts)


-- Run the Code Lens action on the current line.
map("n", "<leader>cl", "<Plug>(coc-codelens-action)", opts)


-- Map function and class text objects
-- NOTE: Requires 'textDocument.documentSymbol' support from the language server.
map("x", "if", "<Plug>(coc-funcobj-i)", opts)
map("o", "if", "<Plug>(coc-funcobj-i)", opts)
map("x", "af", "<Plug>(coc-funcobj-a)", opts)
map("o", "af", "<Plug>(coc-funcobj-a)", opts)
map("x", "ic", "<Plug>(coc-classobj-i)", opts)
map("o", "ic", "<Plug>(coc-classobj-i)", opts)
map("x", "ac", "<Plug>(coc-classobj-a)", opts)
map("o", "ac", "<Plug>(coc-classobj-a)", opts)


-- Remap <C-f> and <C-b> for scroll float windows/popups.
---@diagnostic disable-next-line: redefined-local
local opts = {silent = true, nowait = true, expr = true}
map("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
map("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
map("i", "<C-f>",
       'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
map("i", "<C-b>",
       'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
map("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
map("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)


-- Use CTRL-S for selections ranges.
-- Requires 'textDocument/selectionRange' support of language server.
map("n", "<C-s>", "<Plug>(coc-range-select)", {silent = true})
map("x", "<C-s>", "<Plug>(coc-range-select)", {silent = true})


-- Add `:Format` command to format current buffer.
vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

-- " Add `:Fold` command to fold current buffer.
vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", {nargs = '?'})

-- Add `:OR` command for organize imports of the current buffer.
vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

-- Add (Neo)Vim's native statusline support.
-- NOTE: Please see `:h coc-status` for integrations with external plugins that
-- provide custom statusline: lightline.vim, vim-airline.
vim.opt.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")

-- Mappings for CoCList
-- code actions and coc stuff
---@diagnostic disable-next-line: redefined-local
local opts = {silent = true, nowait = true}
-- Show all diagnostics.
map("n", "<space>a", ":<C-u>CocList diagnostics<cr>", opts)
-- Manage extensions.
map("n", "<space>e", ":<C-u>CocList extensions<cr>", opts)
-- Show commands.
map("n", "<space>c", ":<C-u>CocList commands<cr>", opts)
-- Find symbol of current document.
map("n", "<space>o", ":<C-u>CocList outline<cr>", opts)
-- Search workspace symbols.
map("n", "<space>s", ":<C-u>CocList -I symbols<cr>", opts)
-- Do default action for next item.
map("n", "<space>j", ":<C-u>CocNext<cr>", opts)
-- Do default action for previous item.
map("n", "<space>k", ":<C-u>CocPrev<cr>", opts)
-- Resume latest coc list.
map("n", "<space>p", ":<C-u>CocListResume<cr>", opts)
