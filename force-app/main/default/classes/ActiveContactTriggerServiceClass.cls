public class ActiveContactTriggerServiceClass {
    public static void UpdateAccounts(Set<Id> AccountIDs) {

        List<Account> UpdatedAccounts = New List<Account>();
        For(Account result:    [SELECT id, Active_Contacts__c,
                               (SELECT Id from contacts where Active__c = True)
                                FROM Account
                                WHERE Id in:AccountIDs]){ 

        String AccountId = result.id;
        Integer ConCount = 0;
        For(Contact Con : result.contacts){

            ConCount++;
        }
        Account UpdatedAccount = New Account(Id = AccountId, Active_Contacts__c = ConCount);
        UpdatedAccounts.add(UpdatedAccount);

}
Update UpdatedAccounts;


    }
}