#!/bin/bash
set -e
_dir=`dirname "$(readlink -f "${0}")"`
_basedir=${_dir}
cd ${_basedir}
if [ -f ${_basedir}/../dark-icon-theme*.rpm ]; then
    rm -f ${_basedir}/../dark-icon-theme*.rpm
fi
if [ -f ${_basedir}/dark-icon-theme.spec ]; then
    rm -f ${_basedir}/dark-icon-theme.spec
fi
if [ -d ${_basedir}/dark-icon-theme ]; then
    rm -rf ${_basedir}/dark-icon-theme
fi
#icons
	mkdir -p ${_basedir}/dark-icon-theme/usr/share/icons
	cp -R ${_basedir}/../../DarK-svg ${_basedir}/dark-icon-theme/usr/share/icons

#creating the spec file:
cat <<\EOFALL> ${_basedir}/dark-icon-theme.spec
Buildroot: BUILDROOT
Name: dark-icon-theme
Version: 1.20210223133412
Release: 1
Summary: DarK icons svg version.
License: CC_BY_SAv4
Requires: hicolor-icon-theme
Provides: dark-icon-theme = %version
Obsoletes: dark-icon-theme <= %version
Group: System/X11
BuildArch: noarch

%define _rpmdir ../
%define _unpackaged_files_terminate_build 0
%define _source_payload w0.gzdio
%define _binary_payload w0.gzdio
%description
Ceres theme

%post

%postun

%files
%defattr(-,root,root,-)
#%doc COPYING ReadMe.md LICENSE
%{_datadir}/*
EOFALL

rpmbuild -bb --buildroot=${_basedir}/dark-icon-theme ${_basedir}/dark-icon-theme.spec
if [ -f ${_basedir}/../noarch/dark-icon-theme*.rpm ]; then
	mv ${_basedir}/../noarch/dark-icon-theme*.rpm ${_basedir}/..
	rm -rf ${_basedir}/../noarch ${_basedir}/dark-icon-theme.spec
fi
