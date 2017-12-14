trigger BICE_LeadTrigger on Lead (before delete, before insert, before update,
                                   after delete,  after insert,  after update){
/** START Add Date to Fecha Solicitud de Creacion and Owner **/
    List<Profile> pUsers = [SELECT Name, Id FROM Profile WHERE Name LIKE '%Banca Persona%'];
    List<Profile> eUsers = [SELECT Name, Id FROM Profile WHERE Name LIKE '%Banca Empresas%' OR Name LIKE '%EYC%'];
    Id profileId = userinfo.getProfileId();
    //List<Profile> perfilInversionista =[Select Id,Name from Profile where Id=:profileId AND Name LIKE '%Inversiones%'];
    List<RecordType> rtInversiones;
    
    if(Trigger.isBefore && !Trigger.isDelete){
        for(Lead l: Trigger.New){
            if(l.Request_to_Create_Client_Area__c == true){
                 // Check Owner Banca Personas
                Boolean checkP = false;
                for(Profile xP : pUsers){
                    if(l.Owner.ProfileId == xP.Id){
                        checkP = true;
                    }
                }
                if(checkP == true){
                    l.Customer_type_other_rating__c = 'Gerencia Finanzas';
                }
                //Check Owner Banca Empresas or EYC
                Boolean checkE = false;
                for(Profile xP : eUsers){
                    if(l.Owner.ProfileId == xP.Id){
                        checkE = true;
                    }
                }
                if(checkE == true){
                    l.Customer_type_other_rating__c = 'Gerencia Comercial';
                }
                
                Instance it = new Instance();
                if (it.getInstanceName() == 'Sandbox') {
                     // l.Fecha_Solicitud_Crear_Cliente__c = System.today(); solicitaron comentar esta linea solo en ambiente invers
                } else if (it.getInstanceName() == 'Production') {
                     l.Fecha_Solicitud_Crear_Cliente__c = System.today();
                }
               
            }
        }
        /** END Add Date to Fecha Solicitud de Creacion **/
        /* START Check Comuna */
        Set<ID> ccomIds = new Set<ID>();
        //List<Lead> lactualizar = new List<Lead>();
        List<Comuna__c> comunas = new List<Comuna__c>();
        for(Lead l: Trigger.New){
            if(l.Comuna_comercial_Inv__c != null){
                ccomIds.add(l.Comuna_comercial_Inv__c);
            }else if(l.Pa_s_comercial_Inv__c == 'Chile'){
                l.Region_comercial_Inv__c = '';
                l.Ciudad_o_Provincia_comercial_Inv__c = '';
                l.Pa_s_comercial_Inv__c = '';
                //lactualizar.add(l);
            }else{
                l.Region_comercial_Inv__c = '';
                //lactualizar.add(l);
            }
            if(l.Comuna_particular_Inv__c != null){
                ccomIds.add(l.Comuna_particular_Inv__c);
            }else if(l.Pais_particular_Inv__c == 'Chile'){
                l.Region_particular_Inv__c = '';
                l.Ciudad_o_Provincia_particular_Inv__c = '';
                l.Pais_particular_Inv__c = '';
                //lactualizar.add(l);
            }else{
                l.Region_particular_Inv__c = '';
                //lactualizar.add(l);
            }
            if(l.Comuna_comercial__c != null){
                ccomIds.add(l.Comuna_comercial__c);
            }else if(l.Pais_comercial__c == 'Chile'){
                l.Region_comercial__c = '';
                l.Ciudad_comercial__c = '';
                l.Pais_comercial__c = '';
                //lactualizar.add(l);
            }else{
                l.Region_comercial__c = '';
                //lactualizar.add(l);
            }
            if(l.Comuna_particular__c != null){
                ccomIds.add(l.Comuna_particular__c);
            }else if(l.Pais_particular__c == 'Chile'){
                l.Region_particular__c = '';
                l.Ciudad_particular__c = '';
                l.Pais_particular__c = '';
                //lactualizar.add(l);
            }else{
                l.Region_particular__c = '';
                //lactualizar.add(l);
            }
        }
        comunas = [SELECT Id,Name, GLS_CIUDAD__c, COD_CIUDAD__c, COD_COMUNA__c, COD_REGION__c, Pais__c, GLS_REGIONLARGA__c FROM Comuna__c WHERE Id IN:ccomIds];
        for(Lead l : Trigger.New){
             for(Comuna__c c : comunas){
                if(l.Comuna_comercial_Inv__c == c.Id){
                    l.Region_comercial_Inv__c = c.GLS_REGIONLARGA__c;
                    l.Ciudad_o_Provincia_comercial_Inv__c = c.GLS_CIUDAD__c;
                    l.Pa_s_comercial_Inv__c = c.Pais__c; //c.Pais__c
                    //lactualizar.add(l);
                }
                if(l.Comuna_particular_Inv__c == c.Id){
                    l.Region_particular_Inv__c = c.GLS_REGIONLARGA__c;
                    l.Ciudad_o_Provincia_particular_Inv__c = c.GLS_CIUDAD__c;
                    l.Pais_particular_Inv__c = c.Pais__c;
                }
            }                  
            if(l.Comuna_comercial__c != null){
                ccomIds.add(L.Comuna_comercial__c); system.debug('Hay Comuna');
            }else if(l.Pais_comercial__c == 'Chile'){ system.debug('Chile ');
                l.Info_adicional_Inv_Oficina__c = '';                   
                l.Region_comercial_Inv__c = '';
                l.Ciudad_o_Provincia_comercial_Inv__c = '';
                //lactualizar.add(l);
            }
            if(l.Comuna_particular_Inv__c != null){
                ccomIds.add(L.Comuna_particular_Inv__c);
            }else if(l.Pais_particular__c == 'Chile'){
                l.Region_particular_Inv__c = '';
                l.Ciudad_o_Provincia_particular_Inv__c = '';
                l.Pais_particular_Inv__c = '';
                //lactualizar.add(L);
            }
            for(Comuna__c c : comunas){
                if(l.Comuna_comercial__c == c.Id){
                    l.Region_comercial__c = c.GLS_REGIONLARGA__c;
                    l.Ciudad_comercial__c = c.GLS_CIUDAD__c;
                    l.Pais_comercial__c = c.Pais__c; //c.Pais__c
                    //l.BillingCity =comunas[0].Name;
                    //lactualizar.add(l);
                }
                if(l.Comuna_particular__c == c.Id){ system.debug('Encontró comuna particular');
                    l.Region_particular__c = c.GLS_REGIONLARGA__c;
                    l.Ciudad_particular__c = c.GLS_CIUDAD__c;
                    l.Pais_particular__c = c.Pais__c;
                    //L.PersonMailingCity = c.Name;
                }
            }
            //if(l.RecordTypeId == rEid){
            if(l.Comuna_comercial__c != null){
                ccomIds.add(L.Comuna_comercial__c); system.debug('Hay Comuna');
            }else if(l.Pais_comercial__c == 'Chile'){ system.debug('Chile ');
                l.Apartment__c = '';                   
                l.Region_comercial__c = '';
                l.Ciudad_comercial__c = '';
                //l.Pais_comercial__c = 'Chile';
                //lactualizar.add(l);
            }//else{  
                system.debug('Hay Billing ');
            //}
       // }
        //if(L.RecordTypeId == rPid){
            if(L.Comuna_particular__c != null){
                ccomIds.add(L.Comuna_particular__c);
            }else if(L.Pais_particular__c == 'Chile'){
                l.Region_particular__c = '';
                l.Ciudad_particular__c = '';
                l.Pais_particular__c = '';
                //lactualizar.add(L);
            }
        }
        /* END Check Comuna */
    }
    if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){
    
/** START Aviso Jefe Plataforma **/
        RecordType[] rc = [Select Id 
                           FROM RecordType 
                           WHERE Name='Lead Persona Jurídica (Fuerza Ventas)' 
                            OR Name ='Lead Persona Natural (Fuerza de Ventas)'];
       Set<Id> recordIds = new Set<Id>();
       for(RecordType r : rc){
            recordIds.add(r.Id);
        }
        if(Trigger.isInsert){
            for(Lead le : Trigger.new){
                String IdActual = UserInfo.getUserId();
                RecordType rec1 = [Select Id FROM RecordType  WHERE Name='Lead Persona Jurídica (Fuerza Ventas)'];
                RecordType rec2 = [Select Id FROM RecordType  WHERE Name ='Lead Persona Natural (Fuerza de Ventas)'];
                User us=[select id,Name,ManagerId,profileid,Branch_Name__c from User where id=:IdActual];
                Profile  peinv  = [Select Id,name from Profile where  id=:us.profileid];
                if(string.valueOf(peinv).contains('Inversiones')){
                    le.Investment_Executive__c=us.id;
                }else if(le.RecordTypeId==rec1.id || le.RecordTypeId==rec2.id ){
                    le.Profin_Executive__c=us.id;
                    le.Profin_Supervisor__c=us.managerId;   
                }else if(string.valueOf(peinv).contains('Agente')){
                    le.Jefe_Plataforma_Agente_Sucursal__c=us.id;
                    le.Sucursal_de_Apertura_del__c=us.Branch_Name__c;
                }else{
                    le.Account_Executive__c=us.id;
                    le.Sucursal_de_Apertura_del__c=us.Branch_Name__c;
                    le.Jefe_Plataforma_Agente_Sucursal__c=us.ManagerId;
                }
            }
        }
        Account leadEnCuenta;
        for(Lead le: Trigger.New){
          // system.debug('QueryRc' + recordIds);
            // Database.DmlOptions options = new Database.DmlOptions();
            if(recordIds.contains(le.RecordTypeId) && le.Etapa__c == 'Aprobacion_Agente' && le.Aviso_email_de_cambio_de_propietario_env__c == false && le.Scanned_Documents__c ==true){
                // system.debug('HOLA');
               // le.OwnerId = le.Jefe_Plataforma_Agente_Sucursal__c; se comento esta linea , ya que generaba error al marcar documentos degitalizados con el usuario CAC
                le.Aviso_email_de_cambio_de_propietario_env__c = true; 
                system.debug('Datos' + le.Correo_Jefe_Plataforma_Agente_Sucursal__c +' '+ le.Id+' '+ le.Nombre_completo__c);
                // options.emailHeader.triggerUserEmail = true;
                enviarCorreo(le.Correo_Jefe_Plataforma_Agente_Sucursal__c, le.Id, le.Nombre_completo__c); //
            }
            // le.setOptions(options);
        }
/** END Aviso Jefe Plataforma **/
/** START Check Lead **/
        //for(Lead le: trigger.new){
        String IdActual = UserInfo.getUserId();
        String nombrert = 'Lead Empresas y Corporaciones';
        Integer lim = 50;
        List<Lead> leads = [SELECT Name, RecordTypeId, RecordType.Name FROM Lead WHERE RecordTypeId in (SELECT Id FROM RecordType WHERE Name =: nombrert) AND RecordTypeId <> ''];
        Set<ID> rtIds = new Set<ID>();
        for(Lead ll : leads){
            //System.debug('El record type de '+ll.Name+' es : '+ll.RecordType.Name);
            if(ll.RecordType.Name == nombrert){
                rtIds.add(ll.RecordTypeId);
                //System.debug('El RecordTypeId de '+ll.RecordType.Name+' es : '+rtid);
            }
        }
        List<Lead> lids = [SELECT Id, Name FROM Lead WHERE OwnerId =: IdActual AND RecordTypeId IN: rtIds AND IsConverted = FALSE AND Status != 'No califica'];
        if(lids.size() >= lim){
            for(Lead le : Trigger.new){
                le.addError('No puedes tener más de '+lim+' leads');
            }
        }
        
        //controlar los duplicados de profin persona natural
        /*
        RecordType re = [SELECT Id,name FROM RecordType WHERE Name='Lead Persona Natural (Fuerza de Ventas)'];
        system.debug('recortypee + '+re.Name);
        for(lead can : [select name from lead where name=:NombreCandidato and lastname=:apellidoCandidato and RUT__c=:RutCandidato and RecordTypeId=:re.Id]){
            system.debug('candidato entrante '+ can);
            try{
                 leadEnCuenta=[select name from Account where  RUT__c=:RutCandidato and Name=:nombreCandidato and Tiene_Ejecutivo_de_Cuenta__c='Sí' ]; 
            }catch(QueryException ex){
                system.debug('error '+ex);
            }
           
            system.debug('existe en cuenta'+leadEnCuenta);
            if(can!=null){
                can.addError('No puedes crear el Lead, registro Duplicado');
            }else
            if(leadEnCuenta!=null){
                can.addError('No puedes crear el Lead, registro Duplicado');
            }
        }
        */
        //
        
        //}
/** END Check Lead **/
    }else if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)){
       
/** START Convert Lead On Check *
        for(Lead le : trigger.new){
            if(le.IsConverted){
                System.debug('El lead ya ha sido convertido');
            }else{
                if(le.Convertir__c){ 
                    //invoco a la clase y el método
                    CustomLeadConversion conversion = new CustomLeadConversion();
                    conversion.MyLeadConversion(le.id, le.FirstName, le.LastName);
                    System.debug('El lead fue convertido');
                    System.debug('Aquí debo redireccionar... trabajando en esto');
                    //aqui debo redireccionar una vez que se haya convertido
                }else{
                    System.debug('El lead no fue convertido');
                }    
            }
        }
/** END Convert Lead On Check **/
    }
/** START enviarCorreo **/
    public void enviarCorreo(String correoAgente, Id IdLead, String NombreCandidato){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String emailAddr = correoAgente;
        String urlLead = URL.getSalesforceBaseUrl().toExternalForm() + '/' + IdLead;
        String[] toAddresses = new String[] {emailAddr} ;
        mail.setToAddresses(toAddresses);
        mail.Setsubject('Candidato: Se le ha asignado '+NombreCandidato);
        mail.SetplainTextBody('Candidato: '+NombreCandidato+' se le ha asignado.'+'\n\n'
        +'Para ver los detalles de este candidato en salesforce haga clic en el siguiente vínculo: '+ urlLead);
        if(!Test.isRunningTest()){
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
    }
/** END enviarCorreo **/
}