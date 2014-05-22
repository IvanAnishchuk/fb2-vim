" XML  specific variants: docbk and xbl
"au BufNewFile,BufRead *	call s:FTfb2()

"func! s:FTfb2()
"  let n = 1
"while n < 10 && n < line("$")
"    let line = getline(n)
"    if line =~ '<FictionBook xmlns="http://www.gribuser.ru/xml/fictionbook/2.0"*>'
"      set filetype=fb2
"      return
"    endif
"    let n += 1
"  endwhile
"endfunc

au BufNewFile,BufRead *.fb2,*.fb2.* set filetype=fb2

