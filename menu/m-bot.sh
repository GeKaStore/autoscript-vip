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
�4�gm-bot.sh ��v�������E� D)��tC���J�tD*�����!9!� I����~A��{�o���`%	ʔl�ȭ���,��]f�ѣ/�s�	�
�2%�Һ�hA�ǜ�[e�μ�bN��ϩ�N:McN@�E�1`u8�9���>rݑE��k��j�oa�S��S|�	�r���]�A��rڷX�q�O�/�h_�ڗ�
�	j)G��ż��,듋��q8q��:��T��{��]���m�ut����*Ƙ����^�+��襗J)^/a����b�+�g(���5�"0�!��J��+x	�+��� >���'>���9TvP+�s#��9�?<�����~����������ku)� ���ۯkא~JW?�^���ߡq�;����zpt��O: �g?1����z���}/E�����S�~�[���q������:h�����?nlm�n��ڲ߸��uc-�',�%(u`�85o$(���@�d�?���C`����*���i!Inô�+��k�G-:�-�?��b�M�!�☄�C����K�ecȔ뼑U��WXW�A���/}2գ���p-�W��:���HO��|Q�U�`�^�ֆ]V~��G!�ڋ�g�~���R��cpT0�����+�xBO:m
kku�6L�#�c�|�:[ɯ��G��G��i�5�bK��d%MW,��h6�����y�0D:/��m\	��W�y��B�Ŀ*bx���\w���J��dx~�ۮ	O.���b�G���/�ŷA�	|��f6룱1�F�DTǭ�Q�[�@}1O���!�kU~��bғ��w��%����}윧�>D�8h�8�b��٠�W�W�ջ��1��`ǧh$�]��݄Rz��l��N����s��#~�7"hc m3]M@v�u���y��b�KƠ�ta����NI�Al�t���ªT�	����_ؙ�1�%`ZE�� �.C�Lz4�H�^�a*��HA�1^@�r�X!C���@D�F��W@'�|�:�N�S����j)YEU�N[�H$��<�4d;�Ū" #Fʽ��{�RYͼ��r6&�����*gR%��kwZ�zmC�W��֛Yl��tIU�-���NKa��afB'�Z�3�~���;Z�ffRy�HW�h08���W�A��2��ޠu�TNO�ϔ&��&��z�ٞE�G����z����r���P~���u,�иWQN��3�Ř����@s3��n�uI�.�KO�"��*��q�ц�Y��Z:mG�1�����n�g���KJĭ�-0	��O-7�J%q޹Ir)��	�!�X Kf�t	�D	����A�]b�
3��0���Z@#�sZP
���@_��Q�Y�͊W	�*P��ꇎ�*Qg�i� -267��c�����P{���غ0@�2��A�F���@��	ё�����R��O�<��:U3VH<��ۍ�����y�k�fԙ�ds�X.��X����?��]0�+� �'$`"������iQi��<�8C�ZS�vM�7���ZO�G�K<TА��2~b�֞�3P7�!J����.&����F��a֛��!���L���p������0�8P{:S&��!G�db�ʵ�i���I��'�h�����'�1�Ȉ'���� ������u`M��z0�9p�n��I��j�ϘHړ�}�>�]Q:�RM4�Y%�4�������!}���)��������o��ɓJef�,r�o�a��H��X��F5���:�P�b����]��r;	�N�}��z)\t��6�\�R|��1�`�2��g�ԥ�Q"ɚ}���q)/k���`�=��]}Tg@ȋ�L��|Ӫ��ҹ˕��_��L�D�ܕe��L�i����$[��M�E�>��=fe;�+�
�~��
�N�x�g�33EL��#�d��,	��0�hXҒ��r3��2�Z���rʒ�V���G�,ƶ��d�(�t�^|D�R|˩˖���:qfP���2�+�ˋ}(�A �̊�a���S�S���&=��2�.5�t������x�|Q�%��m�tNL����EESF(���(�QrA=b����r��"ϻ��2�r��D@�o40Տ��3vE�0[�I��o�~��77i�_� ��׍�^[V�r������'G�F��B��5�l��V�����F�!j��_���z�dG����[Ǖ=����l7vAn��?;�OfE�oed��?�ִ�Ϟ�d@d��-O��=�Nh��П�"���"C�$�JW����˯j�5釚�CM��&}CM���:�밮�ae��Vr��i#}6�y���TӅw���O`-��I�,S�u�u�_��"����{���@���Ō���M�H��b����*�ݘ���7n�m��`��'�J{�U.�g�F�3:ssAh7�P8��ш�-��t�������*:�5�8������� ���m���F�#ߚ�WF⾶��AM���� '�GD�l��[6��B&�ă!�x�F7�N��&"�Ё�4�~o||@lG���Ed���a��#�m����@�g���U����Yo��'�h 㔪7�5�4ڳ�j��s�Qӧ�z�s�������OD�=�	�ZUt��k��ۜ��n�M��m$���G:ױ���֪2Yy�˟��G=ױ��7+�AY�WN2,��l�AY�.'��)�F�U`Y�⾸|�45�2���Z�� Xҧ�!D`����3-������<��Rv���U$Z�fU�"�� kU���y
��r��
E�V$�����u9{\ik�#Re���X�-�
�� �"����XOLʒ�5q8[��3iE
�G,�D�O��(<��`�r6����qjn�܈J�p����\�Z��}P6T�}����Cˢ�vN�'!���(�kB���)���+��-�����R�	��e��2���!��j���:�A��w�a]��gf�o쟴���ۊ�t��U�Q��eDX�%���ą�������M�i��ta��Gx��sft$����ɯ_x���4�&�g6���!-��U\3F��	�H���Q��_�A�##��|z��E����%��ĕ�5����a��1�-5���Uyl���?��^�P����G��ssw��c�6W�a��r���W���1X����<  