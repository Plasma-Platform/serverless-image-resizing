.PHONY: all image package dist clean

all: dist

image:
	docker build --tag  node:8.10 .

package: image
	docker run --rm --volume ${PWD}/lambda:/build node:8.10 npm install --production

dist: package
	cd lambda && zip -FS -q -r ../dist/function.zip *

clean:
	sudo rm -r lambda/node_modules
	docker rmi --force node:8.10
