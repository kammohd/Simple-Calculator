import { LightningElement,api, wire  } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import Contact_MailingCity_Field from '@salesforce/schema/Contact.MailingCity';

import getTemp from '@salesforce/apex/Callout.Callout';




export default class WeatherSnippet extends LightningElement {
    @api recordId;
    @wire(getRecord, { recordId: '$recordId', fields:[Contact_MailingCity_Field]})
    contact;

   
    
   get MailingCity() {
        return getFieldValue(this.contact.data, Contact_MailingCity_Field);
      }
      
    @wire(getTemp,{ City: '$MailingCity' }) 
    CityTemp;


    
    


    
    
}