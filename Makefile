default:
	@echo "Semicon - CLI"
	@echo " make install-build-svg2png-tool.. > to install tools for generating PNG's or ICO's"
	@echo " make build-pngs ................. > to create PNG's out of SVG files"
	@echo " make build-icos ................. > to create ICO's out of SVG files"
	@echo " make create-all-folder .......... > to collect all semicons in one folder (for all kinds)"
	@echo " make update-readme .............. > to update README.md using refreshed PNG's"
	@echo " make prepare .................... > to run all operations above to prepare a commit"
	
install-build-svg2png-tool:
	sh misc/scripts/install-tools.sh
	
build-pngs:
	sh misc/scripts/build-pngs.sh 32
	sh misc/scripts/build-pngs.sh 256

build-icos:
	sh misc/scripts/build-icos.sh
	
create-all-folder:
	sh misc/scripts/create-all-folder.sh
	
update-readme:
	sh misc/scripts/update-README.sh
	
prepare: build-pngs build-icos create-all-folder update-readme
