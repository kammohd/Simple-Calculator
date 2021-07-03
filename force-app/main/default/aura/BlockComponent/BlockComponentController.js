({
    onclickhandler : function(component, event, helper) {
    const open = component.get("v.open");
    
    if(!open){
        component.set("v.open", true);
        //get label value
        const LabelVal = component.get("v.label");

        //Fire Aura Event
        let compEvent = component.getEvent("CusEvent");
        compEvent.setParams({"value" : LabelVal});
        compEvent.fire();
    }

    },
    scriptsLoaded: function(component, event, helper){

        const divClass = component.getElement(".board-block");
        fitText(divClass);
    }
})