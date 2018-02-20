#!/bin/bash
SIP_VERSION=4.19.7
SIP_SOURCE=https://sourceforge.net/projects/pyqt/files/sip/sip-$SIP_VERSION/sip-$SIP_VERSION.tar.gz

PYQT_VERSION=5.10
PYQT_SOURCE=https://sourceforge.net/projects/pyqt/files/PyQt5/PyQt-$PYQT_VERSION/PyQt5_gpl-$PYQT_VERSION.tar.gz

echo "Installing Raspberry PI"

if [ ! -d 'sip-$SIP_VERSION' ]; then
  wget $SIP_SOURCE
  tar -xzf sip-$SIP_VERSION.tar.gz
fi

if [ ! -d 'PyQt5_gpl-$PYQT_VERSION' ]; then
  wget $PYQT_SOURCE 
  tar -xzf PyQt5_gpl-$PYQT_VERSION.tar.gz
fi

(cd sip-$SIP_VERSION && python3 configure.py && make -j4 && make install) || exit 1
(cd PyQt5_gpl-$PYQT_VERSION &&  python3 configure.py --confirm-license  && make -j4 && make install) || exit 1


exit 0



