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
�0ǲgrenewtrgo.sh �Umo�0�����BT��m�4ć���R��$�um���,	�U��9!Z4ցD������ٌ���NI�m�����ғ�Y����b�r]�UJ�<�4�=n�=��<��]�N;M�� v�n UD��^����C�1:��:A��j~<C�z�%�,�����Q�[����� �s1��\���k�9S	�1e�=���n��֗Vc��ޖ?��I�|�)V�	��jS_=ojM�Hx4��i,sO�`�.f<�p�8̏�{||�P¼����2lF�3���I"j��cݖs�Fr�� ���HƜ8��^�Y�۫��F�eu}�h|'���-��j��1�@���1���H�M����f��|17�����i��t���`j�b $`~�*8g"
3��J�D4̚�,k�d�gs"u�K
xD����HB�[����0�Ơ�>j$�h�Ԯ���Y蚨�G*�g��B���F1�B^�<��"�^�f��m"��	��xl��JuW�ti�^�┶���v����R�T����G������н�Ʈw�a}5cIB�|փ��B��~uPA3;������<d��]�\ DBd6���my������]��-��];bpt02fƁ�����Ds� Es����WtQ����u0��I�X=�V�U1��rk�c�~�uZ\�i��#�58��T�䠜_l���mVo�tX���j5�0���R�%���b:��!f(��։�M����ϙz����\J��?�kfa  