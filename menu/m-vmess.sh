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
�0ǲgm-vmess.sh �=Y{�F����6E�x(�#���$FbLQ��k�2�H� �@�p��}��>L�y��=R~�Vu �K�DŔ:3"�U}T��Ս'_)�T�Ӗ�Oz�sSu����O?���6eH7ANP�w�խ1����gI��6��BbES]P��)v�a(n�u���j�y�����#�����Qi�g���7�,lT��y2��O~���z�>�^��.c��w�m�>���&$��Lq�[�7ú�{�w{�$oy�M�U7)�=G�T���-���z���:��V�,%ሩ'.��m@��i�t�b���f��vݞ��d,�e0����gY�y;4#?�'ͨI�h[��t؉�;.R�:w~Kd�]z� �dm�|����~��@��[��ު5ײ��cvWw�2������dIk3����G[I�����E/�S��G��HB��T�;����:v?�`7�S������H���o gΔ�ֶ m2��~1�`��~���~�����W��<�޿��+���?��w{����?�x\?�m��pxT�/��|<4ZHT�'����r|�{��<���N�(���˵Z��
;�j��_�	� �ih}��ﾷ�6���M������T�����&kN!5�0ݭ�%�������S�G���댐�����o��Q5x��ͮn��Oƻ��}��ҩ.�bS��ڒ֔ʵC_�ږ�*���KI����h����)I��mˎ>��֩n��zy�T+��j��b��V�8q��LIoK�G�]��̔t|Tj�����`-[��ZvKiXn�*3���	j��R�"�P�����KE�~��!gX-�"�)����E�h�pDI��W�"�Y�)j�o��M���nC�7
@�t�75��f3������ꛮnpeE�
��>��*��1���d5��<{F�R.U�'�ʵzm �$3I�͚�c�^�l�_h���iݸ�zd�K�l���f�@>FY�ʉW�G ��֧�����ȟ����\��XH��*�I�I�2]���Gs}�|�vU��������j������_�Y��j����ٺ%g#!�LȢ�"���|h��Q�K�Kp-h�ZG��G��i�����M_U���)Υ�t�m2�H5�B ���쪎�v\]\M��$��@�lA颧��ݮ�U[O���	��W��wh�X��#�=��!�:�Fw&���] )+���-��cӠb֤�p^���[�:7�ݭI�9�x��2�J�	�uW�y��e�U��[��!XNq��`5�`�Բ_A�BIG������D$b��ĕ6����֢RC}�_@��#�<Rh"�͐���"E8��� ���ʇ7b?�!�<�X���AR�7����Gi��J֛2�QR�G��2~{)����2=Hb_�/e���!
�KN���[vO�Њ� �{k�������Q:�N���3���_Jrϡ���RJ Q"ly^ֳl�
����S� �y��(��w�q�s�WT�6�SH%�e�Q��k�~�-����U�}'l�g�Bg!]x��={�a�.�����@4���H�����夡:웵,J_ɨ����$1_6�]�����{��nv��=�=q�@�GA�����I����qxȱ
A_�v��З��G��zR������=:���KPY�:8<x�E��b4� \��]��[�}yj36�k�"Ss�����z���7];i�]�;��V��A�TݑNn�����.R���l�TS�ƖS��u52 ���Ib[f���h������O����u�H��kS%��ZR��[��3	G���t�^Zc��F���_̉��	�d�\u��ܑΝ��s�u�&u<{��f-��t�-\u��U��/�2��y�u�vc�Ҿ���{�K9�-���R����!��X<<�y0^$5�,?qt�,��5�J�u���������gu�^+U��ͅfu���^���<n�E��~�i��/�
s����P��zC�}3p�>���,Z���P�|IO#H��B��52��:��FF�X���!� 	e�d鷿������������f]������%���.����ohV�m�dCῥ
m���P��^�|Hې���)���t��3�(&q΋�^	���?1���H z|\�	!��ʅ��Ң�E>LF�Q�
�����$>�2��*�8#!��O����=������xL�FM��*
�!ҡ���n?��᭖�������i�FnQ4�9��_ O����m�N�x�#!�~��������q�c	��]��1!���A�P%b�G���݊�W,�b��Ф�9�|QH���E�Ց7<��o�hm�=��G�I���;j�`'�q�S[�g�3����\v�$
��T�a']��E�dHU`Si�3��Ƅ!�+���rBdo
p�r�S�#Q����f+7�I�2~v��t^�i傔ݤ�OO�֟�?�%S\��P��� �C���Fc�����U���U�5Ԏ��q�7��������Ud7�>*�!�K� /c+�Kc@W|4��-Ջ�J�n_x}�JG�H�,... eO�DA�!|T��G@�[�{���:��f��Y��]5�H�o\���n(��|�U��o��&��\d�M�O�[���C��e��h:�bX��f3\gi�
YŢ���F^f�D��gE2�x:�݉/U�#��0�y]<��J2b����ǋ����a���Y,���;aL��������4�us��DLf��71bϏ71��o�D?�d
�0F�v�:�b���i�Ŗg��#.����JQ;Xc$<��m��r��q��;数�9F��t_<E�w���A����<F;�)�����I�ؾc��:," ���"��x?��{���r9/F�sHs�!)�{��cV�b(���P�-�еa�Eun����q_{�DƏ�ϼ�"�W��|�zΥ㲮�`3�Uю�tk���~��C`��ef_�������k�1zQk>�S�A(�N��c�C�M(6g�w�f_7�.s�^�;��<[ࣘ�����/� cA�����*��6G��}�N�d�"�����g!s��-�{�C(�h��7��m��M��71 bTac(���W�T
���-�{���(�5�P,_��?Ea�d�_�犷��{���<��E;DΑw&��Y�Q{��3����L||&>>������g��3����L||f���ćg��3���;����^|F&�2���e���y��/�o����JB�1���i�������7���8=5NO��S���8=5NO��S���8=��驁g>nE�8U5NU�E���Lv>��Z=��*�|w"�^0|���ȟx��Ą1y��7�(�^�Y/@�����7%�<QJs��_��h�F#"��߄��)Y�_�o����Շ�z����]莫�-�������4�6,>�?f���!�1�i.��Qv�Kd�s��q9TBL���̏���P����[�^ѧjxA@O˒��׋��儐��Sȥ�Xf�`v2�P¸��!,�n1d��;��'�,T��w���F�93|�7y���9������#D�{v���vM@5��a�Z���,���)a{��<u�WV��&�͍&��E)�R�xe���A/��).����SR3��u~.��S�"��� A��
�
Nh�R���o�2H�y��O`�"���p-�O�3R�e���a��>�sMiɳ������|8����i��V�ѫv~8*��n�9*UK�n}���Ku��U'��@R���:tN��_���QA�~8,�vFҨ��6�a���F�{�꾯�����~���Os^�4ǽO�}�S��&�t�6z�2�7/�ۛ�/w}Ӽ��ya�7��p�S����LO���b��[.�
��-�7օ�
��6ˁ�_���|�PD��5+�(���{�qD!�(�l5wD����2��>�*�Q�[FF_����o�����\/�\�{�#ʇP)��>�w��wQH���������^�VA,�ݭ�yr�πm�Zܶ�%�z;G�'$/���M�����������}ny.xz�~�nb�_�I|Hv��T�M1�c�p1���[��b����n�Zg,�c��֞��J���5��k�Or@yR[S���4r�nDx�O�<����`sZmY�4���R�4xy�4��}�5oR��N�WN��u���h.�d������(��6��m�)UJ�ң�D�C_���ie�y�.�k%��,ng�
�Ќ��Kc)�l��x���9�i+)���}�-d%�n�DV�t�_�H�m��4�|BF�f
�=�^ყ�ϱM�����P�o�D8W��?� ��1��������_/ޑ�=]�$�����/���9POR)�!|F�������
k�[X:�KȋF�t�l��U�tZ��eN!�����9W�9�b��� (�`L�����Wߌ�ZYY@/k��D��NC�*�j-�zB"���������x��{X��4��Np.£�:�1҈��=�g*�M�:_募���:װ~�������îLV�� �˃�������B��T��j�\-�]����^�����Y���1�$��;�c �@=�@�g�w�A�<:h��R��G�����*�N-��,�AJ��>�Ï.�q!!�kW�pX�A�Q�/�jd����5H&���=W*j�MQuZ�ۙ�(�Uʯ<q�_s�U_�4�\H�b���\�N���~��)�4��ߴ�NS�e�e����t�&C�)I����ؒ��u�J� �Z,��І��4]˄^hD���p�M�P�
�w�?!���r ^3y�͈�$�r�g�V��<W����ZD�y` �0�S���im��u�!>�Igݶ�D�E;)��{�����o��#C�HH�|��'�z�Z\n���7%�$t/p�����:V	��"�h735�)�����?d���݄�%O�C[k��"�����S�wGh�Ӏ�6\���ߏ�L���4�b�R�-2�8�FA�m��x��a�t,˞�f�Y;8O��τ��w<�������ǈ�4�����X#�oOq��٭��o��~�0���o�����!30x�z���;���%��5���Þ�1�Cl��p!������mK��H$$ZY� ��;f�r=:����q� }�����*V*b�jhL�5�Dn	��5N����D�n����/U�g�Zn�g�B	�F�&�F��YPf��`����ݞ��,�&$D����<����@	"�HV��:�HC�f�v�?�w�(ní���ru��+��V��>��É�Κ�궷?	�*.$(�Q�V��av����*��}f�f�����q�x|�hu��ǔ�t�kv���MY�"�$^���~ K�����\�Q,x���A�5�i����MK�o������h���%�;/�r����X��q�\����7�+���q�~��wT�Y�[�Z�Ñ����rv*�����/����]Cm�;����]C�}�b�~��'����~�	���B����A��Vo�����A��]�-]T#|�����"-�=�����,w `��O̾ڇ�Ti�CC���aܪ�%�;�	Mz7�P.�b���=�н����TӃ�K,X�F��k�v�U�%.O�����S��nn�1Q�3.F�-�<;�r����a��>�u�\<�(_�b�ҭ�V�xX�W�e�e���v�0�����S:�a��wh�e�6��$m��W�T
JC7��sg �{��PN������C��OQ<����<W|����e���V��)6[b9����M��k���	���X��VU��1�wM�
�iic���s̄0�x.�f^�CQ�O��$�E�V����|SV<?����]�o�0��_aYThӒR)�X�X�
6J?L�"`ꀎ�6i��>���&$�yCd�RQ.9_����r���E �j� �v��Ë<�{B�#ψ�����jϋ�9};�L����RGv�	��	�Q��"�>#��u�t]�5x��<��$ء�#|�C8e��]���a���s��k��1��D���c^�r���<�2�Ar%���c�CU_.��%	8lѾ� ��$]ұ�����<6���-��s����� ��7u�(�?�\tv�?s���O�JiÌ%��WN�<�����l�k��ɦ1�� ����O�����C����D#Kk���-�l�Q֨YEOW�DW�5���%W�}�5WR?e�9c`�+]��ETu5��u�X��@�3+g#�����������8����9���V���
9�q��u�jm�C�2��ueו��I�2��FY6���(rY�!AQP�}b�DU֑z�b"� �r匞�oX=&p[4�qۆ�z���p����p��'���Gr:>��m�׍��{���5ܭտ똽�3��A{k�ڠ���!]AgQ"#*� mR��s�Y�gX�+�O�FЉC�ǧ��b�iv�o"Q�q�'Eh�]J����d4F_R�II���3�oZ͏w�+YQb��Է�i���W�3)'���lp�S��6��o�]�J�IBW�L��.��C3�L�d��W��8"lH�0Oτ�xOK�7�h��jca&�c.���V������-X���pEh7I�h,���˵�D�+6�c���k��w�x���(�w�c��ey��Y ����
��11zA	0\�N��l�j,���td�8��޸f4\e��&/�L�����3�K~��G<TE~�ώ}�Z�8�ȸ���t��R���(H�t0�Q��K����@}�H�EI��(�D�%I��w(�L�e�:��
!W�Ģ�d��=��SZv�G�e؅�io��+�сg�G�@��o�K�����e�w��� 