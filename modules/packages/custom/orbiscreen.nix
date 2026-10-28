{ lib
, fetchFromGitHub
, rustPlatform
, pkg-config
, wrapGAppsHook3
, gtk4
, webkitgtk_4_1
, gst_all_1
, libevdev
, libxkbcommon
, graphene
, libadwaita
}:

rustPlatform.buildRustPackage rec {
  pname = "orbiscreen";
  version = "0.39.1";

  src = fetchFromGitHub {
    owner = "shadow-x78";
    repo = "orbiscreen";
    rev = "v${version}";
    hash = "sha256-nFLKJdNjg2l81oVA7DdvyCZTwowovefRDnSwT56qY3k=";
  };

  cargoHash = "sha256-YL8Xmfo6F19T0gGfhGp0AhQZKRts/19mp5d2DvkWsBA=";

  nativeBuildInputs = [
    pkg-config
    wrapGAppsHook3
  ];

  buildInputs = [
    gtk4
    webkitgtk_4_1
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    libevdev
    libxkbcommon
    graphene
    libadwaita
  ];

  cargoBuildFlags = [ "--workspace" ];
  cargoTestFlags = [ "--workspace" ];
  dontCargoInstall = true;

  postInstall = ''
    daemon=$(find target -type f -path '*/release/orbiscreen' -print -quit)
    install -Dm755 "$daemon" $out/bin/orbiscreen
    gui=$(find target -type f -path '*/release/orbiscreen-gui' -print -quit)
    if [ -n "$gui" ]; then
      install -Dm755 "$gui" $out/bin/orbiscreen-gui
    fi

    install -Dm644 data/orbiscreen.svg \
      $out/share/icons/hicolor/scalable/apps/orbiscreen.svg
    ln -s orbiscreen.svg \
      $out/share/icons/hicolor/scalable/apps/orbiscreen-gui.svg

    for size in 16 24 32 48 64 128 256 512; do
      if [ -f "crates/orbiscreen-gui/icons/''${size}x''${size}.png" ]; then
        install -Dm644 "crates/orbiscreen-gui/icons/''${size}x''${size}.png" \
          "$out/share/icons/hicolor/''${size}x''${size}/apps/orbiscreen.png"
        ln -s orbiscreen.png \
          "$out/share/icons/hicolor/''${size}x''${size}/apps/orbiscreen-gui.png"
      fi
    done

    install -Dm644 data/orbiscreen.desktop \
      $out/share/applications/orbiscreen.desktop
    install -Dm755 scripts/install-evdi-module.sh \
      $out/share/orbiscreen/install-evdi-module.sh
    install -Dm644 data/99-orbiscreen-usb.rules \
      $out/lib/udev/rules.d/99-orbiscreen-usb.rules

    for file in index.html style.css app.js annexb.js stats.js \
      favicon.svg favicon.png apple-touch-icon.png; do
      install -Dm644 "clients/web/$file" "$out/share/orbiscreen/client/$file"
    done
    install -d $out/share/orbiscreen/client/fonts
    cp clients/web/fonts/*.ttf $out/share/orbiscreen/client/fonts/

    install -Dm644 data/orbiscreen.service \
      $out/lib/systemd/user/orbiscreen.service
    substituteInPlace $out/lib/systemd/user/orbiscreen.service \
      --replace-fail /usr/bin/orbiscreen $out/bin/orbiscreen
  '';

  meta = {
    description = "Turn Android devices into high-performance secondary monitors for Linux";
    homepage = "https://github.com/shadow-x78/orbiscreen";
    license = lib.licenses.gpl3Plus;
    mainProgram = "orbiscreen";
    platforms = lib.platforms.linux;
  };
}
