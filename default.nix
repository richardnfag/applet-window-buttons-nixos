with import <nixpkgs> {};
stdenv.mkDerivation {

    name = "applet-window-buttons";

    src = fetchgit {
        url = "https://github.com/psifidotos/applet-window-buttons.git";
        rev = "1668c6914386a3c7fcd27498bee034476385a3e7";
        sha256 = "0r1h4kbdv6pxj15w4n1w50g8zsl0jrc4808dyfygzwf87mghziyz";
    };

    nativeBuildInputs = [ cmake ];
    
    buildInputs = [
        pkgs.gnumake
        pkgs.gcc
        pkgs.cmake
        pkgs.extra-cmake-modules
        pkgs.binutils
        pkgs.libsForQt5.plasma-framework
        pkgs.libsForQt5.kdeclarative
        pkgs.libsForQt5.kconfigwidgets
        pkgs.libsForQt5.kdecoration
    ];
    
    buildPhase = ''
        cmake -DCMAKE_INSTALL_PREFIX=$out -DCMAKE_BUILD_TYPE=Release -Wnodev ..
        make -j$(nproc)
    '';
    
    installPhase = ''
        make install
    '';
}


