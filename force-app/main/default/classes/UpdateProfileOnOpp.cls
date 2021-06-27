public class UpdateProfileOnOpp {
    public UpdateProfileOnOpp(List<id> OppRecId) {

        List<Opportunity> Opps = [Select id, amount, profile__c from opportunity where id in :OppRecId ];

        For(Opportunity Opp : Opps)
        {
            If(Opp.Amount < 10000 || Opp.Amount == Null)
            {
                opp.profile__c ='Low';

            }
            Else If(Opp.Amount > 10000 && Opp.Amount < 50000)
            {
                opp.profile__c ='Medium';

            }
            else
            {
                opp.profile__c ='High';
            }

           

        }
        Update Opps;

    }
}