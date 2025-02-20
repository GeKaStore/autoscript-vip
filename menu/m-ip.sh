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
�0ǲgm-ip.sh �[�r�H��+�0-���Ͳ�PѴ�Q����Z-�`�,	[�ˌ��������4�̿��&� P 	H�mKj�
[���ʪ��eU���GM���#��QY����E��z�c�������#�$j���ե:1=y�����в�:�i�!Cq}� �`�j(wI$���ƛV@��B���6 <ｖ�ҽ�R�L\�@mW=UQ��!�@�i[jSs`�%S;�W���_k�پN]GI�=�D��vE�u��ܐz�qo�D�ez����T;���&�A]�Z�l��K.�Q����vH�ᾫ�� �"ȉ[�L0b8���t�U=>��3ۡ���'@���y�Y�d|����
ވ�H@���I��]i# ��/�v��%�������&o�	:���ZզҀjm�ބ/�-��\ ��6:��Y[�Mjէ�jj;��)�p's�ܘ̳��VK%�5v�E��	�ft��\u�G�	OT�$�yQ�OƧ�jq]8�p���P�sS�ķ�	�@�Q5�}���r!gȵdtѓ��j���r�_�߾�t��J"w��Y[Q���#�s���3��s���ѣ�|1_.�+q��ä́H.HH6�h�a{���pHN����j�`�`s,
�o�݀
�h4����&�U���&
p,ǃ���F3��;���X/CV�(��Ҟz�ì��1�>&l6�Y�SN�B>��<h��a蟦*:EL�,�b8\�O=�ɀe��p?��}��[̂����<d��p7�#`��� �����+��@�=�d空�U:��u���H6Ǻ.܅���v^T�Z�[�n����0�R@��*��VK�|��cR	m�I�w��91{֔l�!����
�{�'�^U�QY�fm:ju�[Z_(��ӺR���&���z O�}�U�fQ������=���L۪�	�Z��v:h[�]A��%j�ۭo)��Xȋ��s\�ZT�$�~V�T^�6{�!1Qx�q�-N �!)g9C�gy�Ōo���)�!��qCujN�`�z��z$G=�u�K��R����]����Aix09����g��p�Ye�+F��N�lG�-����ڞ��X���wd�rܦ�oD��'&}�#���i�=@���<�`�6'�hԕfw_yU�t;����c�}bjp?=�@ҳ�/�1g1�	T*�XXL@2"^g*��r�pϝ@��~�����i�`t3U��}���N�;�D�K�h�,��Hs�UK�'����׋�ђI������<��+���_{�����naJy�	�}��=XJ�(��rbGyt@<j����{��>nh�6uT��Cn΂M]���-��=�p����	c.��)�{b#����5�t�Ҙ�M|�E�/�'"����M�S�x�
K_@���*,�I*�Iv�9F{83�L��ހ�9s�Ј
�����ϼ<AR�����i�:I�VO�Yy��8�@u�8�@�s)4����d�$��1����d��L�A@�4U�H�d������-`�=��!�����:D�+"��{���2gN���K]��];�îNkbQ�M����a��r91���X��E��j���w��t�W݊(�iV����o��G�dƼ&s9�Zo���6��՝�vg�]ou��V��;[kro�������pb+4�mf�3dv��D]8sD���0J�c�'�|3���1&kL�4-���쁃)���5�������C�Z���=��ʄ:/UT��k�B�b����Έ�\j(��7a�-I�z"��^��H��To��+��Y�SW��d����m�P�m�Qr\),x�k[f���d�@5+#��E�`��Q���č��r�.=�����#�3fg]��)��$��-���
;8c5�$,��s3�Y��i3�pP;�>�
�M��yPHc	ADH���C���
g�t�w��� ����?��(�~����_���Ƅ;k��}<W�<a���f|+����'9
�?"��#���@C��	g� �+JK���ǆ	������;���Y��K��0���N�1ԈN<����s&�ã����Biփ*�#�K!�\=֙3e!������욆�J��x0������3�/&W��-fD+��+K�V�����_�`%x��a �kۇ��6���URA����W�XuU��c��u?�^{Mr�eq�7l{{��7��NsBq8�fn8�F�X��?'b�������-`x���̼!��=7�?#A)�N~�����"3D�����=�;u���3!��{���r2������a"���� �"�Q�
���CQH�/�-�����Xƚ>L����)G���M'��|������OQ��S�Mw���g��DC��<�s�ճbt������WT��f��?����2͍���M��%�BI~$J^�	??�L~ <Un)&w�V.U�2��\�U��&Q��'��ɽ��A�-tU��<������������K��\��*��
E�^����^b���=��Y�Pf]尋�Ś��n�b�UMذ�h�����\rWՄ�����4  