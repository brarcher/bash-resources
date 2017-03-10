"plugin
    execute pathogen#infect()
    "Rainbow Para
    au VimEnter * RainbowParenthesesToggle
    au Syntax * RainbowParenthesesLoadRound
    let g:gitgutter_sign_modified = '>'
    let g:gitgutter_override_sign_column_highlight = 0

    let g:EclimCompletionMethod = 'omnifunc' 

    let g:NERDTreeFileExtensionHighlightFullName = 1
    let g:NERDTreeExactMatchHighlightFullName = 1
    let g:NERDTreePatternMatchHighlightFullName = 1
    let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
    let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
    let g:NERDTreeExtensionHighlightColor = {} "this line is needed to avoid error
    let g:NERDTreeExtensionHighlightColor['cs'] = '33BB33' "assigning it to an empty string will skip highlight
    let g:ctrlsf_winsize = '15%'
    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['cs'] = '#'

    nmap     <C-F>f <Plug>CtrlSFPrompt
    vmap     <C-F>f <Plug>CtrlSFVwordPath
    vmap     <C-F><C-F> <Plug>CtrlSFVwordExec
    nmap     <C-F>n <Plug>CtrlSFCwordPath
    nmap     <C-F>p <Plug>CtrlSFPwordPath
    imap     <C-F>o <Esc>:CtrlSFToggle<CR>
    map      <C-F>o <Esc>:CtrlSFToggle<CR>

    "Airline stuff"
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'
    let g:airline_powerline_fonts = 1
    let g:golden_ratio_exclude_nonmodifiable = 1

    let g:neomake_cs_enabled_makers = ['mcs']
    let g:neomake_enabled_makers = ['mcs']
    "nmap : :<F12>
    nmap / /<F12>
    cmap <F12> <Plug>(Cmd2Suggest)
    nmap <F8> :TagbarToggle<CR>

    function! s:CustomizeYcmLocationWindow()
        " Move the window to the top of the screen.
        execute "wincmd K"
        " Set the window height to 5.
        execute "5wincmd _"
    endfunction
    autocmd User YcmLocationOpened call s:CustomizeYcmLocationWindow()
    let g:ycm_server_python_interpreter = '/usr/bin/python'
    "Easytags
    let g:easytags_dynamic_files = 1
    let b:easytags_auto_highlight = 0
    " Color name (:help cterm-colors) or ANSI code
    let g:limelight_conceal_ctermfg = 'gray'
    let g:airline#extensions#clock#format = '%H:%M:%S'
    let g:airline#extensions#clock#updatetime = 1000
    nmap <silent> <C-n> :NERDTreeToggle<CR>
    nmap <silent> <C-p> :CtrlSpace O<cr>
    nmap <silent> <C-b> :CtrlSpace b<cr>
    nmap <silent> <C-space> :CtrlSpace<cr>
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    let g:bookmark_sign = "★"
    nmap <silent> <C-g> :GitGutterNextHunk<CR>
    nnoremap gn :GitGutterNextHunk<cr>
    nnoremap gb :GitGutterPrevHunk<cr>
    let g:android_sdk_path = '~/Android/Sdk'
    let g:gradle_path = '~/bin/android-studio/gradle/gradle-2.14.1/bin'
"end plugin

"vim stuff
    set foldlevel=0 "Set fold level to the bare min
    "set foldnestmax=1 "I only want it to fold once unless I tell it to fold more
    set foldmethod=indent "Set foldmethod to syntax to autofold and indent
    set shiftwidth=4               " Use indents of 4 spaces
    set tabstop=4                  " An indentation every four columns
    set softtabstop=4              " Let backspace delete indent
    set expandtab                  " Expands tab to spaces
    set wildmode=list:longest:full "Nobody likes to use the vim default autocomplete in command line mode
    set splitbelow "when split, split below the window instead of above
    set splitright
    set showcmd                    "Show cmd while typing
    let &showbreak = '↳ '          "Change show break thing
    set cpo=n                      "Show break in line numbers with wrap on
    set listchars=tab:→\ ,trail:·,extends:↷,precedes:↶ "Changes listchars to more suitable chars
    set showmode nosmd
    set ignorecase
    set smartcase
    set smartindent
    set smarttab
    set scrolloff=10    " Minumum lines to keep above and below cursor
    set list
    set relativenumber
    set number
    set wrap nowrap
    set hidden         " Allow buffer switching without saving
    inoremap  
    set cursorline
    set showmatch      " Show matching brackets/parentthesis
    set matchtime=5    " Show matching time
    set report=0       " Always report changed lines
    set linespace=0    " No extra spaces between rows
    set t_ut=          "On those rare occasions I use tmux
    "set colorcolumn+=1        " highlight column after 'textwidth'

    " change cursor to i-beam in insert mode
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
"end vim stuff

"Map Stuff and functions
    "Map control + x to cut current text into clipboard
    vmap <c-x> "+x
    "map control + v in insert mode to paste
    imap <C-v> <C-r>+
    vmap <C-v> "+P
    "map ctrl + D to clipboard
    nmap <F2> :tabedit <cr>:terminal<cr>
    "map Y to copy to clip in visual mode
    vmap Y "+y
    "Map c-left and right to switch between buffers
    nnoremap <C-left> :bp<cr>
    nnoremap <C-right> :bn<cr>
    nnoremap <C-up> :tabprevious<CR>
    nnoremap <C-down> :tabnext<CR>
    "Map <C-E> to close current buffer
    map <C-E> :bd<cr>
    " Use ctrl-[wasd] to select the active split and s-lrud
    nnoremap <silent> <c-k> :wincmd k<CR>
    nnoremap <silent> <c-j> :wincmd j<CR>
    nnoremap <silent> <c-h> :wincmd h<CR>
    nnoremap <silent> <c-l> :wincmd l<CR>
    nnoremap <silent> <s-up> :wincmd k<CR>
    nnoremap <silent> <s-down> :wincmd j<CR>
    nnoremap <silent> <s-left> :wincmd h<CR>
    nnoremap <silent> <s-right> :wincmd l<CR>
    "allow if folding we hit space and it unfolds/folds, otherwise default
    nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
    nnoremap <silent> <CR> @=(foldlevel('.')?'zO':"\<CR>")<CR>
    "Tack on a comment to the end of the line in one keystoke based on syn
    nmap <silent>"" A <C-R>=&commentstring<cr><esc>F%2cw
    nnoremap <left> h
    nnoremap <right> l
    nnoremap <up> k
    nnoremap <down> j

    "Copy full path of filename to black hole
    nnoremap <C-Y> :let @" = expand("%:p")<cr>
    " Highlight all instances of word under cursor, when idle.
    " Useful when studying strange source code.
    " Type z/ to toggle highlighting on/off.
    nnoremap <F1> :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
    function! AutoHighlightToggle()
        let @/ = ''
        if exists('#auto_highlight')
            au! auto_highlight
            augroup! auto_highlight
                setl updatetime=4000
                echo 'Highlight current word: off'
                return 0
            else
                augroup auto_highlight
                    au!
                    au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
                augroup end
                    setl updatetime=500
                    echo 'Highlight current word: ON'
                    return 1
                endif
            endfunction

    map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
                    \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
                    \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
"end map stuff

"color
    set t_Co=256
    colorscheme snow
"end color
