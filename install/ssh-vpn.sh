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
�0ǲgssh-vpn.sh �ks�6�s�+P��q$%�Nb'L�Dj�����N{�$�B$(�&A e+m����C�Ծ8�:�Z���> ��ܟp�O��9��{$���T��$�p�|*iĈ��0.TA��V�<)�ts& 2QXw�
"Y�́��K9e���H�%��h��� *��	�2!��#��<�)|�9"$�$+�("�B%ٔ��r�(���)/J/$*�d�Ί"WdR�$r�R�!�(���_�=S2��a�HC��g/����N�/F��@d��&>gΏ��8v���)��N\�s.�����/��~�Q�u��� ̟v;ǣ�U݌��_w�Ȭ,Q���XLˤ zuIv�%';�o��2dć��3�J�0��3g2��itv���x�b��XA9,M)��)�Q*�0+E!�IY�BD�`�S'�B�E��M/�,���)�=-x&�l	B��g�a��� Y��f)�6�`f��<a$�J]e2")�=����U�D�ё�Kz��
��I��3��s�{�z^����,2p�<���o}ȯ%�A��	�B�r��p����2G*���p:��2��䩱lNS/�ͬ܊���,"__�;�pe�N���6�]6p݂����e�j�{0�9����Oo�J�<q�?�ׯ`%�:Cf�˥�e�i|�y&@���b6����V0^��o��E΂8���)��5���et��\�랳0�:�&"*�����"(��s�~ 1lZ����Is<�<��n����f�:?SX���"Hap��l�j��)��Ȳ�-��Z��3�P͈ˀ�&�G�-�V̸"�v$ʘ""��z`麕�W:#-�T0�e��yc�t�-Cb@f�"iF��mS���b�&������YFz8�\f�E|��>��7��ǝ`)ƚB1p|Nvwsk�ݵɕy�Co�X��,�!s�4+l�H�M�r�o� H-H3�f��8�t�7?u��9gW��^̧	�`�Z�b�m��YN����%Y��#"`�y��?^��:� n��_*	�J!̽�؉I�@h�mD6K���+N��eV� Y^��ܿ�<N�J*5�����O���W:��p!�ԩٍ���r�0O�v+C7�Y�ͦ��4=��6��2@l��&it^���dYM�����7�����J���u�@����*X�d1Xc�+�De��W��쐧O���H�(�Ꮅ���_����1yKI:z)1�X�v���Ō	�U�q5dNE�+F0�:`��1�,'f��e
��٩;��t6��V�ML��&!��r�������{ji�%P���t����ڢL���7ࢿ��})����t�΃Iv��;�B�z����­r#��X�K���,Y�WP�A�wu�J��B�X;Q�i��䟧�&�1Z���i��:K9�M��\�gƯ�Y���8O�w�p��.ԻdC�tdjQ���PQ�"&��6��9��j,���7{sXU���n�A��AB��[98��0	�:�7�,���SYx�`���.��v��:Q��~Id\]]�?�@NJ@�c'��<�gY�P?/'	ǳ"Ml�z�]x,*���|�3�D��fP��ͮ�29# ۅJ�U[d���_˫m8і�O�lU*b�>��]�ió�qL��F
lm��d��im�	������V�l����N;��	6��%��?��ku��aA�Q���sC?i�zu;yǪ׌��p#���J��G*����ۮXSjTݠ52qV��p�tڑ��sŲ��!��B�[�����"do���-B���Fv,�LZܶM�>�G6�K����TZ�m#��6Q[�e��>%��۽%�>��������nK���r��֬��BЎ� ob�IWA{&D�2�'Е�Av��#_�sjx���'����E�k�Dk�������hp6>=��2���w+.��^�ƃ��σ��d�t L�����_;�E���"�P��F��}ƒDUu���\��m[�6���Ώ�	Q�J�8�$�-	9���>��(�|���� �^;Ѯq��65yX�A��kw����i�ZY}���,���Ū�ڶ����B �9��P[�A/17��7+ӈ{x�gx�/��=��So�ށ/��z��!(����f��R�I�� ]���A(8��0��������1DZ;�Ԧ:]�6��M�)&��N��nV�H�������ץ��YQXhCU=��螭'���:�2Я�x~���8*ׇ�q�{�R�,]pY�>�l�p�m��^c	��F����nx�@�r��`�L��O�g�W��px����������d8z9��= W����P}�H�=�:��`a�Դ��[ )m$��Wʵsi����Hv���W9��[X���5�����^�#խ8�1�3���2!%.���-Ж����A};q�0
R������х�P}@�8�*'�A�}��{6��"��m��`��a�O���U��j`�����Ȩ�Z���� ��SU��u�+U��Z=}��i�4�vS�kWm6��x���h	�z�e�ʙ�F��Mb8��tz��>��&�9���g�WҒ=|�SE�5]��^������\uE!�O'6���q����Lf$�8�o'*�u��D�<�?:x� Z~͠F����~,��V�PS4\ך�
��+�˜F�&��Tj
�]R�1Xk�N�1xnB�j���k�?2����ܽ�(5�"����(��.y�����ϰ�yL�O�9���n%0	$�9�JE����<�R``�����g�`eE�sG_8-1��V�l
�C�ʤ�=�5(mlW��!�W��)�>�Ty���Ԅ.K�&G�����?�ij�5ΪVНZ���|�|t|>�w�|S�|*`Gy<����f"�in*IO���m�ݡ�)��s�j��\��]����k��n�\2�k�P��k��n�8�_�(���C{�l�/w�m���f�v Tk�A�ʉM�;�
���Q��۵��u�0/3pE�����݁�	�s�E��#�B�»Wj|UN��3@�B#���s%�Jw1@LL�.D�ԵMͳMc��|�QU���׳����,�t�A+L��ڀ���SQpb�Y�JjwxrY�Ժ�L�[�V)��bn�dS���<b3[���g���%�%�O`(A�̰ W���N�~��[��<�Ct��r�4�fdU�o���L` _�Ls�F1�Xd����5�g��0���	HdY��Y�1��Fc��+>~Zբ���7�B������1<�:e�t���UtΪN�ze��4,�3l��d�Ɨ1���ɰ�p}R�jĦ}Gc��P�C�'�`��ԅ�,����o�A4j$(��� c���P�rݸ�/a���I���<��m�槝l��j@׹yQ�џ��Е�R���:gEک�i�Y�c.!�'Ov��?�^���u����`��9j��?�ip�͠] _����^� ��{|���6�'��_)_�|:�6�?Ɋ�%l*i���@��Ӱ�j_�=;��yX���T���c���f�s�u��t��ںO��P�n��numnI6��KH:,g3|�ռ@��2!S�B7�{L�v���\`�Jl���75�
�M���E�h�M'��[М�3ֿ	X9:� A�x	��m��֨f�n�{`7���!�֯E,�)�ú%Xup���ŵGYm�����htuk7�L��-�2  