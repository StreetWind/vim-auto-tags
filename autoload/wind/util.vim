" save 'cpo'设置脚本兼容模式为vim
let s:save_cpo = &cpo
set cpo&vim

"util.vim version
let g:wind#util#version =0.1

"------------------------------------------------------
"         Parameter Check(参数检查)
"------------------------------------------------------

"check vim cscope or Python3 (检查vim支持cscope和Python3不)
if ( !has('cscope') || !has('python') )
  finish
endif

"set cscope cmd (设置cscope命令)
if !exists('g:cscope_com')
  if executable('cscope')
    let g:cscope_cmd = 'cscope'
  else
    call <SID>echo('cscope :commadn not found')
    finish
  endif
endif

"-----------------------------------------------
"           Private API(私有API)
"-----------------------------------------------


"-----------------------------------------------
"             Public API(公共API)
"-----------------------------------------------
function! wind#util#windowdir()
  if winbufnr(0) == -1
    let unislash = getcwd()
  else 
    let unislash = fnamemodify(bufname(winbufnr(0)), ':p:h')
  endif
    return tr(unislash, '\', '/')
endfunc

"脚本恢复兼容模式为默认
let &cpo = s:save_cpo

