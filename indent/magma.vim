" indent/magma.vim

setlocal indentexpr=MagmaIndent()

function! MagmaIndent()
    let line = getline(v:lnum)
    let previousNum = prevnonblank(v:lnum - 1)
    let previous = getline(previousNum)

    if previous =~ "{" && line !~ "}" && line !~ "$:"
        return indent(previousNum) + &tabstop
    endif
    if line =~ "}" && previous !~ "{"
        return indent(previousNum) - &tabstop
    endif
    return indent(previousNum)
endfunction
