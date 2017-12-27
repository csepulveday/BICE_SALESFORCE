/**
 * Created by Carlos Bastidas on 21-12-2017.
 */
({
    loadModalError : function(cmp, event, helper) {
        var message = event.getParam("errorMessage");
        var messageHeader = event.getParam("errorMessageHeader");

        if(message){
            cmp.set("v.errorMsg", message);
        } else {
            cmp.set("v.errorMsg", "Default Message.....");
        }

        if(messageHeader){
            cmp.set("v.errorMsgHeader", messageHeader);
        } else {
            cmp.set("v.errorMsgHeader", "Información...");
        }

        helper.modalOpen(cmp);
    },
    modalClose : function(cmp, event, helper) {
        helper.modalClose(cmp);
    }
})