({
    doinit : function(component, event, helper) {
        const columns =  [{label: 'Game Number', fieldName: 'Name', type: 'text'},
                          {label: 'Mode', fieldName: 'Game_Mode__c', type: 'text'},
                          {label: 'Played On', fieldName: 'CreatedDate', type: 'date'},
                          {label: 'Result', fieldName: 'Result__c', type: 'text'}
    ];
        component.set("v.columns", columns);
        //get previous results
        helper.FetchResult(component);
    },
    ReLoadResult : function(component,event, helper){
        //get previous results
        helper.FetchResult(component);
    }
})