Summary: This files count spec file in /etc directory
Name: script
Version: 1.0
Release: 1%{?dist}

Source0: script.sh
License: GPLv3+

%description
The "script.sh" program

%prep

%build

%install
mkdir -p %{buildroot}/usr/bin
install -m 0755 %{SOURCE0} %{buildroot}/usr/bin/script.sh

%files
/usr/bin/script.sh

%changelog
* Tue Dec 05 2024 Kateryna <katyapavlenko768@gmail.com> - 1.0-1
- Initial package
