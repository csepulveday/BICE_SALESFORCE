/**
 * -----------------------------------------------------------------------------
 * @Name            AccountTrigger
 * @Author          Rodrigo Duran <rduran@salesforce.com>
 * @ModifiedBy      Rodrigo Duran <rduran@salesforce.com>
 * @CreatedDate     29-JUL-2017
 * @UsedBy          Account
 * -----------------------------------------------------------------------------
 * @Description
 * Everything that happens around Accounts is handled is this trigger.
 *
 *
 * -----------------------------------------------------------------------------
 * @Changes
 * 
 * -----------------------------------------------------------------------------
 */
trigger AccountTrigger on Account ( before insert,
                                    before update,
                                    before delete,
                                    after insert,
                                    after update,
                                    after delete,
                                    after undelete) {
    if(system.isFuture()) return;

    BICE_AccountTriggerHandler handler = new BICE_AccountTriggerHandler(Trigger.isExecuting, Trigger.size);
  Boolean isExecutable = false;
  isExecutable = handler.isExecutable(UserInfo.getProfileId());
    // BEFORE INSERT
    if ( Trigger.isInsert && Trigger.isBefore && isExecutable) {
        handler.setComunas(Trigger.new);
        handler.OnBeforeInsert(Trigger.new);
    }

    //// AFTER INSERT
    else if ( Trigger.isInsert && Trigger.isAfter && isExecutable) {
        handler.setComunas(Trigger.new);
        handler.OnAfterInsert( Trigger.new );
        BICE_AccountTriggerHandler.OnAfterInsertAsync( Trigger.newMap.keySet() );
    }

    // BEFORE UPDATE
    else if( Trigger.isUpdate && Trigger.isBefore && isExecutable){
        handler.setComunas(Trigger.new);
        handler.OnBeforeUpdate( Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap );
    }

    // AFTER UPDATE
    else if( Trigger.isUpdate && Trigger.isAfter && isExecutable ){
        handler.setComunas(Trigger.new);
        handler.OnAfterUpdate(Trigger.old, Trigger.new, Trigger.newMap);
        BICE_AccountTriggerHandler.OnAfterUpdateAsync(Trigger.newMap.keySet());
    }
/*
    // BEFORE DELETE
    else if ( Trigger.isDelete && Trigger.isBefore){
        handler.OnBeforeDelete(Trigger.old, Trigger.oldMap);
    }

    // AFTER DELETE
    else if(Trigger.isDelete && Trigger.isAfter){
        handler.OnAfterDelete(Trigger.old, Trigger.oldMap);
        BICE_AccountTriggerHandler.OnAfterDeleteAsync(Trigger.oldMap.keySet());
    }

    else if(Trigger.isUnDelete){
        handler.OnUndelete(Trigger.new);
    }
*/
}