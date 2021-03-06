" TODO
" Research formatprg
" Research include and define
" Research g ops
" Of [ ops like [I
" Of ] ops
" map ]f and [f because gf is the same and I never use it anyways...
" map arrow keys ??
" function for cpp  ->  ::\~\?\zs\h\w*\ze([^)]*\()\s*\(const\)\?\)\?$

" Plug, colo {{{
if(has("unix"))
    so ~/.config/nvim/plug.vim
else
    so ~\AppData\Local\nvim\plug.vim
endif
set guicursor=n-c-v:block,i-ci:ver30,r-cr:hor20,o:hor100
colo restraint

if hostname() == 'demi'
    set bg=light
else
    set bg=dark
endif
"}}}

"Begin Vim set {{{
    " Set: Those that use macros
    set backup | set writebackup " back it up, the file, I mean.
    set cursorline               " set cursorline to highlight NOTHING
    set confirm                  " Don't tell me no
    set expandtab                " Expands tab to spaces
    set fic                      " Fuck file case
    set lazyredraw               " Don't draw durning macros
    set linebreak                " don't cut words on wrap if i DO wrap
    set list                     " list my chars: ╳│¦|┆×•·
    set nowrap                   " I really hate wrap
    set nowrapscan               " I don't like my searches to continue forever
    set shiftround               " indent it by multiples of shiftwidth please:)
    set showcmd                  " Show cmd while typing in bottom right corner
    set showmode noshowmode      " I just put it in statusbar, don't clear echos
    set ignorecase smartcase     " ignore case if just using lower
    set smartcase                " makes things a bit better
    set smartindent              " indent things well
    set smarttab                 " tab plays nicer
    set sol nosol                " Don't be stupid and move to start of line
    set splitbelow               " ...split below... what did you think?
    set splitright               " Oh this one will be different!...cept not.
    set tildeop                  " Tilde as oper
    set title title              " rxvt and tmux make this usable
    set titlestring=NVIM         " Simple title, my statusbar tells the rest
    set undofile                 " keep undo history ina file

    " Set: Those that use =
    let &showbreak = '↳ '        " Change show break thing (rare occasion)
    set backupdir-=.             " Don't put backup in current dir please
    set cinkeys-=0#              " don't force # indentation, ever write python?
    set cmdheight=1              " Pair up
    set complete=.,w,b,u,U       " Complete all buffers,window, current, and tag
    set colorcolumn=80,130       " color columns
    set concealcursor=inc        " Complete all buffers,window, current, and tag
    set conceallevel=1           " Complete all buffers,window, current, and tag
    set diffopt+=context:3       " diff context lines
    set foldcolumn=0             " foldcolumn... yes
    set foldmethod=marker        " fold stuff :)
    set foldopen+=jump,search    " open folds when I search/jump to things
    set icm="nosplit"            " inc command split in preview, hasn't worked
    set matchtime=1              " Show matching time
    set matchpairs+=<:>          " More matches
    set mouse=                   " I prefer having terminal functionality.
    set shiftwidth=4             " Use indents of 4 spaces
    set showmatch                " Show matching brackets/parentthesis
    set sidescrolloff=5          " 5 columns off?, scroll
    set scrolloff=0              " I want to touch the top...
    set softtabstop=4            " Let backspace delete indent
    set tabstop=4                " An indentation every four columns
    set textwidth=80             " text width
    set timeoutlen=999           " Best type maps fast
    set ttimeoutlen=25           " I don't care much for waiting
    set undolevels=99999         " A lot of undo history :P
    set updatecount=33           " update swp every 33 chars.
    set updatetime=1000          " Do updates every second
    set viewoptions=folds,cursor " What to save with mkview
    set wildoptions=tagfile      " Wop tags
    set wildmode=longest,full    " Let's make it nice tab completion

    " Set: Those that are complex, or just look stupid
    " These are annoying to have on
    set belloff=error,ex,insertmode,showmatch
    " set fill chars to things that make me happy
    set fillchars=vert:\|,stlnc:_,stl:\ ,fold:—,diff:┉
    " Changes listchars to more suitable chars
    set listchars=tab:→\ ,trail:·,extends:<,precedes:>,conceal:¦
    " If it's modifable, turn on numbers
    if &modifiable | set number | set relativenumber | endif
    set synmaxcol=300
    " Ignore this crap :) Need more..?
    set wildignore=*.jar,*.class,*/Sdk*,*.ttf,*.png,*.tzo,*.tar,*.pdf,
                  \*.gif,*.gz,*.jpg,*.jpeg,**/bin/*,*.iml,*.store,*/build* | "rand
    set wildignore+=*.bak,*.swp,*.swo | "vim
    set wildignore+=*.a,*.o,*.so,*.pyc,*.class | "cpp/python/java
    set wildignore+=*/.git*,*.tar,*.zip | "srctl, compress

    " I finally set it up >.> happy?
    set formatoptions=
    set formatoptions+=l " Don't auto break lines unless I say
    set formatoptions+=r " Continue comments in insert mode
    set formatoptions+=q " continue comments with gq
    set formatoptions+=n " Recognize numbered lists
    set formatoptions+=2 " Use indent from 2nd line of a paragraph
    set formatoptions+=j " Destroy comment leader join when valid
    set formatoptions-=c " Auto-wrap comments using textwidth
    set formatoptions-=o " do not continue comment using o or O
    set formatoptions-=t " auto wrap based on textwidth
    set formatoptions-=a " auto-paragraphing, fuck that.
    set formatoptions-=v " vi auto wrapping, no.
    set formatoptions-=b " I just don't like auto
    set formatoptions-=1 " I don't fuckin care how long it is
"End Vim set }}}

"Begin Vim map {{{
    " Refresh my script bitch!
    nnoremap <F5> :w \| so %<cr>

    " I use this too much for it to not be a mapping
    nnoremap <leader>ee :e **/*
    nnoremap <leader>ea :e <c-r>%<c-w>
    nnoremap <leader>aa :argadd **/*
    nnoremap <leader>vv :vsp **/*
    nnoremap <leader>ss :sp **/*
    nnoremap <leader>cc :cfile  \| copen \| cc<left><left><left><left><left><left><left><left><left><left><left><left><left>

    " Does anyone actually use single quote?
    map ' `

    " I don't use tabs so make them useful things I have trouble hitting
    nmap gt <bar>
    " TODO nmap gT <bar>

    " Hls ease
    nnoremap <silent><space> hl:silent set hlsearch!<cr>
    nnoremap n :set hlsearch<cr>nzv
    nnoremap N :set hlsearch<cr>Nzv
    nnoremap / :set hlsearch<cr>/
    nnoremap * :set hlsearch<cr>*zv

    " pasting in cmode
    cmap <c-v> <c-r>"

    " You know, fuck those arrow keys
    cnoremap <expr> <C-j> wildmenumode() ? "\<Down>\<Tab>" : "\<down>"
    cnoremap <expr> <C-k> wildmenumode() ? "\<Up>\<Tab>" : "\<up>"

    " TODO: next/prev arglist
    " nnoremap <m-l> :next<cr>
    " nnoremap <m-L> :prev<cr>

    " c-list ( Quickfix )
    nnoremap <m-c> :cn<cr>
    nnoremap <m-C> :cp<cr>

    " resize window m-cap H less, J less, K more, L more
    nnoremap <m-H> <c-w><
    nnoremap <m-L> <c-w>>
    nnoremap <m-J> <c-w>-
    nnoremap <m-K> <c-w>+

    " I don't know why this isn't default
    nnoremap Y y$

    " Opp of j
    nnoremap g<cr> i<cr><esc>

    " Bubble
    nnoremap <silent> gj o<Esc>k
    nnoremap <silent> gk O<Esc>j

    "[Pre/App]end to the word under the cursor
    map <m-a> ea
    map <m-i> bi

    " undo break for each <cr>
    inoremap <CR> <C-]><C-G>u<CR>

    " move in insert mode, fuck cursor keys
    inoremap <c-h> <left>
    inoremap <c-l> <right>
    inoremap <c-j> <down>
    inoremap <c-k> <up>

    " I uh... don't use ESC
    inoremap  
    vnoremap  

    " Search and replace word under cursor
    " Why f6 and f7? I'm not sure...
    nnoremap <F6> :%s/<C-r><C-w>/
    nnoremap <F7> :%s/\<<C-r><C-w>\>/

    " I like playing with colors (Gives me hi-lo ids)
    map <leader>1 :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
                \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
                \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" End Vim Map }}}

" Begin Vim abbrev {{{
" I have a bad habit here...
ca W w
ca Echo echo
ca Q q
ca Set set
ca Let let

" End Vim Map }}}

" Status Line , mode [arg]|file [+][-][RO] > TODO < l,c : maxG,% [ pos ] {{{
function! StatusLine()
    " Left Filename/CurArg
    setl statusline=%#ModeMsg#\ %{Mode(mode())}\ %*
    setl statusline+=%3*\ %{CurArg()}\ %*

    if &modifiable
        setl statusline+=%1*%m%*
    else
        setl statusline+=%2*%m%*
    endif

    setl statusline+=%2*%r
    setl statusline+=%#holdScope#\ %{ScopeStart()}%=
    setl statusline+=%<%-1.(%{ScopeEnd()}%=\ %4*%)

    " Right: linenr,column    PositionBar()
    setl statusline+=%-10.(%#CursorLineNr#\ %l,%c,\ :\ %LG,%p%%\ %)
    setl statusline+=%-22.(%#LineNr#\ [\ %{PositionBarLeft()}
                          \%#CursorLineNr#%{PositionBar()}
                          \%#LineNr#%{PositionBarRight()}%)\ ]\ %*
endfunction

function! ScopeStart()
    if has_key(g:, 'scope_startline')
        return strpart(substitute(g:scope_startline, '^\s\+\|\s\+$', "", "g"),
                    \ 0, winwidth('.')/2)
    else
        return ''
    endif
endfunc

function! ScopeEnd()
    if has_key(g:, 'scope_endline')
        return strpart(substitute(g:scope_endline, '^\s\+\|\s\+$', '', "g"), 
                    \ 0, winwidth('.')/4)
    else
        return ''
    endif
endfunc

" Status Line Not current, file [+][-][RO]_______>____<____l,c : maxG,%
function! StatusLineNC()
    setl statusline =%<%#Statuslinenc#%f
    if &modifiable
        setl statusline+=%1*%m
    else
        setl statusline+=%2*%m
    endif
    setl statusline+=%2*%r
    setl statusline+=%#StatusLineNC#
    setl statusline+=%*%=
    setl statusline+=%(%l,%c%)
    setl statusline+=\ \ \ \ %*
    setl statusline+=:\ %LG,%p%%
endfunc

func! CurArg()
    let l:rtn = ''
    if argc() == 0 || argv(argidx()) !=# @%
        return @%
    endif
    let l:curarg = argv(argidx())
    let l:rtn .= '[' . l:curarg . ']'
    return l:rtn
endfun

func! Mode(mode)
    if !has_key(s:, "statusmodes")
        let s:statusmodes = {
                    \ "n"  : "            ",
                    \ "no" : "-- OPERATOR --",
                    \ "i"  : "-- INSERT --",
                    \ "v"  : "-- VISUAL --",
                    \ "V"  : "-- VISUAL LINE --",
                    \ "" : "-- VISUAL BLOCK --",
                    \ "R"  : "-- REPLACE --",
                    \ "Rv" : "-- V REPLACE --",
                    \ "t"  : "-- TERMINAL --",
                    \ "s"  : "-- SELECT --",
                    \ "S"  : "-- SELECT LINE --",
                    \ "" : "-- SELECT BLOCK--",
                    \ "c"  : "-- COMMAND --",
                    \ "cv" : "-- VEX --",
                    \ "ce" : "-- EX --",
                    \ "r"  : "-- PROMPT --",
                    \ "rm" : "-- MORE --",
                    \ "r?" : "-- CONFIRM --",
                    \ "!"  : "-- SHELL --",
       \}
    endif

    let paste = ""
    if &paste
        let paste = " PASTE "
    endif

    if !&modifiable
        return '- '. toupper(&filetype) . ' -'
    else
        return s:statusmodes[a:mode] . l:paste
endfunc

func! PositionBarRight()
     return repeat(s:scrolltrack, float2nr(round(s:scrollrratio)))
endfunc

func! PositionBar()
     return s:scrollpos
endfunc

func! PositionBarLeft()
    let cnt=line("$") * 1.0
    let current=line('.') * 1.0
    let desiredlength=20.0
    let length=20.0
    " If we don't have 20 lines don't display 20 dots...
    if l:cnt < l:length
        let l:length = l:cnt
    endif
    let track='·'

    let ratio=(l:current/l:cnt)*l:length
    let rratio=l:length-l:ratio

    " If we are greater than the length, something is wrong, and if we can never reach the end, something
    " is also wrong.
    if (l:ratio >= 0.5 && l:cnt < l:desiredlength * 2) || round(l:ratio) + round(l:rratio) > l:length
        let l:ratio -= 1
    endif

    if l:current == 1
        let pos = '|=='
    elseif l:current != l:cnt
        let pos = '=|='
    else
        let pos='==|'
    endif

    let s:scrollrratio = l:rratio
    let s:scrollpos = l:pos
    let s:scrolltrack = l:track

    return repeat(l:track, float2nr(round(l:ratio)))
endfunc  "}}}

" Enter/LeaveWin {{{
function! LeaveWin()
    call StatusLineNC()
endfunc

function! EnterWin()
    call StatusLine()
    let curWinIndex = winnr()
    let windowCount = winnr('$')

    exec printf("set scroll=%d",float2nr(winheight(winnr()) * 0.4))

    for i in range(1,winnr('$'))
        if( i != curWinIndex )
            wincmd w
            setl relativenumber norelativenumber
            setl cursorline nocursorline
            setl colorcolumn=0
        endif
    endfor

    wincmd w

    if(&modifiable && &buftype != 'terminal')
        setl cursorline
        setl relativenumber
        setl colorcolumn=80,130
    endif
endfunction
" }}}

" Auto viewing {{{
func! LeaveBufWin()
    if &modifiable && filereadable(expand("%"))
        mkview
    endif
endfun

func! EnterBufWin()
    if &modifiable && filereadable(&viewdir .'/~=+.config=+nvim=+'.expand('%:t').'=')
        loadview
    endif
endfun
" }}}

function! SuperSexyFoldText() "{{{
    let fold = strcharpart(&fillchars, stridx(&fillchars, 'fold') + 5, 1)
    let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
    let oldline = l:line
    let line = strpart(l:line, 0, winwidth('.') / 2 - 3)
    if len(l:line) < len(l:oldline)
        let l:line .= "···"
    endif
    let lines_count = v:foldend - v:foldstart + 1
    let lines_count_text = printf("%s", lines_count)
    let spacechar = " "
    let foldtextstart = strpart('' . repeat(spacechar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
    let foldtextend = ' ( #' . repeat(" ", 4 - len(lines_count_text)) . lines_count_text . " ) "
    let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
    return '|' . repeat(l:fold, winwidth('.') / 4) . "| " . line . repeat(spacechar, winwidth('.') / 2 - len(line)) . foldtextend . '|'
endfunction
set foldtext=SuperSexyFoldText()
" }}}

func! KillWhitespace() " {{{ -- fuck ws
    exec "%s/\\s\\+$//ge"
endf
command! -nargs=0 Kws call KillWhitespace()
" }}}

" Autocommands {{{
augroup init
    autocmd!
    " me
    autocmd BufWinLeave * cal LeaveBufWin() | call LeaveWin()
    autocmd BufWinEnter * cal EnterBufWin() | call EnterWin()
    autocmd WinEnter * cal EnterWin()
    autocmd WinLeave * cal LeaveWin()

    " Filetypes
    autocmd FileType c,cpp,java,cs set mps+==:;|set commentstring=//\ %s
    autocmd FileType cs set foldmarker=region,endregion
    autocmd FileType python set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
augroup END
"}}}

" New Plugin: Highlight word, and Light Scope, and jump to each other.
let g:highlightactive=get(g:, 'highlightactive', 1)
" Mapping to alter custom highlighting. "{{{1
nnoremap <silent><c-space> :silent let g:highlightactive=!g:highlightactive<bar>
    \silent call AutoHighlightCurrentWord()<bar>
    \silent call ScopeIndentHighlight()<bar>
    \silent call HighlightCurrentMatch()<cr>

func! s:skipthis() "{{{1
    return len(g:curhighword) < g:smallest ||
    \ (match(g:curhighword, "\\A") != -1 && match(g:curhighword, "_") == -1)
endfunc

func! HighlightCurrentMatch() "{{{1
    try | call matchdelete(888) | catch *
    endtry

    if s:skipthis() || !g:highlightactive
        return
    endif

    " "nbc" Gets the first index.
    " "nec" Gets the last index (last - first + 1 == "len").
    " "n"   Gets the next instance.
    let sp = searchpos(@/, "nbc", line('.'))
    let sp2 = searchpos(@/, "nec", line('.'))
    let sp3 = searchpos(@/, "n", line('.'))
    let len = sp2[1] - sp[1] + 1

    if &hlsearch && sp != [0,0] && sp2 != [0,0] && (sp2[1] < sp3[1] || sp3 == [0,0])
        call matchaddpos('holdSearchC', [[line('.'), sp[1], l:len], ] , 888, 888)
    else
        let col = match(getline('.'), g:curhighword, col('.') - len(g:curhighword)) + 1
        if col('.') >= l:col && col('.') < l:col + len(g:curhighword)
            call matchaddpos('holdSearchC', [[line('.'), l:col, len(g:curhighword)], ] , -50, 888)
        endif
    endif
endfunc

func! JumpToAuto(forward) "{{{1
    " let save = @/
    if a:forward
        call search(IgnoreCase().'\<'.g:curhighword.'\>', '')
    else
        call search(IgnoreCase().'\<'.g:curhighword.'\>', 'b')
    endif
    " let @/ = l:save
endfunc

" Also opens folds "{{{1
nnoremap <silent> <c-n> :call JumpToAuto(1)<cr>zv
nnoremap <silent> <c-p> :call JumpToAuto(0)<cr>zv

func! AutoHighlightCurrentWord() "{{{1
    try | call matchdelete(999) | catch *
    endtry

    if g:highlightactive
        let g:curhighword = expand("<cword>")
        let g:smallest = 2

        if s:skipthis()
            return
        endif

        if !(g:curhighword == @/ && &hlsearch)
            call matchadd('holdSearch', IgnoreCase().'\<'.g:curhighword.'\>', -100, 999)
        endif
    endif
endfun

func! IgnoreCase() "{{{1
    return &ignorecase ? '\c' : '\C'
endfunc

func! ScopeIndentHighlight() "{{{1
    try | call matchdelete(666) | catch *
    endtry

    if &filetype == 'help' || &filetype == 'qf' || !g:highlightactive
        return
    endif

    let l:start = line('0')
    let l:end = line('$')
    let indent = indent('.')

    if l:indent < &shiftwidth
        let l:indent = &shiftwidth
    endif

    let o_indent = l:indent

    for x in reverse(range(l:start,line('.')))
        if indent(x) < l:indent && !empty(getline(x))
            let l:start = x
            let indent = indent(x) + 1
            break
        endif
    endfor

    for x in range(line('.'), l:end)
        if indent(x) < l:indent && !empty(getline(x))
            let l:end = x
            break
        endif
    endfor

    if l:indent == l:o_indent
        let l:indent = l:indent - &shiftwidth + 1
    endif
    call matchadd('Conceal',"\\%".l:indent."c\\%>".l:start.'l\%<'.l:end.'l\ ',-1000,666)
    let g:scope_startline = getline(l:start)
    if l:start != l:end
        let g:scope_endline = getline(l:end)
    else
        let l:scope_endline = ''
    endif
endfun

augroup scope "{{{1
    autocmd!
    autocmd CursorMoved * call ScopeIndentHighlight() | call AutoHighlightCurrentWord() | call HighlightCurrentMatch()
    autocmd InsertEnter * call ScopeIndentHighlight() | call AutoHighlightCurrentWord() | call HighlightCurrentMatch()
augroup END

" Recommendations: {{{
    " Hls ease
    " nnoremap <silent><space> hl:silent set hlsearch!<cr>
    " nnoremap n :set hlsearch<cr>nzv
    " nnoremap N :set hlsearch<cr>Nzv
    " nnoremap / :set hlsearch<cr>/
    " nnoremap * :set hlsearch<cr>*zv
" }}}1

" Special chars {{{
" ЛМНОПРСТУФХЧЦШЩЬЪЫЅЭІЇЈЮЯӀӢӮабвгѓдеёжзийкќлмнопрстуфхчцшщьъыѕэіјюяһӣӯΑΒΓΔΕΖΗΘΙ
" ΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩαβγδεζηθικλμνξοπρστυφχψω0123456789⁄⅟½↉⅓⅔¼¾⅕⅖⅗⅘⅙⅚⅐⅛⅜⅝⅞⅑⅒*\·•:,…!
" ‼¡#․.?¿"';/‥_{}[]()—–-«»‹›„“”‘‛’‚¢¤$ƒ£¥≡+−×÷=≠><≥≤±≈~¬∅∞∫∆∏∑√∂µ%‰∴∕∙▁▂▃▄▅▆▇█▀▔
" ▏▎▍▌▋▊▉▐▕▖▗▘▙▚▛▜▝▞▟░▒▓━│┃┄┅┆┇┈┉┊┋┌┍┎┏┐┑┒┓└┕┖┗┘┙┚┛├┝┞┟┠┡┢┣┤┥┦┧┨┩┪┫┬┭┮┯┰┱┲┳┴┵┶┷┸
" ┹┺┻┼┽┾┿╀╁╂╃╄╅╆╇╈╉╊╋╌╍╎╏═║╒╓╔╕╖╗╘╙╚╛╜╝╞╟╠╡╢╣╤╥╦╧╨╩╪╫╬╭╮╯╰╱╲╳╴╵╶╷╸╹╺╻╼╽╾╿♥@&¶§©®
" ™°|¦†ℓ‡^̣´˘ˇ¸ˆ¨˙`˝¯˛˚˜
