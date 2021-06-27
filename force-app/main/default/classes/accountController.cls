public class accountController {
   
        public static void updateAvgCaseResolutionDays(List<id> accountIds){
        Map<Id, Integer> CaseAgeonAccount   = New Map<Id,Integer>();
        Map<Id, Integer> TotalCaseonAccount = New Map<Id,Integer>();

        For(Case Cs : [Select id, Accountid, Status, ClosedDate, CreatedDate 
                      from case where IsClosed = True 
                      AND AccountId In:AccountIds]){

                       If(!TotalCaseonAccount.containsKey(Cs.AccountId)){
                           CaseAgeonAccount.put(cs.AccountId, 0);
                           TotalCaseonAccount.put(cs.AccountId, 0);

                       }

                       Integer TotalCases = TotalCaseonAccount.get(cs.AccountId);
                       TotalCases++;
                       TotalCaseonAccount.put(cs.AccountId, TotalCases);

                       Integer CaseAge = CaseAgeonAccount.get(Cs.AccountId);
                       CaseAge = CaseAge + cs.CreatedDate.date().daysBetween(Cs.ClosedDate.date()); 
                       CaseAgeonAccount.put(cs.AccountId, CaseAge);
                    }

                       List<Account> UpdateAccount = New List<Account>();

                       For(Id Acc : CaseAgeonAccount.keyset()){

                          Decimal ResolutionDays = CaseAgeonAccount.get(Acc)/TotalCaseonAccount.get(Acc);
                          
                          Account UpdateAc = New Account(id = Acc, Avg_Case_Resolution_Days__c = ResolutionDays );
                        
                          UpdateAccount.add(UpdateAc);
                          System.debug(ResolutionDays + ' For Account ' + Acc + ' TotalCases ' + TotalCaseonAccount.get(Acc) + ' Total Age ' + CaseAgeonAccount.get(Acc) );
                          

                       }
                       Update UpdateAccount;



        }
           
    }