if exists("b:current_syntax") | finish | endif

syn match cobaltSingleComment "#.*"
syn region cobaltMultiComment start="#=\(\n\|[^=]\)" end="=#" contains=cobaltMultiComment
syn region cobaltMultiComment start="#==\(\n\|[^=]\)" end="==#" contains=cobaltMultiComment
syn region cobaltMultiComment start="#===\(\n\|[^=]\)" end="===#" contains=cobaltMultiComment
syn region cobaltMultiComment start="#====\(\n\|[^=]\)" end="====#" contains=cobaltMultiComment
syn region cobaltMultiComment start="#=====" end="=====#" contains=cobaltMultiComment

syn keyword cobaltDecl fn let module
syn match   cobaltDecl "\(const\|mut\)\(\_s*[&*]\)\@!"
syn keyword cobaltKeyword if else while
syn match cobaltMacro "\v\@(\w|$)+"
syn region cobaltMacro start="\v\@(\w|$)+\(\ze(.|\n){-}\)(\_s\@(\w|$)+(\((.|\n){-}\))?)*\_s*(let|mut|const|type|fn|module)" end="\v(\@(\w|$)+\((.|\n){-})@<=\)\ze(\_s\@(\w|$)+(\((.|\n){-}\))?)*\_s*(let|mut|const|type|fn|module)"

syn match cobaltType "\(const\|mut\)\_s*[&*]"
syn match cobaltType "\<[iu]\d\+\>"
syn keyword cobaltType f16 f32 f64 f128 null

syn keyword cobaltBool true false
syn match cobaltInteger "[+-]\=\<\d\+"
syn match cobaltFloat "[+-]\=\<\d*\.\d+"
syn region cobaltString start="\"" end="\"" skip="\\\"" contains=cobaltEscape
syn match cobaltChar "'[^\\']'" contains=cobaltEscape
syn match cobaltChar "'\\[^xuU]'" contains=cobaltEscape
syn match cobaltChar "'\\x\x\{2}'" contains=cobaltEscape
syn match cobaltChar "'\\u\x\{4}'" contains=cobaltEscape
syn match cobaltChar "'\\U\x\{8}'" contains=cobaltEscape
syn match cobaltEscape "\\[^xuU]" contained
syn match cobaltEscape "\\x\x\{2}" contained
syn match cobaltEscape "\\u\x\{4}" contained
syn match cobaltEscape "\\U\x\{4}" contained

syn match cobaltOperator "[-+*/&|^~:!?=<>]"

syn region cobaltFold start="{" end="}" fold transparent
syn region cobaltFold start="(" end=")" fold transparent

let b:current_syntax = "cobalt"

hi def link cobaltSingleComment Comment
hi def link cobaltMultiComment  Comment
hi def link cobaltMacro PreProc
hi def link cobaltDecl Keyword
hi def link cobaltKeyword Keyword
hi def link cobaltType Type
hi def link cobaltBool Boolean
hi def link cobaltInteger Number
hi def link cobaltFloat   Float
hi def link cobaltString  String
hi def link cobaltChar    Character
hi def link cobaltEscape  SpecialChar
hi def link cobaltOperator Operator
