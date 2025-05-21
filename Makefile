.PHONY: help

tagname=1
local_image=local/bloaty
push_image=mc7h/bloaty

help:
	@echo "Available make targets:"
	@grep -E '^[a-zA-Z0-9_-]+:([^=]|$$)' Makefile | \
		grep -v '^\.' | \
		awk -F: '{printf "  \033[1;32m%-20s\033[0m %s\n", $$1, $$2}'

build-local:
	docker build -t $(local_image) .

run-local:
	docker run $(local_image)

term-local:
	docker run -it --rm --entrypoint /bin/bash $(local_image)

profile-local:
	docker run $(local_image) /usr/local/bin/bloaty -d compileunits

build-image:
	docker buildx build --platform linux/amd64,linux/arm64 --tag $(push_image):$(tagname) .

load-image:
	docker buildx build --platform linux/arm64 --load --tag $(push_image):$(tagname) .

push-image:
	docker buildx build --platform linux/amd64,linux/arm64 --push --tag $(push_image):$(tagname) --tag $(push_image):latest .
