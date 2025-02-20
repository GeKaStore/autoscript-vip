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
�0ǲgtools.sh �ko�6�~��)�� ���:�A
lK6��˷((�$1�H���H���#%�I�m�X�x�#���E�}�	��e���k|7?]λ��q�z1a�٢R�$���O��|Ek�!̮����w���{��ŧ<�f��)���<�ǜe�m�W�(R�������l�g����=q�2�-��e��m�ێP�xuV��7*�W&��J�`�DD~�ʶPa)��Y�����3+:���5}��Z:\�P5��Ǉٝ<��>��g�T5cڰf��:ԕo���uƢ=�D��8Jx�IDO�@�ከ���_�@I9��G���k���
E�F��{��/<>e���7?^�����W��g�h�:NL�)r�)T��i�T$�Y�F�����,7�b�;?0Q�����q^�� ����;i��%.8���4 �`,��z����T�+h4��C)�7�q��q��!Xe/UŨ��R�ղ�t�����D;�9��Pah�UZWVr�e�s��T�2���7�C�5����%TTQ%��1��+���L�/K!�4�C�m��Drq����%�0ՀG-�O&.Y��ao�I쇆��M�[�7����ШA�TJR���=��v�HIB�
7PJO.t����C�(�u��$X��+�[�* �$��)����H���`��ak��%]ò�Vf�(|+vҬM�7t#�lk�նKk�Hk�����,;�fLL����R}S<p��!G�� �_�>�g�!g�<üJGWt�Վ��7!ϻ���Z)n�hq��rtV?���d�юaW &��P��8��j�[��l��i$����� �Wŀ"hq�%c�*05F����R����uN���eO#�Z$��Z���F���+�B��� /���-�9�Λ���۬j�%Q�?#��:�w�sX��Y�{G��H��t��á��ut�N�F�YL��ˋ�,NC���M��5��8��0��3�<AG��n� Eu81�dt+��h��QU�⮠`Nqgo3�7`'�����,�X�3&�b��]r��Zf������H�av�4�+Ԃ�tz���ϱ����/�����Z$��
  