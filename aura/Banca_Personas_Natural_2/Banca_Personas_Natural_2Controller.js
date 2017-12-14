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
    CampaignList : function(component, event, helper) {
			var action = component.get("c.getCampaignList");
        	action.setParams({
            	"accountId": component.get("v.accountId")
       		 });
        	action.setCallback(this, function(data) {
            component.set("v.campList", data.getReturnValue());
            });
            $A.enqueueAction(action);	
	},
    MostrarURLFP : function(component, event, helper) {
			var action = component.get("c.getMostrarURLFP");
        	action.setParams({
            	"accountId": component.get("v.accountId")
       		 });
        	action.setCallback(this, function(data) {
            component.set("v.URLFP", data.getReturnValue());
            });
            $A.enqueueAction(action);	
	}
})