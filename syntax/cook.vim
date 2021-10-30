if exists('b:current_syntax')
  finish
end

" Ingredients
syntax match cookIngredient "@[A-Za-z]\+"
syntax match cookMultiWordIngredient "@[^@{]\{-}{[^}]*}"

" Metadata
syntax match cookMetadataKey "[^:]\+:"
syntax match cookMetadataPrefix "^>>"
syntax region cookMetadata start="^>>" end="$"
      \ contains=cookMetadataPrefix,cookMetadataKey,cookMetadataValue

" Cookware
syntax match cookCookware "#[A-Za-z]\+"
syntax match cookMultiWordCookware "#[^#{]\{-}{}"

" Timer
syntax match cookTimer "\~[^{]\{-}{[^}]*}"

" Comments
syntax keyword cookTodo contained TODO FIXME NOTE
syntax match cookComment "//.*$" contains=cookTodo

highlight def link cookIngredient Identifier
highlight def link cookMultiWordIngredient Identifier
highlight def link cookMetadataKey Identifier
highlight def link cookMetadataPrefix Delimiter
highlight def link cookMetadata String
highlight def link cookCookware Type
highlight def link cookMultiWordCookware Type
highlight def link cookTimer Number
highlight def link cookTodo Todo
highlight def link cookComment Comment

let b:current_syntax = 'cook'
