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
�0ǲgtendang.sh �\�n���k>�	CGQ���v[�4��J,�e	��M`�6E����rd�ul���@{`�^}�>�_���3�Q?q�6�H������3�9�͙�=|`��o��x���5��x����W<}�QAw@�x��(�$�"�z�؁D~06�Ƕ�� �6"��lH<b����ee�T��Ѫ�*�|^][;Z]_�b�v{�}P5��R�lx�����A�5^�T,�Gu��~^{J��1(���g/>N�����Y�W�׾�J
c��B����^�u���`:�x���Ǭ�X���h��_��S?&�F�1�.��:���<j����z;|F� �G'\�QTG�Jbr�Ҙ�(L5Ջ���Y�ʀ��?�FhC��/�wV�1By4�i����BCU��ľ���4���V���:�m����ce�h����_B�6�(���M�zGG�Gbl��H���u���b�}�7&�A� �{����?|~�����oO�}A���I�N ��n�ߝ���/�:쵻��N:�V��x�'�	��V����g隿��5_�T���ۤ�8h5��f{v���<X�)��5�U0���n:��
���Z1�	�����Y������X�M��K6�� �؎h���,(�F�l[�G}��;�o�q� �<Ѭ�C D��-?�/0*�)SΩ2)B�y�G�`0/4b�5m�X��7�b���+���݅�D#��ڪ:ŵK꺖�^|�^���juw�ݭ^s���⼺��c�SV�k�ZZǂK◕Ã�)�[!��t�*A40��P��ia�X�*N��<�E^G֍����g��V��o3�l�A��*v�+��J+��N�`̨�8,+��ޫ�b����b��0�fk�(8�nYa7!)�����eel]��ؗ�ڼP4I���	�h^1��W��U�\��'�П���A�2�wOU�=[[/Mͥe4b�0�����2��|�`H��fu]�k�0��Zϔ���$32j�2�6S	Z��R^C5��Sj@��H̬�q�re�#�O��,
����N�}\?��N��m��u��E�
��5`����R�b@��N�cVt^ͦ��<v�x���G��cѯ�ԫpVF]Lu���W B����]�~2�+(v���LĈ&:$Y�p��R�'�g����s��h�ʇ��S4�	0��zh8�y�J���nr9��n �!��GS8���f�j���a����˝I�j�����i�s)�������Ϥi���dN%=��Pk���b�be����n��v3�WW'��ov>\7=�wTrnż�Xи���VP��A�7����B�:K�w�Љ$LE��b/��f�.�i��B@�D>w�#�8#�X�Ő��w��Xօ���8�7���Yt��t��z���R��_��ok�\� ��=����D��&jկ5�.��J�n��\�''�Z���^$&hܵQ0�����	׌z<�ʶ��F��p�+/U4%u���anQR����Dn��`��":dXN:ֲ���/1�Ow=(�~5��X���9�*Xƅ��*
u�t���Q�����su&�=��e�kjr@O^��)������L��M�&�<�º<�ʗD�e�f�ʆ8d�����������!:+�M���?���B����^�9��zM@l�o��O5�N�������Vd�H��71[��w���\��Y_��[�R��ʬI����Kt�f"��>�=t���|��0B2���˧�n�����kh�\FaO,���Ѿܞ���*�ʆA7Uh�oͯ23��\[Io�@�=�Zg�#	�vť�=��)uL-9�=rhl�]r:&��R�aD�(��G�\3S��(����zh�9d����G4��s^�v��-�e>|�zv�.��lK}#��.+|�����j^j�Kd��/�4>�2\�|�x���:��pGd'��C��Čx6s��8�c6�}�.�)������9Je@�U�0$a�*"h��hQ�H,q�+�%L}�A�(�+o:�pc��Jw���g��0a�l�vMc�-׈��^x�Ia^3m��c6Ꞥ��R�VB}~�[����µ�8|��d�<����*�D�_%|����4�&�uXQ���������s!qT�=
I���O��/��(�3�'/�����$�I��BD���9������B�5�o$�CR=$�CR=$�㫡zp�
���zH���zH���zH���zH���zH���zH���z��X%�C~�*��$�C⒤zH���zH`�T�_���Z�F��~�������N	I4�DI4�DI4�tD�I4�DI4�DI4�DI4�DI4�DI4�DI4���I���@O$I���%I4�DI4��*��;%�wJ|��)������d  