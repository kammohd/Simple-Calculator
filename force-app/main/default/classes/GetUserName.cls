public class GetUserName {
    @Auraenabled
    
    public static string fetchuser(){
        User UserRec = [Select Id, Name from user where id=: userInfo.getUserId() limit 1];
        String UserName = UserRec.Name;
        return UserName;
           
    }

}