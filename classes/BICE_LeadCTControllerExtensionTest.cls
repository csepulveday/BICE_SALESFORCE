@isTest(seealldata=true)
public class BICE_LeadCTControllerExtensionTest {

    public static testMethod void testMyController() {
        UserRole xRole = [SELECT Id, Name FROM UserRole WHERE Name = 'Retail Banking - Account Executive - Casa Matriz'];
        User xUser = new User(
            ProfileId = [SELECT Id FROM Profile WHERE Name = 'Banca Personas Ejecutivo Cuenta'].Id,
            LastName = 'last', Branch_Name__c = 'Casa Matriz',
            Email = 'puser000@amamama.com', 
            Username = 'puser000@amamama.com' + System.currentTimeMillis(), 
            CompanyName = 'TEST', Title = 'title', Alias = 'alias', 
            TimeZoneSidKey = 'America/Los_Angeles', EmailEncodingKey = 'UTF-8', 
            LanguageLocaleKey = 'en_US', LocaleSidKey = 'en_US', UserRoleId = xRole.Id);
        insert xUser;
        System.RunAs(xUser){
            Test.startTest();
			
            RecordType rc = [SELECT Id, Name, DeveloperName FROM RecordType where DeveloperName='lead_persona_juridica' LIMIT 1];
            RecordType rc4 = [SELECT Id, Name, DeveloperName FROM RecordType where DeveloperName='Lead_persona_natural' LIMIT 1];
            Comuna__c c = [SELECT Id FROM Comuna__c WHERE Name = 'SANTIAGO' LIMIT 1];
            Lead ll = new Lead();
            ll.RecordTypeId = rc.Id;
            ll.FirstName = 'Nombre Tres';
            ll.LastName = 'Apellido Tres';
            ll.Phone = '+56912312313';
            ll.Email = 'testthree@test.cl';
            ll.Nationality__c = 'Chile';
            ll.Comuna_particular__c = c.Id;
            ll.Calle_particular__c = 'Teatinos 220';
            ll.Numero_particular__c = '122';
            ll.Comuna_comercial__c = c.Id;
            ll.Calle_comercial__c = 'Teatinos 220';
            ll.Numero_comercial__c = '23213';
            ll.Office_Number__c = 'no';
            ll.Circ_57_2017_UAF__c = true;
            ll.Request_to_Create_Client_Area__c = true;
            ll.Form_FATCA__c = true;
            ll.Estado_civil__c = 'Soltero';
            ll.Sucursal_de_Apertura_del__c = 'Casa Matriz';
            ll.Commercial_Classification__c = 'A1';
            ll.RUT__c = '15633079-5';
            ll.Segmentation__c = 'Banca Personas';
            ll.Birth_Date__c = Date.today();
            ll.Educational_Level__c = 'Universitario Completo';
            ll.Apellido_materno__c = 'materno';
            ll.Sex__c = 'Male';
            ll.Account_Executive__c = xUser.Id;
            ll.CT_Result_Code__c = 0;
        	ll.Cargo__c = 'Abogado';
        	ll.Industry = 'EMPRESAS HOLDINGS';
            ll.Clasificacion_de_Riesgo_SBIF__c = 'A1';
            ll.Customer_Legal_Person_Consumer__c = 'Si';
            ll.Tipo_de_Persona__c = 'Sin Definir';
        	ll.Sub_Sector_Economico__c = 'Compañías corredoras de bolsas de comercio';
            ll.Comuna_comercial_Inv__c = c.Id;
            ll.Region_comercial_Inv__c = 'Region Metropolitana';
            ll.Ciudad_o_Provincia_comercial_Inv__c = 'SANTIAGO';
            ll.Pa_s_comercial_Inv__c = 'Chile';
            ll.Comuna_particular_Inv__c = c.Id;
            ll.Region_particular_Inv__c = 'Region Metropolitana';
            ll.Ciudad_o_Provincia_particular_Inv__c = 'SANTIAGO';
            ll.Pais_particular_Inv__c = 'Chile';
            ll.Comuna_comercial__c = c.Id;
            ll.Apartment__c = '123';
            ll.Region_comercial__c = 'Region Metropolitana';
            ll.Ciudad_comercial__c = 'SANTIAGO';
            ll.Pais_comercial__c = 'Chile';
            ll.Comuna_particular__c = c.Id;
            ll.Region_particular__c = 'Region Metropolitana';
            ll.Ciudad_particular__c = 'SANTIAGO';
            ll.Pais_particular__c = 'Chile';
            //leads.add(ll);
            insert ll;
            ApexPages.StandardController sc = new ApexPages.standardController(ll);
            BICE_LeadCTControllerExtension ext = new BICE_LeadCTControllerExtension(sc);
            System.assertEquals(ext.tObj, ll);
            ext.mensajePagina = '';
            PageReference page = ext.checkComplianceTracker();
            PageReference pag2 = ext.validarCampos();
            PageReference pag3 = ext.volver();
            
            Lead l2 = new Lead();
            l2.Company = 'Mi Empresa';
            l2.Raz_n_Social__c = '11121231-1';
            l2.FirstName = 'Nombre';
            l2.LastName = 'Apellido';
            l2.Phone = '+5699999999';
            l2.Nationality__c = 'Chile';
            l2.RecordTypeId = rc4.Id;
            insert l2;
            ApexPages.StandardController sc2 = new ApexPages.standardController(l2);
            ext = new BICE_LeadCTControllerExtension(sc2);
            System.assertEquals(ext.tObj, l2);
            page = ext.checkComplianceTracker();
            pag2 = ext.validarCampos();
            pag3 = ext.volver();
            
            Test.stopTest();
        }
    }
}