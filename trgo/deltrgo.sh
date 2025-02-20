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
�0ǲgdeltrgo.sh �Uko�0���%�fh���T�JS���umE��v��>���w��RZ4�	��q�{�����WB�W�p�r0h�_��
n(O����_�J�T���&�6�5-�}����d:�׻Mgm����=zf�L�ި�k?�}![���+Yڭ�����Lo,��Z9e��V���p7E���/�D���_�2�3Fc�����Go`���V�r�/o#��4@�*����jQ[��U�3�	��`���e�1&l��`.�P(	u������8�`��*�dx�u�R��M2���cޖ�~�j����Pb����uG�C�yr|�h���p@��5Y,��\.6jn�@]��5U4�*��2Q�T��+�%�fɄ�L&��x�і`6�E�
h_a$pO��a6�6[f�-[g'��\G�/�၀��4�
��[\��Ch�폍į�\�w�u`�t�s� ]Z�Bȟз�;::|AG��~���
٤VfL�YH-��ބ�˄�%XS�2��m�x�]�HW��b/#��je�`>+��Ĕ�����	ٝ�ֶn�#�3.��Q�8O�}�$�%��d��lA�~8����޵��',F�Gu@�^h�lyAo��ӈ��v͗�\ɉ��C%Y�j�s�QӄzP�qEB��j���
[]5i'㿛,��a�����GEA��:궷�D�)�s������Ժ1[o��@�:ʅ����/��`Bg  