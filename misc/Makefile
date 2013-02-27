default:
	@echo "Semicon - CLI"
	@echo " make install-build-svg2png-tool"
	@echo " make build-pngs"
	@echo " make build-icos"
	@echo " make build-tar"
	@echo " make create-all-folder"
	@echo " make update-readme"
	
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
	
prepare: build-pngs create-all-folder update-readme build-tar
