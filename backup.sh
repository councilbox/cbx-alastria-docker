#!/bin/bash
source env.sh

if [ "$1" == "all" ]; then
    OPT=all
    echo "[*] Making a backup of the keys and chain data... "
# Backup only the keys by default
elif [ "$1" == "" ]; then
    OPT=keys
    echo "[*] Making a backup of the keys... "
fi

ARCHIVE=$NODE_NAME_$(date +%Y%m%d%H%M%S)_$OPT.xz
CUID=$UID

echo "[*] Stopping container... "
./stop.sh 2> /dev/null; sleep 10
mkdir -p backups; cd backups

if [ "$OPT" == "keys" ]; then
    sudo tar -cvzf $ARCHIVE \
        $DATA_DIR/data/passwords.txt \
        $DATA_DIR/data/keystore \
        $DATA_DIR/data/constellation/keystore \
        $DATA_DIR/data/geth/nodekey
else
    sudo tar -cvzf $ARCHIVE $DATA_DIR
fi
echo "[*] Starting container... "
sudo chown $CUID:$CUID $ARCHIVE \
&& cd .. && ./start.sh 2> /dev/null

echo "[*] Backup stored in ./backups/$ARCHIVE"
echo "Done!"
