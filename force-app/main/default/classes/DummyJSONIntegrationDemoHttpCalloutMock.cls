@isTest
global class DummyJSONIntegrationDemoHttpCalloutMock implements HttpCalloutMock
{
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest request) 
    {
        // Create a fake response
        HttpResponse response = new HttpResponse();
        	response.setHeader('Content-Type', 'application/json');
        	response.setBody('{"products": ["Coca-Cola Bottle", "Milk Carton", "Champagne Bottle"]}');
        	response.setStatusCode(200);
        return response;
    }
}