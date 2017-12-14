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
	}
})