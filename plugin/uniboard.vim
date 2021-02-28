if exists('g:loaded_uniboard')
  finish
endif
let g:loaded_uniboard = 1

com! UniboardYank call uniboard#Yank()
com! -nargs=1 UniboardPaste call uniboard#Paste(<f-args>)

autocmd TextYankPost * call uniboard#Yank()

noremap p :call uniboard#Paste('p')<CR>
noremap P :call uniboard#Paste('P')<CR>
