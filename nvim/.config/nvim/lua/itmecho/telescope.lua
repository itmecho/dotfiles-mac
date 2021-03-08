local tb = require("telescope.builtin")
local M = {}

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
                        local path =
                            "~/src/CloudExperiments/" ..
                            require("telescope.actions.state").get_selected_entry(bufnr).value
                        vim.cmd("cd " .. path)
                        require("telescope.actions").close(prompt_bufnr)
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
                map("i", "<c-d>", require("telescope.actions").git_delete_branch)
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
                        local path = require("telescope.actions.state").get_selected_entry(bufnr).value
                        vim.cmd("cd " .. path)
                        print("changed directory to " .. path)
                    end
                )
                return true
            end
        }
    )
end

return M
