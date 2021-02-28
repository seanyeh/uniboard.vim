if exists('g:autoloaded_uniboard')
  finish
endif
let g:autoloaded_uniboard = 1

let s:pastefile = $HOME.'/.uniboard'

function! uniboard#Yank()
  " Only yank to uniboard if no custom register specified
  if v:register != '"'
    return
  endif

  let lines = split(@", "\n")
  if @"[strlen(@") - 1] == "\n"
    call add(lines, "")
  endif

  call writefile(lines, s:pastefile)
endfunction!

function! uniboard#Paste(key)
  let value = join(readfile(s:pastefile), "\n")
  if !v:shell_error && strlen(value) > 0
    let @" = value
  endif

  silent exe 'normal! "'.v:register.a:key
endfunction!
