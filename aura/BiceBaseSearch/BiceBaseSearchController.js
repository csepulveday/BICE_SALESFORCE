/**
 * Created by Equipo AcercaRSE on 21-12-2017.
 */
({
    searchRut : function(cmp, event, helper) {
        // RESTO DE LINEAS DE CODIGO
        var action = cmp.get("c.getUserAccounts");
        action.setCallback(this, function(data) {
            cmp.set("v.userAccounts", data.getReturnValue());
        });
        $A.enqueueAction(action);
    }

})