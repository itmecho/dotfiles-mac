local vterm = require("vterm")
local test_args = nil

local function run_tests(reset)
    if reset then
        test_args = nil
    end

    if test_args == nil then
        test_args = vim.fn.input("Test Command: go test ", "", "file")
        vterm.run("clear && go test " .. test_args)
    else
        vterm.rerun()
    end
end

return {
    run_tests = run_tests
}
