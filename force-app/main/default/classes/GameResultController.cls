public  class GameResultController {
    @AuraEnabled
    public static List<Word_Shuffle__c> getResults(){
        // get current user id
        string userid = UserInfo.getUserId();
        List<Word_shuffle__c> results = [Select Id, Name, Result__c, Game_Mode__c, CreatedDate
                                        FROM Word_Shuffle__c
                                        Where CreatedbyId = :userid
                                        ORDER BY CreatedDate DESC];
        return results;
    }
    
}