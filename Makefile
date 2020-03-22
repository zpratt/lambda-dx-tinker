SHELL := /bin/bash -e
port := 9001

clean:
	docker stop $$(docker ps -q -f "name=example-lambda")
	rm -rf **/node_modules

run:
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

test-lambda: run
	curl -d '{}' http://localhost:$(port)/2015-03-31/functions/index/invocations
