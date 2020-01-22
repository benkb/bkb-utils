
cwd=$(pwd)

tools=$HOME/tools
bkb_utils=$tools/bkb-utils

mkdir -p $tools

rm -f $bkb_utils
ln -s $cwd $bkb_utils


## libs like: ~/libs/guile/bkb/
libs=$HOME/libs
mkdir -p $libs

for d in *; do
  [ -d "$d" ] || continue

  case "$d" in 
    *-lib)
      lang=${d%-*}
      liblang=$libs/$lang

      mkdir -p $liblang

      libdir=$liblang/bkb
      rm -f $libdir
      ln -s $cwd/$d $libdir
      ;;
    *)
      :
      ;;
  esac

 done



