@isTest
public class FitnessTest {
    @isTest
    public Static void FitnessTestPositve()
    //Positive test 
    {
       Double BMI = Fitness.calculateBmi(95, 5);
       Double Pace = Fitness.calculatePace(10, 60);
       System.assertEquals(3.8, BMI, 'Check Code For BMI');
       System.assertEquals(10, Pace, 'Check Code For Pace');
    }
    @isTest
    public Static void FitnessTestNegative()
    //Negative test 
    {
       Double BMI = Fitness.calculateBmi(0, 5);
       Double Pace = Fitness.calculatePace(0, 60);
       System.assertEquals(0, Pace, 'Check Code for Pace Negative Handeling');
       System.assertEquals(0, BMI, 'Check Code for BMI Negative Handeling');
    }
}