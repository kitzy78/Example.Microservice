exports.handler = async (event) => {
    const response = {
        statusCode: 200,
        body: JSON.stringify("Example.Microservice")
    };
    return response;
}