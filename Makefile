.PHONY: all image package dist clean

all: dist

image:
	docker build --tag  node:lts-stretch .

package: image
	docker run --rm --volume ${PWD}/lambda:/build node:lts-stretch npm install --production

dist: package
	cd lambda && zip -FS -q -r ../dist/function.zip *

clean:
	sudo rm -r lambda/node_modules
	docker rmi --force node:lts-stretch
