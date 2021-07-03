({
    doInit: function (component, event, helper) {
        console.log("Initialiation completed");
        // get game mode
        const gameMode = component.get("v.mode");
        console.log(gameMode);
        let column = 0;
        // get number of columns based on game mode
        // double equals "1" == 1
        // triple equals 1 === 1
        if (gameMode && gameMode === "hard") {
            column = 6;
        } else if (gameMode === "medium") {
            column = 4;
        } else {
            column = 3;
        }

        // get block width/size
        let blockSize = 12 / column;
        component.set("v.blockSize", blockSize);
        // build a list of 100 words
        const words = helper.getWords(column * column);
        component.set("v.words", words);
        // get win word
        const winWord = helper.getWinWord(words);
        component.set("v.winWord", winWord);
        helper.ResetBoard(component);
        
    },

    blockClickHandler: function(component, event, helper){
        // get label value from event variable
        const value = event.getParam("value");
        let CountClick = component.get("v.clickCount") + 1;
        if(value === component.get("v.winWord")){
            component.set("v.result", "You Win");
            console.log("You Win");
            helper.DisabledBoard(component);
            helper.fireResultEvent("win");            
        } else if (CountClick === 3){

            //user have lost
            component.set("v.result", "You lose");
            console.log("You Lose");
            helper.DisabledBoard(component); 
            helper.fireResultEvent("lose"); 

        }
        //Set the count
        component.set("v.clickCount", CountClick);

    },

    doRender: function (component, event, helper) {
        console.log("Render completed");
    },
    reshuffleBoard: function (component, event, helper) {
        const words = component.get("v.words");
        const randomizedWords = helper.randomizeArray(words);
        component.set("v.words", randomizedWords);
        helper.ResetBoard(component);
    }
});