@isTest(seealldata=true)
public class BICE_TriggersTest{
    public static testMethod void testAccLeadOpp() {
        List<User> users = new List<User>();
        UserRole xRole = [SELECT Id, Name FROM UserRole WHERE Name = 'Retail Banking - Account Executive - Casa Matriz'];
        UserRole yRole = [SELECT Id, Name FROM UserRole WHERE Name = 'Retail Banking - Group Supervisor - Casa Matriz'];
        UserRole zRole = [SELECT Id, Name FROM UserRole WHERE Name = 'Retail Banking - Branch Manager - Casa Matriz'];
        User xUser = new User(
            ProfileId = [SELECT Id FROM Profile WHERE Name = 'Banca Personas Ejecutivo Cuenta'].Id,
            LastName = 'last', Branch_Name__c = 'Casa Matriz',
            Email = 'puser000@amamama.com', 
            Username = 'puser000@amamama.com' + System.currentTimeMillis(), 
            CompanyName = 'TEST', Title = 'title', Alias = 'alias', 
            TimeZoneSidKey = 'America/Los_Angeles', EmailEncodingKey = 'UTF-8', 
            LanguageLocaleKey = 'en_US', LocaleSidKey = 'en_US', UserRoleId = xRole.Id);
        users.add(xUser);
        User yUser = new User(
            ProfileId = [SELECT Id FROM Profile WHERE Name = 'Banca Personas Ejecutivo Cuenta'].Id,
            LastName = 'last', Branch_Name__c = 'Casa Matriz', 
            Email = 'puser001@amamama.com', 
            Username = 'puser000@amamama.com' + System.currentTimeMillis(), 
            CompanyName = 'TEST', Title = 'title', Alias = 'alias', 
            TimeZoneSidKey = 'America/Los_Angeles', EmailEncodingKey = 'UTF-8', 
            LanguageLocaleKey = 'en_US', LocaleSidKey = 'en_US', UserRoleId = yRole.Id);
        users.add(yUser);
        User zUser = new User(
            ProfileId = [SELECT Id FROM Profile WHERE Name = 'Banca Personas Ejecutivo Cuenta'].Id,
            LastName = 'last', Branch_Name__c = 'Casa Matriz',
            Email = 'puser002@amamama.com', 
            Username = 'puser000@amamama.com' + System.currentTimeMillis(), 
            CompanyName = 'TEST', Title = 'title', Alias = 'alias', 
            TimeZoneSidKey = 'America/Los_Angeles', EmailEncodingKey = 'UTF-8', 
            LanguageLocaleKey = 'en_US', LocaleSidKey = 'en_US', UserRoleId = zRole.Id);
        users.add(zUser);
        insert users;
        System.RunAs(xUser){
            Test.startTest();
               insertTestLeads();
            Test.stopTest();
        }
    }
    @future
    private static void insertTestLeads(){
        List<Lead> leads = new List<Lead>();
        Profile pUser = [SELECT Name, Id FROM Profile WHERE Name LIKE '%Banca Persona%' LIMIT 1];
        RecordType rc = [SELECT Id  FROM RecordType  WHERE Name='Lead Persona Jurídica (Fuerza Ventas)' LIMIT 1];
        RecordType rn = [SELECT Id  FROM RecordType  WHERE Name ='Lead Persona Natural (Fuerza de Ventas)' LIMIT 1];
        User uUser = [SELECT Id FROM User WHERE ProfileID =: pUser.Id LIMIT 1];
        Comuna__c c = [SELECT Id FROM Comuna__c WHERE Name = 'SANTIAGO' LIMIT 1];
        User xUser = [SELECT Id FROM User WHERE Email = 'puser000@amamama.com' LIMIT 1];
        User yUser = [SELECT Id FROM User WHERE Email = 'puser001@amamama.com' LIMIT 1];
        User zUser = [SELECT Id FROM User WHERE Email = 'puser002@amamama.com' LIMIT 1];
        //Chile Test
        Lead l = new Lead();
        l.FirstName = 'Nombre Uno';
        l.LastName = 'Apellido Uno';
        l.Phone = '+56912312311';
        l.Email = 'testone@test.cl';
        l.Nationality__c = 'Chile';
        l.Comuna_particular__c = c.Id;
        l.Calle_particular__c = 'Teatinos';
        l.Numero_particular__c = '220';
        l.Comuna_comercial__c = c.Id;
        l.Ciudad_particular__c = 'SANTIAGO';
        l.Numero_particular__c = '122';
        l.Pais_particular_Inv__c = 'Chile';
        l.Calle_comercial__c = 'Teatinos';
        l.Numero_comercial__c = '220';
        l.Ciudad_comercial__c = 'SANTIAGO';
        l.Pa_s_comercial_Inv__c = 'Chile';
        l.Apartment__c = 'otro';
        l.Office_Number__c = 'no';
        l.RecordTypeId = rc.Id;
        l.Fecha_Solicitud_Crear_Cliente__c = System.today();
        l.Etapa__c = 'Aprobacion_Agente';
        l.Aviso_email_de_cambio_de_propietario_env__c = false;
        l.Scanned_Documents__c =true;
        l.Estado_Aprobacion_Gerente_Ventas__c = 'Aprobado';
        //leads.add(l);
        insert l;
       
  
        
        //EEUU Test
        Lead l2 = new Lead();
        l2.FirstName = 'Nombre Dos';
        l2.LastName = 'Apellido Dos';
        l2.Phone = '+56912312312';
        l2.Email = 'testtwo@test.cl';
        l2.Nationality__c = 'Estados Unidos';
        l2.Pais_particular__c = 'Estados Unidos';
        l2.Calle_particular__c = '2102 Liberty';
        l2.Ciudad_particular__c = 'Oregon';
        l2.Numero_particular__c = '122';
        l2.Pais_comercial__c = 'Estados Unidos';
        l2.Calle_comercial__c = '2102 Liberty';
        l2.Numero_comercial__c = '220';
        l2.Ciudad_comercial__c = 'Oregon';
        l2.Pais_comercial__c = 'Chile';
        l2.Apartment__c = 'otro';
        l2.Office_Number__c = 'no';
        l2.Request_to_Create_Client_Area__c = false;
        l2.Fecha_Solicitud_Crear_Cliente__c = System.today();
        //leads.add(l2);
        //insert l2;
        
        //Chile Test Without apartment
        Lead ll = new Lead();
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
        ll.RecordTypeId = rn.Id;
        ll.Fecha_Solicitud_Crear_Cliente__c = System.today();
        //leads.add(ll);
        insert ll;
        
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
        update ll;
        
        //EEUU Test
        Lead ll2 = new Lead();
        ll2.FirstName = 'Nombre Cuatro';
        ll2.LastName = 'Apellido Cuatro';
        ll2.Phone = '+56912312314';
        ll2.Email = 'testfour@test.cl';
        ll2.Nationality__c = 'Estados Unidos';
        ll2.Calle_particular__c = '2102 Liberty';
        ll2.Ciudad_particular__c = 'Oregon';
        ll2.Pais_particular__c = 'Estados Unidos';
        ll2.Numero_particular__c = '122';
        ll2.Calle_comercial__c = '2102 Liberty';
        ll2.Ciudad_comercial__c = 'Oregon';
        ll2.Pais_comercial__c = 'Estados Unidos';
        ll2.Numero_comercial__c = '23213';
        ll2.Office_Number__c = 'no';
        ll2.Apellido_materno__c = 'Perez';
        ll2.Estado_civil__c = 'Casado';
        ll2.RecordTypeId = rc.Id;
        ll2.Birth_Date__c = Date.newInstance(1980, 12, 9);
        ll2.Jefe_Plataforma_Agente_Sucursal__c = yUser.Id;
        ll2.Account_Executive__c = xUser.Id;
        ll2.Profin_Executive__c = xUser.Id;
        ll2.RUT__c = '5234234-1';
        ll2.Segmentation__c = '';
        ll2.Sucursal_de_Apertura_del__c = 'Casa Matriz';
        ll2.Commercial_Classification__c = 'A1';
        ll2.Educational_Level__c = 'Universitaria';
        ll2.Spouse_Mothers_Last_Name__c = 'Apellido';
        ll2.Spouse_Fathers_Last_Name__c = 'Otro apellido';
        ll2.Spouse_First_Name__c = 'Juan';
        ll2.Spouse_RUT__c = '15721061-0';
        ll2.Conjugal_Regime__c = 'Con Separación de Bienes';
        ll2.Sex__c = 'Masculino';
        ll2.Title = 'Titulo';
        ll2.Customer_Legal_Person_Consumer__c = 'No';
        ll2.Company = 'Nectia';
        ll2.Name_and_RUT_from_BICE_client__c = 'Juan Perez12312312-1';
        ll2.SBIF_Sector__c = 'Banco del Estado';
        ll2.Raz_n_Social__c = '123123';
        ll2.Phone_contact__c = '+56912312312';
        ll2.Customer_type_other_rating__c = 'Gerencia Comercial';
        ll2.BICE_Classification__c = 'PERSONAS NATURALES';
        ll2.CT_Result_Code__c = 0;
        ll2.Datos_para_Creaci_n_de_Clientes_ok__c = true;
        ll2.Request_to_Create_Client_Area__c = false;
        ll2.Fecha_Solicitud_Crear_Cliente__c = System.today();
        ll2.Circ_57_2017_UAF__c = true;
        ll2.Segmentation__c = 'Banca Personas';
        ll2.Birth_Date__c = Date.today();
        ll2.Educational_Level__c = 'Universitario Completo';
        ll2.Apellido_materno__c = 'materno';
        ll2.Sex__c = 'Male';
        ll2.Account_Executive__c = xUser.Id;
        ll2.CT_Result_Code__c = 0;
        ll2.Cargo__c = 'Abogado';
        ll2.Industry = 'EMPRESAS HOLDINGS';
        ll2.Sub_Sector_Economico__c = 'Compañías corredoras de bolsas de comercio';
        //leads.add(ll2);
        //insert ll2;
        
        Lead lll = new Lead();
        lll.FirstName = 'Nombre Cinco';
        lll.LastName = 'Apellido Cinco';
        lll.Phone = '+56912312315';
        lll.Email = 'testfive@test.cl';
        lll.Nationality__c = 'Chile';
        lll.Comuna_particular__c = c.Id;
        lll.Calle_particular__c = 'Teatinos 220';
        lll.Numero_particular__c = '122';
        lll.Comuna_comercial__c = c.Id;
        lll.Calle_comercial__c = 'Teatinos 220';
        lll.Numero_comercial__c = '23213';
        lll.Apartment__c = 'otro';
        lll.Fecha_Solicitud_Crear_Cliente__c = System.today();
        //leads.add(lll);
        //insert lll;
        
        //EEUU Test
        Lead lll2 = new Lead();
        lll2.FirstName = 'Nombre Seis';
        lll2.LastName = 'Apellido Seis';
        lll2.Phone = '+56912312316';
        lll2.Email = 'testsix@test.cl';
        lll2.Pais_particular__c = 'Chile';
        lll2.Calle_particular__c = '2102 Liberty';
        lll2.Ciudad_particular__c = 'Oregon';
        lll2.Numero_particular__c = '122';
        lll2.Pais_comercial__c = 'Estados Unidos';
        lll2.Calle_comercial__c = '2102 Liberty';
        lll2.Ciudad_comercial__c = 'Oregon';
        lll2.Apartment__c = 'otro';
        lll2.Numero_comercial__c = '23213';
        lll2.Fecha_Solicitud_Crear_Cliente__c = System.today();
        //leads.add(lll2);
        //insert lll2;
        
        Lead l3 = new Lead();
        l3.FirstName = 'Nombre Siete';
        l3.LastName = 'Apellido Siete';
        l3.Phone = '+56912312317';
        l3.Email = 'testseven@test.cl';
        l3.Comuna_particular__c = c.Id;
        l3.Calle_particular__c = 'Teatinos';
        l3.Numero_particular__c = '220';
        l3.Numero_particular__c = '122';
        l3.Comuna_comercial__c = c.Id;
        l3.Calle_comercial__c = 'Teatinos';
        l3.Numero_comercial__c = '23213';
        l3.Fecha_Solicitud_Crear_Cliente__c = System.today();
        //leads.add(l3);
        insert l3;
        
        //EEUU Test
        Lead l32 = new Lead();
        l32.FirstName = 'Nombre Ocho';
        l32.LastName = 'Apellido Ocho';
        l32.Phone = '+56912312318';
        l32.Email = 'testeight@test.cl';
        l32.Comuna_particular__c = c.Id;
        l32.Calle_particular__c = 'Teatinos';
        l32.Numero_particular__c = '220';
        l32.Numero_particular__c = '122';
        l32.Comuna_comercial__c = c.Id;
        l32.Numero_comercial__c = '23213';
        l32.Calle_comercial__c = 'Teatinos';
        l32.Fecha_Solicitud_Crear_Cliente__c = System.today();
        //leads.add(l32);
        insert l32;
        
        //insert leads;
        
        Comuna__c com = [SELECT Id FROM Comuna__c WHERE Name = 'SANTIAGO'];
        RecordType rtPersona = [SELECT Id FROM RecordType WHERE Name = 'Cuentas personales'];
        RecordType rtEmpresa = [SELECT Id FROM RecordType WHERE Name = 'Cuenta Empresa'];
        RecordType rtOpp = [SELECT Id FROM RecordType WHERE Name = 'Empresas y Corporaciones'];
        
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
        
        Opportunity op = new Opportunity();
        op.RecordTypeId = rtOpp.Id;
        op.CloseDate = Date.today();
        op.StageName = 'Precalificación';
        op.Amount = 100.00;
        op.Type = 'Monoproducto';
        op.Name = 'Esta es una opp nueva';
        op.AccountId = acc.Id;
        insert op;
        
        
        ll.Comuna_comercial_Inv__c = null;
        ll.Pa_s_comercial_Inv__c = 'Estados Unidos';
        ll.Comuna_particular_Inv__c = null;
        ll.Pais_particular_Inv__c = 'Estados Unidos';
        ll.Comuna_comercial__c = null;
        ll.Pais_comercial__c = 'Estados Unidos';
        ll.Comuna_particular__c = null;
        ll.Pais_particular__c = 'Estados Unidos';
        ll.Etapa__c = 'Aprobacion_Agente';
        ll.Aviso_email_de_cambio_de_propietario_env__c = false;
        ll.Scanned_Documents__c = true;
       // update ll;
        
        ll.Comuna_comercial_Inv__c = null;
        ll.Pa_s_comercial_Inv__c = 'Chile';
        ll.Comuna_particular_Inv__c = null;
        ll.Pais_particular_Inv__c = 'Chile';
        ll.Comuna_comercial__c = null;
        ll.Pais_comercial__c = 'Chile';
        ll.Comuna_particular__c = null;
        ll.Pais_particular__c = 'Chile';
       // update ll;
    }
    
    public static testMethod void testInt10() {
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
        insert acc;
        
        
        
        acc.Comuna_comercial__c = com1.Id; 
        acc.Calle_comercial__c = 'TET';
        acc.Numero_comercial__c = '2323';
        acc.Commercial_Phone_Other__c =  '331231';
        acc.Commercial_Landline__c = '12312';
        acc.Comuna_particular__c = com1.Id;
        acc.Ciudad_o_Provincia_particular__c = 'SANTIAGO';
        acc.Calle_Particular__c = 'TEATINOS';
        acc.Office_Number__c = '';
        acc.Phone = '+5634343443';
        acc.PersonHomePhone = '+56343434';
        acc.Phone_contact__pc = '+56343434';
        acc.PersonEmail = 'test2@test2.cl';
        acc.Commercial_Email__pc = 'test2@test2.cl';

        update acc;
        
        acc.Pais_comercial__c = null;
        acc.BillingStreet = '';
        update acc;
        //////////////////////////////////////
        
        acc = new Account();
        acc.Name = 'Empresa';
        acc.RecordTypeId = rtEmpresa.Id;
        acc.RUT__c = '14783929-4';
        insert acc;
        
        acc.Comuna_comercial__c = com1.Id; 
        acc.Calle_comercial__c = 'TET';
        acc.Numero_comercial__c = '2323';
        acc.Commercial_Phone_Other__c =  '331231';
        acc.Commercial_Landline__c = '12312';
        acc.Commercial_FAX_Other__c = '23213';       
        acc.Fecha_Solicitud_Crear_Cliente__c = Date.today();
        acc.Current_MAC_Status__c = 'APROBADO';
        acc.Crear_Cliente__c = true;
        acc.Phone = '+45454544';
        acc.BillingStreet = '';
        acc.Sub_Sector_Economico__c = 'subsector';
        acc.Actividad_Economica_SBIF__c = 'Agricultura';
        
        update acc;
        
        Contact c1 = new Contact();
        c1.Cargo__c = 'Abogado';
        c1.Tipo_de_Contacto__c = 'Ejecutivo';
        c1.Email = 'test@testwsa.cl';
        c1.Apellido_materno__c = 'ApellidoM';
        c1.FirstName = 'Nombre';
        c1.LastName = 'Apellido';
        c1.Phone = '+5669454545';
        c1.Fax = '+5645454545';
        c1.MobilePhone = '+568989898';
        c1.AccountId = acc.Id;
            
        insert c1;
        
        BICE_Account_Int10 int10 = new BICE_Account_Int10();
        //BICE_Account_Int10.updateAccount(acc.Id,'');
    }

}