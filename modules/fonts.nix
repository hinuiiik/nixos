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
		corefonts
		vista-fonts
	];
}
