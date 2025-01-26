{
  git,
  nh,
  lib,
  stdenvNoCC,
  makeWrapper,
  flakedir ? "$HOME/Workspace/Dev/nebula",
  name ? "houston",
  hostname ? "NOVA",
}:
stdenvNoCC.mkDerivation {
  inherit name;
  version = "1.0";

  src = ./.;

  nativeBuildInputs = [makeWrapper];

  postPatch = ''
    substituteInPlace houston.sh \
      --replace-fail "@flakedir@" "${flakedir}" \
      --replace-fail "@hostname@" "${hostname}"
  '';

  postInstall = ''
    install -D ./houston.sh $out/bin/houston

    wrapProgram $out/bin/hsw \
      --prefix PATH : ${
      lib.makeBinPath [
        git
        nh
      ]
    }
  '';

  meta = {
    description = "System config manager";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [kinzoku];
    platforms = lib.platforms.linux;
  };
}
