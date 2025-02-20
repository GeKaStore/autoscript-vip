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
�0ǲgins-xray.sh �\{s�6����=qӆ�~�v��c+�;�챜^o��"!�I�Hв�s?�-�H����zS�(n%rw�X�o� P����#3�(���?>".	���qw�k�ݾj��ޖ�?J����E��_�[@:�8��-hm�}8���l�����i����ft�������iH+6����o[�4�TEUl�bAPUŲg������2�Bsn��3]_ :��"�Y&}$�F�n��2� �M�Ʒ�2v���8@}G�"-XhX�u�6�oB�����ǳ�����FGlM�����f@��G�t]���8J/4�4r"�}��y�֪*�GP�@8�4`nQy�B\nt�(��0�Z�E��c�l-=����IH���*����6��d!�v�t����*+���QK�����0rL�gs
�����c&��,�8��4B�mJNm�
l��a�����ׯ#��\�Xqm#,����b���`��5�ڏRmBi�?n�gK|5��G����C�f!��D跠=�%�"^�b��}aP�4ؘm�0W �U����
�>"���E>t���V $Ҽ�-	�1��.1m����Dh`7L	�H�Ft���C��]�c��o����b�ͼ��D>(� �J4��4p��'��6�/���ĵq�~��6-2̭.�Y�$�TU�/hM<b��
dJbk�����p_��aH�J�(ܪ/-�Ȁ�Co��7�@�~e������c��,�B�f���"���q��I<�!"��.OS���0Bsf0'��ķMި�4��8�Ҵ[Y{S�՛huTFY�i"J��8����	��nZS�p;#11J�Hv��\7����H#��F�'Ŭ�_N�V@�M:�fƔ$���,?�xl�.�,�B��~a�
��.�DQ�3=���o�.˶�aKk��*���0x9�buׁI'���}�M��y��Ė��G	���� |����Oq��P�6D���曬f��H�rMA�~/���Z�e��TN�q�l!PG��X���]C�55B0%z� B��7�ʲ�DόX�6X��LA"n��.��$ih5wP���7����Z}���d��=er�qDF�\�N��2� Q;��>�9Zˀ�gLq�cֱ}�����22y�c�Fa��3� ����������{!�P�>b�p'R��HV�A������`�9�t�-v��㏉
�ƃ��}��v�e�����s>V�����ה
��Fr`5��΂J,��ɔ��#�M��T$VaRk�m��͋�$�!-K�&a��	�TSgnb���n4wԌ��.���L�ۘgH���CBI�H�u`���g��H`��Y��,zTe����{��^'שS�Tb��g�Q!��H8eu̢���hP��MHf"��o�2��4g(Z��
(�e�x��ߖH�.��	k ��
﯀���XC�*�"��aN��%U����Β3�А�n��NT5����Q�-$+aˬ�L�L�jl��?ޯX=dO � L���r�'gn9fO�����h79F�hb�d���l*�TBy!�	ᰘ8Қ��vcy9�T`�nU��\O��-qE�j;���EQ��޶,v�������}{�{���i�MX+%�'�U��8�X�ٳ�c����[׵T�d�Ek´�o?R�Բ�U	B� �WГ�,�P��'�g̳WƱn{�W�d�����=	Z39t@Kl��ه���cU��kǩ���r�	���n�*B����m��0L=$�(���Z���u*q�>��*�i���l��f�6���ڃR6����5�W((>X�\ �j���e��EC�/Y1`��w��������Dm�l��t�YIo�ۜ�lX�?�0e��o��7w�U`�ؒU���8�
Ns�S^Տ�)Y;�Y;M����V��:h�]���o��W��Fc��+Pq�Q�9JIIC���\rХ+0OT���VGM͕QTш��&g�ȡ� ae,��O~'���Y�Cx+�ؗ�>���Ch�>)�X	uqk���W��Em��,7�T�7�*�ޖ�|	2��Y�od��Oع�o�$*�2g��ɤ�P�Zf�򠰥��CZ8˧�j[~��u	�n?%�S"�d߽�}|��Z�GV��9H�o�b�䬒͟;�F����]9����F���K�4$EQ���k���M�~�#30G�����-H�0u�χ��������>J�>�􏇃�ů'G=�m`�uiyG��>���έ��(�!��ak�v���u���>�Ěv�"�r!�����Ʀ��!NH�!��O{w��n���:�C��gG]H���$�}<9�	
Д+�Uz����)�?̻^�RG����_���{i0�O��\}�z��=�F�m��b�E��U7r�F��e�®�����?Mvq�f�������iZ0�YsS�%���l�m��&�'s�t[nl��t�r�0��M�i�ү������{{�NM�jv��i��W��:�������6۲��-bp+�K��b%ꥅC�>L!����m,�D��G:c�bG�=����{�e��`���zGǟ8�|����[��1�D��p��E�̋��L�[;�yF�(2�|��7�J�����/�;%�I&�<���K~��w�P��1��d�YO���4mm"�%D~����.���Iْ�KKBC���C��Ed<>X�,{���T�<����VUŴ���������X�v�MW;9G_7C��T��,�I83C��
�
P;���zF-_�a�����0�3�d�GU�M}���$��q�^^�C�de�{/+����:�ׁ���Ow _R��u����@�g?�Q��3��� W�}x�}I��m��{ú7<w(H����o����~~0�>?���u�?+���{�x_��3��_�5N~��o�̤�i�=V�D\��o�k�}�]�y�+-w}shx��xi���S����9������K�X猗����..�7�7��u��i�k���<��[����[϶	@��5jb>�+d�������3��,5j�?�Px�:���,^�~���>)���LK�G��7��������>hz���?|�����)�T����xS,O/�)ޭ|#X�޼8��icɏ���J���U��6�5�@j��d�K�~+"䇲��vM��(��Z4F  