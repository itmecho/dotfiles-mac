vim.cmd([[autocmd BufWritePost plugins.lua PackerCompile]])
vim.cmd([[autocmd BufWritePre * call v:lua.require("utils").remove_trailing_whitespace() ]])
vim.cmd([[autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync]])
vim.cmd([[autocmd User LspProgressUpdate redrawstatus!]])
