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
    
    Activecampaigns : function(component, event, helper) {
			var action = component.get("c.getActiveCampaigns");
        	action.setParams({
            	"accountId": component.get("v.accountId")
       		 });
        	action.setCallback(this, function(data) {
            component.set("v.camps", data.getReturnValue());
            });
            $A.enqueueAction(action);	
	},
    
    LastContactChannel : function(component, event, helper) {
			var action = component.get("c.getLastContact");
        	action.setParams({
            	"accountId": component.get("v.accountId")
       		 });
        	action.setCallback(this, function(data) {
            component.set("v.VarLastContact", data.getReturnValue());
            });
            $A.enqueueAction(action);	
	},
    ClientProducts : function(component, event, helper) {
			var action = component.get("c.getProductList");
        	action.setParams({
            	"accountId": component.get("v.accountId")
       		 });
        	action.setCallback(this, function(data) {
            component.set("v.ProdList", data.getReturnValue());
            });
            $A.enqueueAction(action);	
	},
    IconosProd : function(component, event, helper) {
            var action = component.get("c.getIconosFamiliaProd");
            action.setParams({
                "accountId": component.get("v.accountId")
             });
            action.setCallback(this, function(data) {
            component.set("v.ICONFAM", data.getReturnValue());
            });
            $A.enqueueAction(action);   
    }
   /* Alertas : function(component, event, helper) {
			var action = component.get("c.getAlertList");
        	//var AlertCont = component.get("ListaAlertasTransCont");
        	action.setParams({
            	"accountId": component.get("v.accountId")
       		 });
        	action.setCallback(this, function(data) {
            component.set("v.alertas", data.getReturnValue());
         	//	component.set("v.AlertasTrans", data.getReturnValue().mc.ListaAlertasTransCont);
            });
            $A.enqueueAction(action);	
	}*/
})