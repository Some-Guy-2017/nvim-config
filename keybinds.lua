function advance_selection(forward)
    local keys_raw
    if not vim.b.highlighting then
        keys_raw = "mA*`A"
    else
        if forward then keys_raw = "n"
        else
            local mode = vim.api.nvim_get_mode().mode
            if mode == 'i' then keys_raw = "N"
            else keys_raw = "NN"
            end
        end
    end
    keys_raw = "<esc>" .. keys_raw .. "ve<c-g>"
    
    local keys = vim.api.nvim_replace_termcodes(keys_raw, true, false, true)
    vim.api.nvim_feedkeys(keys, 'n', false)
    
    vim.b.highlighting = true
end

vim.keymap.set({"i", "s", "n", "v"}, "<m-n>", function()
    advance_selection(true)
end, {silent = true})

vim.keymap.set({"i", "s", "n", "v"}, "<m-p>", function()
    advance_selection(false)
end, {silent = true})

vim.api.nvim_create_user_command("BfClean", function(env) 
    local bufs = vim.fn.getbufinfo({ buflisted = 1 })
    for _, buf in ipairs(bufs) do
        if buf.name == "" and buf.hidden == 1 then
            vim.api.nvim_buf_delete(buf.bufnr, { force = false, unload = false })
        end
    end
end, {desc = "Clears all empty and hidden buffers"})
