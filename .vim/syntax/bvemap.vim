" Vim syntax file
" Language:    Bvets Map File 2.02
" Maintainer:  hakehash
" URL:         http://overpass.dokkoisho.com
" Last change: 04 Oct. 2015

syntax case ignore

syntax region MapComments start="#" end="$"
syntax region MapComments start="//" end="$"
syntax region Delimiters  start="'" end="'"

syntax keyword keywords1 Add Adhesion Ambient Background Beacon Begin Begin0 BeginCircular BeginConst BeginNew BeginTransition BrakeShoeFriction CabIlluminance Cant Change Curve Diffuse Direction DrawDistance Enable End FlangeNoise Fog Gauge Gradient Interpolate Irregularity JointNoise Legacy Light Load Pass Pitch Play Position PreTrain Put Put0 PutBetween Repeater RollingNoise Section Set SetCenter SetFunction SetGauge SetSpeedLimit Signal Sound Sound3D SpeedLimit Station Stop Structure Train Track Turn X Y
syntax keyword keywords2 include false null true

highlight link MapComments Comment
highlight link Delimiters String
highlight link keywords1 Statement
highlight link keywords2 Keyword
