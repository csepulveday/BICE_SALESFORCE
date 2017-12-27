/**
 * Created by Carlos Bastidas on 21-12-2017.
 */
({
    getUserAccounts : function(cmp) {

        var action = cmp.get("c.getUserAccounts");
        action.setCallback(this, function(data) {
            cmp.set("v.userAccounts", data.getReturnValue());
        });
        $A.enqueueAction(action);
    },
    loadErrorModal : function(cmp,msj,header) {
        // event to driven Modal
        var errorModalFire = $A.get("e.c:ModalEvent");
        errorModalFire.setParams({
            "errorMessage" : msj ,
            "errorMessageHeader": header
        });
        errorModalFire.fire();
    }
})