const frisby = require('frisby');

describe('index handler integration tests', () => {
    it('should respond with hello world', function () {
        return frisby.post('http://localhost:9001/2015-03-31/functions/index/invocations', {})
            .expect('status', 200)
            .expect('json', 'hello', 'world');
    });
});