public class CTPersonController {
   //First Method
    public static string getToken(String MobileNumber) {
    Blob InputVal = Blob.valueOf(MobileNumber);
    Blob OutputToken = Crypto.generateDigest('MD5', InputVal);
    String Output = EncodingUtil.Base64Encode(OutputToken);
    Return Output;
    }

     //Second Method
    public static List<Person__c> getRecentHealthChanges(){
    List<person__c> PersonRecs = [SELECT Id, 
                                  Name, Health_Status__c, Mobile__c, 
                                  Status_Update_Date__c, Token__c 
                                  FROM Person__c
                                  ORDER BY Status_Update_Date__c DESC 
                                  NULLS LAST
                                  LIMIT 100];
    If(PersonRecs.size() != 0){
    Return PersonRecs;     
    }
    Return Null;          
    }
    //Third Method
    public static List<Person__c> SearchPeople(String SearchTerm){
    SearchTerm = SearchTerm +'%';
    List<person__c> PersonRecs = [SELECT Id, 
                                  Name, Health_Status__c, Mobile__c, 
                                  Status_Update_Date__c, Token__c 
                                  FROM Person__c
                                  WHERE Name   Like :SearchTerm 
                                  OR Mobile__c Like :SearchTerm
                                  OR Token__c  Like :SearchTerm
                                  ORDER BY Status_Update_Date__c DESC 
                                  NULLS LAST
                                  ];
    If(PersonRecs.size() != 0){
    Return PersonRecs;     
    }
    Return Null; 
    }
    //Fourth Method
    public static Person__c getPersonById(String PersonId){
    List<Person__c> PersonRec = [Select Id, 
                           Name, Health_Status__c, Mobile__c, 
                           Status_Update_Date__c, Token__c 
                           FROM Person__c
                           WHERE Id = :PersonId
                           LIMIT 1
                          ];
    
    If(PersonRec.size() != 0 && PersonRec != Null){
    Return PersonRec[0];
    }
    
    Return Null;
    
    }

//Fifth Method

public static Map<String, Integer> getHealthStatusCount(){

   
   Map<String, Integer> HealthStatCount = NEW Map<String, Integer>();

   For(AggregateResult Result : [SELECT COUNT(Name) Person, 
                                 Health_Status__c HealthStat
                                 FROM person__c 
                                 GROUP BY Health_Status__c]){

      Integer NumberofPeople = Integer.valueOf(Result.get('Person'));
      String HealthStat = String.valueof(Result.get('HealthStat'));

      HealthStatCount.put(HealthStat, NumberofPeople);
   }

   return HealthStatCount;
   
}
public static map<string,integer> GetPersonCount(){

   List<AggregateResult> PeopleCount = [Select Count(id) NumberofPeople, health_status__c 
                                        FROM person__c 
                                        GROUP BY health_status__c];
         If(PeopleCount.size()>0 && PeopleCount != Null){
            Map<String,integer> PeopleCountMap = New Map<String,integer>();
            for(AggregateResult Ppl : PeopleCount){
          
            PeopleCountMap.put(String.valueOf(Ppl.get('health_status__c')), Integer.valueOf(Ppl.get('NumberofPeople')));
           
         }
        
         return PeopleCountMap;

       
        }

                                              
     return Null;

}
                                }