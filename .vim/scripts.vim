if did_filetype()
  finish
endif
if getline(1) =~ "BveTs Map.*"
  setf bvemap
endif

