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
�0ǲgohp.sh �V[o�H~���f%�f����nY��C�%��*���>�Q�kfª?���W��V#a�w.>3�7s|�ʞsaϙ������g�2��5.{#�i�S�:G_�ܗ�T$p���F�u����5���c��w�&B����B�7�� o�\�Q{�X��n%ן�����l�C��I�.�r%�"z�(����`hlL�?����8��C��ɂ�4cҖ�p��\�1([AL���2�ݨ;��3���p�?����yFr��t�-�S�������_j�ZىY��w���Zj�s����'�a	�dI����N/��bB'R�v�	��SLh�6�F���:�0e]?Fӏ�������@o�ť�l�qa�=�s �<a��s�������28-�]Pf%�]�0Up!��)��D�.�ސ�:���i� ��;JJC�,cs�p���\D8�)�N�;����mwp��t;�y��v����K��c�O��1a��a5Q�E���r ��S��t�F�l� >*���N�]��?�C�i��er! ���&	@o�Ja-Ord�Sn��ۇ�GrָL%�7�_&D�u'�í߿]̂�b#(�́���f���&����0�U�7���Ty G��i�}���+�F�v�y�}&�UG5�q�*��xq8�߼�:yMB#)&Ɔ�]���`s�e3��c5{,eH���w�\W��'�j=���H��0Z���;ug��_�����W�E�� ����'�������t�Mg�_<M���p�zM-A_����WY"��TP��%`�6M�����	�X�ھ� �(��D�s��4����4�|�P��	�h�D���kd�+s:�`<��+�`'�[�A�.7�w�:��V~���¿.5��  