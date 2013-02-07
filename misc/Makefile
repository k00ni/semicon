default:
	@echo "Semicon - CLI"
	@echo " make install-build-svg2png-tool"
	@echo " make build-pngs"
	@echo " make build-tar"
	@echo " make create-all-folder"
	@echo " make update-readme"
	
install-build-svg2png-tool:
	sh scripts/install-tools.sh
	
build-pngs:
	sh scripts/build-pngs.sh
	sh scripts/build-pngs.sh 32
	sh scripts/build-pngs.sh 64
	sh scripts/build-pngs.sh 128
	
build-tar:
	sh scripts/build-tar.sh
	
create-all-folder:
	sh scripts/create-all-folder.sh
	
update-readme:
	sh scripts/update-README.sh
	
prepare: build-pngs create-all-folder update-readme build-tar
