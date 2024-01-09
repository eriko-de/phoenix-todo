dev:
	mix phx.server

release:
	mix phx.gen.release --docker

build:
	docker compose build

up:
	docker compose up

full-release-test: build release up
