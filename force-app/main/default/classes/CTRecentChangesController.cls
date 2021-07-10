public class CTRecentChangesController {
//method 1
   @AuraEnabled
   public static List<Person__c> getRecentPersonHealthChanges() {
        return CTPersonController.getRecentHealthChanges();
    }
//method 2
    @AuraEnabled
    public static List<Location__c> getRecentLocationHealthChanges() {
         return CTLocationController.getRecentStatusChanges();
              }

     //method 3
    @AuraEnabled
    public static List<Person__c> searchPeople(String Term) {
         Term = Term + '%';
         return  CTPersonController.SearchPeople(Term);
              }
    //method 4
     @AuraEnabled
     public static List<location__C> searchLocations(String Term) {
          Term = Term + '%';
         return CTlocationController.searchLocations(Term);
               
      }
}