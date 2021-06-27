import { LightningElement } from 'lwc';

export default class SimpleCalculator extends LightningElement {

    CalScreenVal = '';
    firstNum = 0;
    IsAdd = false;
    IsSub = false;
    IsMult = false;
    IsDiv = false;

handleClick(event){


this.CalScreenVal = this.CalScreenVal + event.target.label;



}
handleOp(event){

    if(event.target.name === 'Addition'){

    
        this.firstNum = this.CalScreenVal;
        this.CalScreenVal = 0;
        this.isAdd = true;
        this.isSub = false;
        this.IsMult = false;
        this.IsDiv = false;

    }
    if(event.target.name === 'Subtract'){

    
        this.firstNum = this.CalScreenVal;
        this.CalScreenVal = 0;
        this.isSub = true;
        this.isAdd = false;
        this.IsMult = false;
        this.IsDiv = false;

    }
    if(event.target.name === 'Multiply'){

    
        this.firstNum = this.CalScreenVal;
        this.CalScreenVal = 0;
        this.isSub = false;
        this.isAdd = false;
        this.IsMult = true;
        this.IsDiv = false;

    }
    if(event.target.name === 'Divide'){

    
        this.firstNum = this.CalScreenVal;
        this.CalScreenVal = 0;
        this.isSub = false;
        this.isAdd = false;
        this.IsMult = false;
        this.IsDiv = true;

    }
    if(event.target.name === 'Reset'){

    
        this.firstNum = 0;
        this.CalScreenVal = '';
        this.isSub = false;
        this.isAdd = false;
        this.IsMult = false;
        this.IsDiv = false;

    }
    
}

handleResult(event){

    
if(this.isAdd){
        this.CalScreenVal = parseFloat(this.firstNum) + parseFloat(this.CalScreenVal);
}
if(this.isSub){
    this.CalScreenVal = parseFloat(this.firstNum) - parseFloat(this.CalScreenVal);

}
if(this.IsMult){
    this.CalScreenVal = parseFloat(this.firstNum) * parseFloat(this.CalScreenVal);

}
if(this.IsDiv){
    this.CalScreenVal = parseFloat(this.firstNum) / parseFloat(this.CalScreenVal);

} 
}
   

    
    
    }