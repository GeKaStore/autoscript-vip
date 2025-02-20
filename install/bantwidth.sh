#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�0ǲgbantwidth.sh �[O�0���C?�a��iFa\L0�`�70QC�Q��薵c��]|�=���t=���K��a�c�&�E+��0
�O�Z#7�'p:���	uy"���0� ��IM���`��_�+�(X`z���a*,�Ȏ}�d��북q�=ˇ�l"�N�`rp�� �pAe�M'X�$��x����7�1�Z#O)qdY�ajC�[:LnA��!��8�Ժ�p��}׌�P���M���g����*�|�����kWγY_�Q�G�z�Ur���f�!긁������J�Q��1'j�|K�C�s��y������"�2R�j�[��ݩ0َ����X̂����Y�&�i���rq�rq�rq�rq�v�8�\\�_���z���Ey�P�E��җJ_*}���җJ_�җ/Q�J�  