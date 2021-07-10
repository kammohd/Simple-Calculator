public class CTHealthHeaderController {
    @AuraEnabled
    public static Map<string,Integer> getPersonHealthStatusCount(){
        return CTPersonController.GetPersonCount();
    }
    @AuraEnabled
    public static Map<string,Integer> getLocationHealthStatusCount(){
      return  CTLocationController.GetLocationCount();
    }
}