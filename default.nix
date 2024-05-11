{ stdenv, kernel }:
let
  version = "0.1.0";
in
stdenv.mkDerivation {
  inherit version;
  name = "snull-${version}-${kernel.version}";
  src = ./src;

  # installPhase = ''
  #   mkdir $out
  #   cp -r * $out/
  # '';
  installTargets = [ "install" ];

  hardeningDisable = [ "pic" "format" ];
  nativeBuildInputs = kernel.moduleBuildDependencies;

  makeFlags = [
    "INSTALL_MOD_PATH=$(out)"
    "KERNELRELEASE=${kernel.modDirVersion}"
    "KERNELDIR=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build"
  ];
}
