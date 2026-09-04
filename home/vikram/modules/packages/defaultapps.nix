{ ... }:

{
	xdg.mimeApps = {
    enable = false;
    defaultApplications = {
      "text/html" = "zen.desktop";
      "x-scheme-handler/http" = "zen.desktop";
      "x-scheme-handler/https" = "zen.desktop";
      "x-scheme-handler/about" = "zen.desktop";
      "x-scheme-handler/unknown" = "zen.desktop";
      "inode/directory" = "org.kde.dolphin.desktop";
    };
  };
}
