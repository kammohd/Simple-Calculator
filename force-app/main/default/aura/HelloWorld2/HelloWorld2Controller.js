({
	doInit : function(component, event, helper) {
        let action = component.get("c.fetchuser");
        action.setCallback(this, function(response){
        let state = response.getState();
        let ResVal = response.getReturnValue();
            if(state==="SUCCESS"){
               component.set("v.userName", ResVal) ;
                             
            }
            
        });
        
        $A.enqueueAction(action);
        
    }
})