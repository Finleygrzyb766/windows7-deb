#!/bin/bash
set -e

PKG_NAME="windows7"
PKG_VER="V27"
MAINTAINER="Finleygrzyb766"
DESCRIPTION="Installs Windows 7 downloads folder for use on Debian systems."
BUILD_DIR="./${PKG_NAME}-deb"
INSTALL_DIR="${BUILD_DIR}/opt/windows7/downloads"

# Clean up any previous build
rm -rf "$BUILD_DIR"
mkdir -p "$INSTALL_DIR"
mkdir -p "${BUILD_DIR}/DEBIAN"

# Copy downloads folder
cp -r downloads "$INSTALL_DIR/../"

# Create control file
cat > "${BUILD_DIR}/DEBIAN/control" <<EOF
Package: $PKG_NAME
Version: $PKG_VER
Section: base
Priority: optional
Architecture: all
Maintainer: $MAINTAINER
Description: $DESCRIPTION
EOF

# Build DEB package
dpkg-deb --build "$BUILD_DIR"

echo "Package built: ${PKG_NAME}-deb.deb"