@isTest(seeAllData= true) 
public class BICE_LeadChangesVFTest {

    public static testMethod void testMyController() {
        Profile p = [SELECT Id FROM Profile WHERE Name = 'Banca Personas Ejecutivos Fuerza de Ventas'];
        User u = [SELECT Id FROM User WHERE ProfileId =:p.Id AND IsActive = true AND ManagerId <> NULL LIMIT 1];
        List<Lead> lInsert = new List<Lead>();
        RecordType rt = [SELECT Id
                         FROM RecordType
                         WHERE Name = 'Lead Empresas y Corporaciones' LIMIT 1];
        System.runAs(u) {
            Comuna__c com = [SELECT Id FROM Comuna__c WHERE Name = 'SANTIAGO'];
            RecordType rtPersona = [SELECT Id FROM RecordType WHERE Name = 'Cuentas personales'];
            RecordType rtEmpresa = [SELECT Id FROM RecordType WHERE Name = 'Cuenta Empresa'];  
            
            Account acc = new Account();
            //////Cuenta Persona///////////
            acc.FirstName = 'INT';
            acc.LastName = '20';
            acc.RUT__c = '1234567-4';
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
            Lead l = new Lead();
            l.FirstName = 'Juan';
            l.LastName = 'Last';
            l.RUT__c = '1234567-4';
            l.OwnerId = u.Id;
            l.Phone = '+56912312312';
            l.Email = 'a@test.cl';
            l.RecordTypeId = rt.Id;
            insert l;
            ApexPages.StandardController sc = new ApexPages.standardController(l);
            BICE_LeadChangesVF ext = new BICE_LeadChangesVF(sc);
            ext.checkLeadChanges();
            ext.saveIt();
        }
    }
}