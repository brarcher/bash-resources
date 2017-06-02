"Plug
so ~/.config/nvim/plug.vim
colo Chill

"The 4 most important lines
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

map <space> <leader><leader>

"Begin Vim set   -------------------------
auto BufEnter * let &titlestring = "NVIM│%f│%h%m%r%y "
set sol nosol
set viewoptions=cursor,folds
set foldcolumn=0
set mouse=
set title titlestring=%P
set cursorline "set cursorline to highlight the current line I'm no
set showmode noshowmode "don't show mode in cmd line, I hate when it clears an echo
set shiftwidth=4               " Use indents of 4 spaces
set tabstop=4                  " An indentation every four columns
set softtabstop=4              " Let backspace delete indent
set expandtab                  " Expands tab to spaces
set splitbelow "when split, split below the window instead of above
set splitright "when vsplit, splt to the right instead of left
set showcmd                    "Show cmd while typing
set ignorecase "in the name
set smartcase  "makes things a bit better
set smartindent "indent things well
set smarttab	"tab plays nicer
set list        "list my chars╳│
set fillchars=vert:\|,stlnc:-,stl:\ ,fold:-,diff: "set fill chars to things that make me happy
set listchars=tab:→\ ,trail:·,extends:┇,precedes:┇  "Changes listchars to more suitable chars
let &showbreak = '↳ '          "Change show break thing
set showmatch      " Show matching brackets/parentthesis
set matchtime=1    " Show matching time
set report=0       " Always report changed lines
set nonumber
set nowrap
if &modifiable | set number | endif "If it's modifable, turn on numbers
"End   Vim set   -------------------------

"When jumping somewhere, also center it.
map gg ggzz
map n nzz
map N Nzz
map <c-o> <c-o>zz
map <c-t> <c-t>zz
map <c-i> <c-i>zz

"[Pre/App]end to the word under the cursor
"And in visual mode, slow movement
map <m-a> ea
map <m-i> bi
map <m-p> "+p
map <m-P> "+P
map <f4> :cp<cr>
map <f5> :cn<cr>

"movement while in insert mode
imap <c-j> <down>
imap <c-k> <up>
imap <c-h> <left>
imap <c-l> <right>
xmap <c-j> <down>
xmap <c-k> <up>
xmap <c-h> <left>
xmap <c-l> <right>
cmap <c-v> <c-r>"
cmap <c-j> <down>
cmap <c-k> <up>
cmap <c-h> <left>
cmap <c-l> <right>
"Temporary quick term
map <F12> :10split \| terminal<cr>
tmap <F12> <C-\><C-n>:hide<cr>
tmap <c-left> <C-\><C-n><c-w><left>
tmap <c-down> <C-\><C-n><c-w><down>
tmap <c-up> <C-\><C-n><c-w><up>
tmap <c-right> <C-\><C-n><c-w><right>

map <silent><pageup> <c-u>
map <silent><pagedown> <c-d>
map <m-n> :bn<cr>
map <m-N> :bp<cr>
map <m-w> :bwipeout %<cr><cr>
map <silent><m-k> 5k
map <silent><m-j> 5j
inoremap <silent><c-v> <esc>gpa
inoremap <silent><c-z> <esc>ua
inoremap  
vnoremap  

"Map some clipboard function
vnoremap <c-x> "+d

"Search and replace word under cursor
nnoremap <F6> :%s/<C-r><C-w>/

"s-lrud for window movement
nnoremap <silent> <c-k> :wincmd k<CR>
nnoremap <silent> <c-j> :wincmd j<CR>
nnoremap <silent> <c-h> :wincmd h<CR>
nnoremap <silent> <c-l> :wincmd l<CR>

"I like playing with colors (Gives me hi-lo ids)
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

"End   Mappings   -------------------------

"Aucmd time       -------------------------
let g:doGoldRatioActive=0
let g:GoldRatio=1.6
let g:doAutoNumInActive=0
let g:killInactiveCursor=1
let g:doAutoWrap=0
let g:dynamicStatusLine=0

function! EnterWin()
    let curWinIndex = winnr()
    let windowCount = winnr('$')
    let ratio = &columns/g:GoldRatio

    exec printf("set scroll=%d",float2nr(winheight(winnr()) * 0.3))

    for i in range(1,winnr('$'))
        if( i != curWinIndex )
            wincmd w
            if(g:doGoldRatioActive && (&modifiable || (&lines-winheight(curWinIndex) != 3)))
                let minRatio = float2nr(ratio/windowCount)

                cal setwinvar(i,"&winminwidth",minRatio)
                cal setwinvar(i,"&winwidth",minRatio)
            endif
            if(g:doAutoNumInActive)
                setlocal number nonumber
                setlocal relativenumber norelativenumber
            endif
            if(g:killInactiveCursor)
                set cursorline nocursorline
            endif
        endif
    endfor

    wincmd w
    if(&modifiable && &buftype != 'terminal')
        if(g:doGoldRatioActive)
            exec printf("vertical resize %d", float2nr(ratio))
        endif
        if(g:killInactiveCursor)
            set cursorline
        endif
        if(g:doAutoNumInActive)
            setlocal number
        endif
        if(g:doAutoWrap)
            setlocal wrap nowrap
        endif
    endif
endfunction

func! LeaveBufWin()
    if &modifiable && filereadable("%")
        mkview
    endif
endfun

func! EnterBufWin()
    if &modifiable && filereadable(&viewdir .'/~=+.config=+nvim=+'.expand('%:t').'=')
        silent loadview
    endif
endfun

augroup init
    autocmd!
    autocmd WinEnter * cal EnterWin()
    autocmd BufWinLeave * cal LeaveBufWin()
    autocmd BufWinEnter * cal EnterBufWin()
augroup END
"End    Aucmd   -------------------------

"Symbols
" AÁĂÂÄÀĀĄÅÃÆBCĆČÇĈDÐĎĐEÉĚÊËĖÈĒĘFGĜHĤIĲÍÎÏÌĪĮJĴKLĹĽĿŁMNŃŇÑOÓÔÖÒŐŌØÕŒPÞQRŔŘSŚŠŞŜTŦŤUÚŬÛÜÙŰŪŲŮVWẂŴẄẀXYÝŶŸỲZŹŽŻŢa
" áăâäàāąåãæbcćčçĉdðďđeéěêëėèēęfgĝhĥiıíîïìĳīįjȷĵklĺľŀłmnńňñoóôöòőōøõœpþqrŕřsśšşŝßtŧťuúŭûüùűūţųůvwẃŵẅẁxyýŷÿỳzźžż
" ªºАБВГЃДЕЁЖЗИЙКЌЛМНОПРСТУФХЧЦШЩЬЪЫЅЭІЇЈЮЯӀӢӮабвгѓдеёжзийкќлмнопрстуфхчцшщьъыѕэіјюяһӣӯΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩ
" αβγδεζηθικλμνξοπρστυφχψω0123456789⁄⅟½↉⅓⅔¼¾⅕⅖⅗⅘⅙⅚⅐⅛⅜⅝⅞⅑⅒*\·•:,…!‼¡#․.?¿"';/‥_{}[]()—–-«»‹›„“”‘‛’
" €¢¤$ƒ£¥≡+−×÷=≠><≥≤±≈~¬∅∞∫∆∏∑√∂µ%‰∴∕∙▁▂▃▄▅▆▇█▀▔▏▎▍▌▋▊▉▐▕▖▗▘▙▚▛▜▝▞▟░▒▓━│┃┄┅┆┇┈┉┊┋┌┍┎┏┐┑┒┓└┕┖┗┘┙┚┛
"├┝┞┟┠┡┢┣┤┥┦┧┨┩┪┫┬┭┮┯┰┱┲┳┴┵┶┷┸┹┺┻┼┽┾┿╀╁╂╃╄╅╆╇╈╉╊╋╌╍╎╏═║╒╓╔╕╖╗╘╙╚╛╜╝╞╟╠╡╢╣╤╥╦╧╨╩╪╫╬╭╮╯╰╱╲╳╴╵╶╷╸╹╺╻╼╽╾╿
"♥@&¶§©®™°|¦†ℓ‡^̣´˘ˇ¸ˆ¨˙`˝¯˛˚˜ 
"
