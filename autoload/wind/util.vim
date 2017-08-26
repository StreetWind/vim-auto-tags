" save 'cpo'设置脚本兼容模式为vim
let s:cpo_save = &cpo
set cpo&vim

"util.vim version
let g:wind#util#version =0.1

"检查vim支持cscope和Python3不
if ( !has('cscope') || !has('python3') )
  finish
endif

echo 'test'

"脚本恢复兼容模式为默认
let &cpo = s:save_cpo

