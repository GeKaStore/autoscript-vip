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
�0ǲgxp.sh �X]s�@}ϯ�� `�`u�V:>9㛯N�6����&f7��߽�@J
h�����{��<&m=#WB�+�#'��d��N�F	��H�%!�7�Lc²$��0��a��a�� ܄�:�7D�~�$�)t��Z��
s>���c�;:��ʕ����̆��p�?���o37p�I���7�/ߏ��'�Z�nQȟ�kk�g�.��v܍N��~�����\����Y�z�څ����������P��>�A�}szr��#�pyY&��K���9��+Gs��6o���n�0�~�n�Wl|Ɩ�3�S�r)ap��nc�� g,�hH�ĜLSM��J��kdbi�����6pq�ii�}]on�����ce2Ae\l6��w�3L�XL^~ӉZ��4�<�P7�����k��"�s����/K׆���<�4�(X�=W�8�(�p�G��Z�m�ك���l	���+$�b���a�$����x^���B��}�(h\�m���F�R�w
�\����������l��m&��f�Ql&�{�Ɇ6���������6�{�l�[dC�Ȇn����=�[��#�倬��[L�|���]6���e��&{��j��4L�]�,���e���{�=�C#!��PԆ�|/+i�tV�Z����{����[l{2��Ox������/�L%V�h����:��(Kf�&�p���v��9����&N	�#2.�6�c�1����a�+���v6a�h⢊�w�b�O���Ы��#�^T���O����ؑ�P!-��Ί�|_ �*�j�q��V��v�5�Js�7Ӆ&�e ^�J�Ld�q%���v`aUՂ?��;�P�Й��P�W�N��"�ºo�B��g�b�b;�gS�w_îvP��KF�o�,�W����(W:{ols&a�&쮗���o�m��?ᘷ"�Ν�+g��W���}Hȡj���/m�n�7  