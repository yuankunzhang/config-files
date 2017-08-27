" Environment {

    set nocompatible
    set shell=/usr/local/bin/fish
    let mapleader = ';'
    let maplocalleader = '_'

" }

" Plugins {

    " Begin of plugins loading.
    call plug#begin(expand('~/.config/nvim/plugged'))

    " General {
        Plug 'luochen1990/rainbow'
        Plug 'nathanaelkane/vim-indent-guides'

        let g:rainbow_active = 1
        let g:indent_guides_start_level = 2
        let g:indent_guides_guide_size = 1
        let g:indent_guides_enable_on_vim_startup = 1
    " }

    " UI {
        Plug 'tomasr/molokai'
        Plug 'sonph/onehalf', {'rtp': 'vim/'}
        Plug 'vim-airline/vim-airline'

        let g:airline_theme = 'onehalfdark'
        let g:airline_skip_empty_sections = 1
        let g:airline#extensions#tabline#enabled = 1
    " }

    " Navigation {
        Plug 'scrooloose/nerdtree'
        Plug 'jistr/vim-nerdtree-tabs'
        Plug 'ctrlpvim/ctrlp.vim'

        map <C-e> <plug>NERDTreeTabsToggle<CR>
        map <leader>e :NERDTreeFind<CR>
        nmap <leader>nt :NERDTreeFind<CR>

        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
        let NERDTreeChDirMode=0
        let NERDTreeQuitOnOpen=1
        let NERDTreeMouseMode=2
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=1

        let g:ctrlp_working_path_mode = 'ra'
        nnoremap <silent> <D-t> :CtrlP<CR>
        nnoremap <silent> <D-r> :CtrlPMRU<CR>
        let g:ctrlp_custom_ignore = {
            \ 'dir':  '\.git$\|\.hg$\|\.svn$',
            \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

        let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
        if exists("g:ctrlp_user_command")
            unlet g:ctrlp_user_command
        endif
        let g:ctrlp_user_command = {
            \ 'types': {
                \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
            \ },
            \ 'fallback': s:ctrlp_fallback
        \ }
    " }

    " Git {
    " }

    " General Programming {
        Plug 'majutsushi/tagbar'
        Plug 'tpope/vim-commentary'

        nnoremap <silent> <leader>tt :TagbarToggle<CR>
    " }

    " Programming Languages {

        " Golang {
            Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}

            let g:go_fmt_command = "goimports"
            let g:go_fmt_fail_silently = 1
            let g:syntastic_go_checkers = ['golint', 'govet']
            let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

            let g:go_highlight_types = 1
            let g:go_highlight_fields = 1
            let g:go_highlight_functions = 1
            let g:go_highlight_methods = 1
            let g:go_highlight_operators = 1
            let g:go_highlight_build_constraints = 1
            let g:go_highlight_structs = 1
            let g:go_highlight_generate_tags = 1
            let g:go_highlight_space_tab_error = 0
            let g:go_highlight_array_whitespace_error = 0
            let g:go_highlight_trailing_whitespace_error = 0
            let g:go_highlight_extra_types = 1
        " }

        " Javascript {
            Plug 'jelera/vim-javascript-syntax'
            Plug 'mxw/vim-jsx'

            let g:javascript_enable_domhtmlcss = 1
        " }

        " Python {
            Plug 'klen/python-mode'
        " }

    " }

    " End of plugins loading.
    call plug#end()

" }

" General {

    filetype plugin indent on                       " Detect file types.
    syntax on                                       " Syntax highlighting.
    set mouse=a                                     " Enable mouse usage.
    set mousehide                                   " Hide the mouse cursor while typing.
    scriptencoding utf-8

    set clipboard=unnamed,unnamedplus

    set shortmess+=filmnrxoOtT                      " Abbrev. of messages (avoid 'hit enter').
    set viewoptions=folds,options,cursor,unix,slash " Better Unix compatibility.
    set history=1000                                " Store a ton of history (default is 20).
    set hidden                                      " Allow buffer switching without saving.
    set iskeyword-=.                                " '.' is an end of word designator
    set iskeyword-=#                                " '#' is an end of word designator
    set iskeyword-=-                                " '-' is an end of word designator

    " Instead of reverting the cursor to the last position in the buffer, we
    " set it to the first line when editing a git commit message.
    au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

    " Backup {
        set nobackup
        set noswapfile
    " }

    " Undo {
        set undofile                                    " So is persistent undo ...
        set undolevels=1000                             " Maximum number of changes that can be undone
        set undoreload=10000                            " Maximum number lines to save for undo on a buffer reload
    " }

" }

" UI {

    color molokai

    hi Visual ctermbg=59

    set tabpagemax=15                               " Show at most 15 tabs.
    set showmode                                    " Display the current mode.

    set cursorline                                  " Highlight current line.

    highlight clear SignColumn                      " SignColumn should match background.
    highlight clear LineNr                          " Current line number row has same background color in relative mode.

    set ruler                                       " Show the ruler.
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
    set showcmd                                     " Show partial commands in status line.

    set backspace=indent,eol,start                  " Backspace for dummies.
    set linespace=0                                 " No extra spaces between rows.
    set number                                      " Line numbers on.
    set showmatch                                   " Show matching brackets/parenthesis.
    set incsearch                                   " Find as you type search.
    set hlsearch                                    " Highlight search terms.
    set winminheight=0                              " Windows can be 0 line high.
    set ignorecase                                  " Case insensitive search.
    set smartcase                                   " Case sensitive when uc present.
    set wildmenu                                    " Show list instead of just completing.
    set wildmode=list:longest,full                  " Command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]                   " Backspace and cursor keys wrap too.
    set scrolljump=5                                " Lines to scroll when cursor leaves screen.
    set scrolloff=3                                 " Minimum lines to keep above and below cursor.
    set foldenable                                  " Auto fold code
    set list
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:.  " Highlight problematic whitespace

    " Status Line {
        set laststatus=2

        " Broken down into easily includeable segments
        set statusline=%<%f\                            " Filename.
        set statusline+=%w%h%m%r                        " Options.
        "set statusline+=%{fugitive#statusline()}        " Git Hotness.
        set statusline+=\ [%{&ff}/%Y]                   " Filetype.
        set statusline+=\ [%{getcwd()}]                 " Current dir.
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%         " Right aligned file nav info.
    " }

" }

" Formatting {

    set nowrap                                      " Do not wrap long lines.
    set smartindent                                 " Indent at the same level of the previous line.
    set shiftwidth=4                                " Use indents of 4 spaces.
    set tabstop=4                                   " An indentation every four columns.
    set softtabstop=4                               " Let backspace delete indent.
    set expandtab                                   " Tabs are spaces, not tabs.
    set nojoinspaces                                " Prevents inserting two spaces after punctuation on a join (J).
    set splitright                                  " Puts new vsplit windows to the right of the current.
    set splitbelow                                  " Puts new split windows to the bottom of the current.

    autocmd FileType c,cpp,javascript setlocal tabstop=4 shiftwidth=4 expandtab softtabstop=4
    autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab tabstop=8 colorcolumn=80
    autocmd FileType json,proto,html,css setlocal tabstop=2 shiftwidth=2 expandtab softtabstop=2
    autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

" }


" Key Mapping {

    " Toggle search highlighting.
    nmap <silent> <leader><space> :set invhlsearch<CR>

    " Buffer nav.
    nmap <C-n> :bnext<CR>
    nmap <C-m> :bprevious<CR>

    "" Switching windows
    noremap <C-j> <C-w>j
    noremap <C-k> <C-w>k
    noremap <C-l> <C-w>l
    noremap <C-h> <C-w>h

" }

" Autocmd Rules {

    "" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
    augroup vimrc-sync-fromstart
        autocmd!
        autocmd BufEnter * :syntax sync maxlines=200
    augroup END

    "" Remember cursor position
    augroup vimrc-remember-cursor-position
        autocmd!
        autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
    augroup END

    "" make/cmake
    augroup vimrc-make-cmake
        autocmd!
        autocmd FileType make setlocal noexpandtab
        autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
    augroup END

    set autoread

" }

" Functions {
" }
