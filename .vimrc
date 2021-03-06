syn on             "To switch syntax highlighting on according to the current
                   "value of the 'filetype' option
filetype plugin on

"common conf {{

set autoindent     "Copy indent from current line when starting a new line
set laststatus=2   "status line always shows up

    "tab conf {
    set expandtab      "When expandtab is set, hitting Tab in insert mode will
                       "produce the appropriate number of spaces.
    set softtabstop=4  "Set softtabstop to control how many columns vim
                       "uses when you hit Tab in insert mode
    set shiftwidth=4   "Set shiftwidth to control how many columns text
                       "is indented with the reindent operations (<< and >>)
                       "and automatic C-style indentation.
    set tabstop=4      "Set tabstop to tell vim how many columns a tab counts
                       "for. This is the only command here that will affect
                       "how existing text displays.
    "}

set cursorline     "Highlight the screen line of the cursor with CursorLine
"set number        "Print the line number in front of each line
set nonumber
set autoread       "When a file has been detected to have been changed
                   "outside of Vim and it has not been changed inside of Vim,
                   "automatically read it again.
set scrolloff=3    "Minimal number of screen lines to keep above and below the cursor.
set showmode       "Show the mode message on the last line
set showcmd        "Show (partial) command in the last line of the screen
set hidden

    "code complete {
    set wildmenu
    set wildmode=list:longest
    "}

set visualbell     "Use visual bell instead of beeping
set ttyfast
set ruler          "Show the line and column number of the cursor position,
                   "separated by a comma.
set backspace=indent,eol,start "Backspace over something
hi Search term=standout ctermbg=11

    "search conf {
    set ignorecase     "Ignore case in search patterns.  Also used when
                       "searching in the tags file.
    set smartcase      "Override the 'ignorecase' option if the search
                       "pattern contains upper case characters.
    set incsearch      "While typing a search command, show where the pattern,
                       "as it was typed so far, matches. The matched
                       "string is highlighted.
    set hlsearch       "When there is a previous search pattern, highlight all its matches.
    set showmatch      "The showmatch option is also useful: it can reduce
                       "the need for %, the cursor will briefly jump to
                       "the matching brace when you insert one.
    "}
set encoding=utf-8
set fileencodings=uft-8 "Sets the character encoding for the file of this buffer
set foldmethod=syntax "Syntax highlighting items specify folds

"set wrap          "This option changes how text is displayed
set nowrap
"set textwidth=79 "'textwidth' is set to 0 when the 'paste' option is set.
"set formatoptions=qrn1 "When the 'paste' option is on, no formatting is done

"}}

"Remap {{

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

inoremap jj <ESC>

nnoremap / /\v
vnoremap / /\v

nnoremap j gj
nnoremap k gk

nnoremap ; :

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

au FocusLost * :wa "saving on losing focus

"}}

"User definded shotcut{{

let mapleader = ','
nnoremap <leader><space> :noh<cr>
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
set pastetoggle=<leader>T

"}}

"conf for plugins {{

"pathogen{
call pathogen#infect()
"}

"powerline{
set guifont=PowerlineSymbols\ for\ Powerline
set nocompatible
set t_Co=256
let g:Powerline_symbols = 'fancy'
"}

"nerdtree{
nnoremap <leader>nr :silent! NERDTreeToggle<CR>
let NERDTreeIgnore = ['.*\.o$','.*\.ko$']
"}

"taglist{
nnoremap <leader>tl : Tlist<CR>
let Tlist_Show_One_File = 1           "只显示当前文件的taglist，默认是显示多个
let Tlist_Exit_OnlyWindow = 1         "如果taglist是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1        "在右侧窗口中显示taglist
let Tlist_GainFocus_On_ToggleOpen = 0 "打开taglist时，光标不保留在taglist窗口
let Tlist_Ctags_Cmd='/usr/bin/ctags'  "设置ctags命令的位置
let Tlist_Auto_Open = 0               "每次vim运行时不自动打开taglist
"set tags+=/home/acayf/Documents/taobao/Nginx/nginx-1.4.1/src/tags
"set tags+=/home/acayf/Documents/test/linux-2.6.18_pro500/tags
"set tags+=/home/acayf/Documents/DM365/backup/encode/tags
"set tags+=/home/acayf/Documents/DM365/backup/dmai_1_21_00_10/packages/ti/sdo/dmai/tags
"}

" vimdiff color scheme {
highlight DiffChange cterm=none ctermfg=black ctermbg=LightGreen gui=none guifg=bg guibg=LightGreen
highlight DiffText cterm=none ctermfg=black ctermbg=Red gui=none guifg=bg guibg=Red
"}

" Git Gutter {
nnoremap <leader>ggt :GitGutterToggle<cr>
let g:gitgutter_enabled = 0
"}

" ctrlp {
set runtimepath^=~/.vim/bundle/ctrlp.vim
"}

" vim-colors-solarized {
syntax enable
set background=dark
colorscheme solarized
call togglebg#map("<F5>")
"}

" Conque-Shell {
nnoremap <leader>b :ConqueTermSplit bash<cr>
let g:ConqueTerm_StartMessages = 0
function MyConqueStartup(term)

    " set buffer syntax using the name of the program currently running
    execute 'setlocal syntax=' . a:term.program_name

    " shrink window height to 10 rows
    resize 5

    " silly example of terminal api usage
    " if a:term.program_name == 'bash'
    "    call a:term.writeln('gcc ')
    " endif
    
endfunction

call conque_term#register_function('after_startup', 'MyConqueStartup')
"}

" YCM {
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" "}

" UltiSnips {
" related issue
" https://github.com/Valloric/YouCompleteMe/issues/36#issuecomment-15451411
  let g:UltiSnipsExpandTrigger       = "<c-tab>"
  let g:UltiSnipsJumpForwardTrigger  = "<tab>"
  let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
  
  " Enable tabbing through list of results
  function! g:UltiSnips_Complete()
      call UltiSnips#ExpandSnippet()
      if g:ulti_expand_res == 0
          if pumvisible()
              return "\<C-n>"
          else
              call UltiSnips#JumpForwards()
              if g:ulti_jump_forwards_res == 0
                 return "\<TAB>"
              endif
          endif
      endif
      return ""
  endfunction
  
  au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
  
  " Expand snippet or return
  let g:ulti_expand_res = 0
  function! Ulti_ExpandOrEnter()
      call UltiSnips#ExpandSnippet()
      if g:ulti_expand_res
          return ''
      else
          return "\<return>"
  endfunction
  
  " Set <space> as primary trigger
  inoremap <return> <C-R>=Ulti_ExpandOrEnter()<CR>
"}

" gocode {
set completeopt-=preview
set completeopt+=longest
"}

" a.vim {
nnoremap <leader>a :A "switches to the header file corresponding to the current file being edited (or vise versa)
nnoremap <leader>as :AS "splits and switches
nnoremap <leader>av :AV "vertical splits and switches
nnoremap <leader>at :AT "new tab and switches
nnoremap <leader>an :AN "cycles through matches
nnoremap <leader>ih :IH "switches to file under cursor
nnoremap <leader>ihs :IHS "splits and switches
nnoremap <leader>ihv :IHV "vertical splits and switches
nnoremap <leader>iht :IHT "new tab and switches
nnoremap <leader>ihn :IHN "cycles through matches
"<Leader>is switches to the alternate file of file under cursor (e.g. on  <foo.h> switches to foo.cpp)
"}

"cscope{

    """"""""""""" Standard cscope/vim boilerplate

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " " add any exiting csope database from above directory
    " let db = findfile("cscope.out", ".;")
    " if (!empty(db))
    "     let path = strpart(db, 0, match(db, "/cscope.out$"))
    "     set nocscopeverbose " suppress 'duplicate connection' error
    "     exe "cs add " . db . " " . path
    "     set cscopeverbose
    " endif

    " " add any cscope database in current directory
    " if filereadable("cscope.out")
    "     cs add cscope.out
    " " else add the database pointed to by environment variable
    " elseif $CSCOPE_DB != ""
    "     cs add $CSCOPE_DB
    " endif

    " show msg when any other cscope db added
    "set cscopeverbose

    "add user defined cscope db
    "cs add ~/opt/arm-2009q1/cscope.out ~/opt/arm-2009q1/
    "cs add ~/ti-dvsdk_dm365-evm_4_02_00_06/dmai_2_20_00_15/cscope.out ~/ti-dvsdk_dm365-evm_4_02_00_06/dmai_2_20_00_15/
    "cs add ~/ti-dvsdk_dm365-evm_4_02_00_06/dvsdk-demos_4_02_00_01/cscope.out ~/ti-dvsdk_dm365-evm_4_02_00_06/dvsdk-demos_4_02_00_01/
    "cs add ~/ti-dvsdk_dm365-evm_4_02_00_06/psp/linux-2.6.32.17-psp03.01.01.39/cscope.out ~/ti-dvsdk_dm365-evm_4_02_00_06/psp/linux-2.6.32.17-psp03.01.01.39/
    "cs add ~/workdir/dm365/mv_pro_5.0/cscope.out ~/workdir/dm365/mv_pro_5.0/
    "cs add ~/workdir/lsp/ti-davinci/sjw/linux-2.6.18_pro500/cscope.out ~/workdir/lsp/ti-davinci/sjw/linux-2.6.18_pro500/
    "cs add ~/workdir/dm365/dvsdk_2_10_01_18/dmai_1_21_00_10/cscope.out ~/workdir/dm365/dvsdk_2_10_01_18/dmai_1_21_00_10/
    "cs add ~/workdir/dm365/dvsdk_2_10_01_18/dvsdk_demos_2_10_00_17/cscope.out ~/workdir/dm365/dvsdk_2_10_01_18/dvsdk_demos_2_10_00_17/
    "cs add ~/dvsdk_2_10_01_18/dmai_1_21_00_10/cscope.out ~/dvsdk_2_10_01_18/dmai_1_21_00_10/
    "cs add ~/dvsdk_2_10_01_18/dvsdk_demos_2_10_00_17/cscope.out ~/dvsdk_2_10_01_18/dvsdk_demos_2_10_00_17/
    "cs add ~/workdir/lsp/ti-davinci/linux-2.6.18_pro500_plc/linux-2.6.18_pro500/cscope.out ~/workdir/lsp/ti-davinci/linux-2.6.18_pro500_plc/linux-2.6.18_pro500/
    "cs add ~/workdir/dm365/dvsdk_2_10_01_18/qt/qt-everywhere-opensource-src-4.6.2/examples/cscope.out ~/workdir/dm365/dvsdk_2_10_01_18/qt/qt-everywhere-opensource-src-4.6.2/examples/
    "cs add ~/workdir/dm365/dvsdk_2_10_01_18/qt/qt-everywhere-opensource-src-4.6.2/include/cscope.out ~/workdir/dm365/dvsdk_2_10_01_18/qt/qt-everywhere-opensource-src-4.6.2/include/
    " cs add /home/acayf/Documents/taobao/Nginx/nginx-1.4.1/src/cscope.out /home/acayf/Documents/taobao/Nginx/nginx-1.4.1/src/
    " cs add /home/acayf/Documents/test/linux-2.6.18_pro500/cscope.out /home/acayf/Documents/test/linux-2.6.18_pro500/
    " cs add /home/acayf/Documents/DM365/backup/encode/cscope.out /home/acayf/Documents/DM365/backup/encode/
    " cs add /home/acayf/Documents/DM365/backup/dmai_1_21_00_10/packages/ti/sdo/dmai/cscope.out /home/acayf/Documents/DM365/backup/dmai_1_21_00_10/packages/ti/sdo/dmai/
    " cs add /home/acayf/OpenSource_Procjects/muduo/muduo/cscope.out /home/acayf/OpenSource_Procjects/muduo/muduo/

    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    " Below are three sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window horizontally and
    " diplays your search result in the new window, and one that does the same
    " thing, but does a vertical split instead (vim 6 only).
    "
    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    " unlikely that you need their default mappings (CTRL-\'s default use is
    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
    " (which also maps to CTRL-/, which is easier to type).  By default it is
    " used to switch between Hebrew and English keyboard mode.
    "
    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    " that searches over '#include <time.h>" return only references to
    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    " files that contain 'time.h' as part of their name).


    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.
    "

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>


    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>

    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>


    " Hitting CTRL-space *twice* before the search type does a vertical
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left

    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>


    """"""""""""" key map timeouts
    "
    " By default Vim will only wait 1 second for each keystroke in a mapping.
    " You may find that too short with the above typemaps.  If so, you should
    " either turn off mapping timeouts via 'notimeout'.
    "
    "set notimeout
    "
    " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
    " with your own personal favorite value (in milliseconds):
    "
    "set timeoutlen=4000
    "
    " Either way, since mapping timeout settings by default also set the
    " timeouts for multicharacter 'keys codes' (like <F1>), you should also
    " set ttimeout and ttimeoutlen: otherwise, you will experience strange
    " delays as vim waits for a keystroke after you hit ESC (it will be
    " waiting to see if the ESC is actually part of a key code like <F1>).
    "
    "set ttimeout
    "
    " personally, I find a tenth of a second to work well for key code
    " timeouts. If you experience problems and have a slow terminal or network
    " connection, set it higher.  If you don't set ttimeoutlen, the value for
    " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
    "
    "set ttimeoutlen=100

"}

"}}
