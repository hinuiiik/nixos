{ pkgs, ... }:
{
	fonts.packages = with pkgs; [
		(google-fonts.override {
      fonts = [ "Bebas Neue" ];
    })
		material-symbols
		noto-fonts
		noto-fonts-cjk-sans
		noto-fonts-color-emoji
		iosevka
		# (pkgs.stdenvNoCC.mkDerivation {
		#       name = "custom-fonts";
		# 
		#       src = ../fonts;
		# 
		#       installPhase = ''
		#         mkdir -p $out/share/fonts/opentype
		#         cp *.otf $out/share/fonts/opentype/
		#       '';
		#     })
	];
}
