trigger BICE_BICE_HouseHoldTrigger on BICE_HouseHold__c (before delete, before insert, before update,
                                                             after delete,  after insert,  after update){
    if(Trigger.isAfter && Trigger.isInsert){
/** START Relate Account HouseHold **/
        Set<String> BHName= new Set<String>();   
        for(BICE_HouseHold__c bh : trigger.new){
            BHName.add(bh.Name);   
        }
        /* Para batch */
        if (BHName.size() > 1) {
            Database.executeBatch(new UpdateAccountHouseHold(BHName),50);
        }else{
            /*Funciona para creación individual de cuenta*/
            List<Account> updateAccounts = new List<Account>();
            Set<Id> IdsCuenta = new Set<Id>();
            for(BICE_HouseHold__c bh : trigger.new){
                system.debug('Nombre HH: '+bh.Name);
                for(Account a: [select id from Account where HouseHoldName__c =: bh.Name]){
                    a.HouseHold__c = bh.Id;
                    updateAccounts.add(a);
                }
            }
            update updateAccounts;
        }
/** END Relate Account HouseHold **/
    }
}