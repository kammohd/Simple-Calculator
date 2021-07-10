({
    AddNewHandler : function(component, event, helper) {
        const ViewVal = component.get("v.scope");
        if (ViewVal === 'person_view'){
            const createRecordEvent = $A.get("e.force:createRecord");
            createRecordEvent.setParams({
                "entityApiName": "Person__c"
            });
            createRecordEvent.fire();

        }
        if (ViewVal === 'location_view'){
            const createRecordEvent = $A.get("e.force:createRecord");
            createRecordEvent.setParams({
                "entityApiName": "Location__c"
            });
            createRecordEvent.fire();

        }
    },
    doinit : function(component, event, helper){

        helper.FetchStatus(component);
    }
})