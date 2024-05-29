public class DummyJSONIntegrationDemo
{
    public static void testIntegration()
    {
        Http http = new Http();
        Httprequest req = new Httprequest();
        
        req.setHeader('Authorization', 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTUsInVzZXJuYW1lIjoia21pbmNoZWxsZSIsImVtYWlsIjoia21pbmNoZWxsZUBxcS5jb20iLCJmaXJzdE5hbWUiOiJKZWFubmUiLCJsYXN0TmFtZSI6IkhhbHZvcnNvbiIsImdlbmRlciI6ImZlbWFsZSIsImltYWdlIjoiaHR0cHM6Ly9yb2JvaGFzaC5vcmcvSmVhbm5lLnBuZz9zZXQ9c2V0NCIsImlhdCI6MTcxMTIwOTAwMSwiZXhwIjoxNzExMjEyNjAxfQ.F_ZCpi2qdv97grmWiT3h7HcT1prRJasQXjUR4Nk1yo8');
        req.setendpoint('https://dummyjson.com/products');
        req.setMethod('GET');
        
        HttpResponse resp = Http.send(req);
        
        system.debug('response status --> ' + resp.getStatusCode());
        system.debug('response check --> ' + resp.getBody());
        
        
        // If the request is successful, parse the JSON response.
        if(resp.getStatusCode() == 200) 
        {          
            try
            {   
                // Deserialize the JSON string into collections of primitive data types.
                Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(resp.getBody());
                
                // Cast the values in the 'Product' key as a list
                List<Object> products = (List<Object>) results.get('products');
                
                System.debug('Received the following products:');
                System.debug(products);
            }
            catch(Exception ex)
            {
                System.debug('\n\n ======================================== ');
                System.debug(' EXCEPTION: '+ ex.getMessage());
                System.debug('\n ======================================== ');
            }
        }
    }
}