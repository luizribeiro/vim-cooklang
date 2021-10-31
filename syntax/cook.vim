if exists('b:current_syntax')
  finish
end

syntax match cookNumbers "\([0-9]\+\.[0-9]\+\|[0-9/]\+\)"
syntax match cookSymbol "@\|#\|\~"
syntax match cookQuantityScaling "\*"
syntax match cookUnit "%[^}]*"
syntax match cookQuantity "{[^}]*}"
      \ contains=cookNumbers,cookUnit,cookQuantityScaling,cookSymbol

" Ingredients
syntax match cookIngredient "@[A-Za-z ]\{-}{[^}]*}\|@[A-Za-z]\+"
      \ contains=cookSymbol,cookQuantity

" Metadata
syntax match cookMetadataKey "[^:]\+:"
syntax match cookMetadataPrefix "^>>"
syntax region cookMetadata start="^>>" end="$"
      \ contains=cookMetadataPrefix,cookMetadataKey,cookMetadataValue

" Cookware
syntax match cookCookware "#[^#{]\{-}{}\|#[A-Za-z]\+"
      \ contains=cookSymbol,cookQuantity

" Timer
syntax match cookTimer "\~[^{]\{-}{[^}]*}"
      \ contains=cookNumbers,cookUnit,cookQuantityScaling,cookSymbol

" Comments
syntax keyword cookTodo contained TODO FIXME NOTE
syntax match cookComment "//.*$" contains=cookTodo

highlight def link cookUnit Label
highlight def link cookNumbers Number
highlight def link cookQuantityScaling Operator
highlight def link cookQuantity Statement
highlight def link cookSymbol Function
highlight def link cookIngredient Identifier
highlight def link cookMetadataKey Identifier
highlight def link cookMetadataPrefix Delimiter
highlight def link cookMetadata String
highlight def link cookCookware Type
highlight def link cookTimer Number
highlight def link cookTodo Todo
highlight def link cookComment Comment

let b:current_syntax = 'cook'
