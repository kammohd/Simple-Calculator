public  class CTLocationTracingController {
//First Method @uthor --- Mohammad Kamran - Get Visitor details from location tracing
public static list<Location_Tracing__c> getVisitors(String locationId){
List<Location_Tracing__c> LTrace = [SELECT Id, Name, Person__c, 
                                    Location__c, Visit_Date__c,
                                    Person__r.health_status__c,
                                    Person__r.token__c 
                                    FROM Location_Tracing__c
                                    WHERE Id = :locationId
                                    ORDER BY visit_Date__c DESC
                                    NULLS LAST];
Return LTrace;


}

//Second Method @uthor --- Mohammad Kamran - Get location by person ids provided
public static list<Location_Tracing__c> getLocationsByPersonIds(Set<id> personIds){

    List<Location_Tracing__c> LTrace = [SELECT Id, Person__c, 
                                        Location__c
                                        FROM Location_Tracing__c
                                        WHERE Person__c IN :personIds
                                        AND visit_date__c = LAST_N_DAYS: 10
                                       ];
    Return Ltrace;
}

//Third Method @uthor --- Mohammad Kamran - Get Locations by Location IDs provided
public static List<Location_Tracing__c> getLocationsByLocationIds(Set<id> locationIds){

    List<Location_Tracing__c> Ltrace = [SELECT Id, Person__c, 
                                        Location__c
                                        FROM Location_Tracing__c
                                        WHERE Location__c IN :locationIds
                                        AND person__r.health_status__c = 'Green'
                                        AND visit_date__c = LAST_N_DAYS: 10
                                         ];
    Return Ltrace;
}
//Fourth Method @uthor --- Mohammad Kamran - Duplicate Check

public static List<Location_Tracing__c> checkDuplicates(List<Location_Tracing__c> locationTraces){

    Set<id> locationIds = New Set<id>();
    Set<id> PersonIds = New Set<Id>();

    for(Location_Tracing__c Ltrace : locationTraces){

        locationIds.add(Ltrace.Location__c);
        personIds.add(ltrace.Person__c);
    }

    //Creating a Map of Location id with a set of person ids (ppl who visited the location)
    Map<id,set<id>> MapofExistingRecords = new Map<id,Set<id>>();
    List<Location_Tracing__c> existingRecords = [SELECT Id, Person__c,
                                                Location__c                             
                                                FROM Location_Tracing__c
                                                WHERE Location__c IN:locationIds
                                                AND person__c IN: PersonIds];

    
If(existingRecords != Null && existingRecords.size()>0){

    for(Location_Tracing__c Ltrace: existingRecords){
        If(!MapofExistingRecords.containsKey(Ltrace.Location__c)){
            //If it does not have the location, put in the location first
            MapofExistingRecords.put(Ltrace.Location__c, New Set<id>());
        }
        //Insert the related person records inside the maps - for one location, a set of persons visited the location.
        MapofExistingRecords.get(Ltrace.Location__c).add(Ltrace.Person__c);


    }
}

//Find the dupes
List<Location_Tracing__c> DupeRecs = New List<Location_Tracing__c>();
For(Location_Tracing__c Ltrace : locationTraces){
If(MapofExistingRecords.containsKey(Ltrace.Location__c) && MapofExistingRecords.get(Ltrace.Location__c).contains(Ltrace.Person__c)){
DupeRecs.add(Ltrace);

}

}
Return DupeRecs;
}

  
}