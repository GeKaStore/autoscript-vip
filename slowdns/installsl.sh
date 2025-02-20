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
�0ǲginstallsl.sh �VaS�8�l����)�w�Hi���������i`�=��(��8�+�!i.��ֱ� ����2���ݼ}�v���l�R6�6�S�����/��Q|�
3�������i��<��i#��$g�����w��c�0��>e%Ҫ��_�����r�r�S�p�u�n�_K�K�~�6�ŜW�vzg�>�z�{�o��;���+��#ş�"�$z�0�?���X{V��������@��b=�b��7��g�*s��d� ������×.��4ҁ�Le�]�X9�B�T:��N�i��9�y���N�|��I����m� H�\f���Lu(�3�(�:6~ƾ�Tڗ)IT��}dw�mq��X��=��G������He!���Þ�Vfiپ�S����4�M�Y�(,��)�luJ���� 5i���*��U��>���v�(��
��,�5Rh�'���$c�����a�;��DB}����,˲��~�wga�,n��V!�K�ʓb�sX��~�I:=�3)J��+�UZ�}Qb���!�0fFO�I3≕�Z/�F��H-��w���j��YF�;���W���h�rL��Q����N�?�}�|y�ǅs� P��I�Ь�6ѧ��WN�.,���f,ͅ���C��|���⺨�[��{�Tg<w�
�2G�*cŽqϖQ	2-��4Ox��Qy�#�O��ѯ�]�XV��9���s��_s.�
t(Sz"�(�Qc|���1RZ�Ґ����R�'X�1<��`���:9
���`���$�Q�"S�t�dn�&+�-D�l�vqDؐ|�\��r�x����|���%���q�$�C	�ˉr��ö�h�	  