public class Callout {
    @AuraEnabled(cacheable=true)
    public static String Callout(String City) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        String APIKey = 'c693f7dc33d94fa8a3a164120212005';
        //String City = City;
        String Temp;
        request.setEndpoint('http://api.weatherapi.com/v1/current.json?key=' + APIKey + '&q='+City+'&aqi=no');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            Map<String, Object> CurrentStat = (Map<String,Object>) results.get('current');
            Temp = String.valueof(CurrentStat.get('temp_c'));
            
            
        }
        Else{

        Temp = 'Connection Error';

        }
        return Temp;
    }

    }