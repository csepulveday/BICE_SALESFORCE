/**
 * Created by Carlos Bastidas on 21-12-2017.
 */
({
    initAction : function(cmp, event, helper) {
        helper.getUserAccounts(cmp);
    },
    loadModal : function(cmp, event, helper) {
        helper.loadErrorModal(cmp,"Llamada desde la carga de cuantas",null);
    }

})