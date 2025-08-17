.PHONY: dist clean

dist:
	bash scripts/build_dmg.sh
	bash scripts/build_pkg.sh
	bash scripts/make_zip.sh

clean:
	rm -rf build dist package pkgroot ImageToEPS.dmg ImageToEPS-Setup.pkg ImageToEPS-Setup.zip
