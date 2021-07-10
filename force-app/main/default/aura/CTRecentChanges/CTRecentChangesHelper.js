({
    fetchResultpersonview : function(component) {
       const action = component.get('c.getRecentPersonHealthChanges');
       action.setCallback(this, function(response){
        const state = response.getState();
        if(state==="SUCCESS"){
        const ResVal = response.getReturnValue();
        component.set('v.data', ResVal);
        }

        
       });
       $A.enqueueAction(action);


    },
    fetchResultlocationview : function(component) {
        const action = component.get('c.getRecentLocationHealthChanges');
        action.setCallback(this, function(response){
         const state = response.getState();
         if(state==="SUCCESS"){
         const ResVal = response.getReturnValue();
         component.set('v.data', ResVal);
         }
 
         
        });
        $A.enqueueAction(action);
    }


})