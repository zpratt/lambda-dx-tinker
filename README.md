lambda DX tinkering
---

## What is this?

I'm experimenting with ways to:

1. Interact with AWS lambdas without deploying to AWS (i.e. running locally)
1. Demonstrate how to unit test AWS lambdas
1. Demonstrate how to run integration tests of AWS lambdas
1. Demonstrate how to orchestrate all of this with Make

## Prerequisites

1. Install Docker
1. Install Make
1. Install nodejs version 12.x
  * optionally using `nvm`
  
## Running

1. Running the tests: `make test`
1. Viewing runtime statistics of the lambda: `make runstats`
1. Running the lambda so that you can interact with it via postman: `make run`
