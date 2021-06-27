public class CTPeopleTracingController {
    //First Method
    public static List<People_Tracing__c> getTraces(String recordId) {

        List<People_Tracing__c> ptList = [SELECT Name, Id, Contact_Date__c, 
                                          Contact_Type__c, Person_2__c, Person_1__c,
                                          person_1__r.health_Status__c, person_1__r.token__c,
                                          person_2__r.health_Status__c, person_2__r.token__c
                                          FROM People_Tracing__c
                                          WHERE Person_1__c =:recordId OR Person_2__c =:recordId
                                          ORDER BY contact_date__c DESC
                                          NULLS LAST];
        return ptList;

    }

    //Second Method
    public static List<People_Tracing__c> CheckDuplicates(List<People_Tracing__c> peopleTraces){
    // store the unique ids
    Set<Id> PersonIDs = New Set<id>();
    For(People_Tracing__c PTRec : peopleTraces){

        PersonIDs.add(PTRec.Person_1__c);
        PersonIDs.add(PTRec.Person_2__c);
    }

    // List of duplicates records
    List<People_Tracing__c> DupeList = New List<People_Tracing__c>();
    //Map id and Set<id>

    Map<id, Set<id>> MapofExistingRecords = new Map<id,Set<id>>();
    List<People_Tracing__c> ExistingRecords = [SELECT Id, Person_2__c, Person_1__c
                                                     FROM People_Tracing__c
                                                    WHERE Person_1__c IN:PersonIDs
                                                       OR Person_2__c IN:PersonIDs];

   
   If(ExistingRecords != Null && ExistingRecords.size() > 0){
        for(People_Tracing__c Ptrace: ExistingRecords){
            if(! MapofExistingRecords.containskey(Ptrace.Person_1__c) ){
                MapofExistingRecords.put(Ptrace.Person_1__c, new set<id>());

            }
            MapofExistingRecords.get(Ptrace.Person_1__c).add(Ptrace.Person_2__c);
            if(! MapofExistingRecords.containskey(Ptrace.Person_2__c) ){
                MapofExistingRecords.put(Ptrace.Person_2__c, new set<id>());

            }
            MapofExistingRecords.get(Ptrace.Person_2__c).add(Ptrace.Person_1__c);

        }
        For(People_Tracing__c trace : peopleTraces){

            if(
                (MapofExistingRecords.containsKey(trace.Person_1__c)&& MapofExistingRecords.get(trace.Person_1__c).contains(trace.Person_2__c))
                ||
                (MapofExistingRecords.containsKey(trace.Person_2__c)&& MapofExistingRecords.get(trace.Person_2__c).contains(trace.Person_1__c))
            )
            DupeList.add(trace);
        }

             }
             return dupelist;
}
}