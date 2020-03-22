const {handler} = require('./index');

describe('index lambda handler', () => {
    it('should respond with hello world', async function () {
        const response = await handler();

        expect(response).toEqual({hello: "world"});
    });
});
