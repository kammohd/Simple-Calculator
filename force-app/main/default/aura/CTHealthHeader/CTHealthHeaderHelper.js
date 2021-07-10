({
    FetchStatus : function(component) {

        const viewVal = component.get("v.scope");
        let action;
        if(viewVal === 'person_view'){
            action = component.get("c.getPersonHealthStatusCount");
        }
        if(viewVal=== 'location_view'){
            action = component.get("c.getLocationHealthStatusCount");
        }

        action.setCallback(this, function(response){
        const state = response.getState();
        if(state==="SUCCESS"){
            component.set("v.Count", response.getReturnValue());
        }
        });
        $A.enqueueAction(action);

        

    }
})