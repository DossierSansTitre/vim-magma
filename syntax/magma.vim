" syntax/magma.vim

syntax sync fromstart
syntax case match

syntax keyword magmaKeyword
    \ if
    \ else
    \ return

syntax keyword  magmaBool           true false
syntax match    magmaType           "\v<\k+>" contained
syntax match    magmaColonType      "\v:" contained skipwhite nextgroup=magmaType
syntax region   magmaFuncParen      start=/\v\(/ end=/\v\)/ contained contains=magmaColonType
syntax match    magmaNumber         "\v<\d+>"
syntax match    magmaFunction       "\v<\k+>" contained skipwhite nextgroup=magmaFuncParen
syntax match    magmaTypeArrow      /->/ skipwhite nextgroup=magmaType
syntax match    magmaKeyword        "\vfun" skipwhite nextgroup=magmaFunction
syntax match    magmaVar            "\vvar" skipwhite nextgroup=magmaVarDecl
syntax match    magmaVarDecl        "\v<\k+>" contained skipwhite nextgroup=magmaColonType

highlight default link magmaKeyword     Keyword
highlight default link magmaNumber      Number
highlight default link magmaType        Type
highlight default link magmaFunction    Function
highlight default link magmaBool        Boolean
highlight default link magmaVar         Keyword
