unlet! did_load_ftplugin
source $VIMRUNTIME/ftplugin/xml.vim
setlocal softtabstop=1
setlocal shiftwidth=1
setlocal formatoptions=
" Чтобы видеть неразрывные пробелы:
setlocal listchars=nbsp:~
setlocal list
" Валидация FB2 клавишей F9.
let fbschema=expand("<sfile>:p:h")."/schema/FictionBook2.21.xsd"
let mkprg="xmllint --nonet --noout --schema "
let mkprg=mkprg.fbschema." \"%\"\ 2>&1 "
let mkprg=mkprg."\\| sed s,{http://www.gribuser.ru/xml/fictionbook/2.0},,g"
execute "setlocal makeprg=".escape(mkprg, ' "|\')
set grepprg=grep\ -nH\ $*
setlocal errorformat=%E%f:%l:\ parser\ error\ :\ %m,%-Z%p^,%-C%.%#,
\%E%f:%l:\ error\ :\ %m,
\%W%f:%l:\ warning\ :\ %m,
\%E%f:%l:\ validity\ error\ :\ %m,
\%W%f:%l:\ validity\ warning\ :\ %m,
\%-Z%p^,
\%f:%l:\ element\ %.%#:\ Schemas\ validity\ error\ :\ %m,
\%-G%.%#
nmap <F9> :w<C-M>:make<C-M>
imap <F9> :w<C-M>:make<C-M>

" Ввод длинного как "--" (два тире подряд).
"imap -- -N
" Ввод открывающей и закрывающей кавычки-ёлочки как "' и "" соответственно.
"imap ' <<
"imap >>
" Ввод многоточия как "..." (три точки подряд).
"digraph ., 8230
"imap ... .,
" Ввод открывающей и закрывающей кавычки-лапки как '' и '" соответственно.
"imap '' :9
"imap ' 6
" Ввод неразрывного пробела как " " (два пробела подряд).
"imap NS
" Ввод апострофа как `.
"imap ` '9
" Добавление ударения к букве:
"nmap _a a=nr2char(0x301)
"nmap _ф _a
" Разрыв абзаца (_p)
"nmap _p d1h:if @" != " "execute "normal ul"endifi
"nmap _з _p
" Слияние двух абзацев (_P)
nmap _P ^/\c<\/p>4s l3x:if tolower(@") != ""execute "normal u"endif
nmap _З _P
" Заключение текста в emphasis и strong (_e, _s).
vmap _e c<emphasis></emphasis><Esc>10hP
vmap _у _e
vmap _s c<strong></strong><Esc>8hP
vmap _ы _s
" Разбивка b64-картинки на строки по 60 символов (_b)
nmap _b ://s,\c[0-9a-z\/+]\{60\},&,g:noh

