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
�0ǲgrmbl.sh �kO�0��qʯ0�Z׉�M�e�n��q�`!�q�k���(]��NZ��e�4�]�O�y�c�O���ΐ�P�KM���"���R��sĲT"w�4;������Ϩ�:�^�;&����ZDR�-��P��P'T&(��2�n�z-x��'��>i7����TH�#Ak�z�NzL�su�uDuV]�袿���_t��/������|�.�#���-ry�Q"A��W�����	FUL/E���,;����$�V�jn��H��4���=��λ�V+w;�a6Л�±��iB�1��0��@S¤�ʒ��Ԋ�E��LA�� a���2+�����w5����]7��	��-u��4 r-�ie�<wo���I"��Z�S�F���K�ɤ=�{"�8;���N�!�Hi��@u�r����lN��y::B�4����~��ȯ���edc���}��_�V�0��G�����x���<e_�
�6��ۓ��7�Zu'��<č�J����,�6$�����	 ����w����AA�z������/lj?g@%؎^^��4J��)Wp.q��EJ�w�Ǐ&���w���"ꋨ/����"ꋨ/���Q�E���y�}^2�)��KD2HPV��B��z��  