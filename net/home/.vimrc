" Settings

filetype on
filetype plugin on
filetype indent on

set shell=/bin/sh
set nocompatible
set encoding=utf-8
set fileencoding=utf-8
set nobackup
set nowb
set noswapfile
set noundofile
set ignorecase
set incsearch
set hlsearch
set wrapscan
set smartcase
set mouse=a
set modeline
set more
set ruler
set number
set cursorline
set showmode
set showcmd
set pastetoggle=<F2>
set backspace=2
set scrolloff=3
set lazyredraw
set foldmethod=syntax 
set wildmenu
set wildmode=longest,full,list
set fillchars=vert:\
set laststatus=2
set cmdheight=1

" NetBSD
au BufNewFile,BufRead *Pkgfile set filetype=sh

" Colorscheme
set background=dark
highlight clear
if exists("syntax_on")
	syntax reset
endif

set t_Co=256
let g:colors_name = "AfterDark"

hi Normal         ctermfg=none
hi Boolean        ctermfg=215
hi Comment        ctermfg=14
hi Conditional    ctermfg=176 cterm=bold
hi Constant       ctermfg=11
hi CursorLine     ctermbg=235 cterm=none
hi CursorLineNr   ctermfg=3   ctermbg=none
hi LineNr         ctermfg=14
hi DiffAdd        ctermfg=8   ctermbg=11
hi DiffChange     ctermfg=8   ctermbg=12
hi DiffText       ctermfg=8   ctermbg=13
hi DiffDelete     ctermfg=8   ctermbg=14
hi FoldColumn     ctermfg=239 ctermbg=234
hi Folded         ctermfg=3   ctermbg=234
hi Function       ctermfg=11
hi StatusLine     ctermfg=234 ctermbg=239
hi StatusLineNC   ctermfg=2
hi Statement      ctermfg=11
hi Number         ctermfg=174
hi MatchParen     ctermfg=240
hi ModeMsg        ctermfg=3   ctermbg=235
hi String         ctermfg=3
hi Operator       ctermfg=215 cterm=none
hi PreCondit      ctermfg=9   cterm=none
hi PreProc        ctermfg=217
hi Question       ctermfg=12
hi Repeat         ctermfg=246
hi Search         ctermfg=173 ctermbg=7
hi SpecialChar    ctermfg=144
hi SpecialComment ctermfg=216
hi Special        ctermfg=180
hi SpecialKey     ctermfg=181
hi Title          ctermfg=173
hi Type           ctermfg=239
hi Visual         ctermfg=209

" General highlighting group links.
highlight! link diffAdded       DiffAdd
highlight! link diffRemoved     DiffDelete
highlight! link diffChanged     DiffChange
highlight! link StatusLineNC    StatusLine
highlight! link Title           Normal
highlight! link LineNr          NonText
highlight! link MoreMsg         Normal
highlight! link Question        DiffChange
highlight! link TabLine         StatusLineNC
highlight! link TabLineFill     StatusLineNC
highlight! link VimHiGroup      VimGroup

" Test the actual colorscheme
syn match Comment      "\"__Comment.*"
syn match Constant     "\"__Constant.*"
syn match Cursor       "\"__Cursor.*"
syn match CursorLine   "\"__CursorLine.*"
syn match DiffAdd      "\"__DiffAdd.*"
syn match DiffChange   "\"__DiffChange.*"
syn match DiffText     "\"__DiffText.*"
syn match DiffDelete   "\"__DiffDelete.*"
syn match Folded       "\"__Folded.*"
syn match Function     "\"__Function.*"
syn match Identifier   "\"__Identifier.*"
syn match IncSearch    "\"__IncSearch.*"
syn match NonText      "\"__NonText.*"
syn match Normal       "\"__Normal.*"
syn match Pmenu        "\"__Pmenu.*"
syn match PreProc      "\"__PreProc.*"
syn match Search       "\"__Search.*"
syn match Special      "\"__Special.*"
syn match SpecialKey   "\"__SpecialKey.*"
syn match Statement    "\"__Statement.*"
syn match StatusLine   "\"__StatusLine.*"
syn match StatusLineNC "\"__StatusLineNC.*"
syn match String       "\"__String.*"
syn match Todo         "\"__Todo.*"
syn match Type         "\"__Type.*"
syn match Underlined   "\"__Underlined.*"
syn match VertSplit    "\"__VertSplit.*"
syn match Visual       "\"__Visual.*"

"__Comment              /* this is a comment */
"__Constant             var = SHBLAH
"__Cursor               char under the cursor?
"__CursorLine           Line where the cursor is
"__DiffAdd              +line added from file.orig
"__DiffChange           line changed from file.orig
"__DiffText             actual changes on this line
"__DiffDelete           -line removed from file.orig
"__Folded               +--- 1 line : Folded line ---
"__Function             function sblah()
"__Identifier           Never ran into that actually...
"__IncSearch            Next search term
"__NonText              This is not a text, move on
"__Normal               Typical text goes like this
"__Pmenu                Currently selected menu item
"__PreProc              #define SHBLAH true
"__Search               This is what you're searching for
"__Special              true false NULL SIGTERM
"__SpecialKey           Never ran into that either
"__Statement            if else return for switch
"__StatusLine           Statusline of current windows
"__StatusLineNC         Statusline of other windows
"__String               "Hello, World!"
"__Todo                 TODO: remove todos from source
"__Type                 int float char void unsigned uint32_t
"__Underlined           Anything underlined
"__VertSplit            :vsplit will only show ' | '
"__Visual               Selected text looks like this
