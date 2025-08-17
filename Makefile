.PHONY: dist clean

dist:
	./scripts/print_versions.sh
	./scripts/build_dmg.sh
	./scripts/build_pkg.sh
	./scripts/make_zip.sh

clean:
	rm -rf build dist package pkgroot ImageToEPS.dmg ImageToEPS-Setup.pkg ImageToEPS-Setup.zip
