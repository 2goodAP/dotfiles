" -----------------------------------------------------------------------------
"  Additional optional highlighting
" -----------------------------------------------------------------------------

" Operators
syn match cOperator	"\(<<\|>>\|[-+*/%&^|<>!=]\)="
syn match cOperator	"<<\|>>\|&&\|||\|++\|--\|->"
syn match cOperator	"[!~*&%<>^|=,+-]"
syn match cOperator	"/[^/*=]"me=e-1
syn match cOperator	"/$"
syn match cOperator "&&\|||"
syn match cOperator	"[][]"

"" Preprocs
syn keyword cDefined defined contained containedin=cDefine
hi def link cDefined cDefine

"" Functions
syn match cUserFunction "\<\h\w*\>\(\s\|\n\)*("me=e-1 contains=cType,cDelimiter,cDefine
syn match cUserFunctionPointer "(\s*\*\s*\h\w*\s*)\(\s\|\n\)*(" contains=cDelimiter,cOperator

hi def link cUserFunction cFunction
hi def link cUserFunctionPointer cFunction

"" Delimiters
syn match cDelimiter    "[();\\]"
" foldmethod=syntax fix, courtesy of Ivan Freitas
syn match cBraces display "[{}]"

" Links
hi def link cDelimiter Delimiter
" foldmethod=syntax fix, courtesy of Ivan Freitas
hi def link cBraces Delimiter
