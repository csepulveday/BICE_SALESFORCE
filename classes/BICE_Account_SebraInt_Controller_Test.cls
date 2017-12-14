@isTest(seeAllData= true) 
private class BICE_Account_SebraInt_Controller_Test{
    static testMethod void IntegracionSebra() {
       BICE_Account_SebraInt_Controller bs = new BICE_Account_SebraInt_Controller();
       BICE_Account_SebraInt_Controller.ClienteSebra cs = new BICE_Account_SebraInt_Controller.ClienteSebra();
        
        Comuna__c com1 = [SELECT Id FROM Comuna__c WHERE Name = 'CONCEPCION'];
        Comuna__c com = [SELECT Id FROM Comuna__c WHERE Name = 'SANTIAGO'];
        RecordType rtPersona = [SELECT Id FROM RecordType WHERE Name = 'Cuentas personales'];
        RecordType rtEmpresa = [SELECT Id FROM RecordType WHERE Name = 'Cuenta Empresa'];  
        
        Account acc = new Account();
        //////Cuenta Persona///////////
        acc.FirstName = 'INT';
        acc.LastName = '20';
        acc.RUT__c = '16049291-0';
        acc.RecordTypeId = rtPersona.Id;
        acc.Ciudad_o_Provincia_particular__c = 'SANTI';
        acc.Comuna_particular__c = com.Id;
        acc.Comuna_comercial__c = com.Id;
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
        acc.Raz_n_Social__c = null;
        update acc;
        
        Cuenta_Bancaria_Inv__c cb = new Cuenta_Bancaria_Inv__c();
        cb.Cliente__c = acc.id;
        cb.Banco__c = 'r&h';
        
        insert cb;
        
        BICE_Solicitud_Cliente__c bsc = new BICE_Solicitud_Cliente__c();
        bsc.Sebra_Ok__c = true;
        bsc.Cliente__c = acc.id;
        insert bsc;
        
       bs.ClienteSF(acc,bsc);
       bs.xmlRequest();
       bs.ActualizarFechaSebra();
       bs.Redireccionar();
       bs.SEBRACallout();
        ApexPages.StandardController sc = new ApexPages.standardController(acc);
        BICE_Account_SebraInt_Controller ext = new BICE_Account_SebraInt_Controller(sc);
        BICE_Account_SebraInt_Controller.ClienteSebra xa = new BICE_Account_SebraInt_Controller.ClienteSebra();
        BICE_Account_SebraInt_Controller.direccion xb = new BICE_Account_SebraInt_Controller.direccion();
        BICE_Account_SebraInt_Controller.email xc = new BICE_Account_SebraInt_Controller.email();
        BICE_Account_SebraInt_Controller.telefono xd = new BICE_Account_SebraInt_Controller.telefono();
        BICE_Account_SebraInt_Controller.CuentaBancaria xe = new BICE_Account_SebraInt_Controller.CuentaBancaria();
        BICE_Account_SebraInt_Controller.personaRelacionada xf = new BICE_Account_SebraInt_Controller.personaRelacionada();
       //BICE_Account_SebraInt_Controller.ActualizaSolicitudCliente(bsc);
    }
}