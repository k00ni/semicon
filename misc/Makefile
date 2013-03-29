default:
	@echo "Semicon - CLI"
	@echo " make install-build-svg2png-tool.. > to install tools for generating PNG's or ICO's"
	@echo " make build-pngs ................. > to create PNG's out of SVG files"
	@echo " make build-icos ................. > to create ICO's out of SVG files"
	@echo " make build-tar .................. > to create an archive containg SVG, PNG and ICO files"
	@echo " make create-all-folder .......... > to collect all semicons in one folder (for all kinds)"
	@echo " make update-readme .............. > to update README.md using refreshed PNG's"
	
install-build-svg2png-tool:
	sh scripts/install-tools.sh
	
build-pngs:
	sh scripts/build-pngs.sh
	sh scripts/build-pngs.sh 32
	sh scripts/build-pngs.sh 48
	sh scripts/build-pngs.sh 64
	sh scripts/build-pngs.sh 96
	sh scripts/build-pngs.sh 128
	sh scripts/build-pngs.sh 256

build-icos:
	sh scripts/build-icos.sh
	
build-tar:
	sh scripts/build-tar.sh
	
create-all-folder:
	sh scripts/create-all-folder.sh
	
update-readme:
	sh scripts/update-README.sh
	
prepare: build-pngs build-icos create-all-folder update-readme build-tar
