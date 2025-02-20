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
�0ǲginsshws.sh �[k�@���Wl�K���R��/JkҨ&N҇�j5��v��ȶ�}W�ܚ;m��) 0Z��=3糏_�2A"0c�|�����(-��G������*3�_,�23~&��MN��qx��1�Xvg��2)����PW�<�gbB�A J�(�*��PE�o@$��c��|�A�.�V
�8\b'u�H@8���!fK���d�۔�Z���^�h��n�$0)�
�d��i�Y��Hc�R~r�Cvseݲ!�])k�qE�5��Ͻ�~ś������e��v3;us?\R`
������ -��wI�z������E{��M���]V���B��&Cg-��(D����oK��Y'@�7����7<�|�����$��"���m��W��S��c�J�̗�+�E+���&�:�b���d���ʚΝP�t�nS�e߅'$�Wa^jR���Z�d�:9I��r�Á�"�:#|��M�[���#�U{~vQ���_w��>�k��o:?��g�g�A�����#�B��d7�H�1��n�p�ɟ��V>�O	��s(~qz/����wK���/�LkQK.	  