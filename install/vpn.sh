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
�0ǲgvpn.sh �Xmo�6��_�)�� �X�H[X�d@�4�tC?��D�L(R#)+�����dɖ_�5�ebG��^ޝr�2��{�!Sڢ��ߝ\��rݿ�9�<�I%��L���	���ާ\Ҕ!�~:��|w�{�1��}�x�e���v��X��K���ED+eI5��m���=ߐ��C^�12�+�˓��r�Kr	)��$��\K�x����|t��Na6"*cd���>��lu���ߚ �|����f�M�`��8��H0��J�=�#����*i�Y<�)=��W��QHb6!2�?vP�B.�-�}X�Qd�y:�B"|��G�-L�&��)ֆ��T�,�[7�`�K�F����Jja�����},���H�d&�`R?��tc��40jU�f�Үa1�m�u��?�9���� �O��G�1Kh.l+��X�FV &�P@�c�
T�0����6ʾ}QW�J��6�k�f�'��N̷"���6QB���
{�:(D$�*"`�Hf��&��Һ�:^�D'�Ez�~��TC\��ϕp��!@ p��]���� ��ͥ�Y�L���2�3�t��èQb�5�z��o88��UnN����IM*�2�7߳i�R���G�c<�������h�s~9$�(����X��
������]	tw����V�u,k-6F<qS����o��D���@�Q�C\��L�[7�n�݈��(�P�U����" ���!��J����	դ(
2��X�}��:��Bk��!��dD;�u��*_HקD����@Vle�{@;�o2�D�e�:c�A�U��C^/-�m�uj�Vw,�%ekR�٘�ܢip���@{�,���t:���Զk���f�����p�?��xu��c�u�T�z>�~��h���A���Kt�L(#�,8�1�q؅�A��Qm����M�Hص�
��OKj���j�Z�yϏY��Hj��	T�������0�����r��S�MD�u�ׯ��<�4O����끓�?s`�Y�scո���H	��z]~Ja���@�0;̌-c͒^C��j��bZ@NYI�a	�Uf�� 8vId���?��V����Py��+-�>8�i�-��Cm6Vӌ�{A��ی)�����b2��{�1}���f��i؍�E�$=߁'��]n,O�x7��;���T��S���*;z�����PY�ң��
���1��0��2:��;+��Q�"� y��!��]6���>1(r�����@b��c�l�K@��^t4�+#����hYB~8+�x=� �v9��ZX����YYׂ�N`p.]}�l��D����ٰ3�;�Yxsz��&��65��2z<9C1��L�}?<��V<&�? W�佊Y�%nq�I�( ��7��Ql%�?�Σ��
:a�$��Z
�t�"�]ᓳ����`pt�i��Ml	�8A��.������x���f�p��Q�{!����!]�ܞ҃�ųC�f�i�� =G�(�3������%���Nr�~I��+�B*�<gܞ7;���˂�_^��r-6ē�2H��`	z�6mv�>/^!W����gu�9��[����_��`,��Zs�]	����ޢ��_S|�ݾ  