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
�0ǲgins-trgo.sh �Vmo�6��_��A�d�gA����xC�5�f��*M�m�ɒ�c/�ߑ�,�I�%�m=���^x�?�c!�1�3R0�e0V(9�v^��4�4�9���4eZ$S�f�8�LheS}8�	�.uF}a2�*��,؈�K��F�f����r��+�&{��u��%{�߃�
g�P*�`7"����
!��5��o���N���b�~3��N=F��2fe��0�G舔�\k��5!=k�)8ޗ�~.�JM��3ir��v�7y�h����J*��4��	ӗ/�)il&[��h`Y(ΊM���J����k������^�S�����4��6E�	�*������6��ve�9	Ej�̱z^e���'*�*9S�)x��#}ݦ��V��*I߿���3rO(�L%3������u�~�x�:cyn�d?	�}�Vơ�`��m@����bp�6����1:��q4�
X@��`�LD�|/S�cͬ�S&G�|�ю�O�O�A%����5������ H�\gN��*���~ �����s"&+|����5�͔u�vnI9�8�V_�
	G�ј��	�v
Y/��Ź�30H�e�}D����zfk�>C+����vbB���в�I��t�E�mk�L���%3���5�"]�IuX���>idW��?�B}����[\�)m�I�_-=�PM�uWM��
���6�+��8יzq��^�j�y�[,�n%�8$��5�ȱ�-�vyc���>r�g��,tO;��v엵��K�����:�Q�Jw�r<���h���C�K��t�j8k�nn��C"�0����:�
l�n �+�{��?q��ɛ�� ��n;o��p��,7B;��k�q�~��p��W��3ūI��)a��	g��āA���'��)8*����nBn�����R��2�Ƣnu�*�ctW���Ǘ���Sv|�����O'�g�����#r\�}�����1�Ppwi�G�MB�������>�i\o�o����%�	E��i�K��_��R8<�Uvx�3����-��I��jXV�1��&�)~W�k�O�=�
�tm��nh��	�J���eh}�`��2��Լ�2@ct��2V7�@�����t��Z�/_��E��䮠9Õ)�G8������򤤾�O��t�� sy���
  