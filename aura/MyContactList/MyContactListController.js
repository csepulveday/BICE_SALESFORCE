({
	myAction : function(component, event, helper) {
			var action = component.get("c.getContacts");
        	action.setParams({
            	"accountId": component.get("v.accountId")
       		 });	
            action.setCallback(this, function(data) {
            component.set("v.contacts", data.getReturnValue());
            });
            $A.enqueueAction(action);
	},
    NumCases : function(component, event, helper) {
			var action = component.get("c.getCountCases");
        	action.setParams({
            	"accountId": component.get("v.accountId")
       		 });	
            action.setCallback(this, function(data) {
            component.set("v.CountCases", data.getReturnValue());
            });
            $A.enqueueAction(action);
	},
    AUM : function(component, event, helper) {
			var action = component.get("c.getAumInversiones");
        	action.setParams({
            	"accountId": component.get("v.accountId")
       		 });	
            action.setCallback(this, function(data) {
            component.set("v.aumAPV", data.getReturnValue());
            });
            $A.enqueueAction(action);
	}
})