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
�0ǲgxraylimit.sh �]�r����S�!�������V����*�I=n"� D!Z ���ȜI�rә��3���ӧ����
=gw�K��d�φ����=��������d�ֶ���GJ���j����$_��J�vi���R��,��s�=����F1\�z�{�(,:#��ͳ�TcG�mj��l��aQ�z�P�b��ت���ϕz�u�z
�mol�Vjv/�`�t=�GJ'D�_��
F��nK�tX{���kDӺE���������>�{�X��W��?����:��5A���z�s�-W�zE�L?��|�$�=JJR*Y�o	��EM��#�z���]j¬��5�W��pI�T�d�N˼h	T[�����2v�MT���k����~R�Z���C#X3Jq-����{��L�gz�����h�c�T�82�c����b��) m�텶�{� �
)�I�W��,��<�/ԇ`�uH^����L
�G���_X:G1�#��S1�o�7^����>�������p��l���Kx9�+�uH¯��w/�~�Yy����l���Ovv�7[/7	'�d7A�[�Ԍ�y+��c���,er ކ;뻛�����Y[�j���{B��Wn�#����U�;$����m�Y���d*�^��0L�'і�ɡ����'Y����n0��[�ؖC&���oR���6o��+�ں�;���A�|k1��R�q�S���!�`Gz��p�� %JB4�H�ˈZ���[��r)��r��N*��-Cw�����qQa�m��+p~��w�U������^C�V ��X�o���28u�ڝ������:��NQy���g��\ղ�u���
Ё�Ng|L�qA�ƛ�˷�~�A!��7Jko'�s]��-B����d�a�Ӣ����Z�D�a_��������T�}v�zɾz�{hQ��Ӟ��Q��r��>u��xuX�^�gp��t�
Cj��J�)Q���0�8"ׁef(h����5Hx4���5���u!����"�FE99����g��A͐�V�� W�y� ڞA����]�6���OP��@�Ҟl>W��B\�5^9�`	����ۃ���2�,,.�/��b�%Ţ0��7�~Y�2aW�ȑ1]-��
[�� �@R���Cza��)3�F�n6|���H�R{������U41C����O��Z\\���^�E��ދE�͸��ԟ<�>�� ��Xt�G�7W�Xf�j/{�c���UU T8[�&�+�)��=�\�oԲ-��&���q��H�7�{؍��>��3{�[�ч�dr��07��j:��0wu= �>,���HScvQ06u�U�#��~���ܝ�`d9�@�4(�� W��xo��%�:��q���JQn��;D���m���=�# �x!�2z����X�G]<�18po�*��������A��CA�,���22�k�EE`����EŠ��J�d�E�fZ,�aK����b1?Xǆ�-U"���ُO ��sbE&7��ú��)��=8�O�:�˰�&'�+";	����hiEY=M� ���e���PbC`��{�h���n4��3�I�H���%�r�t��B�6��XP� ߥCR+=�2O@d�Lp�c�G-�D���D�/�*�_��:+�~T��`��>Q���R�Ԣ��&���y���_E���hޱ��1,���F��0���1��$�-���ǃ�8�VkO���.U+���a��6�~8J���g�采�OA�	C:�c�%�}g�V0/�"+I�q���ahΔS��ؒg"����N�W b�z�9�X��EFs�sl�eG�:B�M	D��� �UQR�]�%7�����w��А�i�M�4E���𔋄WКo�o�ůP��˨J
B\�P����(T��;�w��@��ՙEǏ��y����"��)�������?�]�+�2˂QjpQ������ҙ:%e/&�ٓ ��r&��g�m0
��F�z6>Y�=��XC�n�����u��09Dz2C��	N�����b��������:LF�@0�6���Z�1&(ц��2�6�O
R&�
�����������,n�l~�����:��o�.k\LYn7ɇ����;�N�{d���~�ll?om-k���w�������Y?(��݄�1/��àƼ�R<��߂��{�[+��X.�%����_ِR-1���Hx�9�<붃ҏ5WN&��C�at�8�!���Hϒ����j�.=|K6�xj��U6��Ȋa�}L7�S>ل��e�ryY�����Ry�R� ����Ai�9F�W�m�m	 ��/u��q���oq�s�c�z��'f��q� OЖyҨ�g�[ �;��t�7l��q�l����ݍx.�I�$�����LNG I���N�#��ȴ�Lַ�V�^�ol48e�);+�/Sѥ�j>�/����(k�6�<�b^�@~�-	�p�čBd>N7��%1ͳ��AAM���a9��~m���gn�s$ϑ|FH>����b\��rx����S
ޖ�'|����1����o?:ʋ�4�Eϧ���T�,����l�0�E%�U�� ����ZNhMGhћ �(Z4A��|��h6�E�~�#��'����(�`�P�6���pY~�0q�H3�,� �c���,��#:JrX8W�a�p��`�-����K)Wa楸��V��/B^%�	uucS�L3���;��J��(k���q�U�����k�4�B��\͠߉�l��/r��eWt<cE�ʮh�b�)�*��eW#�R�U��S�WBT���)�OO��@2Wt��i���oE���(oEӼM�V4���qފ&����_�U��]�@��t \�S�	��l/:�G��i⼏��v^s~��&� �&{/h����0��0�9�p85���T��<K�i�
.�ZN�e���!�ҸMr��l�[��9��r�[��!�h���)+�;��f�Y�sԝ�|�h3��m�G��>-�ż�Z̓�V]�8Z��b����z�gM�g1��,Xt�n/�1o,�ż4�ť3-HL���J̋�����rqFj�I\�%6����dN��;�1��Ւ��-󮵨���q5Ė�z���F��2[��Q���ː[	s.񱬄�L������d�ԙ��J[��n�ڌ�Fڝ�pq8��I��?2��EǓ0��
���a���f�\�"R�"I�N�\i�	�aeA��9TWjO"���b����t�(L�]Y㌗���r29/)� �DY���%�*�y�@{A|��3_���\ٺ�7&\!��nx�6ӛ_ᅗ� ��.
������vʺ�� �	�w�˱0�BgF4X��92^G�0!f�7̈ɤ5� 1�r"n'���g��!+�����b�ySc�g�w4)N0ds�K�^��6�%i��u��Ϡ�44�I��D�I�[D����Bz��4n�eش���6B-2�ҜZ��i����q�Z\��ɵ����x�s(�d�Ϝe�ɸ�D[�_n�k���K�mqc�c�F�NE��C��n�XN���9��_0_Oh�m�Мp9"�\��9>N��ch8�]L^��d\�9��qy��49Aɉ����O'�ϛE���i��x8x  