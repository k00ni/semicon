default:
	@echo "Semicon - CLI"
	@echo " make install-build-svg2png-tool"
	@echo " make build-pngs"
	@echo " make create-all-folder"
	
install-build-svg2png-tool:
	sudo apt-get install librsvg2-bin
	
build-pngs:
	sh scripts/build-pngs.sh
	
create-all-folder:
	sh scripts/create-all-folder.sh
	
prepare: build-pngs create-all-folder
