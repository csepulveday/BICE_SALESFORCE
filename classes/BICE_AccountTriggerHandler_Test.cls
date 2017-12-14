@isTest(seeAllData= true) 
private class BICE_AccountTriggerHandler_Test{
    static testMethod void All() {
        BICE_AccountTriggerHandler ba = new BICE_AccountTriggerHandler(true,200);
        Comuna__c com1 = [SELECT Id FROM Comuna__c WHERE Name = 'CONCEPCION'];
        Comuna__c com = [SELECT Id FROM Comuna__c WHERE Name = 'SANTIAGO'];
        RecordType rtPersona = [SELECT Id FROM RecordType WHERE Name = 'Cuentas personales en CIF'];
        RecordType rtEmpresa = [SELECT Id FROM RecordType WHERE Name = 'Cuenta Empresa en CIF'];
        List<Account> ListaAcc = new List<Account>();  
        Set<Id> SetIds = new Set<Id>();
         Map<Id, Account> m = new Map<Id, Account>();
         Map<Id, Account> oldm = new Map<Id, Account>();
         User u = [SELECT id FROM User WHERE FirstName = 'MA EUGENIA' LIMIT 1];
         User u2 = [SELECT id FROM User WHERE FirstName = 'MARYCARMEN' LIMIT 1];
        
        
            Account acc = new Account();
            //////Cuenta Persona///////////
            acc.FirstName = 'INT';
            acc.LastName = '20';
            acc.RUT__c = '16049291-0';
            acc.RecordTypeId = rtPersona.Id;
            acc.Ciudad_o_Provincia_particular__c = 'SANTI';
            acc.Comuna_particular__c = com.Id;
            acc.Pais_particular__c = 'Chile';
            acc.Calle_particular__c = 'CallePart';
            acc.Numero_particular__c = '111';
            acc.Apartment__c = '1111';
            acc.Comuna_comercial__c = com.Id;
            acc.Pais_comercial__c = 'Chile';
            acc.Calle_comercial__c = 'Calle';
            acc.Numero_comercial__c = '1111';
            acc.Office_Number__c = '111';          
            acc.Numero_comercial__c = '23213';
            //acc.Commercial_FAX_Other__c = '213213';
            acc.Office_Number__c = '111';
            acc.PersonMobilePhone = '+569898987';
            acc.Particular_Phone_Other__pc = '+568998989';
            acc.Particular_Landline__pc = '+568987878';
            acc.Phone = '+5689898980';
            acc.Fecha_Solicitud_Crear_Cliente__c = Date.today(); 
            acc.Crear_Cliente__c = true;
            acc.Ejecutivo_de_Cuenta__c = u.id;
            
            insert acc;
            BICE_Account_Int10 a10 = new BICE_Account_Int10();
            //BICE_Account_Int10.callInt10(acc.id, 'xml');
            BICE_Account_Int10.updateAccount(acc.Id, '1234');
            m.put(acc.id, acc);
            
            acc.Fecha_de_declaracion_de_margen__c = Date.today();
            acc.Phone = '+5681111111';
            update acc;
            
            ListaAcc.add(acc);
            SetIds.add(acc.id);        
            oldm.put(acc.id,acc);
            
            ba.setComunas(ListaAcc);
            ba.OnBeforeInsert(ListaAcc);
            ba.OnAfterInsert(ListaAcc);
            BICE_AccountTriggerHandler.OnAfterInsertAsync(SetIds);
            ba.validateIfCallInt10(ListaAcc);
            ba.OnBeforeUpdate(ListaAcc,ListaAcc,oldm,m);
            BICE_AccountTriggerHandler.FormatoFecha(acc.Fecha_Solicitud_Crear_Cliente__c, '20/05/1777');
    
        
            acc = new Account();
            //////Cuenta Persona///////////
            acc.Name = 'Empresa x';
            acc.RUT__c = '22385241-6';
            acc.RecordTypeId = rtEmpresa.Id;
            
            acc.Comuna_comercial__c = com.Id;
            acc.Pais_comercial__c = 'Chile';
            acc.Calle_comercial__c = 'Calle 1';
            acc.Numero_comercial__c = '11115';
            acc.Office_Number__c = '1114';          
            acc.Numero_comercial__c = '232133';
            //acc.Commercial_FAX_Other__c = '213213';
            acc.Office_Number__c = '1112';           
            acc.Fecha_Solicitud_Crear_Cliente__c = Date.today();  
            acc.Crear_Cliente__c = true;
            acc.Ejecutivo_de_Cuenta__c = u.id;
            
            insert acc;
            
            m.put(acc.id, acc);
        
        	acc.Calle_comercial__c = 'lejos';
        	update acc;
            
      
            
            ListaAcc.add(acc);
            SetIds.add(acc.id);        
            oldm.put(acc.id,acc);
            
            
            ba.setComunas(ListaAcc);
            ba.OnBeforeInsert(ListaAcc);
            ba.OnAfterInsert(ListaAcc);
            BICE_AccountTriggerHandler.OnAfterInsertAsync(SetIds);
            ba.validateIfCallInt10(ListaAcc);
            ba.OnBeforeUpdate(ListaAcc,ListaAcc,oldm,m);
            BICE_AccountTriggerHandler.FormatoFecha(acc.Fecha_Solicitud_Crear_Cliente__c, '20/05/1777');
        
        
        
            acc = new Account();
            //////Cuenta Persona///////////
            acc.Name = 'Empresa 2';
            acc.RUT__c = '89120-7';
            acc.RecordTypeId = rtEmpresa.Id;           
            //acc.Comuna_comercial__c = com.Id;
            acc.Pais_comercial__c = 'Chile';
            acc.Calle_comercial__c = 'Calle';
            acc.Numero_comercial__c = '1111';
            acc.Office_Number__c = '111';          
            acc.Numero_comercial__c = '23213456';
            //acc.Commercial_FAX_Other__c = '213213';
            acc.Office_Number__c = '111';
            acc.Commercial_Cellphone__c = '+568989898';   
            acc.Phone = '+568989898';   
            acc.Commercial_Landline__c = '+562656565'; 
            acc.Commercial_FAX_Other__c = '+568989859';    
            acc.Fecha_Solicitud_Crear_Cliente__c = Date.today();  
            acc.Crear_Cliente__c = true;
            acc.Ejecutivo_de_Cuenta__c = u.id;
            acc.Taxes__c = true;
        	acc.Integracion_Sebra__c = true;
            
            insert acc;
        
        	acc.Office_Number__c = '12312';
        	update acc;
            
            Contact c = new Contact();
            c.Cargo__c = 'Apoderado';
            c.Tipo_de_Contacto__c = 'Ejecutivo Máximo';
            c.Email = 'conta@cont.cl';
            c.Apellido_materno__c = 'Materno';
            c.FirstName = 'Nombre';
            c.LastName = 'Apellido';
            c.MobilePhone = '+568989898';
            c.Fax = '+5688977';
            c.Phone = '+562589859';
            c.AccountId = acc.id;
            
            insert c;
        
            m.put(acc.id, acc);
            
      
            
            ListaAcc.add(acc);
            SetIds.add(acc.id);        
            oldm.put(acc.id,acc);
            
            BICE_AccountTriggerHandler.getAccountContacts(c.Id);
            ba.setComunas(ListaAcc);
            ba.OnBeforeInsert(ListaAcc);
            ba.OnAfterInsert(ListaAcc);
            BICE_AccountTriggerHandler.OnAfterInsertAsync(SetIds);
            ba.validateIfCallInt10(ListaAcc);
            ba.OnBeforeUpdate(ListaAcc,ListaAcc,oldm,m);
            BICE_AccountTriggerHandler.FormatoFecha(acc.Fecha_Solicitud_Crear_Cliente__c, '20/05/1777');
            Boolean x = ba.IsTriggerContext;
            x = ba.IsVisualforcePageContext;
            x = ba.IsWebServiceContext;
            x = ba.IsExecuteAnonymousContext;
        
    }

}