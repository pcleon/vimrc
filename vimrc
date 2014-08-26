" 高亮显示
syntax on

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
"color torte

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


"自定义快捷键"
set pastetoggle=<F10>
