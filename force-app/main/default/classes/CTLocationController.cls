public class CTLocationController {
    //First Method @uthor---Mohammad Kamran - Return 100 Location records
public static List<Location__c> getRecentStatusChanges(){
    List<Location__c> LocationList = [SELECT Address__c, Id, Name, 
                                      Pincode__c, Red_Score__c, Status__c,
                                      Status_Update_Date__c FROM Location__c
                                      ORDER BY Status_Update_Date__c DESC
                                      NULLS LAST
                                      LIMIT 100];
    If(LocationList.size() != 0){
    return LocationList;
    }
        return Null;
    } 
    //Second Method @uthor---Mohammad Kamran - Search by Search Term
    public static List<Location__c> searchLocations(String searchTerm){
        searchTerm = searchTerm +'%';
        List<Location__c> LocationList = [SELECT Address__c, Id, Name, 
                                          Pincode__c, Red_Score__c, Status__c,
                                          Status_Update_Date__c FROM Location__c
                                          WHERE Name    Like :searchTerm 
                                          OR Pincode__c Like :searchTerm
                                          OR Address__c Like :searchTerm 
                                          ORDER BY Status_Update_Date__c DESC
                                          NULLS LAST]; 
        
    If(LocationList.size() != 0){
    return LocationList;
    }
    return Null; 
    }
    //Third Method @uthor---Mohammad Kamran - Search by LocationID
    public static Location__c getLocationById(String locationid){
    List<Location__c> Location = [SELECT Address__c, Id, Name, 
                            Pincode__c, Red_Score__c, Status__c,
                            Status_Update_Date__c FROM Location__c
                            WHERE id =:locationid
                            LIMIT 1];
    if(Location.size() != 0){
        Return Location[0];
    }
    
    Return Null;
    }
//Fourth Method
public static Map<String,Integer> getStatusCount(){
Map<String,Integer> StatusCount = New Map<String,Integer>();
for(AggregateResult Locations : [SELECT COUNT(Id) NumberOfLocations,
                                Status__c Status 
                                FROM Location__c 
                                GROUP BY Status__c]){
StatusCount.put(String.valueOf(Locations.get('Status')), integer.valueOf(Locations.get('NumberOfLocations')));

                                }
return StatusCount;

}
}