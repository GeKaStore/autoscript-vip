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
�0ǲgm-theme.sh ��o�@����x�]p����6�	t��[�e�i��� �K[\�F⟠����o����xw�J�����h�k?���w�����J}�3x?(�vqH���֖�y�+��Qb֗��4�����`y���eIzb�Z��tl%��(|���g납�ķ�DuD�a��gU�NԢ��A?�4PIL�H/p=�\�|	b�x����T�.�g��t!(�(��:�V��Q+�%��Z)Ǖ��Vpr�}ϟ�����u��	�b�=�	� E����r{����JW�>���C�U�1�^��qm|���jƾфòi�a�0��Y�5%�d�>������8Zs�M=J�	O65�U�;#�,7�w�}���߷��^U���~t���"=��{�6�\ t'�P����Pm���Q�'
EjZ�dF�B7�{�ԏ��G(�P��~U���=헫��*'
ͧz�׺�Э��v�\Q-�P��B�n(�煦���r�5�9����K`w�J�{����07��4"��?KKmt$J��'	�W2;yt�,X��&Vq��9ٍ��"�w�<�������"z E���z ��p}/�y����U�n8�q�(�����|�I����F�(U�SGĶ��l��݈c;��d�nR�f��qC���E�[q�5�[��Bjz����Q6�6%o'�3W��$J�ZfHe�&����6� �\r�5�'���k>�%�3�b�~��.�ϳ�K�4�|�֧S�́�Fl�.�|ݔ]@  � _���'A ��9A�A[��|�#?��ab�  