#! /bin/sh
#
# This script generates the Visual Studio build files for Windows.

project=simvoleon2

function cleansolution() {
  name=$1;
  rm -f ${name}.dsw ${name}.sln;
}

function cleanproject() {
  name=$1;
  rm -f ${name}.dsp ${name}.vcproj;
}

proper=true;

cleansolution ${project}
cleanproject ${project}
cleanproject ${project}_install
cleanproject ${project}_uninstall
cleanproject ${project}_docs

rm -f install-headers.bat uninstall-headers.bat

build_pwd=`pwd`
build="`cygpath -w $build_pwd | sed -e 's/\\\\/\\\\\\\\/g'`"
build_pwd="`pwd | sed -e 's/\\//\\\\\\\\/g'`\\\\"

source_pwd=`cd ../..; pwd`
source="`cygpath -w $source_pwd | sed -e 's/\\\\/\\\\\\\\/g'`"
source_pwd="`(cd ../..; pwd) | sed -e 's/\\//\\\\\\\\/g'`"

if $proper; then
  ../../configure --with-msvcrt=mtd --with-suffix=d \
    --enable-debug --enable-symbols || exit 1
  mv lib/config.h lib/config-debug.h

  ../../configure --enable-msvcdsp --with-msvcrt=mt \
    --disable-debug --disable-symbols --enable-optimization || exit 1
  mv lib/config.h lib/config-release.h

  cp ../misc/config-wrapper.h lib/config.h
else
  ./config.status --file=cfg/gendsp.pl;
fi

make || exit 1

if $proper; then
  sed \
    -e "s/$build/./g" \
    -e "s/$build_pwd//g" \
    -e "s/$source/..\\\\../g" \
    -e "s/$source_pwd/..\\\\../g" \
    -e 's/COIN_DLL/COIN_NOT_DLL/g' \
    -e '/_MAKE_DLL/ { s/COIN_NOT_DLL/COIN_DLL/g; }' \
    -e '/^# ADD .*LINK32.*\/debug/ { s/COINDIR)\\lib\\coin3.lib/COINDIR)\\lib\\coin3d.lib/g; }' \
    -e 's/$/\r/g' \
    <${project}.dsp >new.dsp
  mv new.dsp simvoleon2.dsp

  sed \
    -e "s/$build/./g" \
    -e "s/$build_pwd//g" \
    -e "s/$source/..\\\\../g" \
    -e "s/$source_pwd/..\\\\../g" \
    -e 's/$/\r/g' \
    <install-headers.bat >new.bat
  rm -f install-headers.bat
  mv -f new.bat ../misc/install-headers.bat

  sed \
    -e "s/$build/./g" \
    -e "s/$build_pwd//g" \
    -e "s/$source/..\\\\../g" \
    -e "s/$source_pwd/..\\\\../g" \
    -e 's/$/\r/g' \
    <uninstall-headers.bat >new.bat
  rm -f uninstall-headers.bat
  mv -f new.bat ../misc/uninstall-headers.bat
fi

echo "Done."
echo "Now, make sure there are no absolute paths in the .dsp file."

set -x
grep -i "\\(c:\\|@\\)" ${project}.dsp /dev/null
grep -i "cygdrive" ${project}.dsp /dev/null
grep "svn" ${project}.dsp /dev/null
sort ../misc/install-headers.bat | uniq -c | grep -v " 1 "
grep "SOURCE=" ${project}.dsp | sort | uniq -c | grep -v " 1 "
set +x

echo ""
echo "If everything seems OK, upgrade the project files (if necessary) with"
echo "  devenv.exe (for msvc7 and msvc8), or"
echo "  VCExpress.exe (for msvc9)."
echo ""

