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
�0ǲgset-br.sh �UQo�0~����R�R�Ihbl����D�� �8Nb5����}��sN��<�s"ߝ��>�w���Lj�1W�R;��,����R��_�u���х,ɶ�/@�1�.z+�c�3BRy߸KJ-�.J�6k����B{�Q�������ǭl|��U�EV��	A �����cw���Fطtkt.���Bn�sط��b��Nb��8��5�u6�ը:c|�6�צ�ni�pU2�[�#%�hx-��x��������29�ڍg�o�eOx"�	Ϯ	�@�N ��K��[���,���WB��&"��
n> ��7��u�5v����u��6��ԡ�ro�M{��y�	��i�B���(d-$��]��x�	}�K)8��I���:dT�}DD.ip^t!O	���҆���fR\f��(-S�al$�v�Ժrg�ӝ��-6����5!3��1�t	+�������
�� �
��ӎ�1��|�x0<^8��Y�7�	�f��پy ����|~  