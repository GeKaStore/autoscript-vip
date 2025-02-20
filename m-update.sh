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
�0ǲgm-update.sh �Y�r�6��)6�bY�P��C�8�Lb�I'����I;�'�HXB�%��gz˥�|�k���')H ��t2�!өƖ�K��p��={�{��s�s����!�D��u7��Xb�%�/cLP�`�X?��Y���o�֣�!|�E�r0~#,��~���m������w�A�0��l�����	�f�L�|gt�Ϙ�Z���b���N��t�;���$�A�L�;l�\��Sb�9���<�Ӿ��36AǛ�iLv���ht��=rEfa86�Q�Ҋ����h�ӑ�n���u��!�8�5����P�<�2�'Oo�|�l�˘�G��=��},���Vz+ur�a�,fW�������߿��?��{;W�'|!��o��+X�t/�<����7�~���h7���O#A�v�Д2s�s��#8�<y|���g�����*W�|�3w�$�A}��)P��")���PJS�=K"uO{�� ��I�EgVIᯊű&���h��	
9���59���H/��4	̊�I��B^��������[ӐI����-���9T��=����S��w"hF���eZ.AN�hA�!�:R�^�ce�\=�(vH��BCV5e7g*�قO���cs�S��	O,�끝�4M6����N����$,t��b��I�v���>\i��y�{�y�3��T�0����n�{|�F������prkk�M(�QDc{�<�=�������Y4l��ĝ�X诎��L�"��]��q&���  +����/N��������^PdyKy,���{8A���S�NC
��ư���;�wc��/+��[~�,�	�e��`+��|��S��3�lV�:�O
�¢fOx/I�e�G�Ƨ��G�̪O�%��|���[���AH}���o�Pmjc9C����}�4ʁ)k�,3���4��u+�YVg?Eϝ������(v)������;9J�5��f�tw�l��U3�bp[2�"�W�ȣWKDr�z&2XVQ��%&��H��xȴww&<[(�z**�V�Q9�6
��N���mKl�{��
�Zっ&8�a�}����!-Jj"IZ��JR��X�Z�T�z�5*ZQ�P!�R!�Q!�TD��b�O��}VV�ewkl\��ίa#�����F>y�Q�E��V>h�0�jj�K�Q�5Ƙ��Gy����QPo]��E5��Z}Z[�@k�򶰊J�#�D%G��"[�J��i[�)����U�T��)�WO��+�L5�m��lX�����DZ�t[�ЏjY����y��*��*��d��nᓞ�T6���dp3�	��2�:�mT~��Y�L�C%uOE*)��tYQ�{P��u���3�R�����s������n�a]�2�+����-�����U
y�E|*T�+Vt�Sݪ��nU�a4�j�<y6������qU��D��	ȣ��>���Q�0�1��@?�������t,q�4Jmf�_��Z  