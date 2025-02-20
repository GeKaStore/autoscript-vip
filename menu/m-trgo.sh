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
�0ǲgm-trgo.sh �Z[w��~6~��D1��/�L%K�)���8�,� ��`� ��DfOۗ��!9y�i�{�M�%�Y\� ���nC���������7���s[陖���c�(
��c��Lk u�L�φn�q���8�գJ�^�2먻��IوVil_O�V��k�գjg�Q'^�q��jm�f�mg�y�m����V9����rPX_)�"��mUmJIP��z��T�Vi��UaUZ�v�#���~%6�}A�׶w:��@Pհy43�MͲ�{��Mܴ��f�,d.��z�]���\6��C9d�579�?�)o�ej>Q�9�Ԕ���i����j\V�6˺��	>j�ej�U������"ք=*Cs�}�Y�!����(����np#� ���w[j�^k����()��z�]�����0�9G�\���g���)�i�3-|.˥����Z�,O,�9}�b���9��vm��e\�ސE���;fNY��p߶��N{޲�ʙ%]�@a��8��PAFT���u���$�O4�Ύ�A� K�U�>�R2�(�
C���]G�}�A�X�|���ed]M7���������}�̧;�W}g��!�iw͙Y:0��}3��D�X6m��֥�^+4�c۞�l��T�u��ͺ�]�$\�c�IRƎ�7�9�S�U��r���۩tj[qӏ���FN"��i��f�$�c�=o�)�66�=6dG-��@��^�*.��]溈��d�#ʹ�/"q�v���/%J3���v�J:Q(T�Y�RR%�p�̗�9�K��lE;�Xp��Ė4:1L��4&�oJ���l�f�3��rp)I�3�pp ���(W�=<?��?T�+�stx7���D<R���u��P.C���Cٰ�[���w� w���F�@&}�2�z�q���8�-i�{�L�<.?����iP�5�s�u�ӏm���G�DH�˙r`C$#�/�i���=h��vT�m�*�M��<7=(���a[L�LL#��bDY�ν�����f:�XK�v���4#�մ����9�AHcX��r��� ]kH�̠N��Hﲽ��囉�i�7����1�s�3��@
�pW^0��Z7����;��m�DR386dP���2�R
��q�M��&��Y�X�K������
�Fy�t�9�i�1�B�`ބ�"ge9Ck*�SFў}鷠ѩ%;�����`��K�A��ܹ���*��Fڶ���c#���\O�1,c�SSg�дN��[�#�H����\�85]��|��D��E�W��]<��kk�q9Pe`/2Kw.�ew���������B�~bt���OI���Pzj�MW����(|FHpJ�����^s���n��S8_l�̱X�P���
7�Ć.�;#��Nk2FZA�D*���dxCY�H�:���u!+�� n<G�>��Go� j)s�O�(J�ɯ\.2��.�'�� � �1�]�� ��*���f:`�_~�^ ǳ�pE�M;;����1-2�)*陼<�|�B�ٸ����ʳ^ �YO1�T�BE��pW������ȿ�����`Ui�i�(+���_~|�����/?J-����:���&Tt��`�2�l�9'.��G:��4)��Tk)�S�Ȕ�E�a ��{�2PnQ��#��g�c\7�yr�A-�{�!¡�Z�h��L� <�ֈ�K��ݔuD;\�m:��ؼb(8}�QdI�8CȻ�Ϗ��gR��S^��c�;�<��:ӥ����13<;��dg����Qi["�;.;щ��e��qjC��n\�P�A#��sVr�?���٧>*��2Z���(<�3�����Ӌ��.,�-�-���p�'K����¡�Åz�� ����Z�U�i7[i���u�U��#������j�Vj�5�>�[c���d�qi��z��[t
Ok�	^�S�Փ��<6�swOm_�Wsz~~g�� ����	H�+�mW�j3�"C�Ao����F��)�بǆ�fA��K�./?R̍���қ9a)�K	7�G�(��cI�X���D�Q�}������c���:��#� BU�U��!I8L�L>PS\J�y�.n-�(@���G�(N������+,ˬɨŧ��������E�O<��[|	5�Np	<z�~h��&�D��$��E
�K]��Q��Q�^S�2�y��-�+��jxt�jW�$jA%A��}{��)�=��ty�R����ۜ-�Pv.z�����=�=�.P�h�J���n�ժ�v�nէ{�����`�O�[x� ��n�]T�,�����_�6�f6Y�( ]�F=�<œÝ��G��!K_�����Lǔ��(>�&�,|P<�*HB-%67vͧi�*/�
��ʮm�w�0?�Xt�IZ@�x����oN��w�}��с�y� rݡ-*�<����KRƘ[uy�*J������r���N��Lc�t��z��ȉO������N�B代r�/@�f���",�#�/<RfP��AM�M���E���W��[Tw�d���EQ���?<�g�dEy^f���"�� `,DZ�%��Rxx�P�����!��]g6�����*��*3�������D�6��GB�՛e��}3��l^�^]&� ����$��͔�m]�e{s˙�:oܕ7�w{~�7V1�?aa��M7eN���ޫ�=�� �:>�]i%���r�'�d>Xy�Z|8G��XR�I�u��v#�s�#q��Qs��@ ��4,vQe��~�G�wnn��/n�jgq'g����`b�߿ȭ_9z��������������O�_
�����)�>�˧;S*#�
/+5��/0$�INx%�iG��?����?���g�����+�b�/$_;:��V\��,�S�VaG}��t���<��U���!����m��@�� }��a������)��}�@��n��gY�LC;�M����at	*S��";�ehX�����0�Di�0�PM��9Db�uO��%c�g���"����Y�&�r2
/oVM��F�0�
��Mnb�&���g<L\���Lw�W�.(J�^!�*(v���J�윐�Z���bQ�Yq��iRc{�O#9��m5�I0����7ߗ�^��/�PO�O�D�0āi���`���w�U$�:�E=���\������b)�s���+ �-�+.,�П����rxxfɼt(M�2��(����s�%���LLH������
�����@�ON1�ؓ�qH~������p��*��j�;�����}��ۨ�(^F/y�a��������-\���O!&ae����P�B�I��wF���N���q�Ժ�Q��JX�/���V���=5-�g���\���?}�u��y<�|H�C,�~�qV��ig���,gH���t�)��w�):c�g��r���/�A	�⠰ĚO�ׁS{�I:�)��'��%���h	��氾.(�)	����T��W5�c��U$�
bP#R�P�ɸ4�(���$����M��t��O]�m5  