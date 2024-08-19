augroup netrw_keepdir_fix
  autocmd!
  autocmd BufModifiedSet * call s:netrw_keepdir_fix_install()
augroup END

function! s:netrw_keepdir_fix(cmd)
  try
    let original_cwd = getcwd()
    lcd %:p:h
    execute a:cmd
  finally
    execute 'lcd ' . fnameescape(original_cwd)
  endtry
endfunction

function! s:netrw_keepdir_fix_install()
  if &filetype !=# 'netrw'
    return
  endif

  let mappings = ['mc', 'mm']

  for lhs in mappings
    let original_rhs = maparg(lhs, 'n', '', 0)

    if !empty(original_rhs) && stridx(original_rhs, 'netrw_keepdir_fix') == -1
      let rhs = substitute(original_rhs, '^\c:<C-U>', '', '')
      let rhs = substitute(rhs, '\c<CR>$', '', '')
      let rhs = ' :<C-U>call <SID>netrw_keepdir_fix(' . string(rhs) . ')<CR>'

      execute 'nnoremap <silent> <buffer> ' . lhs . rhs
    endif
  endfor
endfunction
