default:
	@echo "semicon - CLI"
	@echo " make build-pngs ................. > to create PNG's out of SVG files"
	@echo " make update-readme .............. > to update README.md using refreshed PNG's"
	@echo " make prepare .................... > to run all operations above to prepare a commit"

build-pngs:
	sh misc/scripts/build-pngs.sh 32

update-readme:
	sh misc/scripts/update-README.sh

prepare: build-pngs update-readme
