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
��Ȳgsetup.sh �<�R#ǒ������V����y�A����c��Rw!��������D�ؗ���`G��>��^����/�/�Oج�{K�6�co�����2���V�<�D�< �H��C�hħ�����%i,�%� �Tk���'��b���K����+5lSÈV��e��Pl���`�z�,C�y�Gx�j���=�Ƭ�m*U%�y�w���v<�pī��`;��t�1��2\UG6H�o��+�6�t��M�X5�M���M�_��x���¯L��B�
^��"�
�LV5�]���N@,]���;7"H�*�n�?���Q�o� ,J5�mp�t<��qe��(з��p������SS�4�S՗.u�_�� �v�u�N,L���/��m�>x��خO�,j�V��;�����|���Rmxj���} �+����K�m�-,q}�d�2��p ���*�����W�|(�n�˜%�&�'�u�'�)a���Vf2F~��$3��\�='E�����ѭs��۲����/ps�넮�k��3��=���X�yԪ�o�� �@�@�c7��t�/�]%ֈ�ӝ�j�)26����eK�7��xQR��͸��+t#�i�v��&�͈�~�\����=ɥhq<*灥��m�A,zF|��"$ۥt��_~��_~��W��k��`�Fn
T��$��_��M�N��-�'�q��#K���t��>�3�۝���iC,)b��Z��-	���]����_&|�_ I PYQ6��n�%3��S�\�)pҚ@g��� 8��2M�Q/��Xh��QsXc��ف�~��t�r���d�^�V`P�ZT
@��@�^��	���`R�X����#z2��uT�r�8,
��Q�~�V�	�2�]�g�&T5t"@�C��>tmU�^�W�P�I�y�Y����w�	���yn����C����P���ӧ��9�<|���'b�3(��j%��f[t�3eIĉZ���:����F@\�����m'Z��RE�/K�,c��K�Eʿ>I]�#I*�i�g�c�a�xA� W{�v肐TW�9h:@^LkL��d��L�ًN�̢�k��k��]��QVg�k&t�>�C��nZ6��	���F���(gmMjY ��x�Y��IH6�|�lׅq�4�)�~��i�H���� �[��Tۥ��<(�7,nl���p��1�b'�N�O⩦��?�%��ޛD����ۭ^�w���:j�Rۃ:��$2٩{I�3�CR�)����硗ú!������$�~1i�㒸���	q��a�a|�xVX�Q&��O��;��k�A�ӄ�f�"��:�ƺ�,C�G��?�?��]S��*��U�ӧ%n'Р���Pf��L��I`����n�>���z �82�0|W�B�ǵь�!(��`+�)F�"�?��|�.'��7��>9�{I��]�$�"P|��[�Њb�<�}�ې�mʂ>9t2Q���R��he4�Nٓ_���2��}zf��y��T\x#-�҂��k�Z�qY@B��w���y]rU��(���#U��Wt��|ܟ2�sS�<�j�$������	s��b�1�%�N�	0}��6ҷ52n|�ye�U�݌=1��������q�P^XZ��X�l,�����q�4>��P�f.9$�.x�Q�up�.���~N��Ғ��+�j� ���z��� #�^����S��%���C{�R����K!ƼW��>P��Jl⋾e}�l<��s5yL�:�M�����,wGn���'�4��͇.z�Ί��Ƹ.�"��^HJd��_���3���2�1$��8�M\��GNE�V��*���G4�61�Yn�m�����9鱅1R46�49k�Z8��, J-�s��\2~���M�F�9�n�����>_[[�֪���<�R3��1���d��Er��I����w�~���Q��b��^o�f!�4��Y�m�|���"*���0y�5�h��2Dš��W�V��;�X���wo�.4]u��ZsNm��Z��e$�����M��e��qޔ3%S�)]�wn8I�W0����L�F:��O'0B��t�Y�2�1}<�� �	j�ZuX�pP�9�s�g�U'cIDb+F-�������������&ۘ����q?p�y�b��C"q�DPҥ�D�x���⍘�PG���ӷ�i�� ��CrTmZ������_՟�����Yi�(��:����1�d�#[�8÷�J���%�?����k3�_��_8�h�2��.X��QK��Re�� �ME���\%���Z�U�p��ue���7 �o8̆A^���P�C�f�� �l����F�F�1�R2�լJOQ��O*�^�|;�N�} �ϔMu{�G�<�*L)�h%�
=Qe�a�WvX��Kƹ��Z���"�e1�*��8�|S�+ߖ`��d�<�̇�3�=�j�O�z�j�<�V��7sd:�mwL_du6� ;�L`��&���&�qD�ĸ^[� ��6�INY���v�]�1<Kf�5�L�9��c�Ӣ��{~���P-�Bҳ�Z!������۰��GۢT,ٷG�,8���4����'M]:��̝�9���PS�<��]�>�uْvb��ߒ��73|�����[������T2&1c;R��P�F��[�/u`�}�۶�X�a{�o�;1�+h�V�E�`t^�t�z�Z�D6=k�F�I`�w	�K:��9�,�EH2���H��6�7$7=�`�s��,�9�\����6�e#7=��_�B���7�Xq_�("���"E��#ۚu.��й�e�U�t�bf�o�d�f����#Ї�C]$��^�� �ʛ#�(�+��ʾ�P�i�d�f��jca�=���4p'�7�Z� � �9s��,��6U��ѷ�KLjs$+��Z�)�Z� �ڧ�}��<�b���3��[���\�Z�c�b�� C sB��Ni�u��m�͑X�/���ͫ���E��b�wA%�%��YK�1�*����d�Wm��u)�O��H2�n����/����W0�XIAf,������w��|whOs��Jpʽ.ҳ�PE���)t~赝�A���߇~���{Н�$�Kc���PZ&���va�_<����d*5_5��H�m�9�u�e�����s�<���G��$%/��{Ǉ�i?V&aP��$��{�!��|bi}�?jf��J�ء�țf��������װs���mF�X��C�>����GS���\�r�����]�єp�;��;�~��=�����E6�����U��n���r��Cw�^[`93s�a�"��N���,�۝V�!�kۻ�~{�!��>_���j�UQ�k�i�ϫJUy����n4��p�ѫ]��<ػ�ë�/��#K��]9����E=Q8>�O/G����������΀:��Ȑ����P~���� �%��f��Þs�f/�55�]"�twZ��,��+�ד�Z�����f���#^x���Jeٓ�<,��b�13�u�ы7�_�Y�_��0v��;�0qs�������Qo{y�(��+}L:����:����oK�љ5D�jkt�������/��/d�Gx1�J�u���m��L�:���y�5��W{�߼�ö_�<�3\�c;.�z�L��kT��w8	��y���o�ۙ�����總��;wm^q5y!�[�X^��7�g&qѵ7�E�2t��t<����''ע�ሸ!��ӿ�������?��߾?qwbk���k���gɸ��	�+ Wk�������:��J�$��Ċ��E��P�w�F)���qY���4�g�K/uz�P��S�E��=��6F�i�PB��I�27:�_��N��h�į��l�vӷGy�t�+,yvդ����b7�����.�Rќ,��0A\���'S�a�a�8E�Q�ɄI�� �2t�U���r���sr���yl���h>I��U�������s�M�}{MD�TU;@;��tN˦��j�*���D�r��uD�� �+�h
F���"��@�b79�Qq]zf��E	eP�@ �p�T���#��1�C�%U�����i�
a�wxo�]�N`n�>g�fU��Ϩ�& 3
�I��
e�k�πI�X�[<Z�m�)x��=�{���<~G:}9H毽/_����uR�n*����� kJ��	8�VD���L+�V���R��F�@�܍f���,�����xL���O
��M�zv7*uL��^���z7C��!;c�#[�@�v72]�$.�Z-"[�ޓ��d���L�7�
�T'4t�vOt��T�N����=�Mj�R�P���=�M�5�:�l���pR��ʭ�C�T۰��M���N�WB�]��el�>}H.�L����o���J&/����AFRHc=>����8����GE  