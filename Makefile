SHELL := /bin/bash -e
port := 9001

clean-docker:
	if [[ ! -z $$(docker ps -q -f "name=example-lambda") ]]; then docker stop $$(docker ps -q -f "name=example-lambda") ; fi

clean: clean-docker
	rm -rf **/node_modules

run: clean-docker
	docker run -d --rm \
	  -e DOCKER_LAMBDA_WATCH=1 \
	  -e DOCKER_LAMBDA_STAY_OPEN=1 \
	  -p $(port):$(port) \
	  --name example-lambda \
	  -v $$(pwd)/src:/var/task:ro,delegated \
	  lambci/lambda:nodejs12.x \
	  index.handler

runstats:
	docker run --rm \
	  -v $$(pwd)/src:/var/task:ro,delegated \
	  lambci/lambda:nodejs12.x \
	  index.handler

test-unit:
	npm i
	npm test

test-integration: run
	npm run integration

test: clean test-unit test-integration