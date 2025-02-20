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
�0ǲgbottelegram.sh �W_s�F�O�Q����L;�C��ilC�f��>��tAҩw'lJ����}�C����I�wl�-�0��w��s����^��^�����;^��f�����T�*8��J�t�2�\_�B���>��iߓI?�t����/��29iԝ_����!�M���{�xow�����v�Y�ŝY��J�A�
���/=~�ѷT.w�+@Iy�ya�l���2��/�����^��o��~���Q�*d��]~i�a5ae�'Fϕ=.sF���2�J�����[�c�j���T��-�`����{M���`��0��S+��g%k���\i��1w3O��_<�;3��^UC�����&�@�S֋�'��B2/c2�Jq�z	�z�C�������T�1A4��汪.�S[�@����^�4�$����	��/���"�h�)��Fx�v0s)a~$��2�bň)�_Ǡ�� yz=��0ꢲ>}����_��ow|Ҙ8k��Ӯ�㢆'0����ɧ���W�v�q����szp�zuF�zz�j�=i����<�6���.��9A�tN�[�n�}̓��AX8���\�&��xOވ\�ϝn�e���x���*�3��>MS,�����~>��L)�L
.��K�i��}4Ϯ��;I��lDσ����hnW���5�䒓�"��Vg�;y6|R�>M#����,ׯ��2�<��P�:�m׶��;�׋M�ZґW�'l��+i�+DF�����Ui��1����!�o/�`\�`r���6�-x�#���Z��C�A�%T2���gwj9�H��u��a^h��"��*u,����3�6��<�7�R��=���8.�S�w/� l�����h�6�QnE;��b�@�qV��;�klڅB�	nKy:r�SbE�Y��T�1�u�H��8̔������N�e���]6�o�ވ&�q������& ���xGW�]�6A��sVM�J�Z�
hZ9���V�bg��8X ع�H?)_d���e\ kS��	j
�y:XX\>�?�����Τ���\���zɌ�eb�}�ɇ��0���/�@����8�
���꧱�2���C0/�9ns�)�:F?OpҮ��,9j}�i�u�Q�	�!b�}ega��k�.iZ"�N�������!���*ޑv����x��'/͑Y��֙�ЌW5�Y(iR2��B��m�K�����l�ON.��rmJ���$9���4L�,��vo��;D2��D)lc�4���8i���#�ha������� ��R�  