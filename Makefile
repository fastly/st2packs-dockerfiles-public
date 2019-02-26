# Path where github repos are cloned
PRIVATE_PACKS_PATH="st2packs-image/private_packs"

.PHONY: image
image:
	@docker build --build-arg PACKS="st2" \
		-t st2packs:latest \
		st2packs-image

.PHONY: builder
builder:
	@docker build \
		-t stackstorm/st2packs:builder \
		st2packs-builder

.PHONY: runtime
runtime:
	@docker build \
		-t stackstorm/st2packs:runtime \
		st2packs-runtime

all: builder runtime image

.PHONY: custom
custom:
	cp clone_repos.sh $(PRIVATE_PACKS_PATH) && \
	cd $(PRIVATE_PACKS_PATH) && ./clone_repos.sh && rm clone_repos.sh
	docker build --build-arg PACKS="st2" \
		--build-arg PRIVATE_PACKS=true \
		-t st2packs:latest \
		st2packs-image
	rm -rf $(PRIVATE_PACKS_PATH)/*

.PHONY: push
push:
	docker push gcr.io/netsys-162413/stackstorm/st2packs
