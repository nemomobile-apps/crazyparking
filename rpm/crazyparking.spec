Summary: Simple Rush-hour based puzzle game with 12 levels
Name: crazyparking
Version: 0.2.7
Release: 3
Source: %{name}-%{version}.tar.gz
URL: http://maemo.org/downloads/product/Maemo5/crazyparking/
License: GPL2
Group: System/GUI/Other
BuildRequires: pkgconfig(sdl2)
BuildRequires: pkgconfig(SDL2_mixer)
BuildRequires: pkgconfig(glesv1_cm)
BuildRequires: pkgconfig(egl)


%description
Simple Rush-hour based puzzle game with 12 levels

%prep
%setup -q 

%build
make

%install
make DESTDIR=%{?buildroot} install

%files
%defattr(-,root,root,-)
%doc ChangeLog SOURCES
/opt/%{name}/*
/usr/share/applications/*
