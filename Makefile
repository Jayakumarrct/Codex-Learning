.PHONY: dmg clean

dmg:
	bash scripts/build_dmg.sh

clean:
	rm -rf build dist package ImageToEPS.dmg
