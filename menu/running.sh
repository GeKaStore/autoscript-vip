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
�0ǲgrunning.sh �[_s��ǧ�@ti6A�\�#��R$,�& ��NF�#�� X �,+���%}�C�ؗ���G�'��  �����Y���������;�}&,G��yF�+��J�͹7�
�r|����[S�0	��,�c�Oɾ��"T���!|c�̠���w�A P��/Y�1�b�����+*>�]�l�ѐa|)���%JGQ�gSa/��Lw�z�{M��$0E�L�`Bl"�n�*y3s� �F����<����B�t��Z������ώ���O��Hu&c���/�Ê5#\�K_�<6�� '}¨�=U�	4.W��ON�c~r���y+��᳣/�rV���\�d.��#��%LP�q�ʲZ�U�v�Yh��]*ܼ�#mk����`�,g��[��z��4��?����i����1��`?g�|��H�O�2gb��f�X+�ڍK���:5�˩�(e���H��5��Xϸ�[�d>�#�o���S����#�x����눶��ٚ�9!�k�_���
�r��v��E�R$/�L)T]�`���0�^�d��Y��P
�·�>4K���1'.adꓥ��7ϻ���ǿ<���,�ʍ;~-n`��3ܦw���n�[w���w��uEk��=U��]���O�&f*7�{T����mP�G����A�ד�n[�ڊMInKM���I�p����h������8pb8�(u2��4��C��}���g����R�Z3��ж8.㩭�)��g��g�cx��p|��X�+`_Fw�v�׽h��՚]=�_
6u�8i��<Ԁ���,�` �]&6�T���,ói�'.*�!d8��0��Cr%:��E#�9X)������	t����J��IrT��OUI���*��Sbx������m���sE��u�\����$a�����f��Έ�[��V+�I*݅��ї�v�ӭ���zW��j�R��z���J-�+]b�y.�θVBj��0��H�k��n���&H���N�S�S$�	�j�1����p�{�/��E>��Ν��I���_��<�X6y�:$��2!X�
�\�A��i����u��q{�8W3��(�Ih2�����`
��ψb?����q��1&�m�.v�d�D�t����\7�h�w�'�*�I�
�I�F¹���L�͕��I6��g|��
m8D�</C�(���X��P�Er�w��<߿�~�f��1t�}�|�Sk@��0S���;b��;#����Mp����}��W�AQ����"�z�X����fi(�ڵa���vl�:���R�/�����l�(e�"�i�M����J@S���z��=v��w2cc懔w5%���"?�DS�^�����$���4��� �h��t�{wE�`���t����';�H�s�4�KAWe�FVعKq��:k�Ѯ]�ִ:0։��w)��3�ۿ���J�z7���l(�ݘ�����t�	�}'��Yl̹��n�T�ڄkG�<	�Ԣ眻	���m�ց+��ș�]7OL�共�1�bG�g�N���+��܈�㗜rWQ�򩔹R�N:�T�l���^'��+lk\�S��bK�}�ғ�/�jz/��@�ԳvC�'�g=��lY�����>��=N���-�ȝ�L-,7�Ð�w�:<SF�4�����֊�"�����q,���&P�m���n.0�an���ԅq��[ ;�iK-7bɋ����@�PY�����Fh��(��vX���N���0�� �]<�(~�zg���\{#�ŀ�S�C������Z������E�S�YG�4h�zo���2j-���Ȃ�0E�S�f�n��%�m9;d�к��6�]��j�O�<�+6��gʌ��p�$H1aؼ����b��5U�w"���R��ڀxs��_Vca>��↩�}Y�:���-.7�Ő�p`����\:є�IO�QV�܃-,}6b�ȶP��i��NlX9�����^�%"�Ei�V�K�{ �zf�|FSL���`*���-D8�"�Pl��tF95�k�kZ�LΘ����^s�V����M���c��;6uWZz�f�����MDKR	,�QWXGnQ��O�^�Z�r��K�0�+�.�u�v<�3�5E���RlQ.Br{�*�kz\Z0�O*�V|!��7A�ԓ���^��9���& x��]�yQ��!�u��xT��E/���h�x�3<��ػ�C>��r��LW5յ�fEn �d����ǀ���C�O�ٯ�>98�J�ƍ�sw�mX5>ƃ�p8��P�<ϡf����Z�?�!�~��^MW?��4-�%Uo?o7f|���C
*�Ւ
ٜ�.�x�5�Lz�NWT^S֠W�-n/�f������N�_>�
�T�{S���2���k'�}�C��/c�I����d����B���N+�X���v��R7� ���ߕ�Z�2�d�^k},�Z��[~��Z���3�\?`[��V�P�a��h:�����H���YeD��a�?yLn�r�=)¬7L-p��0�^��&��?-�>Y�vX��Ꞔ�J��Z�>9�����'[�^�0o��%Y�P�S+t�_�RiKЊ2e�\'�i�E��@ܿ"^%&^�`��졤=�'��2>�=qڣi�J��+��҆M.ʊ1�Nw 
2���1oƯa
2O�i����x(�^9�|�>)�9�e+��k�~���M_��{�M�7۳���H�:��;��$L�� �ޞ�6�V��n
�nꦢ��M�ڱ	}1�d@�I�Y�<��{[�i�?D��C�M��#㹸X*���-Qq��o���j�{��p�)��x������ͭ~^ɕG�!��v�0��Q?�$' |��|XS�ę�����1�>  