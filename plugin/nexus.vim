" ==============================
"       objectType
" ==============================
:function CreateObjectType(object_name, definition_dictionary ) 
:  exec "normal iexport const ".a:object_name." = objectType({ \n  name: ".a:object_name.",\ndefinition(t) {\n    "
: call DicToDef(a:definition_dictionary)
: exec "normal ji  },"
: exec "normal ji})"
:endfunction

let my_dictionary = {'foo':'string'}

:function DicToDef(definition_dictionary)
:let fields = keys(a:definition_dictionary)
:let next_line = 0
:let current_line = line('.')
:let current_line_type = type(line('.'))
:  for field in fields
:    let insertion_line = current_line + next_line
:    let field_name = '"'.field.'"'
:    let field_type = a:definition_dictionary[field]
:    let next_line += 1
:    exec insertion_line.'normal i    t.'.field_type.'('.field_name.')'
:  endfor
:endfunction

let @c=":s/:/\":\"/g\rjk:s/,/\",\"/g\rjk"
let @s=":s/^/{\"/ | s/$/\"}\rkj"
nnoremap <leader>not "ndiwj@s@cl"ddiW:call CreateObjectType("<C-R>n",<C-R>d)<CR>
" first write the object name then write the definition of the object
"name
"key:value,key1:value1 
" hover over the name and pres \not



" ==============================
"       extendType
" ==============================

:function CreateExtendType(object_name, definition_dictionary ) 
:  exec "normal iexport const ".a:object_name." = objectType({ \n  name: ".a:object_name.",\ndefinition(t) {\n    "
: call DicToDef(a:definition_dictionary)
: exec "normal ji  },"
: exec "normal ji})"
:endfunction


" Mental model first createa a t.field generator then implement the
" surrounding text
" T-field Input: fieldName,operationType, returnedType,operationArgs
" T-Field Output: a single function that takes a field Name and and object
" The object includes three parts type: args resolverFunction

" create tFieldObject
" input operationType, args





