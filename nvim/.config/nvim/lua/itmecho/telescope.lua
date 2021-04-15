local tb = require("telescope.builtin")
local actions = require("telescope.actions")
local finders = require("telescope.finders")
local pickers = require("telescope.pickers")
local previewers = require("telescope.previewers")
local sorters = require("telescope.sorters")
local state = require("telescope.actions.state")

local vterm = require("vterm")

local M = {}

local function generic_command(opts)
    local results = vim.fn.system(opts.command)
    local items = {}
    for s in results:gmatch("[^\r\n]+") do
        table.insert(items, s)
    end
    pickers.new(
        {},
        {
            prompt_title = opts.prompt_title,
            cwd = opts.cwd,
            finder = finders.new_table(items),
            previewer = previewers.vim_buffer_cat.new({}),
            sorter = sorters.get_fzy_sorter(),
            attach_mappings = opts.mappings
        }
    ):find()
end

M.orca = function()
    generic_command(
        {
            prompt_title = "Orca",
            command = "bazel query 'kind(container_image, //...)' 2>/dev/null | grep 'image$' | sed -E 's/.*:(.*).image/\\1/'",
            cwd = "~/src/CloudExperiments",
            mappings = function(prompt_bufnr, map)
                map(
                    "i",
                    "<cr>",
                    function()
                        vterm.run("clear && orca variant update " .. state.get_selected_entry().value)
                        actions.close(prompt_bufnr)
                    end
                )
                map(
                    "i",
                    "<C-l>",
                    function()
                        vterm.run("clear && orca variant logs " .. state.get_selected_entry().value)
                        actions.close(prompt_bufnr)
                    end
                )
                return true
            end
        }
    )
end

M.gotest = function()
    generic_command(
        {
            prompt_title = "Filter test packages",
            command = "fd _test.go --exec echo {//} | sort | uniq;",
            mappings = function(prompt_bufnr, map)
                map(
                    "i",
                    "<cr>",
                    function()
                        vterm.run("clear && go test ./" .. state.get_selected_entry().value .. "/...")
                        actions.close(prompt_bufnr)
                    end
                )
                return true
            end
        }
    )
end

M.search_string = function()
    tb.grep_string(
        {
            prompt_title = "Filter Results",
            search = vim.fn.input("Search for: ")
        }
    )
end

M.search_nvim_config = function()
    tb.find_files(
        {
            prompt_title = "Neovim Config",
            cwd = "~/.config/nvim"
        }
    )
end

M.cd_to_project = function()
    tb.find_files(
        {
            prompt_title = "Sparx Projects",
            cwd = "~/src/CloudExperiments",
            find_command = {"fd", "--max-depth=2", "--type=d"},
            attach_mappings = function(prompt_bufnr, map)
                map(
                    "i",
                    "<cr>",
                    function(bufnr)
                        local path = "~/src/CloudExperiments/" .. state.get_selected_entry(bufnr).value
                        vim.cmd("cd " .. path)
                        actions.close(prompt_bufnr)
                        local parts = vim.fn.split(path, "/")
                        vim.g.itmecho_project = parts[#parts]
                        print("project: " .. path)
                    end
                )
                return true
            end
        }
    )
end

M.git_branches = function()
    tb.git_branches(
        {
            attach_mappings = function(_, map)
                map("i", "<c-d>", actions.git_delete_branch)
                return true
            end
        }
    )
end

M.file_browser = function()
    tb.file_browser(
        {
            hidden = true,
            attach_mappings = function(_, map)
                map(
                    "i",
                    "<c-d>",
                    function(bufnr)
                        local path = state.get_selected_entry(bufnr).value
                        vim.cmd("cd " .. path)
                        print("changed directory to " .. path)
                    end
                )
                return true
            end
        }
    )
end

M.buffers = function()
    tb.buffers(
        {
            attach_mappings = function(_, map)
                map(
                    "i",
                    "<c-d>",
                    function(_)
                        local selection = state.get_selected_entry()
                        if pcall(vim.api.nvim_buf_delete, selection.bufnr, {}) then
                            print(string.format("Deleted buffer %d: %s", selection.bufnr, selection.filename))
                        -- Delete buffer here
                        end
                    end
                )
                return true
            end
        }
    )
end

return M
