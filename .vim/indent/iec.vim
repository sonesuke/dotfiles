" Vim indent file
" Language:	iec61131-3

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal indentexpr=GetIECIndent()
setlocal nolisp
setlocal nosmartindent
setlocal nocindent
setlocal autoindent

setlocal indentkeys+==if,=else,=elsif,=end_if
setlocal indentkeys+==case,=else,=end_case
setlocal indentkeys+==for,=end_for
setlocal indentkeys+==while,=end_while
setlocal indentkeys+==repeat,=end_repeat
setlocal indentkeys+==configuration,=end_configuration
setlocal indentkeys+==program,=end_program
setlocal indentkeys+==function_block,=end_function_block
setlocal indentkeys+==function,=end_function
setlocal indentkeys+==var,=end_var
setlocal indentkeys+==var_input,=end_var
setlocal indentkeys+==var_ouput,=end_var
setlocal indentkeys+==var_in_out,=end_var
setlocal indentkeys+==var_external,=end_var
setlocal indentkeys+==var_global,=end_var
setlocal indentkeys+==var_access,=end_var
setlocal indentkeys+==type,=end_type
setlocal indentkeys+==struct,=end_struct
if !exists("iec_2nd_ed")
	setlocal indentkeys+==class,=end_class
	setlocal indentkeys+==method,=end_method
	setlocal indentkeys+==interface,=end_interface
endif

let b:undo_indent = "setl smartindent< indentkeys< indentexpr< autoindent< comments< "

" Define some stuff
" keywords grouped by indenting
let s:trust_user_indent = '\(+\)\(\s*\(//\).*\)\=$'
let s:indent_elements = '\(configuration\|program\|function_block\|function\|var\|type\|struct\|class\|method\|interface\|if\|case\|for\|while\|repeat\)'
let s:relative_indent = '^\s*'.s:indent_elements.'\>'
let s:else_indent = '^\s*\(elsif\|else\)\>'
let s:substract_indent = '^\s*end_'.s:indent_elements.'\>'

" Only define the function once.
if exists("*GetIECIndent")
  finish
endif

let s:keepcpo= &cpo
set cpo&vim

function GetIECIndent()

  " Find a non-blank line above the current line.
  let lnum = prevnonblank(v:lnum - 1)

  " At the start of the file use zero indent.
  if lnum == 0
    return 0
  endif

  " trust the user's indenting
  if getline(lnum) =~ s:trust_user_indent
    return -1
  endif

  " Add a 'shiftwidth' after lines that start with an indent word
  let ind = indent(lnum)
  if getline(lnum) =~ s:relative_indent || getline(lnum) =~ s:else_indent
    let ind = ind + &sw
  endif

  " Subtract a shiftwidth for end statements
  if getline(v:lnum) =~ s:substract_indent || getline(v:lnum) =~ s:else_indent
    let ind = ind - &sw
  endif

  return ind
endfunction

let &cpo = s:keepcpo
unlet s:keepcpo

"vim:sw=2
