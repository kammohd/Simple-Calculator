({
    startGame: function (component, event, helper) {
        // access combobox
        let gameModeComboBox = component.find("gameMode");

        // access the value of combobox
        let selectedValue = gameModeComboBox.get("v.value");
        const selectedmode = component.get("v.selectedMode");
        // update selectedMode attribute
        
        component.set("v.selectedMode", selectedValue);
        if(selectedmode){
            const BoardComp = component.find("BoardComp");
            BoardComp.startGame();
        }
		console.log(component.get("v.selectedMode") + 1);
		console.log("Button is clicked");
		
		
    },

    reshuffleBoard: function (component, event, helper) {
        const BoardComp = component.find("BoardComp");
        BoardComp.reshuffleBoard();
        component.set("v.reshuffleDisable", true);
        console.log("Reshuffle board is called");

    },
    onResultHandler: function(component, event, helper) {
        const result = event.getParam("result");
        if(result === "win"){
            component.set("v.reshuffleDisable", true);
        } else{
            component.set("v.reshuffleDisable", false);

        }
    }
});