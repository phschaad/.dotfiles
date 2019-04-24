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

" Check if vim-plug is installed, if not, install it.
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

" Post download hook to install the plugin YCM.
function! BuildYCM(info)
    if a:info.status == 'installed' || a:info.force
        !./install.py
    endif
endfunction

" Load plugins.
call plug#begin('~/.vim/plugged')

" Autocompletion.
"Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

" File control {{{
Plug 'tpope/vim-eunuch'
Plug 'francoiscabrol/ranger.vim'
" }}}

" Editing {{{
Plug 'scrooloose/nerdcommenter'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'tommcdo/vim-exchange'
Plug 'mattn/emmet-vim'
" }}}

" Code features {{{
Plug 'sheerun/vim-polyglot'
Plug 'ludovicchabant/vim-gutentags'
Plug 'neoclide/coc.nvim', { 'do': { -> coc#util#install() } }
Plug 'w0rp/ale'
" }}}

" Language specific features {{{
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
" }}}

" Navigation {{{
Plug 'moll/vim-bbye'
Plug 'andymass/vim-matchup'
Plug 'google/vim-searchindex'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-repeat'
"Plug 'kien/ctrlp.vim'
" }}}

" Fzf {{{
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" }}}

" UI {{{
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'tpope/vim-obsession'
" }}}

" Git {{{
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" }}}

" Color scheme(s) {{{
Plug 'phschaad/onedark_hc.vim', { 'as': 'onedark' }
" }}}

" Finish setting up the plugin manager.
call plug#end()
