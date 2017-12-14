global class UpdateAccountHouseHold implements Database.Batchable<sObject> {
 
 Set<String> HHName = new Set<String>();

    global UpdateAccountHouseHold( Set<String> HHn ) {
        HHName = HHn;
    }

    global Database.QueryLocator start(Database.BatchableContext BC) {
        return DataBase.getQueryLocator([select id,HouseHoldName__c from Account where HouseHoldName__c IN :  HHName]);
    }

    global void execute(Database.BatchableContext BC,List<Account> scopeAcc) {
    
           for(BICE_HouseHold__c bh: [SELECT Id,Name FROM BICE_HouseHold__c]){
                for (Integer i=0;i<scopeAcc.size();i++){
                    if(scopeAcc[i].HouseHoldName__c == bh.Name)
                        scopeAcc[i].HouseHold__c = bh.id;
                }
            
           }
           update scopeAcc;
    }
    

    global void finish(Database.BatchableContext BC) {
   
    }
}