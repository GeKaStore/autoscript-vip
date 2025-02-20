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
�0ǲgm-noobz.sh �<�v�Ȗ��+*
���`q78��%�  ���v� ݬ'�53/�:�W���\���d�$N�3��6�2h�]�v�kU��ɡj�Cə�^ ���2mW5Ơ&cOC���-����q�F�S�Z� �m��G�qW�Ӧ��X����5�sG���Mʹ�+�#��%W5�Uo�)��Œɳ؛d\_S-��m0����j���ܠ
�6�A�6�f�oֶP���S[�d6�[������+��7тd��+��s�t��牳�4��	�?p��{bՂ�J�E0��ߨQe�~#_L7��~�&�Y��۴�����À�F<C3l��i���������z�F����5�.�s>��82�A��"��X��{��]�X��|TL�]��3h�#p��<�t�#��j{-��s�H�����'<C��H5���ʶj��uS�y��P�k�h牞b�;Mq)ce7̫|��,����L��P#QCď�>�MctB��'C��v@l�эZ��#��J%�|cZ z��Ȟ��	�����D��T�/�Z(�f��4�x`%!Y���ST��X�`*l62����q�^��o]_g��*���8�Ȓ��ڵ�;�⹞0��Z�=���0���D��f&޾LU'�!f2�(��$#	�B����L��kӭ��,�l�S����Ҙ����p��:5����ʕ�δD�.N��\c����)+3�Lg{�骚l�G$O�{�H�?��EӡrY�M�{ܟ�|)7�6�USnM4��YTY9��R��>�e���ľ�j%U��
5��N�y|U�+�QMM������M]���@�VJm�W���̳Ch'�iO���$=+�b�<n1��(9=���ݔXmf#�Ӌ�w��4͆a/�j}d]��\���B��c��U�r;R����Fz��:ۺ���ހ�;	3rZKVȪX��d��X�a�r:��tD�M���2ӌ���NSk9V�:�ȑ�W�,����&�SƸT'��/&JV-+�5�龑a�3�}X,Z^d�fQ��z���l�[xҩ�*f��\G铓Y����xϦk�F�)���1B,�U.a���"ƬjFZ�0n�Ԋ���牥�!�FJW�Q��F�WNH%n�#O
U��Eq,D��4��.NEY���Pd��1O�"E����q]��]1{Ig��0�y?-���u�n�:�1,��#�b�W:���x\Hq�Zu��e���ެ��u�-'3�H����r�Ӯ+�iAL$KC�Tv��x�q&B��{ǵ�^mɥ�����Β�WNx�봲�-�]�v�i�$��c�N�2��R]�5��ʤS���S�H�9�$M�>�_��u�/.�k��b��BJ�K��+����U��X�PH\��yơ��إ��a�\0fzcVՒs]ʣa�sU��#�ˌ�.�TW�Ν�,R�S��kiZ�;��|䎻�QL���/�+���h�x"b�4�əF��NvR�abZKe"ͫ΀�;�z�'�O{�X��J�\�l���	y"�*-A�Oc��Ӂ�R�y�fl\NÜ[2�U!E]*=f�DQ�&�cVKQקFڝ��*͜r�q��p㌙��hk�V�T�q�ؙ�"W�X�.Mct1G��\9wi�Y�|L��gV��Z�YS�R�Y��KD>�n4z^�T/]�ש�;O_:-����g�\��f���Υ9#��q�ZA��k��S��u�/̛�Y㴨��l�r����4��V�֐VK1�C�B3�WˌHP�&?��ɶ6z��	8�����m�mI�'�
S�B7��&�Ud����e�e�QjLȓ�d����}�#*�Uҵ%��+���.�zlS�KQ��	�ݻ��BhEQ�1�w
wIb55Vh���m�.y�:�a�f��.XV��a����X�9R�Ð��!O�c(�V(�-n'�IU9�n�l�!?����圐�d�G.� �]?2�194�0�K:�P��qP�O�S�T#�Ӛ�ܖd �i�Dbo8��b����C��s��eI�3�D�C�i�Ii�����#�O�Q��V��y���@����ׇ�F��'�A���/���/�����o??&>�������Abvv^����o���@*�IqL��0h�%�P>Y��e�_��)��Y����5���kH:2Ux��Ӕ�ʴ����g� ��@e� �/�ǳX4�>)�+���@5�M�U届�pO�:#2�9�D%`��@���fgD�$|]uH�"�
��J�k��6DX����va�!�f��hTR�(��p�� ���wQxJ��IAf��w4��2"��~��}�?�pD�A����H�Բ�����	�x�jK.��Aɲ��
�:����� Z"�J|�laÉ\Ql�O|#>��+eI���g��iڦˋ/��B2~��_�>/��zU}I���$.�P���ן���}��?��F�0@e!�h�����*6�ˁ�WաoÁk�+�?���sT���V�&%�_�`�PVص�� ��!��E�/�G_���*"M �!W��W~�{@6��@G[�(?x�T���[A6D�y.��`���ZM=H�V���|
���~�OD�0�4���@<�?=�"�Qd�O�d Or���/{���e4�K��������(R�窒��+Eu���9�N�-D�-�Tx���r��͇����$ہ�:ދ���F�0�}��������\}���%:�/��`���*���	᳅	<#l4�RX�Ï��Aģɠ��M�<"r�J�������K���w��X.�	�ןW��F'�'PUTg�܉ �6M#9�}�HK����Ws�7*'��|�=F�qY�סH��m�}�ހ.[����[���h�ע����#��z3���h��'���H���䫾�<���گ� �kĒm���������[��l*���*q�U%��j�`~�O���B�K���$���A�V���6��ʇ���Md�ï�m���#���	X����[�'�j�a�V���N<��*9��%g;�Yf5߄�2)
r��V���Ⱦ�9�:�:���r�҇e�������~�
�{�O�;j��������H�L�_9J��С�!�7t
m��TLl��/���h3��������-[���v��>׮��Q:�k,É���%2�2������UC�0�,؛Ed�)܀|�6;�Ϟ��oz`"� 0L ��_�5������g��]v�6�.'0���`j]	}M�CݜAb�ZO�|-Bc����������i�_�	 >�@�`'�!�-���p�~�#��&��ˣ�Cpz�9���<����!2�W�n���u�̗�)�����I|gM��¶�R6�\p���w���������[���vVT�5�����>!�G�O����������`�+�~�]�":?���
�T�lz@���`���I�`��P��]8��sje�Ƴu:�{����B]v5d_�+�.X�}
� x��ޞ@������V(�[�goƨ*�Y�)�k���5��h��F����F�o|�?X�|�m?MGo}�T�;T�ۮ<0y���m��3ӽ�������2�w煔�͋�a�q����l�ɸ��Ɠ6���)H�����`_W���2rHϟO��)����f��G�j�
�⑽v�X%���'�x��+�២�St�}�e+�8ӯw�Y;�:������o�#�12���E���}���w��"G?D�	)�������ת�xPy�z�^��(�?N$gr�����k�Rt�>B����_�~���T~���e��8���%nB���E�0��D. �]誧ߪϏ�p��<�&�k���>�F=��3s��h���;��5�~�1_�do)����bx���0�ǋlbeISi(C��j�U_E����@ݓ���7�Or�8���2\~����	 �x>~�� ���
��L8�X��h|E�j�>>�eu�+W�f[ SoS�i�s��Uy��-Lqw0e�2��Cɕ��d ޖr����d��s��Ȧ_S��	�㪊43IS�#��7O����b�SL����ǴU��7q����S^*��W���kx��8��xx�5x���bP�6��5�)��d�������.N��#T�=V�)�燎�S����W�����&���2�S��o�l����P���v�اp����YU�}	���9�?$_����</���������n9N 6j~��7��%L�ɒA}B�Z(A���x���T�͛P��Nl0��̇����<��)�Hm�Wc|La��d}x�3x����c�9��h��6�g%<�}��B�B@�>AG�C��i�qX  