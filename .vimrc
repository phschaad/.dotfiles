" phschaad dotfiles
" Copyright (C) 2019  Philipp Schaad
"
" This program is free software: you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation, either version 3 of the License, or
" (at your option) any later version.
"
" This program is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
" GNU General Public License for more details.
"
" You should have received a copy of the GNU General Public License
" along with this program.  If not, see <https://www.gnu.org/licenses/>.

" This is the configuration file applied to VIM at startup.

" Load Plugins:
source ~/.dotfiles/vim/plugins.vim

" Lightline Settings:
source ~/.dotfiles/vim/lightline.vim

" Gutentags Settings:
source ~/.dotfiles/vim/gutentags.vim

" ALE Settings:
source ~/.dotfiles/vim/ale.vim

" COC Settings:
source ~/.dotfiles/vim/coc.vim

" IndentLine Settings:
source ~/.dotfiles/vim/indentLine.vim

" General Settings:
" Try to set the color scheme if it exists.
silent! colorscheme onedark

" Change the shape of the cursor when we enter insert mode (i beam), and back
" to a regular blinking block cursor when we exit it again.
" Codes are:
" 0 -> blinking block.
" 1 -> blinking block (default).
" 2 -> steady block.
" 3 -> blinking underline.
" 4 -> steady underline.
" 5 -> blinking i beam (xterm).
" 6 -> steady i beam (xterm).
let &t_SI="\e[6 q"
let &t_SR="\e[2 q"
let &t_EI="\e[2 q"

" Remove annoying timeouts after trying to escape insert mode.
set timeoutlen=1000 ttimeoutlen=0

" Disable bells
" set belloff=all
set noeb vb t_vb=
if has('autocmd')
    autocmd GUIEnter * set vb t_vb=
endif

" Enable syntax highlighting.
syntax on

" Enable line numbers in hybrid mode.
set number
set relativenumber

" Enable auto indention.
filetype plugin indent on

" Show existing tabs with 4 spaces width.
set tabstop=4

" When indenting with '>', use 4 spaces width.
set shiftwidth=4

" On pressing tab, insert spaces instead.
set expandtab

" Enable mouse support.
set mouse=a

" Enable the cursor line.
set cursorline

" Set the colwidth indicator.
set colorcolumn=80

" Set the offset after/before the cursor line to the end of the screen.
set so=5

" We can disable the usual -- INSERT -- etc., since we have lightline.
set noshowmode

" Disable the annoying notification if I have unsaved changes.
set hidden

" Ask for confirmation though if we try to close unsaved buffers.
set confirm

" Always show the sign column. We want to always see that, for less visual
" disturbances.
set signcolumn=yes

" Load Mappings:
source ~/.dotfiles/vim/mappings.vim
