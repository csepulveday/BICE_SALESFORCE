/**********************************************************************************
Desarrollado por: Nectia
Autor: Esteban Flores (EFR)
Proyecto: BICE
Descripción: Trigger para BICE_Solicitud_Cliente__c
---------------------------------------------------------------------------------
No. Fecha        Autor    Descripción
---------------------------------------------------------------------------------
1.0 25-07-2017   EFR      Creación del Trigger.
***********************************************************************************/
trigger BICE_SolCteTrigger on BICE_Solicitud_Cliente__c (before insert,
                                    before update,
                                    before delete,
                                    after insert,
                                    after update,
                                    after delete,
                                    after undelete) {

    BICE_SolCteTriggerHandler handler = new BICE_SolCteTriggerHandler(Trigger.isExecuting, Trigger.size);
    // BEFORE INSERT
    if ( Trigger.isInsert && Trigger.isBefore) {
        handler.OnBeforeInsert(Trigger.new);
    }
    //// AFTER INSERT
    else if ( Trigger.isInsert && Trigger.isAfter ) {
        //handler.OnAfterInsert( Trigger.new );
        //BICE_SolCteTriggerHandler.OnAfterInsertAsync( Trigger.newMap.keySet() );
    }
    // BEFORE UPDATE
    else if( Trigger.isUpdate && Trigger.isBefore ){
        handler.OnBeforeUpdate( Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap );
    }
    // AFTER UPDATE
    else if( Trigger.isUpdate && Trigger.isAfter ){
        //handler.OnAfterUpdate(Trigger.old, Trigger.new, Trigger.newMap);
        //BICE_SolCteTriggerHandler.OnAfterUpdateAsync(Trigger.newMap.keySet());
    }
    // BEFORE DELETE
    else if ( Trigger.isDelete && Trigger.isBefore ){
        //handler.OnBeforeDelete(Trigger.old, Trigger.oldMap);
    }
    // AFTER DELETE
    else if(Trigger.isDelete && Trigger.isAfter){
        //handler.OnAfterDelete(Trigger.old, Trigger.oldMap);
        //BICE_SolCteTriggerHandler.OnAfterDeleteAsync(Trigger.oldMap.keySet());
    }
    //UNDELETE
    else if(Trigger.isUnDelete){
        //handler.OnUndelete(Trigger.new);
    }
}