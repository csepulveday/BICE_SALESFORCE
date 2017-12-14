global class BICE_LeadCTControllerExtension{
    public Lead tObj{get;set;}
    public String mensajePagina {get;set;}
    public String urlToRedirect{get;set;}
    public BICE_LeadCTControllerExtension(ApexPages.StandardController controller){
        this.tObj = (Lead)controller.getRecord();
    }
    public PageReference validarcampos(){
        
        Lead Le = [SELECT Raz_n_Social__c,RUT__c,name,firstname,Nationality__c,Pais_comercial__c
                   FROM Lead 
                   WHERE Id =:tObj.Id];
        RecordType rc = [SELECT Id, Name, DeveloperName FROM RecordType where DeveloperName='lead_persona_juridica'];
        RecordType rc1 = [SELECT Id, Name, DeveloperName FROM RecordType where DeveloperName='Lead_Inversiones_Persona_Jur_dica'];
        RecordType rc2 = [SELECT Id, Name, DeveloperName FROM RecordType where DeveloperName='Lead_persona_Juridica_Fuerza_Ventas'];
        RecordType rc3 = [SELECT Id, Name, DeveloperName FROM RecordType where DeveloperName='Lead_Inversiones_AP_Persona_Jur_dica'];
        RecordType rc4 = [SELECT Id, Name, DeveloperName FROM RecordType where DeveloperName='Lead_persona_natural'];
        RecordType rc5 = [SELECT Id, Name, DeveloperName FROM RecordType where DeveloperName='Lead_persona_natural_Fuerza_de_Ventas'];
        RecordType rc6 = [SELECT Id, Name, DeveloperName FROM RecordType where DeveloperName='Lead_Inversiones'];
        RecordType rc7 = [SELECT Id, Name, DeveloperName FROM RecordType where DeveloperName='Lead_Inversiones_AP_Persona_Natural'];
        RecordType rc8 = [SELECT Id, Name, DeveloperName FROM RecordType where DeveloperName='Lead_Empresas_y_Corporaciones'];
        if(rc.id==tObj.RecordTypeId || rc1.id==tObj.RecordTypeId || rc2.id==tObj.RecordTypeId || rc3.id==tObj.RecordTypeId || rc8.id==tObj.RecordTypeId){
            if(Le.Raz_n_Social__c==null || Le.Raz_n_Social__c=='' ){
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Por favor ingresar Rázon social');
                ApexPages.addMessage(myMsg);  
            }
             if(Le.Nationality__c==null && rc8.id!=tObj.RecordTypeId || Le.Nationality__c=='' && rc8.id!=tObj.RecordTypeId){
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Por favor ingresar Nacionalidad');
                ApexPages.addMessage(myMsg);  
            }
            if(Le.Pais_comercial__c==null && rc8.id==tObj.RecordTypeId || Le.Pais_comercial__c=='' && rc8.id==tObj.RecordTypeId){
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Por favor ingresar País Comercial');
                ApexPages.addMessage(myMsg);  
            }
            if(!ApexPages.hasMessages()){   
                mensajePagina ='Chequeando Compliance Tracker...';
                return checkComplianceTracker();
            }
        }else if(rc4.id==tObj.RecordTypeId || rc5.id==tObj.RecordTypeId || rc6.id==tObj.RecordTypeId || rc7.id==tObj.RecordTypeId){
            if(Le.RUT__c==null || Le.RUT__c=='' ){
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Por favor ingresar Rut');
                ApexPages.addMessage(myMsg);  
            }
             if(Le.name==null || Le.name=='' ){
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Por favor ingresar Nombre');
                ApexPages.addMessage(myMsg);  
            }
             if(Le.FirstName==null || Le.FirstName=='' ){
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Por favor ingresar Apellido');
                ApexPages.addMessage(myMsg);  
            }
             if(Le.Nationality__c==null || Le.Nationality__c=='' ){
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Por favor ingresar Nacionalidad');
                ApexPages.addMessage(myMsg);  
            }
            if(!ApexPages.hasMessages()){   
                mensajePagina ='Chequeando Compliance Tracker...n';
                return checkComplianceTracker();
            }
       }else{
             mensajePagina ='Chequeando Compliance Tracker...';
            checkComplianceTracker();
        }
        
        return null;
    }
    public pageReference volver(){
        PageReference back = new PageReference('/' + tObj.Id);
        back.setRedirect(true);
        return back;
    }
    
    public PageReference checkComplianceTracker(){
        Lead myObj = [SELECT Rut__c, Raz_n_Social__c, Company, FirstName, LastName, Apellido_materno__c, Nationality__c, CT_Result_Code__c, CT_Request_Date__c, CT_Request_Code__c FROM Lead WHERE Id =:this.tObj.Id];
        // Create the stub
        BICE_ComplianceTrackerWS.ComplianceTrackerSoapQSPort wservice = new BICE_ComplianceTrackerWS.ComplianceTrackerSoapQSPort();
        // Set the response var
        BICE_ComplianceTrackerWS.searchResponse_element response = new BICE_ComplianceTrackerWS.searchResponse_element();
        //Make the call
        String rCode;
        rCode = '0';
        try{            
            if(myObj.CT_Request_Code__c != null){
                rCode = myObj.CT_Request_Code__c;
            }
            if(myObj.Company != null){
                response = wservice.search_x(61, //id_usys
                                         myObj.RUT__c, //idemp
                                         myObj.Raz_n_Social__c, //nombres
                                         '', //apellidos
                                         myObj.Nationality__c, //nacionalidad
                                         '0', //tipo
                                         0, //estatus
                                         0, //autorizado
                                         Integer.valueOf(rCode), //id_requestws
                                         0, //id_emp
                                         '0'); //source
            }else{
                response = wservice.search_x(61, //id_usys
                                         myObj.RUT__c, //idemp
                                         myObj.FirstName, //nombres
                                         myObj.LastName+' '+myObj.Apellido_materno__c, //apellidos
                                         myObj.Nationality__c, //nacionalidad
                                         '0', //tipo
                                         0, //estatus
                                         0, //autorizado
                                         Integer.valueOf(rCode), //id_requestws
                                         0, //id_emp
                                         '0'); //source
            }
            System.debug('Response: '+response);
            System.debug('Autorizado = '+response.autorizado);
            System.debug('Status = '+response.estatus);
            myObj.CT_Request_Code__c = String.valueOf(response.id_requestws);
            myObj.CT_Result_Code__c = response.estatus;
            myObj.CT_Request_Date__c = System.today();
            try{
                update myObj;
            }catch(Exception e){
                System.debug('Exception updating lead: '+e.getMessage());
            }
        }catch(Exception e){
            System.debug('Exception getting response: '+e.getMessage());
        }
        urlToRedirect = '/apex/BICE_IntOnline_Redirect';
        PageReference myVFPage = new PageReference(urlToRedirect);
        myVFPage.getParameters().put('LID',this.tObj.Id);
        myVFPage.getParameters().put('msg','Completando validacion...');
        myVFPage.setRedirect(true);
        return myVFPage;
    }
}