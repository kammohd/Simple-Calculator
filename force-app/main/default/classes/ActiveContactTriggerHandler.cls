public class ActiveContactTriggerHandler {
    public static void AfterInsert(List<Contact> ContactList) {
        Set<id> AccountIDs = New Set<id>();
        List<account> UpdatedAccounts = new list<account>();
        For(Contact Con: ContactList){
            IF(!String.IsBlank(Con.AccountId)){
            AccountIDs.add(Con.AccountId);
            }
        }
         
        ActiveContactTriggerServiceClass.UpdateAccounts(AccountIDs);
    
       

    }
    public static void AfterUpdate(List<Contact> ContactList, Map<Id, Contact> OldConMap) {
        Set<id> AccountIDs = New Set<id>();
    List<account> UpdatedAccounts = new list<account>();
    For(Contact Con: ContactList){
        IF(!String.IsBlank(Con.AccountId) && OldConMap.get(Con.id).Active__c != Con.Active__C){
        AccountIDs.add(Con.AccountId);
        }
    else If(OldConMap.get(Con.id).AccountId != Con.AccountId){
        AccountIDs.add(Con.AccountId);
        AccountIDs.add(OldConMap.get(Con.id).AccountId);

    }
    }
    ActiveContactTriggerServiceClass.UpdateAccounts(AccountIDs);
     
    

}
public static void AfterDelete(List<Contact> OLDContactList) {
    Set<id> AccountIDs = New Set<id>();
    List<account> UpdatedAccounts = new list<account>();
    For(Contact Con: OLDContactList){
        IF(!String.IsBlank(Con.AccountId)){
        AccountIDs.add(Con.AccountId);
        }
    }
     
    ActiveContactTriggerServiceClass.UpdateAccounts(AccountIDs);

   

}
public static void AfterUndelete(List<Contact> NewContactList) {
    Set<id> AccountIDs = New Set<id>();
    List<account> UpdatedAccounts = new list<account>();
    For(Contact Con: NewContactList){
        IF(!String.IsBlank(Con.AccountId)){
        AccountIDs.add(Con.AccountId);
        }
    }
     
    ActiveContactTriggerServiceClass.UpdateAccounts(AccountIDs);

   

}

}