public class Fitness {
    
    public static Double calculateBmi(Double bodyWt, Double bodyHt)
    { 
    If(bodyWt <= 0 || bodyHt <= 0 )
    {
        System.debug('Check Values');
        Return 0;
    }
    else
    {
       
        return (bodyWt / (bodyHt * bodyHt));
        
    }
}
    public static Double calculatePace(Double Km, Double Mins){
    if (km <=0 || Mins <=0)
    {
        
        System.debug('Check Values');
        Return 0;
    }
    else 
        
    {
        Double Hr = Mins/60;
        return (km/hr);
    }
}
    }