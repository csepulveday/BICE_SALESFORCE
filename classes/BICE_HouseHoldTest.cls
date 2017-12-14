@isTest
private class BICE_HouseHoldTest{
    static testMethod void householdcreation() {
        Account acc = new Account();
        acc.FirstName = 'Sam';
        acc.LastName = 'Nectia';
        acc.RUT__c = '61001000-8';        
        insert acc;        
        BICE_HouseHold__c bh = new BICE_HouseHold__c();
        bh.Name = (acc.FirstName+acc.LastName+acc.RUT__c).toLowerCase();        
        insert bh;
    }    
}