#!/bin/bash

PREFIX="/data/data/com.termux/files/usr"
HOME="/data/data/com.termux/files/home"
NAME="neon-termux"
VERSION="1.0.0"
OUT_DIR="${GITHUB_WORKSPACE}/out"
DEB_NAME="neon-termux.deb"

if [ -z "$GITHUB_WORKSPACE" ]; then
    OUT_DIR="out"
fi

rm -rf "${OUT_DIR}"
mkdir -p "${OUT_DIR}/deb"
mkdir -p "${OUT_DIR}/deb${PREFIX}/bin"
cp -v src/neon "${OUT_DIR}/deb${PREFIX}/bin/"
cp -rv deb/dpkg-conf "${OUT_DIR}/deb/DEBIAN"
mkdir -p "${OUT_DIR}/deb${HOME}/${NAME}"
echo "${VERSION}" > "${OUT_DIR}/deb${HOME}/${NAME}/.neon_version"
chmod -R 755 "${OUT_DIR}/deb/DEBIAN"
chmod 755 "${OUT_DIR}/deb${PREFIX}/bin/neon"
cd "${OUT_DIR}/deb"
dpkg-deb -Zxz -b . "${OUT_DIR}/${DEB_NAME}"
echo "=== Package Structure ==="
dpkg -c "${OUT_DIR}/${DEB_NAME}"
echo "=== Package Metadata ==="
dpkg -I "${OUT_DIR}/${DEB_NAME}"

if [ -n "$GITHUB_WORKSPACE" ]; then
    echo "deb_path=${OUT_DIR}/${DEB_NAME}" >> $GITHUB_OUTPUT
fi

echo "=== Finish Build ==="
echo "package successfully built: ${OUT_DIR}/${DEB_NAME}"
