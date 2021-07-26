if has("wildmenu")
  set wildmenu
  """set wildmode=longest,list:full
  ""set wildmode=longest,list
  "set wildmode=lastused,longest,list,lastused:full
  set wildmode=longest,list,lastused:full
  " NOTE: didn't like this one: 
  " set wildmode=lastused:longest,list:lastused,list:full
  set wildignore+=*.a,*.o
  set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
  set wildignore+=.DS_Store,.git,.hg,.svn
  set wildignore+=*~,*.swp,*.tmp
  set wildignorecase
endif
