@isTest(seeAllData= true) 
public class BICE_ConsultaBolsa_Controller_Test{

    public static testMethod void testMyController() {
        String ProfileId = [SELECT Id FROM Profile WHERE Name = 'Banca Personas Ejecutivo Cuenta'].Id;
        BICE_ConsultaBolsa_Controller bcc = new BICE_ConsultaBolsa_Controller();
       // User u = [SELECT Id FROM User WHERE ProfileId =:ProfileId AND IsActive = true AND ManagerId <> NULL LIMIT 1];
        User u = [SELECT Id, Name FROM User WHERE Name = 'SAMUEL BRAVO' LIMIT 1];
        
        System.runAs(u) {
          Comuna__c com = [SELECT Id FROM Comuna__c WHERE Name = 'SANTIAGO'];
            RecordType rtPersona = [SELECT Id FROM RecordType WHERE Name = 'Cuentas personales'];
            RecordType rtEmpresa = [SELECT Id FROM RecordType WHERE Name = 'Cuenta Empresa'];
            RecordType rtOpp = [SELECT Id FROM RecordType WHERE Name = 'Monoproducto'];
            
            Account acc = new Account();
            //////Cuenta Persona///////////
            acc.FirstName = 'INT';
            acc.LastName = '20';
            acc.RUT__c = '1234567-4';
            acc.RecordTypeId = rtPersona.Id;
            acc.Ciudad_o_Provincia_particular__c = 'SANTI';
            acc.Comuna_particular__c = com.Id;
            acc.Comuna_comercial__c = com.Id;
            acc.Comuna_comercial_Inv__c = com.Id;
            acc.Numero_comercial__c = '23213';
            //acc.Commercial_FAX_Other__c = '213213';
            acc.Office_Number__c = '111';
            acc.PersonMobilePhone = '+569898987';
            acc.Particular_Phone_Other__pc = '+568998989';
            acc.Particular_Landline__pc = '+568987878';
            acc.Spouse_RUT__pc = '16049291-0'; //Conyuge
            acc.rut_inv__c = '16049291-0'; //representante legal
            acc.Comuna_particular_Inv__c = com.Id;
            acc.Ciudad_o_Provincia_particular_Inv__c = 'asdasd';
            acc.Calle_particular_Inv__c = 'calle';
            acc.Telefono_fijo_particular_Inv__pc = '23323';
            acc.Celular_Particular_Inv__pc = '2222';
            acc.Otro_telefono_particular_Inv__pc = '111';
            acc.Calle_comercial_Inv__c = 'calle com';
            acc.Ciudad_o_Provincia_comercial_Inv__c = 'ciudad com';
            acc.Pais_comercial_Inv__c = 'Chile';
            acc.Numero_calle_comercial_Inv__c = '111';
            acc.Region_comercial_Inv__c = 'rm';
            acc.Info_adicional_Inv_Oficina__c = 'info';
            acc.Telefono_fijo_comercial_Inv__c = '12121';
            acc.Celular_comercial_Inv__c = '11111';
            acc.Otro_telefono_comercial_Inv__c = '1111';
            acc.Email_personal_Inv__pc = 'a@g.cl';
            acc.Email_comercial_Inv__c = 'a@g.cl';
            acc.Email_Rep_Legal_Inv__c = 'a@g.cl';
            acc.Raz_n_Social__c = 'razon';
            
            insert acc;
            
            Account acc2 = new Account();
            //////Cuenta Persona///////////
            acc2.Name = 'Empresa';
            acc2.RUT__c = '22385241-6';
            acc2.RecordTypeId = rtEmpresa.Id;
            
            acc2.Comuna_comercial__c = com.Id;
            acc2.Pais_comercial__c = 'Chile';
            acc2.Calle_comercial__c = 'Calle';
            acc2.Numero_comercial__c = '1111';
            acc2.Office_Number__c = '111';          
            acc2.Numero_comercial__c = '23213';
            //acc.Commercial_FAX_Other__c = '213213';
            acc2.Office_Number__c = '111';           
            acc2.Fecha_Solicitud_Crear_Cliente__c = Date.today();  
            acc2.Crear_Cliente__c = true;
            acc2.Ejecutivo_de_Cuenta__c = u.id;
            insert acc2;
            
            Opportunity op = new Opportunity();
            op.RecordTypeId = rtOpp.Id;
            op.CloseDate = Date.today();
            op.StageName = 'Contacto';
            op.Amount = 100.00;
            op.Type = 'Monoproducto';
            op.Name = 'Esta es una opp nueva';
            op.AccountId = acc.Id;
            
            insert op;
           
         ApexPages.StandardController sc = new ApexPages.StandardController(acc);
          BICE_ConsultaBolsa_Controller  testAccPlan = new BICE_ConsultaBolsa_Controller(sc);
        
          PageReference pageRef = Page.BICE_ConsultaBolsa_Btn_acc; // Add your VF page Name here
          pageRef.getParameters().put('id', String.valueOf(acc.Id));
          Test.setCurrentPage(pageRef);
            
          bcc.ConsultaBolsaCallout();
          
         
        }
    }
    public static testMethod void testLoginBolsa() {
        //String ProfileId = [SELECT Id FROM Profile WHERE Name = 'Banca Personas Ejecutivo Cuenta'].Id;
        BICE_ConsultaBolsa_Controller bcc = new BICE_ConsultaBolsa_Controller();
        User u = [SELECT Id FROM User WHERE IsActive = true AND Username_Bolsa__c <> NULL AND Perfil_Bolsa__c <> NULL LIMIT 1];
        //User u = [SELECT Id, Name FROM User WHERE FirstName = 'MARYCARMEN' LIMIT 1];
        
        System.runAs(u) {
          Comuna__c com = [SELECT Id FROM Comuna__c WHERE Name = 'SANTIAGO'];
            RecordType rtPersona = [SELECT Id FROM RecordType WHERE Name = 'Cuentas personales'];
            RecordType rtEmpresa = [SELECT Id FROM RecordType WHERE Name = 'Cuenta Empresa'];
            RecordType rtOpp = [SELECT Id FROM RecordType WHERE Name = 'Monoproducto'];
            
            Account acc = new Account();
            //////Cuenta Persona///////////
            acc.FirstName = 'INT';
            acc.LastName = '20';
            acc.RUT__c = '1234567-4';
            acc.RecordTypeId = rtPersona.Id;
            acc.Ciudad_o_Provincia_particular__c = 'SANTI';
            acc.Comuna_particular__c = com.Id;
            acc.Comuna_comercial__c = com.Id;
            acc.Comuna_comercial_Inv__c = com.Id;
            acc.Numero_comercial__c = '23213';
            //acc.Commercial_FAX_Other__c = '213213';
            acc.Office_Number__c = '111';
            acc.PersonMobilePhone = '+569898987';
            acc.Particular_Phone_Other__pc = '+568998989';
            acc.Particular_Landline__pc = '+568987878';
            acc.Spouse_RUT__pc = '16049291-0'; //Conyuge
            acc.rut_inv__c = '16049291-0'; //representante legal
            acc.Comuna_particular_Inv__c = com.Id;
            acc.Ciudad_o_Provincia_particular_Inv__c = 'asdasd';
            acc.Calle_particular_Inv__c = 'calle';
            acc.Telefono_fijo_particular_Inv__pc = '23323';
            acc.Celular_Particular_Inv__pc = '2222';
            acc.Otro_telefono_particular_Inv__pc = '111';
            acc.Calle_comercial_Inv__c = 'calle com';
            acc.Ciudad_o_Provincia_comercial_Inv__c = 'ciudad com';
            acc.Pais_comercial_Inv__c = 'Chile';
            acc.Numero_calle_comercial_Inv__c = '111';
            acc.Region_comercial_Inv__c = 'rm';
            acc.Info_adicional_Inv_Oficina__c = 'info';
            acc.Telefono_fijo_comercial_Inv__c = '12121';
            acc.Celular_comercial_Inv__c = '11111';
            acc.Otro_telefono_comercial_Inv__c = '1111';
            acc.Email_personal_Inv__pc = 'a@g.cl';
            acc.Email_comercial_Inv__c = 'a@g.cl';
            acc.Email_Rep_Legal_Inv__c = 'a@g.cl';
            acc.Raz_n_Social__c = 'razon';
            
            insert acc;
            
            Account acc2 = new Account();
            //////Cuenta Persona///////////
            acc2.Name = 'Empresa';
            acc2.RUT__c = '22385241-6';
            acc2.RecordTypeId = rtEmpresa.Id;
            
            acc2.Comuna_comercial__c = com.Id;
            acc2.Pais_comercial__c = 'Chile';
            acc2.Calle_comercial__c = 'Calle';
            acc2.Numero_comercial__c = '1111';
            acc2.Office_Number__c = '111';          
            acc2.Numero_comercial__c = '23213';
            //acc.Commercial_FAX_Other__c = '213213';
            acc2.Office_Number__c = '111';           
            acc2.Fecha_Solicitud_Crear_Cliente__c = Date.today();  
            acc2.Crear_Cliente__c = true;
            acc2.Ejecutivo_de_Cuenta__c = u.id;
            insert acc2;
            
            Opportunity op = new Opportunity();
            op.RecordTypeId = rtOpp.Id;
            op.CloseDate = Date.today();
            op.StageName = 'Contacto';
            op.Amount = 100.00;
            op.Type = 'Monoproducto';
            op.Name = 'Esta es una opp nueva';
            op.AccountId = acc.Id;
            
            insert op;
           
         ApexPages.StandardController sc = new ApexPages.StandardController(op);
          BICE_ConsultaBolsa_Controller  testAccPlan = new BICE_ConsultaBolsa_Controller(sc);
        
          PageReference pageRef = Page.BICE_ConsultaBolsa_Btn_opp; // Add your VF page Name here
       
          Test.setCurrentPage(pageRef);
            
          bcc.loginBolsa();
          //bcc.loginBolsa();
         
        }
    }
    
    public static testMethod void testBolsa(){
        Test.setMock(WebServiceMock.class, new BICE_ConsultaBolsaWS_Test());
        BICE_ConsultaBolsaWS parentObject = new BICE_ConsultaBolsaWS();
        new BICE_ConsultaBolsaWS.wscreatoken();
        new BICE_ConsultaBolsaWS.wsCreaTokenAgente();
        new BICE_ConsultaBolsaWS.wsCreaTokenAgenteResponse();
        new BICE_ConsultaBolsaWS.wscreatokenResponse();
        new BICE_ConsultaBolsaWS.wscreatokenResult();
    }
    @isTest 
    public static void coverCodeForwsValidaToken(){
        Test.setMock(WebServiceMock.class, new BICE_ConsultaBolsaWS_Test());
        BICE_ConsultaBolsaWS.WscreatokenejbWebPortBindingQSPort testObject = new BICE_ConsultaBolsaWS.WscreatokenejbWebPortBindingQSPort();
        testObject.wsValidaToken(null);
    }
    @isTest 
    public static void coverCodeForwsCreaTokenAgente(){
        Test.setMock(WebServiceMock.class, new BICE_ConsultaBolsaWS_Test());
        BICE_ConsultaBolsaWS.WscreatokenejbWebPortBindingQSPort testObject = new BICE_ConsultaBolsaWS.WscreatokenejbWebPortBindingQSPort();
        testObject.wsCreaTokenAgente(null,null,null,null,null);
    }
    @isTest 
    public static void coverCodeForwsCreaToken(){
        Test.setMock(WebServiceMock.class, new BICE_ConsultaBolsaWS_Test());
        BICE_ConsultaBolsaWS.WscreatokenejbWebPortBindingQSPort testObject = new BICE_ConsultaBolsaWS.WscreatokenejbWebPortBindingQSPort();
        testObject.wscreatoken(null,null);
    }
}