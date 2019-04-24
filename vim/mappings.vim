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

" General Mapping:
" Set a comma (,) as the command leader character.
let mapleader = ","

" Quicksave by typing , twice.
nnoremap <leader>, :w<CR>

" Quicksave and close buffer by typing ,q.
nnoremap <leader>q :wq<CR>

" Next window.
nnoremap <leader>. <C-W><C-W>

" Switch between current and last buffer.
nnoremap <leader>m <C-^>

" Move the screen a little bit more intuitively with C-J and C-K.
nnoremap <C-J> 2<C-E>
nnoremap <C-K> 2<C-Y>

" Inserting from and copying to clipboard shortcuts.
nnoremap <leader>p "+p
nnoremap <leader>P "*p
vnoremap <leader>y "+y
vnoremap <leader>Y "*y

" Reload the vim configuration.
if has('nvim')
    nnoremap <leader>rr :source ~/.config/nvim/init.vim<CR>
else
    nnoremap <leader>rr :source ~/.vimrc<CR>
endif

" Tab navigation.
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprev<CR>

" ALE Mapping:
nnoremap <leader>aj :ALENext<CR>
nnoremap <leader>ak :ALEPrevious<CR>
nnoremap <leader>af :ALEFix<CR>

" NERDTree Mapping:
nnoremap <leader>ne :NERDTreeToggle<CR>

" IndentLine Mapping:
nnoremap <leader>il :IndentLinesToggle<CR>

" FZF Mapping:
nnoremap <leader>f<space> :FZF<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fb :Buffer<CR>

" Ranger Mapping:
" Get rid of the default mapping first.
let g:ranger_map_keys=0
nnoremap <leader>ra :Ranger<CR>
