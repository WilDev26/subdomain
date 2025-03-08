#!/data/data/com.termux/files/usr/bin/bash
#
# Encrypted by bagas oscarius
#
# This file has been encrypted with BZip2 Shell Exec
# The filename 'main.sh' encrypted at Sat Mar  8 21:55:36 WIB 2025
# I try invoking the compressed executable with the original name
# (for programs looking at their name).  We also try to retain the original
# file permissions on the compressed file.  For safety reasons, bzsh will
# not create setuid or setgid shell scripts.
#
# WARNING: the first line of this file must be either : or #!/bin/bash
# The : is required for some old versions of csh.
# On Ultrix, /bin/bash is too buggy, change the first line to: #!/bin/bash5
#
# Don't forget to follow me on <https://github.com/wildev26>
skip=76
set -e

tab='	'
nl='
'
IFS=" $tab$nl"

# Make sure important variables exist if not already defined
# $USER is defined by login(1) which is not always executed (e.g. containers)
# POSIX: https://pubs.opengroup.org/onlinepubs/009695299/utilities/id.html
USER=${USER:-$(id -u -n)}
# $HOME is defined at the time of login, but it could be unset. If it is unset,
# a tilde by itself (~) will not be expanded to the current user's home directory.
# POSIX: https://pubs.opengroup.org/onlinepubs/009696899/basedefs/xbd_chap08.html#tag_08_03
HOME="${HOME:-$(getent passwd $USER 2>/dev/null | cut -d: -f6)}"
# macOS does not have getent, but this works even if $HOME is unset
HOME="${HOME:-$(eval echo ~$USER)}"
umask=`umask`
umask 77

bztmpdir=
trap 'res=$?
  test -n "$bztmpdir" && rm -fr "$bztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | */tmp/) test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  */tmp) TMPDIR=$TMPDIR/; test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  *:* | *) TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
esac
if type mktemp >/dev/null 2>&1; then
  bztmpdir=`mktemp -d "${TMPDIR}bztmpXXXXXXXXX"`
else
  bztmpdir=${TMPDIR}bztmp$$; mkdir $bztmpdir
fi || { (exit 127); exit 127; }

bztmp=$bztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$bztmp" && rm -r "$bztmp";;
*/*) bztmp=$bztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | bzip2 -cd > "$bztmp"; then
  umask $umask
  chmod 700 "$bztmp"
  (sleep 5; rm -fr "$bztmpdir") 2>/dev/null &
  "$bztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress ${0##*/}"
  printf >&2 '%s\n' "Report bugs to <Wildev26>."
  (exit 127); res=127
fi; exit $res
BZh91AY&SY�[��  �߀D|���+�����@wJ�ݔ�^�F�Mjm��dѦ4h M&�M4LL�
yFbF	���44Cڡ(К4 @@Ѧ�C �$ �b��z��Q� �f�����c�#�q��K�ōƆ}/�q.@�GA�G%�*�B�`c�0Ɉ��F��j���;�c>�kWe�u�� ~�eET+�������`�^4������	��3��m�e�2���<ܔj��=�J��:���R&p��p�zL6V�\�Z��J!T/R��Ga
��#��g7+���L2���k�V������L��"R` ��LC�x����[�@�
�ߧA#q�{[$w3{���
��#6]:��k���;6\NR�g@�� �!1"$PE�#�"!��)�э�L`K쳽�C�PI;�s;����x���==�"	�2�)���A?p�]�3�VI�ĲG�yW���
���,r(�q��`�מ�t�Ŏ�bUL�X��#.b���#����_��e�V�5��M̂����.���Y���WxwؘA���ji��T5�<���bL��h����h�9�ZkkH�j�GB�<۽��"�T��	vu ��ũ���K�nHi��A@�Φ��(�{4�Gd^��[,�R[T�J<l��}r%��L�J�u��{<d!�CC~�:=�w$S�	E��
