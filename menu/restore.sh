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
�0ǲgrestore.sh �YOO�F�ٟ����*1��`�� Q�D$�"�{��gܙ1��V=�������$}c'!�ɲ=Tb[y���޿��G�z�m1�Z-v�J�}�)|k/�����oC��1��R�*����[��������jϕa+pu���M�O���Eo#!5�K�;z��㙳��A���{�Z,��n�ansL;����a�qO�vP;^+���:c��:�F���Y��i�kTf���;E}�)\��[����g��{�@��\�,��,)�'h���M����"�ۢ��ˢMM.Ubgc�X���|�qEqD�U��r]�#��|���������X���;0婑�M2����>�2`J#��NKb��bQ�����a��b\���(T"���4��ԍ��RLp7$x�Xd[^�z=�;��{�w��'��8#^cE��h8$7=�"�P}�8D5X�ϓ�6��..6]�-�u�9�h����J���(-"��oGK(j�������?���ߝ�Qyhϑ�ׄ��C<���N������f�Q>�֛P?�VO�L?}R�	,8G�y��_�}�Xh�/Ο�>��8�W���F�v;��je����wNPA;�~0<����e|��a��p�(hQ�a�pN�)f�3�؎�@<�*��@A[HP�d�VOT���3�t=,c�!��і2�M�i�~�o����N�P�(��.�H'�]�`�m2F�p���NL:��<!}�Ma�o��S��ƭX��;�:rQ���0SN�l�Gp�x�`Se�>�ЄnO䒔`����]La��Ǩoy��|&!�+��X�`+͒5H���lw�V��`j^�ק�.����!f�)����d-���)2Ri��,�ɹ��2�D��z�[K���f($�ְ ��n��v�(�w�@s-$�.��XH����R͛k
,�)\)�碩��b3����^�T;��I-8�Y�EC�da:���r���h��W-�
f�)�d� 4��d�Y�=�[�.�:��
��#5�m�9�{;e�yK�C"\�$k)�_L��Ӕ��8}�ę��tO�����E�%�s1�VsG�� L��<jO�]rD6��3�Vd��m�ftwWߍ��5,��/�4�#�=�ǳ��z�+Rۖ��ڇ/�}�(*�˫B��d=D�Cd=D�Cd=D�Cd=D�Cd=���� �����;�dmM��dmM��dmM��dmM��dmM��dm����W�_�C_B&  