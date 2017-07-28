rm -rf dist
mkdir dist
for i in /data/release/downloads/$1/*/*.checksum.txt
do
  cp "${i/checksum.txt/tar.gz}" "dist/$(cat "$i").tar.gz"
done
python /root/osscmd/osscmd uploadfromdir --id=ztDf0fCxr0eCgSIi --key=11LyGMp38uiHXuM2ok808w2jZVaTda dist "oss://mycard/release/dist"
python /root/osscmd/osscmd put --id=ztDf0fCxr0eCgSIi --key=11LyGMp38uiHXuM2ok808w2jZVaTda /data/release/metalinks/$1.meta4 "oss://mycard/release/metalinks/$1.meta4"
python /root/osscmd/osscmd put --id=ztDf0fCxr0eCgSIi --key=11LyGMp38uiHXuM2ok808w2jZVaTda /data/release/checksums/$1 "oss://mycard/release/checksums/$1"
