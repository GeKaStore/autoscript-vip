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
�0ǲgbckpbot.sh �W�n�F��S��8%�r@�Jd�~��n ��*��c{���3�̰�H� ��E.z�G˓��� �$�^TJ:B����;���a��q�zT���v�d�c�3S{�����8\h�=����L����lח�Ń
����PG0|�, �AN�oҡ2�n.oy��|L���g;r�N �ޤA>Z[��@�����g���F�|J%�$aN�������5#17�F�b��Z�
����E��6���W*���
8��P���Q��L�3�o��'8��j(�3(~I��l�;��S���C���I%�2/�~�r��j��˲x���zX���\�.�.��I$��߇A�ꋐk��<����
ɎUt�;�f4�Ƹ}k�T���B{F*��LE\k.�Q�u�1�����w�0� "��x�(��L���v��r�Xq4�]������,ݵPo�^����>��E�.i�IpKX�ٝ���xs��������Ӟ�js� oH���9�6{��d~��o8|�o�j�f��n�����Ͷ��@[5򈩮�������^��7��)t�itO��^�݂z��l���#��|[�>ȱ�_;����7l5B5x�	�R!X�(�ծ�x
���ְ��R����~��5���8".��$��>�P�(]^�M�fS~�'��������3��|=�Z�2������z�͟A�g��-�[�w��f��
z�BU0Әa<�������W��s��Ku���:��	+�%����p{d1���^�� ��+F�Ԋ�T��byLi(8E�<x(�hMc���R�(F�`Wʸۓf!�kY��T*@
dU�,n���<w�U�o��K��3�D��x8ê��y�u�^��s�!��D�9#ӤPT<�vҵ ��7�"�O�#|J��T`/z�!y:�5�u�L�c���]��M��
2��6˯���;-�Yt}!f� �����  