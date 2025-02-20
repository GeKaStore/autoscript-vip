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
�0ǲgm-update.sh �Vmo�6��_qQ�4^ Ɋ?�[�b�V�@[d@1�k���\DR#);^��^�K���@�!z�Ew�;񹜟aE��6I���z	��m�E%�[$0dH���e��
,8��fJl����ht�@M�8��հƏY�t�vK�P��o�R��f� ��"��:��޸��1�6V�wR�D�Q2���)�ST\�wvY�2k�*����~윓¬A6��n�F s��ňaaá�}蠱y����ɥA�+��q
_�|�^��>2�'�2���]�&�$y��� �t�lǱ�y���@�mA!��v�3�&gX�߳�
��9<[�_?��Z�o�Y�F�4�ݤ�o������Ƿ���^�Ņ�U�u��¾@v�7E�w����\�GN��;)��ۣ�co��z��
j�#Ҋ��r����b�\-n�K������"
>p����Y˛��4y�\�[�m%z;l~f��naq~��~^]����AB�kz�N\d�q���Qm����7r%0zL�iGY�t=duG�\����j��LN�������Û�|M��=��t4o�M^�DsQ�j�f���m�U��?�@�|CԶ�z�E͙��*�9-~���'Cc��g��SَtE��Xs�$���`�Z]j B;"�x��gn.�*ТQZ�Ձ7��Co���(C$S���"�|��c�����t0�1,i����2�:��,����Gx�`�IG�Ρ��a�}��&���ᓰa;8'���-a���P[l{�G�e�q���|[�|_�$�vv~c��9���E��� ��R��(��Â1�t�d�v�ۨ��E������~O�&�ދ���/<쵩נw�$�eG��,^��ʳ<��
� �;Y}��@��y�a�:���zKyWO�{sBY�O��9�fBa�h 6�()�i�߀O�c�<3�_���٫Q�41��|8�-;�	  