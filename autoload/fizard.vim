function! fizard#open_help()
  " get current buffer(window) info
  let bufnr = bufnr('%')
  let winnr = bufwinnr(bufnr)
  let wh = winheight(winnr)
  let ww = winwidth(winnr)
  let margin = 10

  " to copy visual selected word
  let tmp = @@
  silent normal gvy
  let selected = @@
  let @@ = tmp

  " open :h
  let hres = execute(":h " . selected)

  " if error happen, then exit
  if hres =~ '^.*E149.*$'
    return
  endif

  " get help window info
  let hbufnr = bufnr('%')
  " close default help window
  execute ":q"

  " open floating window
  call nvim_open_win(
        \ hbufnr,
        \ v:true,
        \ {'relative': 'editor', 'width': ww - margin, 'height': wh - margin, 'row': margin, 'col':margin}
  \ )
endfunction

