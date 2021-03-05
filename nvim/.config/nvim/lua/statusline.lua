local function mode_segment()
    local current = vim.api.nvim_get_mode().mode
    local mode_map = {
        n = {
            name = "NORMAL",
            color = "WildMenu"
        },
        i = {
            name = "INSERT",
            color = "DraculaTodo"
        },
        c = {
            name = "COMMAND",
            color = "DraculaDiffText"
        },
        t = {
            name = "TERMINAL",
            color = "DraculaOrangeInverse"
        },
        v = {
            name = "VISUAL",
            color = "DraculaSearch"
        },
        V = {
            name = "VISUAL LINE",
            color = "DraculaSearch"
        }
    }

    local mode = mode_map[current]
    local content = ""

    if mode == nil then
        content = string.format("%%#DraculaRedInverse# UNKNOWN: %s", current)
    else
        content = string.format("%%#%s# %s", mode.color, mode.name)
    end

    content = content .. " %#LineNr#"

    return content
end

local function file_segment()
    local filename = vim.fn.expand("%:p:t")
    local ext = vim.fn.expand("%:e")
    local icon, icon_hl = require "nvim-web-devicons".get_icon(filename, ext)
    local output = ""
    if icon ~= nil then
        output = output .. string.format("%%#%s#%s", icon_hl, icon)
    end

    return output .. "%#LineNr# %f"
end

local function project_dir_segment()
    local prefix = "%#LineNr#   "

    return prefix .. (vim.g.itmecho_project or vim.fn.getcwd())
end

local function lsp_segment()
    local status_prefix = "%#DraculaDiffText#  "
    local ok_message = "%#DraculaGreen#  "

    if #vim.lsp.buf_get_clients() == 0 then
        return ""
    end

    local msgs = {}
    local buf_messages = vim.lsp.util.get_progress_messages()

    for _, msg in ipairs(buf_messages) do
        local client_name = "[" .. msg.name .. "]"
        local contents = ""
        if msg.progress then
            if msg.title == "Error loading workspace" then
                print(msg.message)
            end

            contents = msg.title

            if msg.message then
                contents = contents .. ": " .. msg.message
            end

            if msg.percentage then
                contents = contents .. " (" .. msg.percentage .. ")"
            end
        elseif msg.status then
            contents = msg.content
            if msg.uri then
                local filename = vim.uri_to_fname(msg.uri)
                filename = vim.fn.fnamemodify(filename, ":~:.")
                local space = math.min(60, math.floor(0.6 * vim.fn.winwidth(0)))
                if #filename > space then
                    filename = vim.fn.pathshorten(filename)
                end

                contents = "(" .. filename .. ") " .. contents
            end
        else
            contents = msg.content
        end

        table.insert(msgs, client_name .. " " .. contents)
    end
    local base_status = " " .. table.concat(msgs, " ")

    if base_status ~= " " then
        return status_prefix .. base_status .. " "
    end

    return ok_message
end

local function diagnostic_segment()
    local hint_count = vim.lsp.diagnostic.get_count(0, [[Hint]])
    local info_count = vim.lsp.diagnostic.get_count(0, [[Information]])
    local warn_count = vim.lsp.diagnostic.get_count(0, [[Warning]])
    local error_count = vim.lsp.diagnostic.get_count(0, [[Error]])

    local content = ""

    if (hint_count + info_count + warn_count + error_count) == 0 then
        return content
    end

    if hint_count > 0 or info_count > 0 then
        content = content .. "%#DraculaTodo# " .. hint_count + info_count .. " "
    end

    if warn_count > 0 then
        content = content .. "%#DraculaDiffText# " .. warn_count .. " "
    end

    if error_count > 0 then
        content = content .. "%#DraculaRedInverse# " .. error_count .. " "
    end

    return content
end

local function line_number_segment()
    return "%#WildMenu# %l:%c "
end

function _G.statusline()
    local segments = {
        mode_segment(),
        file_segment(),
        "%=",
        project_dir_segment(),
        lsp_segment(),
        diagnostic_segment(),
        line_number_segment()
    }

    for i = 1, #segments, 1 do
        if segments[i] == "" or segments[i] == nil then
            table.remove(segments, i)
        end
    end

    return table.concat(segments, " ")
end
