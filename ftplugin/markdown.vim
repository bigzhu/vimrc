" 针对 ink 的 markdown blog 系统, 生成配置信息
map <buffer> <f1> idraft: false<cr>date: <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr><cr>cover: /images/avatar.jpeg<cr>tags:<cr>    - bigzhu<cr><BS><BS><BS>preview:<cr><cr>---<cr><!--more--><cr><Esc>
" 用默认程序打开 markdown 文件
:nmap <f4> :!open "%" <cr>
" 插入当前时间
:inoremap <buffer> <c-n> <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr>

" for vim-table-mode
let g:table_mode_corner='|'
let g:table_mode_border=0
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'

let g:tagbar_type_markdown = {
        \ 'ctagstype' : 'markdown',
        \ 'kinds' : [
                \ 'h:headings',
        \ ],
    \ 'sort' : 0
\ }

" markdown 默认打开
let g:tagbar_left = 1
TagbarOpen
