({
	handleActive : function(component, event, helper){
		const tabId = event.getParam('id');
	

        if(tabId === 'person_view'){
			component.set('v.HeaderName', 'Person View');
			
			
		}
		console.log(component.get('v.HeaderName'));

		if (tabId === 'location_view'){

			component.set('v.HeaderName', 'Location View');
	
		}
		component.set('v.scope', tabId);
		const HealthHeader = component.find("health-header");
		HealthHeader.FetchResult();
		
	

		
	}

});