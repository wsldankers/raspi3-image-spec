#!/bin/sh

set -e

case $1 in prereqs)
	exit 0
esac

. /scripts/functions

rootpart=$(resolve_device "$ROOT")
rootdev=${rootpart%p2}

sfdisk -f $rootdev -N 2 -q <<EOF
,+
EOF

resize.f2fs $rootpart

exit 0
