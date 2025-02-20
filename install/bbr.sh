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
�0ǲgbbr.sh ��]O�0��ɯ8���I�(�@�]L���w�d9�Ikձ���+�}v��Q�5Ы��yΛs����M;f�S=��ï�a9�n����O�]�)�����'&����w�2��щ��CKDp�o�%��>\\�� ?ޙ1
�� ��߇�K��AƼ��Qg���y�ǘLȕH�K�����R&�T�m��¢"؜�\ɭ��MUV��ІrN���9v-�p���Z������A�{�R�r��t)3��Ze�]�t)c5.�iRhJ% ��kր�%�r#�C�W(#�� V���rm4I�n+9��4��� �"�u]����N_nh�� Ō�ܐ���. �� +�����k#ԆI���ܒ*-u���n,�tj�Kc��`ۍ�����l9cU�od��2IPkg�q��Q�����
{zɎIu �$7T�*��qY1kbeħ3�l>&�bf��V�Yy�-h�2c�u°	dLU�B��Ҽ���������t�Z9�iG`���L�sRgQ8z�Cf��)N��4�p9��N?�����c�e����^��t�H��0�5c�QXjlNȘ v�P��B�a3����M�b95���B��p�PN
�Q����~6T�n����at�iβU��d��u����j#t.�6�yeねO5��V�^S=��9G��;��ۊ7��������ܔ��.��~� �h��5��<n^�v}�<�C+��;d��;���M`�
  