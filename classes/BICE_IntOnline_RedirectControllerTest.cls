@isTest(seealldata=true)
public class BICE_IntOnline_RedirectControllerTest{
    public static testMethod void testMyController() {
        Comuna__c c = [SELECT Id FROM Comuna__c WHERE Name = 'SANTIAGO' LIMIT 1];
        Lead l = new Lead();
        l.Rut__c = '15633079-5';
        l.FirstName = 'Nombre';
        l.LastName = 'Apellido Paterno';
        l.Apellido_Materno__c = 'Apellido Materno';
        l.Calle_Particular__c = 'Teatinos';
        l.Comuna_Particular__c = c.Id;
        l.Region_Particular__c = 'Region Metropolitana';
        l.Ciudad_Particular__c = 'SANTIAGO';
        l.Pais_particular__c = 'Chile';
        l.Phone = '+56912312312';
        l.Email = 'test@test.cl';
        insert l;
        
        BICE_IntOnline_RedirectController ext = new BICE_IntOnline_RedirectController();
        ext.lid = '123';
        ext.msg = 'hola';
        ext.urlToRedirect = 'a';
        
        Lead l2 = new Lead();
        l2.Rut__c = '15721061-0';
        l2.FirstName = 'Nombre';
        l2.LastName = 'Apellido Paterno';
        l2.Apellido_Materno__c = 'Apellido Materno';
        l2.Calle_Particular__c = 'Teatinos';
        l2.Comuna_Particular__c = c.Id;
        l2.Region_Particular__c = 'Region Metropolitana';
        l2.Ciudad_Particular__c = 'SANTIAGO';
        l2.Pais_particular__c = 'Chile';
        l2.Phone = '+56912312312';
        l2.Email = 'test333@test.cl';
        insert l2;
        
        ext = new BICE_IntOnline_RedirectController();
        ext.lid = '123';
        ext.msg = 'hola';
        ext.urlToRedirect = 'a';
    }
}