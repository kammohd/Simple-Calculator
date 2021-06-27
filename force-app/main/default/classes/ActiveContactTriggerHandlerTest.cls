@istest
public class ActiveContactTriggerHandlerTest {

    @TestSetup
    static void makeData(){
        List<account> TestAccounts = New List<account>();
        For(Integer i=0; i < 2; i++ ){
            TestAccounts.add(new Account(Name='Test' + i));

        }
        Insert TestAccounts;

        List<contact> TestContacts = new List<contact>();
        TestContacts.add(new Contact(LastName ='Test Con 1', AccountId=TestAccounts[0].Id));
        TestContacts.add(new Contact(LastName ='Test Con 2', AccountId=TestAccounts[0].Id));
        TestContacts.add(new Contact(LastName ='Test Con 3', AccountId=TestAccounts[1].Id, Active__c = True));
        TestContacts.add(new Contact(LastName ='Test Con 4', AccountId=TestAccounts[0].Id));
        TestContacts.add(new Contact(LastName ='Test Con 5', AccountId=TestAccounts[1].Id, Active__c = True));

        Insert TestContacts;
    }

   
   @isTest
    public static void afterinserthandlertest() {

       
        
        List<account> accs = [Select id, Active_Contacts__c from Account];
        system.assertEquals(2, accs.size());
        system.assertEquals(0, accs[0].active_Contacts__c);
        system.assertEquals(2, accs[1].active_Contacts__c);

    
    }

    @isTest
    public static void afterinserthandlertestBulk() {
        List<Account> TestAccount = [Select id, Name from account order by Name];
        List<contact> TestContacts = new List<contact>();
        For(integer i = 0; i < 1000; i++){
            TestContacts.add(new contact(LastName = 'Test Con' + i, AccountId = TestAccount[0].Id, Active__c = True));

        }
        TestContacts.add(new contact(LastName = 'Test Con' + 1001, AccountId = TestAccount[1].Id));
        TestContacts.add(new contact(LastName = 'Test Con' + 1002, AccountId = TestAccount[1].Id));
        TestContacts.add(new contact(LastName = 'Test Con' + 1003, AccountId = TestAccount[1].Id));

        Insert TestContacts;
        
        List<account> accs = [Select id, Active_Contacts__c from Account];
        System.assertEquals(1003, TestContacts.size());
        system.assertEquals(2, accs.size());
        system.assertEquals(1000, accs[0].active_Contacts__c);
        system.assertEquals(2, accs[1].active_Contacts__c);

    
    }

@isTest

public static void AfterUpdateHandlerTest1(){

    
    List<Contact> TestContacts =[Select id, LastName, Active__c from Contact Order By LastName ];
    List<account> accs = [Select id, Active_Contacts__c from Account];
    system.assertEquals(2, accs.size());
    system.assertEquals(0, accs[0].active_Contacts__c);
    system.assertEquals(2, accs[1].active_Contacts__c);

    List<Contact> ConList = [Select Id, LastName, Active__c, AccountID from Contact];

    For(Contact C : ConList){
        If(C.LastName == 'Test Con 1' || C.LastName == 'Test Con 2' ){

            C.Active__c = True;
           
        }

        If(C.LastName == 'Test Con 3' || C.LastName == 'Test Con 5' ){
            C.AccountId = accs[0].id;
        }

    }

    Test.startTest();
    Update Conlist;
    Test.stopTest();

    List<account> acs = [Select id, Active_Contacts__c from Account];
    system.assertEquals(2, acs.size());
    system.assertEquals(4, acs[0].active_Contacts__c);
    system.assertEquals(0, acs[1].active_Contacts__c);


    }
    
   @istest
   public static void AfterDeleteHandler(){

    List<Contact> ConList = [Select id, LastName from contact where LastName Like 'Test Con 3' OR LastName Like 'Test Con 5'];
    Test.startTest();
    Delete Conlist;
    Test.stopTest();

    List<Account> AccList = [Select Id, Name, Active_Contacts__c from Account Order By Name];
    System.assertEquals(0, Acclist[1].Active_Contacts__c);


       }

       @isTest
    public static void AfterUndelete(){
    
    List<Contact> ConList = [Select id, LastName from contact where LastName Like 'Test Con 3' OR LastName Like 'Test Con 5'];
    Delete Conlist;
    Test.startTest();
    UnDelete Conlist;
    Test.stopTest();
    List<Account> AccList = [Select Id, Name, Active_Contacts__c from Account Order By Name];

    System.assertEquals(2, Acclist[1].Active_Contacts__c);


    }

}