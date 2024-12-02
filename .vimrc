call plug#begin('~/.vim/plugged')

" 插件列表
Plug 'tpope/vim-fugitive'  " Git 集成插件
Plug 'scrooloose/nerdtree' " 文件系统浏览器
Plug 'vim-airline/vim-airline' " 状态栏增强
Plug 'ycm-core/YouCompleteMe' " 代码补全引擎
Plug 'scrooloose/syntastic' " 语法检查
Plug 'tpope/vim-surround' " 快速操作包围符号
Plug 'tpope/vim-commentary' " 快速注释代码

call plug#end()

" 其他配置
set mouse=nv
set number
set tabstop=4
set shiftwidth=4
set expandtab
syntax on

"files
nmap > : n<CR>
nmap < : N<CR>

"buf
nmap bs : buffers <CR>
nmap bn : buffer 
nmap br : bd 
nmap ab : bufdo
"rm tailing
nmap tail : %s/\s\+$//e <CR>

"ctags
set tags=./tags;,tags
set autochdir

" vim-fugitive 配置
set statusline+=%{fugitive#statusline()}
nmap <C-g> : Git 

" NERDTree 配置
nmap <C-t> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" vim-airline 配置
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" YouCompleteMe 配置
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_completion = 1
nmap <C-D> : YcmCompleter GoToDefinition<CR>
nmap <C-d> : YcmCompleter GoToDeclaration<CR>
nmap <C-r> : YcmCompleter GoToReferences<CR>
nmap <C-k> : YcmCompleter GetDoc<CR>
nmap <C-f> : YcmCompleter FixIt<CR>
nmap <C-n> : YcmCompleter RefactorRename

" syntastic 配置
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

nmap <C-c> :SyntasticCheck<CR>
nmap es : Errors<CR>
nmap ep : lnext<CR>
nmap en : lprev<CR>
