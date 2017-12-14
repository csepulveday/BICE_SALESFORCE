@IsTest(seeAllData=true)
public class MyContactListControllerTest {
     
      public static testMethod void testVista360() {
          Account a1 = new Account();
          a1.Name = 'TestAccount';
          a1.RUT__c = '15951475-7';
          
          insert a1;
          
          Date a = date.newInstance(1998, 10, 21);
          //Account a = [SELECT Id FROM Account WHERE Rut__c = '15948588-9'];
          MyContactListController.getContacts(a1.id);
          MyContactListController.getActiveCampaigns(a1.Id);
          MyContactListController.getCampaignList(a1.Id);
          MyContactListController.getFinAccounts(a1.Id);
          MyContactListController.getProductList(a1.Id);
          MyContactListController.getCountCases(a1.Id);
          MyContactListController.getLastContact(a1.Id);
          MyContactListController.getMostrarURLFP(a1.Id);
          MyContactListController.getIconosFamiliaProd(a1.Id);
          //MyContactListController.getAlertList(a1.Id);
          MyContactListController.DateTimeConversion(a);
          MyContactListController.ArmarURLFAMILIAS('3frgt548751poit','familia');
          MyContactListController.getAumInversiones(a1.Id);
          MyContactListController.getDeudaEYC(a1.Id);
          MyContactListController.getAumInversiones(a1.Id);
      }    
}