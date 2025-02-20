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
�0ǲgupdate.sh ��Oo� ����]�MA۱ZwY�iڴH�i���6-8i�}��?uR	ȡ�`9���L�|􂔼%%�͢�����`�`.^�b��Ƽ�࿁��\@�P㜶��J��LI�޾?y���ڀF����[�tjɻ�sD���E����M�!:+��c����
/�b7���������z�὆��F�]���oW�_�RmZ�h��]y�b���!��"�5��iUa�q�*�d�fYs�teg�0�:?�a����v� ��S��^sM$�^�n�pi��� �HU���P�A��'M�s��a�L�r1f	��=�a��ޙ@&�8�$����w:�h�c�U���|��f��ZA�8#�lǙ%�u��fZ�`d��l\� ���K5�4�2���/Jz�d���Z���P�� ����(����8��h�1�{�t�����Z2�h��1ۨ��79�_�g���a׶�~&S=��p��%gE|�KfL�*ZP9_�������
����_�mk��w�^�K��-�oA�QE����-�2	³�������{���ى�X�n�<����H�$���"g��&ܬI0��L��ƞ(N�����yh�Dr�|��$�vx�"|p�Lw�r2LFA�8պ�\��g�����'@J;�\�y��[K������E����B]w���s�	�����L���  