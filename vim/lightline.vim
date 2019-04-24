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

" Configure Lightline.
let g:lightline = {
            \ 'colorscheme': 'onedark',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'gitbranch' ],
            \             [ 'readonly', 'filetype', 'filename' ] ],
            \   'right': [ [ 'lineinfo' ],
            \              [ 'percent' ],
            \              [ 'linter_checking', 'linter_errors', 'linter_warnings' ],
            \              [ 'fileformat', 'fileencoding' ] ],
            \ },
            \ 'component_expand': {
            \   'linter_checking': 'lightline#ale#checking',
            \   'linter_warnings': 'lightline#ale#warnings',
            \   'linter_errors': 'lightline#ale#errors',
            \   'linter_ok': 'lightline#ale#ok',
            \ },
            \ 'component_type': {
            \   'linter_checking': 'left',
            \   'linter_warnings': 'warning',
            \   'linter_errors': 'error',
            \   'linter_ok': 'left',
            \ },
            \ 'component_function': {
            \   'filename': 'LightlineFilename',
            \   'gitbranch': 'LightlineGitBranch',
            \ },
            \ 'tabline': {
            \   'left': [ [ 'tabs' ] ],
            \   'right': [ [ 'close' ] ],
            \ },
            \ 'tab': {
            \   'active': [ 'filename', 'modified' ],
            \   'inactive': [ 'filename', 'modified' ],
            \ },
            \ 'separator': {
            \   'left': "\ue0b0",
            \   'right': "\ue0b2",
            \ },
            \ 'subseparator': {
            \   'left': "\ue0b1",
            \   'right': "\ue0b3",
            \ },
            \ }

" Extract the current git branch - if it exists - for lightline.
function! LightlineGitBranch()
    return exists('*fugitive#head') ? "\ue0a0 " . fugitive#head() : ''
endfunction

" Display the current filename in lightline, except if it's nerdtree.
function! LightlineFilename() abort
    let filename = winwidth(0) > 70 ? expand('%') : expand('%:t')
    if filename =~ 'NERD_tree'
        return ''
    endif
    let modified = &modified ? ' +' : ''
    return fnamemodify(filename, ":~:.") . modified
endfunction

" Enable the status line.
set laststatus=2

" Set ale integration stuff symbols.
let g:lightline#ale#indicator_checking="\uf110"
let g:lightline#ale#indicator_warnings="\uf071"
let g:lightline#ale#indicator_errors="\uf05e"
let g:lightline#ale#indicator_ok="\uf00c"
