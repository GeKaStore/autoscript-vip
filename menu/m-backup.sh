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
�0ǲgm-backup.sh �]w�F�]��V%��._��@�)`٦��d�9��
1�j}�)��᜶�����}����o�/�;� g����$��;3���M>�L�2��D��o��G��W�GV��P�����%�k���J�c:��WRۺ�B<]q���xb��wt��%r1u\�����g-9��R��Z/+[�d�~�\(X[��Q��\ rјz���U��eS![��.�B������ ��P�dF�7�a�*�(�t|����M^;x��/���r�O֖dL�v��������c�e�w,��P��)�jf��]2�!�1lJ���Oj���`�ySZ�eglT��@���\����`�dc����-�95��*kmr"��iE�u���M���D(��Lq.��Z�s\�L�k���X��1�%}B�3��R};W�F��e�]H��BAR���Q;?����k�����0F����4�R��prR��-}�@�&1)O|����~��O���%uլ��~�����[g0���^��~�/��赺�N�݃vG=n�8^��i�I�u9A5��H��g�j�)퀹n�V;Ǎn��j�l�{�Y (S�r|���
+�����!6�4�&�D"�	��J!
Y
#����ԣ7I���i@�1�3��C˰a��6ܷ.O�,��$�$�+�|[�PC�fM��A��W�Z�qGA��]��*��9M?�I؁~6=u<k��J.��t�
=��dd\�zX�[2<~2L��l0�-;v�.R�ͧYK������x<��("a�a�,�W+����I�je,�Wu]�e����!��k����DPzuȨ ��s�ε+��zX$�N C��Q���Y�U�,"�`�y��m�k���* ~X�Z�����R��&f����i�O�1U1sA	Rh���m�g?w|�SyąB������HwII��|"m1��i"�I��b"�.��|׆�h�E(F�d=Yr����IL���m�5�x���2E�rq�FŚ!� G��R�3��fӅ�ð�(����KǱ�$�r"�r��u�7��b�x~#m��;�(>u��5S��[*Ş�c �c"��ܼ���������C�U��ZǮf�k������["�D����K�!�,���N��.������ʐ�Vl�4�Ff��t�זi�e)��b�>9��:D�9�@��#����D���{�O7�%�x`.����������n:����J
�?��'C�����"T�El��ti�p���� K���!I�v曢����N�?�;���69�l��iP�J��K��3a�� �߁!�v֝�]_ߵ��\9��
ѵ�z\�0O�A`������He)�[�o!�b���'���R6<{�Q�{R�P=:��H'�ge)�)WI]1f"��ͼcࣅd�	W�?y�-$C�B��W�cqܿ�O��S��.v�A��;����E�p�.�T��S�4��=�o,z�����M
��m~����fG������F-1l��B��D}!�Q�?+���z{��«�6
B	��dQ�K�R�>q���|�=
�{e��!'�$����7�0���h��w�ȶ�赶o�K!�ɳ��}	5��{�%�4ϝ��p���7U�Yxה�x���QB��5�Cᛆy)��2'�B�]��XCQ��%�Z ����@6"	�K��c���ԧ��)?}���$�F��[��O+SV;��A~�h�б�*JQ##��V�T�_3�I�$l��-�݋v>C�Za��y�����ۿ��:�>4��-t�ud�#�n��6`�۷��M��@�����8�|,��˚��kȐ(��|η���Y��ߴi�s��x�=rP�4��C}��FLO���4����V�������3����ů։DЮ6�#8V�/Vn�=�{u����e�L���ܘ�esp�13�qDG��Z�ݨSz�
�Vo��z�ϭ&\�<3��!�q���fx���x3�]������@��do� `;@����^��he���ZV�|ܘh�y9J���d�>�:$���3'�����lQ
prx��L��{dd�Ȳ�I����(�C=�%P.K�<��J�t2L1���N/"��cr�Et66�1��'��L��E��cAɀ��}�m2��6.�_�?9IӔ�3  