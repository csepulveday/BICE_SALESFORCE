/**
 * Created by Carlos Bastidas on 21-12-2017.
 */
({
    modalClose : function(cmp) {

        var modalContainer = cmp.find('modalContainer');
        $A.util.addClass(modalContainer, 'slds-hide');
        var cmpTarget = cmp.find('modalId');
        $A.util.removeClass(cmpTarget, 'slds-fade-in-open');
    },
    modalOpen : function(cmp) {

        var modalContainer = cmp.find('modalContainer');
        $A.util.removeClass(modalContainer, 'slds-hide');
        var cmpTarget = cmp.find('modalId');
        $A.util.addClass(cmpTarget, 'slds-fade-in-open');
    }
})