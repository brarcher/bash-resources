"The single most important line to me
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
map  \
map <BS> X

"Begin pathogen {{{
execute pathogen#infect()
call pathogen#helptags()

tnoremap <Esc> <C-\><C-n>
let g:esearch#out#win#open = 'split'
hi link ESearchMatch SearchNC

let g:gtags_auto_gen=1

let g:ctrlp_line_prefix = ''
let g:ctrlp_map = '<c-space>'
let g:ctrlp_mruf_max=30
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:30,results:20'
let g:ctrlp_switch_buffer = 'etvh'
nmap <c-p> :CtrlPMRU<cr>
nmap <c-b> :CtrlPBuffer<cr>
nmap <m-]> :CtrlPFunky<cr>

let gutentags_add_default_project_roots = 1

cmap <F12> <Plug>(Cmd2Suggest)
nmap / /<F12>
nmap <F8> :TagbarToggle<CR>
let g:tagbar_width = 30

nmap <c-n> :NERDTreeToggle<cr>
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeLimitedSyntax = 1
let g:NERDTreeHighlightFolders = 0 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

let g:NERDTreeDirArrowExpandable = ' '
let g:NERDTreeDirArrowCollapsible = ' '

let g:ycm_error_symbol = ''
let g:ycm_warning_symbol = ''
"End pathogen }}}

"being vim source {{{│
let statStart='%(\ \ \ %)'
"let statLine='%(\ %l\ %c\ \ %)'
let statSep='\ \ '
"set statusline=%#linenr#%(\ %n\ \ \ %P\ \ \ \%)%{&columns}:::%y%f%h%r%w%q%=%l,%c
"set statusline=...%(\ [%M%R%H]%)...
set cursorline
set selectmode=mouse
set showmode noshowmode
set foldmethod=manual
set fillchars=vert:\|,stlnc:.,stl:\ ,fold:*,diff:
set updatetime=500
set lazyredraw
set cmdwinheight=10
set cmdheight=1
set scrolljump=0
set shiftwidth=4               " Use indents of 4 spaces
set tabstop=4                  " An indentation every four columns
set softtabstop=4              " Let backspace delete indent
set expandtab                  " Expands tab to spaces
set wildmode=list:longest:full "Nobody likes to use the vim default autocomplete in command line mode
set splitbelow "when split, split below the window instead of above
set splitright
set showcmd                    "Show cmd while typing
let &showbreak = '↳ '          "Change show break thing
set listchars=tab:→\ ,trail:·,extends:↷,precedes:↶ "Changes listchars to more suitable chars
set laststatus=2
set ignorecase
set smartcase
set smartindent
set winwidth=1
set equalalways noequalalways
set smarttab
set list
if &modifiable | set number | endif "If it's modifable, turn on numbers
set wrap nowrap
inoremap  
set showmatch      " Show matching brackets/parentthesis
set matchtime=1    " Show matching time
set report=0       " Always report changed lines
"end vim }}}

"Map Stuff and functions {{{
map <silent> <c-q> :bd<cr>
nnoremap <F6> :%s/<C-r><C-w>/

"Map home and end to ^$ respect'
nnoremap <End> $
nnoremap <Home> ^
vnoremap <End> $
vnoremap <Home> ^

"map fold movements
nnoremap <C-left> [z
nnoremap <C-right> ]z
nnoremap <C-up> zk
nnoremap <C-down> zj
inoremap <C-down> zj
inoremap <C-left> [z
inoremap <C-up> zk
inoremap <C-down> zj
vnoremap <C-left> [z
vnoremap <C-right> ]z
vnoremap <C-up> zk
vnoremap <C-down> zj
map <F7>  :sp tags<CR>:%s/^\([^ :]*:\)\=\([^    ]*\).*/syntax keyword Tag \2/<CR>:wq! tags.vim<CR>/^<CR><F12>

" Use ctrl-[wasd] to select the active split and s-lrud
nnoremap <silent> <s-up> :wincmd k<CR>
nnoremap <silent> <s-down> :wincmd j<CR>
nnoremap <silent> <s-left> :wincmd h<CR>
nnoremap <silent> <s-right> :wincmd l<CR>

"allow if folding we hit space and it unfolds/folds, otherwise default
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>

"Copy full path of filename to black hole
nnoremap <M-Y> :let @" = expand("%:p")<cr>

"Smooth scroll
map <PageUp> <C-Y><C-Y><C-Y><C-Y>
map <Pagedown> <C-E><C-E><C-E><C-E>
imap <PageUp> <C-Y><C-Y><C-Y><C-Y>
imap <Pagedown> <C-E><C-E><C-E><C-E>
" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
function! AutoHighlightToggle()
    let @/ = ''
    if exists('#auto_highlight')
        au! auto_highlight
        augroup! auto_highlight
            echo 'Highlight current word: off'
            return
    else
        augroup auto_highlight
            au!
            au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
        augroup end
            echo 'Highlight current word: ON'
            return 1
    endif
endfunction
nnoremap <F1> :if AutoHighlightToggle() <Bar> endif<CR>

"I like playing with colors
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
"end map stuff }}}

"color {{{
set t_Co=256
colorscheme shadow
nnoremap <F9> :cal ColorMeHappy()<cr>
"switch between light and dark theme with <F9> {{{
fun! ColorMeHappy()
    syntax reset
    let g:theme=xor(1,g:theme)
    let start=255
    let end=233
    let acc=-1
    if g:theme
        let start=233
        let end=255
        let acc=1
    endif
    while start != end
        exec printf("hi Normal ctermbg=%d",start)
        sleep 10m
        let start = start + acc
    endwhile
    cal g:HandleBackgroundColors()
    cal g:HandleOtherColors()
endfun
"}}}
"end color }}}

"Aucmd time! {{{
"Support for tagbar and ctrlsf
let g:doGoldRatioActive=0
let g:GoldRatio=1.6
let g:doAutoNumInActive=1
let g:doAutoDimInactive=0

autocmd CursorHold * if &number | set relativenumber | endif
autocmd CursorMoved * if &relativenumber | set relativenumber norelativenumber | endif
autocmd WinEnter * cal EnterWin()
autocmd WinLeave * cal LeaveWin()

function! LeaveWin()
    let curWinIndex = winnr()
    let windowCount = winnr('$')

    if(&modifiable && g:doAutoNumInActive)
        setlocal number nonumber
        setlocal relativenumber norelativenumber
    endif
    if(&modifiable && g:doAutoDimInactive && !getbufvar(bufnr(1),'&diff'))
        call setwinvar(winnr(),'&colorcolumn',join(range(1,&columns),','))
    endif
endfunction

function! EnterWin()
    let curWinIndex = winnr()
    let windowCount = winnr('$')

    if(g:doGoldRatioActive && (&modifiable || (&lines-winheight(curWinIndex) != 3)))
        let ratio = &columns/g:GoldRatio
        let minRatio = float2nr(ratio/windowCount)
        for i in range(1,winnr('$'))
            if( i != curWinIndex )
                cal setwinvar(i,"&winminwidth",minRatio)
                cal setwinvar(i,"&winwidth",minRatio)
            endif
        endfor

        exec printf("vertical resize %d", float2nr(ratio))
    endif

    if(&modifiable && g:doAutoNumInActive)
        setlocal number number
    endif
    if(&modifiable && g:doAutoDimInactive && !getbufvar(bufnr(1),'&diff'))
        call setwinvar(winnr(),'&colorcolumn',0)
    endif
endfunction

"I want to save my session on leave automatically
autocmd VimLeave * nested if (!isdirectory($HOME . "/.config/nvim")) |
    \ call mkdir($HOME . "/.config/nvim") |
    \ endif |
    \ execute "mksession! " . $HOME . "/.config/nvim/lastSession.vim"
autocmd VimEnter * nested if argc() == 0 && filereadable($HOME . "/.config/nvim/lastSession.vim") |
    \ execute "source " . $HOME . "/.config/nvim/lastSession.vim"

"status line management
exec printf('set statusline=%s%s',"%{ManageMode()}",statSep)
let g:mod=0
fun! ManageMode()
    let myMode = mode()
    if(myMode ==# 'no')
        echo "no"
        return "Normal()"
    endif
    if(myMode ==# 'n')
        cal g:HandleDynamicColors(g:normalColor)
        redraw!
        return "Normal  "
    endif
    if(myMode ==# 'i')
        cal g:HandleDynamicColors(g:insertColor)
        redraw!
        return "Insert  "
    endif
    if(myMode ==# 'v')
        cal g:HandleDynamicColors(g:visualColor)
        redraw!
        return "Visual  "
    endif
    if(myMode ==# 'V')
        cal g:HandleDynamicColors(g:visualBColor)
        redraw!
        return "Visual-L"
    endif
    if(myMode ==# '')
        cal g:HandleDynamicColors(g:visualBColor)
        redraw!
        return "Visual-B"
    endif
    if(myMode ==# 's')
        return "Select  "
    endif
    if(myMode ==# 'S')
        return "Select-L"
    endif
    if(myMode ==# 'R')
        return "Replace "
    endif
    if(myMode ==# 'Rv')
        return "VReplace"
    endif
    if(myMode ==# 't')
        return "Terminal"
    endif
    if(myMode ==# 'c')
        return "Cmd-Line"
    endif
    if(myMode ==# 'cv')
        return "Vim-Ex  "
    endif
    if(myMode ==# 'ce')
        return "NormalEx"
    endif
    if(myMode ==# 'r')
        return "HitEnter"
    endif
    if(myMode ==# 'rn')
        return "MoreInfo"
    endif
    if(myMode ==# 'rn')
        return "..Well??"
    endif
    if(myMode ==# '!')
        return "Shell!!!"
    endif

    return printf("%s","Mode unsupported...")
endfun

"end aucmd!! }}}
