if did_filetype()
  finish
endif

let s:line1=getline(1)

if s:line1 =~ "BveTs Map.*"
  setfiletype bvemap
elseif s:line1 =~ "\.LOG"
  setfiletype changelog
endif
