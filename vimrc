" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
" 高亮显示
syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
" set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file

"if has("autocmd")
"  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
"    \| exe "normal g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules according to the
" detected filetype. Per default Debian Vim only load filetype specific
" plugins.
"if has("autocmd")
"  filetype indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd                " Show (partial) command in status line.
"set showmatch                " Show matching brackets.
"set ignorecase                " Do case insensitive matching
"set smartcase                " Do smart case matching
"set incsearch                " Incremental search
"set autowrite                " Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a                " Enable mouse usage (all modes) in terminals

" Source a global configuration file if available
" XXX Deprecated, please move your changes here in /etc/vim/vimrc
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif


if has("autocmd")

  " 自动检测文件类型并加载相应的设置
  filetype plugin indent on

  " Python 文件的一般设置，比如不要 tab 等
  autocmd FileType python setlocal et | setlocal sta | setlocal sw=4

  " Python Unittest 的一些设置
  " 可以让我们在编写 Python 代码及 unittest 测试时不需要离开 vim
  " 键入 :make 或者点击 gvim 工具条上的 make 按钮就自动执行测试用例
  autocmd FileType python compiler pyunit
  autocmd FileType python setlocal makeprg=python\ ./alltests.py
  autocmd BufNewFile,BufRead test*.py setlocal makeprg=python\ %


endif


"设置文件类型为python语言
set filetype=python

"显示行号
set nu

"自动缩进
set autoindent

"背景显示颜色（我最喜欢的颜色)
color torte

"高亮搜索
set hlsearch

"输入字符串就显示匹配点
set incsearch

"输入的命令显示出来，看的清楚些
set showcmd

"自动补全命令时候使用菜单式起配列表
set wildmenu

"快速缩进？
set smartindent

"自动补全
"pydiction 1.2 python auto complete
filetype plugin on
"let g:pydiction_location = '~/.vim/tools/pydiction/complete-dict'
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'
"defalut g:pydiction_menu_height == 15
""let g:pydiction_menu_height = 20
