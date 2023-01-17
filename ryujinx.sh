#!/bin/sh
cd /tmp
curl -s https://api.github.com/repos/Ryujinx/release-channel-master/releases/latest \
| grep -e "https.*ava-.*linux" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -

FILE=`find /tmp -name '*ava*linux*' 2>/dev/null`
tar xf $FILE -C $HOME/deck/Applications/
mv $HOME/deck/Applications/publish/Ryujinx.Ava $HOME/deck/Applications/publish/Ryujinx
rm $FILE
