({
	addResultRecord : function(component, gameResult) {
		//create apex method call action

		const action = component.get("c.addResult");
		const modeValue = component.get("v.selectedMode").toUpperCase();

		// set parameters

		action.setParams({
			"result" : gameResult,
			"mode"   : modeValue
		});

		// define a callback

		action.setCallback(this, function(response){
			const state = response.getState();

			if(state !== "SUCCESS"){
				console.error("Error in saving the record");

			}
		});

		// call apex method
		$A.enqueueAction(action);
	},
	showToast : function(title, message, type) {
		var toastEvent = $A.get("e.force:showToast");
		toastEvent.setParams({
			"title": title,
			"message": message,
			"type" : type
		});
		toastEvent.fire();
	}
})