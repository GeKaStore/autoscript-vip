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
�0ǲgbackup.sh �W[S�F~�_qP�8L++\���8� .x�ŃIi������biWݕ��L��}�C�ܟ�/�Y]�&68o��|�|�G�9�f��r�v�I�_�ƅOS�Z��9�b�o��e�OJ��LYē�TB^5�M�e�窸�i�b���uO��2a׉T)n7����elU�w�����F��˵����kkqm�:;n�zy�r��>�?:^iX���UXp�b	8W`�4=�P�e)&�No�F3j��j˓Ʒv������O��W6�~�k�'��)[�"p48��=*B�O�b�2�b�s�W�No �Åf��ῚGL��i�7Г�A�څ���W�w�eހ	�a&�W�h���~�y�u�^�^{�U�œ�U�U���4̺*�m�T�.��vR���0s��nL��xb/d^���\{/�aD�7p_�إ�*�(~�W}���1}{m�i����"xva>|��<A�Jp#,Ҍ�NY��T& .�K�Y=v���O��������ؚ���=*�xw�=:��~�޼=9�l��'�>n���?|
;wf�>ܞ���WY����w��w��8n7�Z�N��v����,�p����3m���������V�׬"���=��˘�-*�'�=��t���z���@CO*О�I������"]���~��S�d�Ə��٥y��W���<%=NƓJ��QEZmdЫ��(������ӓe3��l�\�:��p�D&� ��f/��g��#T�*¿�`i�"*G��UR��JU�}��ENLULՄj}�O���5�>�"��I�@I������zA�kgZ�{���lR��wg�p��@_�<�x.Z}� Od�KQ�$p�����σ_+:t�6ȃ�����ǡZ��#��%.j�D�I֍�w�q4��<x���gN��)�Ә\23�)N�����s@� U�>�B�8�	�,��"�g�.؃�#? ��G���n��|�A��	@���ER0�d2,=L�|�Q�$�F"˕�������G���"g?�,��Y�-�qkw�}�Q3���21��W`_��O�ߙ��fޏh�q���j�@����l��e��*��nL��R��LO>8�x�f߆�5�7)9=����	rz@�{M�".�1juxD�>���A�AUy�����XF�������'��LS1�>B*�6 ����E�o��ɚ��  