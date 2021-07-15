augroup WikiGlobalBindings
augroup END`

augroup WikiBufferBindings
    autocmd!
    autocmd FileType vimwiki nmap     <silent> <buffer> <leader>wi    <Plug>VimwikiToggleListItem
    autocmd FileType vimwiki nnoremap <silent> <buffer> <leader>ws   :VimwikiSearch<CR>
    autocmd FileType vimwiki nnoremap <silent> <buffer> <leader>wa   :VimwikiSearchTags<CR>
    autocmd FileType vimwiki nmap     <silent> <buffer> <leader>wd   <Plug>VimwikiDeleteFile
    autocmd FileType vimwiki nmap     <silent> <buffer> <leader>wr   <Plug>VimwikiRenameFile
    autocmd FileType vimwiki nmap     <silent> <buffer> <CR>         <Plug>VimwikiFollowLink
    autocmd FileType vimwiki vmap     <silent> <buffer> <CR>         <Plug>VimwikiFollowLink
    autocmd FileType vimwiki nmap     <silent> <buffer> <S-CR>       <Plug>VimwikiVSplitLink
    autocmd FileType vimwiki vmap     <silent> <buffer> <S-CR>       <Plug>VimwikiVSplitLink
    autocmd FileType vimwiki nmap     <silent> <buffer> <C-CR>       <Plug>VimwikiSplitLink
    autocmd FileType vimwiki vmap     <silent> <buffer> <C-CR>       <Plug>VimwikiSplitLink
    autocmd FileType vimwiki nmap     <silent> <buffer> <C-S-CR>     <Plug>VimwikiTabnewLink
    autocmd FileType vimwiki vmap     <silent> <buffer> <C-S-CR>     <Plug>VimwikiTabnewLink
    autocmd FileType vimwiki nmap     <silent> <buffer> <BS>         <plug>VimwikiGoBackLink
    autocmd FileType vimwiki vmap     <silent> <buffer> <BS>         <plug>VimwikiGoBackLink
augroup END`
    
augroup WikiBufferOptions
    autocmd!
    autocmd FileType vimwiki :setlocal nowrap
    autocmd FileType vimwiki autocmd BufWritePre <buffer> :CronofilerSync
augroup END`

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plasticboy Markdown

let g:vim_markdown_folding_level = 3
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_no_extensions_in_markdown = 1
let g:vim_markdown_autowrite = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/preservim/vim-lexical#spell-check

let g:lexical#spell = 1
let g:lexical#spelllang = ['en_us', 'en_ca', 'en_gb']
let g:lexical#thesaurus = ['~/.config/nvim/language/MobyThesaurus.txt']
let g:lexical#dictionary = ['/usr/share/dict/words']
augroup lexical
    autocmd!
    autocmd FileType markdown,mkd call lexical#init()
    autocmd FileType textile call lexical#init()
    autocmd FileType vimwiki call lexical#init()
    autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://vimwiki.github.io/
" TODO: sync wiki with super secret script (cronofiler)
"       - autocmd on vimwiki and markdown save
"       - run on demand
"       - run when vim first opens
"       - when closing nvim

let g:vimwiki_key_mappings = { 'all_maps': 0, }
let g:vimwiki_folding = 'expr'
let g:vimwiki_hl_headers = 1
let g:vimwiki_use_calendar = 1
let g:vimwiki_dir_link = 'index'
let g:vimwiki_list = [
    \ { 'syntax': 'markdown',
    \   'name': 'journals',
    \   'description': 'personal todos, notes, scraps, etc.',
    \   'index': 'index',
    \   'maxhi': 1,
    \   'auto_diary_index': 1,
    \   'auto_tags': 1,
    \   'auto_generate_links': 1,
    \   'auto_generate_tags': 1,
    \   'ext': '.md',
    \   'path': $HOME . '/cronofiles/journal' },
    \ { 'syntax': 'markdown',
    \   'name': 'unfiled',
    \   'description': 'lots of scraps that I will probably never read but may want to find again, maybe even some things that used to be filed...',
    \   'index': 'index',
    \   'maxhi': 0,
    \   'auto_diary_index': 0,
    \   'auto_tags': 0,
    \   'auto_generate_links': 0,
    \   'auto_generate_tags': 0,
    \   'ext': '.md',
    \   'path': $HOME . '/cronofiles/unfiled' },
    \ { 'syntax': 'markdown',
    \   'name': 'diff.mx',
    \   'description': 'a blog where I post anything I learn about tech that took a lot of googleing, so maybe it will be easier for you',
    \   'index': 'about',
    \   'maxhi': 0,
    \   'auto_diary_index': 0,
    \   'auto_tags': 0,
    \   'auto_generate_links': 0,
    \   'auto_generate_tags': 0,
    \   'ext': '.mdx',
    \   'path': $HOME . '/cronofiles/diff.mx' },
    \ { 'syntax': 'markdown',
    \   'name': 'cronofiler',
    \   'description': 'the software I use to keep my scraps from overwelming me, maybe one day it will be useful enough to share',
    \   'index': 'readme',
    \   'maxhi': 0,
    \   'auto_diary_index': 0,
    \   'auto_tags': 0,
    \   'auto_generate_links': 0,
    \   'auto_generate_tags': 0,
    \   'ext': '.mdx',
    \   'path': $HOME . '/Desktop/cronofiler' },
    \ ]

