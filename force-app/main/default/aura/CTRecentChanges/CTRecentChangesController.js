({
    doinit : function(component, event, helper) {
        
        const sc = component.get("v.scope");
        if(sc === 'person_view'){
    
        const columns =  [{label: 'Name', fieldName: 'Name', type: 'text'},
                          {label: 'Phone', fieldName: 'Mobile__c', type: 'text'},
                          {label: 'Token', fieldName: 'Token__c', type: 'text'},
                          {label: 'Status', fieldName: 'Health_Status__c', type: 'text'},
                          {label: 'Status Update Date', fieldName: 'Status_Update_Date__c', type: 'date-local'}
    ];
    component.set("v.columns", columns);
    helper.fetchResultpersonview(component);
}
    else if(sc === 'location_view'){
    
    const columns =  [{label: 'Name', fieldName: 'Name', type: 'text'},
                      {label: 'Status', fieldName: 'Status__c', type: 'text'},
                      {label: 'Pincode', fieldName: 'Pincode__c', type: 'text'},
                      {label: 'Status Update Date', fieldName: 'Status_Update_Date__c', type: 'date-local'}
];
component.set("v.columns", columns);
helper.fetchResultlocationview(component);
}

    }
})