local function bootstrap(url, opts)
    local name = opts.name or url:gsub(".*/(.+)%.git", "%1") or url:gsub(".*/", "")
    local path = opts.path or (vim.fn.stdpath("data") .. "/lazy/" .. name)

    if (vim.uv or vim.loop).fs_stat(path) then
        if opts.adjust_rtp then
            vim.opt.rtp:prepend(path)
        end
        return path
    end

    print(name .. ": installing in data dir...")

    local cmd = { "git", "clone", "--filter=blob:none", url, path }
    if opts.ref then
        table.insert(cmd, 4, "--branch=" .. opts.ref)
    end

    vim.fn.system(cmd)

    if opts.adjust_rtp then
        vim.opt.rtp:prepend(path)
    end

    vim.cmd("redraw")
    print(name .. ": finished installing")

    return path
end

bootstrap("https://github.com/folke/lazy.nvim.git", { ref = "stable", adjust_rtp = true })
bootstrap("https://github.com/botantony/tangerine.nvim.git", { ref = "master", adjust_rtp = true })

require("tangerine").setup({
    compiler = {
        verbose = false,
        hooks = { "oninit" },
    },
})
