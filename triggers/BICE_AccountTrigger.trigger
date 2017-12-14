trigger BICE_AccountTrigger on Account (before delete, before insert, before update,
                                         after delete,  after insert,  after update){
                                         
/*Id profileId = userinfo.getProfileId();
String profileName=[Select Id,Name from Profile where Id=:profileId].Name;
system.debug('ProfileName'+profileName);*/
if(UserInfo.getFirstName() != 'usuario' && UserInfo.getLastName()!='integrador'){
if(System.isBatch() == false || System.isScheduled()==false || System.isQueueable() == false){                                       
                                         
    List<Profile> pUsers = [SELECT Name, Id FROM Profile WHERE Name LIKE '%Banca Persona%'];
    List<Profile> eUsers = [SELECT Name, Id FROM Profile WHERE Name LIKE '%Banca Empresas%' OR Name LIKE '%EYC%'];
    List<RecordType> rTypes = [SELECT Id, Name FROM RecordType WHERE Name ='Cuenta Empresa' OR Name = 'Cuentas personales'];
    Id rEid;
    Id rPid;
    for(RecordType rt : rTypes){
        if(rt.Name == 'Cuenta Empresa'){
            rEid = rt.Id;
        }else if(rt.Name == 'Cuentas personales'){
            rPid = rt.Id;
        }
    }
    if(Trigger.isBefore && !Trigger.isDelete){
        Set<ID> ccomIds = new Set<ID>();
        List<Comuna__c> comunas = new List<Comuna__c>();
        List<Account> lactualizar = new List<Account>();
        for(Account a: Trigger.New){
            if(a.Crear_Cliente__c == true){
                // Check Owner Banca Personas
                Boolean checkP = false; 
                for(Profile xP : pUsers){ system.debug('ID BP: '+xp.Id); system.debug('ID Owner: '+a.Owner.ProfileId);
                    if(a.Owner.ProfileId == xP.Id){
                        checkP = true; 
                    }
                }
                if(checkP == true){
                    if(a.RecordTypeId == rEid){
                        a.Tipo_Cliente_Gestion__c = 'Personas Naturales';  
                        a.Clasificacion_submargenes__c = 'Personas';
                    }else if(a.RecordTypeId == rPid){
                        a.Tipo_Cliente_Gestion__c = 'Mediana Empresa';
                        a.Clasificacion_submargenes__c = 'Clientes Corporativos';
                    }
                    a.Customer_type_other_rating_c__c = 'Gerencia Finanzas';
                }
                //Check Owner Banca Empresas or EYC
                Boolean checkE = false;
                for(Profile xP : eUsers){
                    if(a.Owner.ProfileId == xP.Id){
                        checkE = true;
                    }
                }
                if(checkE == true){
                    if(a.RecordTypeId == rEid){
                        a.Tipo_Cliente_Gestion__c = 'Personas Naturales';
                        a.Clasificacion_submargenes__c = 'Personas';
                    }else if(a.RecordTypeId == rPid){
                        a.Tipo_Cliente_Gestion__c = 'Mediana Empresa';
                        a.Clasificacion_submargenes__c = 'Clientes Corporativos';
                    }
                    a.Customer_type_other_rating_c__c = 'Gerencia Comercial';
                }
            }
        
    }
    
    /* START Check Comuna */
        for(Account l: Trigger.New){
            if(l.Comuna_comercial__c != null){
                ccomIds.add(l.Comuna_comercial__c);
            }else if(l.Pais_comercial__c == 'Chile'){
                l.Region_comercial__c = '';
                l.Ciudad_o_Provincia_comercial__c = '';
                l.Pais_comercial__c = '';
                lactualizar.add(l);
            }else{
                l.Region_comercial__c = '';
                lactualizar.add(l);
            }
            if(l.Comuna_particular__c != null){
                ccomIds.add(l.Comuna_particular__c);
            }else if(l.Pais_particular__c == 'Chile'){
                l.Region_particular__c = '';
                l.Ciudad_o_Provincia_particular__c = '';
                l.Pais_particular__c = '';
                lactualizar.add(l);
            }else{
                l.Region_particular__c = '';
                lactualizar.add(l);
            }
        }
        comunas = [SELECT Id,Name, GLS_CIUDAD__c, COD_CIUDAD__c, COD_COMUNA__c, COD_REGION__c, Pais__c, GLS_REGIONLARGA__c FROM Comuna__c WHERE Id IN:ccomIds];
        for(Account l : Trigger.New){
            for(Comuna__c c : comunas){
                if(l.Comuna_comercial__c == c.Id){
                    l.Region_comercial__c = c.GLS_REGIONLARGA__c;
                    l.Ciudad_o_Provincia_comercial__c = c.GLS_CIUDAD__c;
                    l.Pais_comercial__c = c.Pais__c; //c.Pais__c
                    //l.BillingCity =comunas[0].Name;
                   
                    
                    lactualizar.add(l);
                }
                if(l.Comuna_particular__c == c.Id){
                    l.Region_particular__c = c.GLS_REGIONLARGA__c;
                    l.Ciudad_o_Provincia_particular__c = c.GLS_CIUDAD__c;
                    l.Pais_particular__c = c.Pais__c;
                    
                    //L.PersonMailingCity = c.Name;
                }
            }
        
        
        //if(l.RecordTypeId == rEid){
                if(l.Comuna_comercial__c != null){
                    ccomIds.add(L.Comuna_comercial__c); system.debug('Hay Comuna');
                }else if(l.Pais_comercial__c == 'Chile'){ system.debug('Chile ');
                    l.Apartment__c = '';
                    l.BillingCity = '';
                    l.BillingCountry = 'Chile';
                    l.BillingState = '';
                    l.BillingStreet = '';
                    l.Region_comercial__c = '';
                    l.Ciudad_o_Provincia_comercial__c = '';
                    //l.Pais_comercial__c = 'Chile';
                    lactualizar.add(l);
                }//else{  
                    system.debug('Hay Billing ');
                    l.BillingStreet = '';
                    if(L.Numero_comercial__c != null && L.Numero_comercial__c != ''){
                        String n = L.Calle_comercial__c + ' ' +L.Numero_comercial__c;
                        if(L.Office_Number__c != null && l.Office_Number__c != ''){
                            l.BillingStreet = n + ', ' + l.Office_Number__c;
                        }else{
                            l.BillingStreet = n;
                        }
                    }else if(l.Calle_comercial__c != null && l.Calle_comercial__c != ''){
                        String n = l.Calle_comercial__c;
                        if(l.Office_Number__c != null && l.Office_Number__c != ''){
                            l.BillingStreet = n + ', ' + l.Office_Number__c;
                        }else{
                            l.BillingStreet = n;
                        }
                    }
                    if(l.Comuna_comercial__c != null){
                        Comuna__C ComComercial = [SELECT Name FROM Comuna__c WHERE Id =: l.Comuna_comercial__c]; 
                        L.BillingCity = ComComercial.Name;
                    }
                    //l.BillingCity = comunas[0].Name;
                    l.BillingCountry = l.Pais_comercial__c;
                    if( comunas.size()>0)
                        l.BillingState = l.Ciudad_o_Provincia_comercial__c;
                    //l.Region_comercial__c = '';
                    lactualizar.add(l);
                //}
           // }
            //if(L.RecordTypeId == rPid){
                if(L.Comuna_particular__c != null){
                    ccomIds.add(L.Comuna_particular__c);
                }
                else if(L.Pais_particular__c == 'Chile'){
                    L.PersonMailingCity = '';
                    L.PersonMailingCountry = 'Chile';
                    L.PersonMailingState = '';
                    L.PersonMailingStreet = '';
                    L.Region_particular__c = '';
                    L.Ciudad_o_Provincia_particular__c = '';
                    L.Pais_particular__c = '';
                    lactualizar.add(L);
                }//else{
                    L.PersonMailingStreet = '';
                    System.debug('Calle: '+L.PersonMailingStreet);
                    if(L.Numero_particular__c != null && L.Numero_particular__c != ''){
                        String n = L.Calle_particular__c + ' ' +L.Numero_particular__c;
                        System.debug('Calle: '+n);
                        if(L.Apartment__c != null && L.Apartment__c != ''){
                            L.PersonMailingStreet = n + ', ' + L.Apartment__c;
                        }else{
                            L.PersonMailingStreet = n;
                        }
                    }else if(L.Calle_particular__c != null && L.Calle_particular__c != ''){
                        String n = L.Calle_particular__c;
                        System.debug('Calle sin numero: '+n);
                        if(L.Apartment__c != null && L.Apartment__c != ''){
                            L.PersonMailingStreet = n + ', ' + L.Apartment__c;
                        }else{
                            L.PersonMailingStreet = n;
                        }
                    }
                    if(l.Comuna_particular__c != null){
                        Comuna__C Comparticular = [SELECT Name FROM Comuna__c WHERE Id =: l.Comuna_particular__c]; 
                        L.PersonMailingCity = Comparticular.Name;
                    }
                    //L.PersonMailingCity = l.Comuna_particular__r.Name;
                    L.PersonMailingCountry = L.Pais_particular__c;
                    L.PersonMailingState = L.Ciudad_o_Provincia_particular__c; system.debug('Comuna Particular:'+l.Comuna_particular__r.Name);
                    //L.Region_particular__c = '';
                    lactualizar.add(L);
              //  }
           // }
    }
/* END Check Comuna */   
    
    
   }
                                       
/* START Integration INT-10 */

                String PCOD_TIPOCLI;
                String PCOD_SUBTIPOCLI;
                String PCOD_TIP_CLI_CL;
                String PCOD_CLAS_SEG;
                String PCOD_TIPO_FATCA;
                String PCOD_INTIN;
                String PCOD_IDGIN;
                String PCOD_CATDEU;
                String PCOD_RELA_BICE;
                String PCOD_GRUP_RELA;
                String PCOD_ESTA_DEUD;
                String PFEC_CLIENTE;
                String PCOD_SEPBIENES;
                String PFLG_EMPLEADO;
                String PCOD_CLARIE;
                String PNUM_CARPETA;
                String PNUM_CASI_INTE;
                String PCOD_NACION;
                String PCOD_PROFESION;
                String PCOD_ACTIVIDAD;
                String PCOD_CLIENTE;
                String PCOD_TIPO_CLIENTE;
                String PFEC_CONSTITUCION;
                String PGLS_RAZON_SOCI;
                String PNOM_FANTASIA; //Company
                String PGLS_RAZON_SOCIAL_LEGAL;
                String PCOD_GRUPO_ECON;
                String PNUM_ROL_EMPLEADO;
                String PCOD_COMUNACOM;
                String PCOD_COMUNAPART;
                String PCOD_TIPO_JURIDI;
                String COD_OPERADOR;
                String PCOD_GIROSII;
                String PFEC_DECL_JURADA;
                String PCOD_PAGA_IVA;
                
    if(Trigger.isUpdate && Trigger.isBefore){ //!Trigger.isDelete
        String testData;
        List<RecordType> rPN = [SELECT Id, Name FROM RecordType WHERE Name LIKE '%Cuentas personales%'];
        List<RecordType> rPJ = [SELECT Id, Name FROM RecordType WHERE Name LIKE '%Cuenta Empresa%'];
        Endpoint_Setting__mdt xEx = [SELECT Id, Endpoint__c, Namespace__c FROM Endpoint_Setting__mdt WHERE MasterLabel = 'INT10'];
        String soapNS = xEx.Namespace__c;
        for(Account a: Trigger.New){
            String msg;
            Account old = Trigger.oldMap.get(a.Id);
            
            List<User> u = new List<User>();
            List<Comuna__c> ComComercial;
            List<Comuna__c> ComParticular;
            if(a.Comuna_comercial__c != null){
                ComComercial = [SELECT Name FROM Comuna__c WHERE Id =: a.Comuna_comercial__c]; 
                PCOD_COMUNACOM = ComComercial[0].Name;
            }
            else
                PCOD_COMUNACOM = '';
            if(a.Comuna_particular__c != null){
                ComParticular = [SELECT Name FROM Comuna__c WHERE Id =: a.Comuna_particular__c]; 
                PCOD_COMUNAPART = ComParticular[0].Name;
                }
                else{
                    PCOD_COMUNAPART = '';
                }
            system.debug('Comuna Comercial: :'+ ComComercial +'Com Particular: '+ComParticular);
           // if(a.Ejecutivo_de_Cuenta__c != null || a.Ejecutivo_de_Cuenta__c !=''){
                   u = [SELECT ROL_Number__c FROM User WHERE Id =:a.Ejecutivo_de_Cuenta__c];
                   if(u.size()>0)
                       PNUM_ROL_EMPLEADO = u[0].ROL_Number__c;                  
                   else
                       PNUM_ROL_EMPLEADO = '0';                  
                  system.debug('Empleado: '+PNUM_ROL_EMPLEADO );
                  u = [SELECT ROL_Number__c FROM User WHERE Id =:a.LastModifiedById];
                   if(u.size()>0)
                       COD_OPERADOR = u[0].ROL_Number__c;                  
                   else
                       COD_OPERADOR = '0';          
                  
           // }
           // catch(Exception e){
            for(RecordType r : rPN){ if(r.Id == a.RecordTypeId){ PCOD_TIPO_JURIDI = '1'; System.debug('Persona Natural'); } }
            for(RecordType r : rPJ){ if(r.Id == a.RecordTypeId){ PCOD_TIPO_JURIDI = '2'; System.debug('Persona Juridica'); } }
            if(PCOD_TIPO_JURIDI == '1'){ //PERSONA NATURAL
                //Nuevos Campos 04072017//
                PCOD_TIPOCLI = a.Segmentacion_Liquidez_Codigo__c;//'Minorista';
                PCOD_SUBTIPOCLI = a.Segmentacion_Liquidez_Subcodigo__c;//'Minoristas personas naturales';
                PCOD_TIP_CLI_CL = 'Personas';
                PCOD_CLAS_SEG = A.Segmentation__c;
                PCOD_TIPO_FATCA = A.FATCA_Information__c;
                PCOD_INTIN = A.Numero_de_TIN__c;
                PCOD_IDGIN = A.Numero_de_GIN__c;
                PCOD_CATDEU = 'Persona natural';
                PCOD_RELA_BICE = 'NO RELACIONADO';
                PCOD_GRUP_RELA = 'Sin Grupo';
                PCOD_ESTA_DEUD = 'DEM';
                PFEC_CLIENTE = FormatoFecha(A.Fecha_Solicitud_Crear_Cliente__c,PFEC_CLIENTE );
                PCOD_SEPBIENES = A.Conjugal_Regime__pc;
                PFLG_EMPLEADO = 'N'; //se debe mapear con campo de Salesforce (averiguar cual)
                PCOD_CLARIE = A.Clasificacion_de_Riesgo_SBIF__c;
                PNUM_CARPETA = '0';
                PNUM_CASI_INTE = '0';
                PCOD_NACION = A.Nationality__c;
                PCOD_PROFESION = A.Profession__pc;
                PCOD_ACTIVIDAD = 'Serv. Comunales, Sociales y Personales';
                PCOD_CLIENTE = A.Customer_type_other_rating_c__c;
                PCOD_TIPO_CLIENTE = 'Personas Naturales';
                PFEC_DECL_JURADA = FormatoFecha(a.Fecha_de_declaracion_de_margen__c,PFEC_DECL_JURADA);
                //PNUM_ROL_EMPLEADO = '0';
                ///////////////////////////
                if(
                (a.Ciudad_o_Provincia_particular__c != old.Ciudad_o_Provincia_particular__c) || 
                (a.Comuna_Particular__c != old.Comuna_Particular__c) || 
                (a.Pais_Particular__c != old.Pais_Particular__c) || 
                (a.Region_Particular__c != old.Region_Particular__c) || 
                (a.Calle_Particular__c != old.Calle_Particular__c) || 
                (a.Numero_Particular__c != old.Numero_Particular__c) || 
                (a.Ciudad_o_Provincia_comercial__c != old.Ciudad_o_Provincia_comercial__c) || 
                (a.Comuna_comercial__c != old.Comuna_comercial__c) || 
                (a.Pais_comercial__c != old.Pais_comercial__c) || 
                (a.Region_comercial__c != old.Region_comercial__c) || 
                (a.Calle_comercial__c != old.Calle_comercial__c) || 
                (a.Numero_comercial__c != old.Numero_comercial__c) || 
                (a.Phone != old.Phone) ||
                (a.PersonHomePhone != old.PersonHomePhone) ||
                (a.Phone_contact__pc != old.Phone_contact__pc) ||
                (a.Commercial_Phone_Other__c != old.Commercial_Phone_Other__c) ||
                (a.Commercial_Landline__c != old.Commercial_Landline__c) ||
                (a.Commercial_FAX_Other__c != old.Commercial_FAX_Other__c) ||
                (a.PersonEmail != old.PersonEmail) ||
                (a.Commercial_Email__pc != old.Commercial_Email__pc) ||
                (a.Ejecutivo_de_Cuenta__c != old.Ejecutivo_de_Cuenta__c) ||
                (a.PersonMobilePhone != old.PersonMobilePhone) ||
                (a.Fecha_de_declaracion_de_margen__c != old.Fecha_de_declaracion_de_margen__c) ||
                (a.SBIF_Sector__c != old.SBIF_Sector__c)
                )
                {
                    testData = '';
                    testData = testData + '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cif="'+soapNS+'">';
                    testData = testData + '   <soapenv:Header/>';
                    testData = testData + '   <soapenv:Body>';
                    testData = testData + '      <cif:crearCliente>';
                    testData = testData + '         <COD_CANAL>501</COD_CANAL>';
                    testData = testData + '         <GLOSA_APLICACION>INGRESO POR CRM</GLOSA_APLICACION>';
                    testData = testData + '         <COD_SUCURSAL>'+a.Sucursal_Banco__c+'</COD_SUCURSAL>';
                     testData = testData + '         <COD_OPERADOR>'+COD_OPERADOR+'</COD_OPERADOR>';
                    testData = testData + '         <TIPO_IDEN_CLIENTE>1</TIPO_IDEN_CLIENTE>';
                    testData = testData + '         <IDEN_CLIENTE>'+(a.Rut__c.replace('-','')).replace('.','')+'</IDEN_CLIENTE>';                                        
                    //testData = testData + '         <IDEN_CLIENTE>'+a.Rut__c.replace('-','')+'</IDEN_CLIENTE>';
                    //testData = testData + '         <FEC_CREACION></FEC_CREACION>';
                    if(PNUM_ROL_EMPLEADO!=null){
                        testData = testData + '         <PNUM_ROL_EMPLEADO>'+PNUM_ROL_EMPLEADO+'</PNUM_ROL_EMPLEADO>';
                    }else{
                        testData = testData + '         <PNUM_ROL_EMPLEADO>'+PNUM_ROL_EMPLEADO+'</PNUM_ROL_EMPLEADO>';
                    }
                    testData = testData + '         <PCOD_TIPO_JURIDI>'+a.Tipo_de_Persona__c+'</PCOD_TIPO_JURIDI>';
                    testData = testData + '         <PCOD_CLIENTE>'+PCOD_CLIENTE+'</PCOD_CLIENTE>';                   
                    //testData = testData + '         <PCOD_TIPO_CLIENTE>'+PCOD_TIPO_CLIENTE+'</PCOD_TIPO_CLIENTE>';
                    //if(a.Sub_Sector_Economico__c != null){
                       testData = testData + '         <PCOD_SECTOR_ECONOM>'+'Sin clasificar'+'</PCOD_SECTOR_ECONOM>';
                    //}
                    testData = testData + '         <PFEC_CLIENTE>'+PFEC_CLIENTE+'</PFEC_CLIENTE>';
                    //testData = testData + '         <PNUM_COR_DOMLEGAL></PNUM_COR_DOMLEGAL>';                  
                     testData = testData + '         <PCOD_ACTIVIDAD>'+PCOD_ACTIVIDAD+'</PCOD_ACTIVIDAD>';
                    if(a.SBIF_Sector__c != null){
                        testData = testData + '         <PCOD_SECTOR>'+a.SBIF_Sector__c+'</PCOD_SECTOR>';
                    }
                    
                    //testData = testData + '         <PCOD_CATDEU>'+PCOD_CATDEU+'</PCOD_CATDEU>';
                    //testData = testData + '         <PCOD_RELA_BICE>'+PCOD_RELA_BICE+'</PCOD_RELA_BICE>';
                    //testData = testData + '         <PCOD_GRUP_RELA>'+PCOD_GRUP_RELA+'</PCOD_GRUP_RELA>';
                    //testData = testData + '         <PCOD_ESTA_DEUD>'+PCOD_ESTA_DEUD+'</PCOD_ESTA_DEUD>';
                    //testData = testData + '         <PNUM_CARPETA>'+PNUM_CARPETA+'</PNUM_CARPETA>';
                    //testData = testData + '         <PNUM_CASI_INTE>'+PNUM_CASI_INTE+'</PNUM_CASI_INTE>';
                    //testData = testData + '         <PGLS_SINO_SBIF></PGLS_SINO_SBIF>';
                    testData = testData + '         <PFEC_DECL_JURADA>'+PFEC_DECL_JURADA+'</PFEC_DECL_JURADA>';
                    /*//testData = testData + '         <PFEC_VERIF_DOMLEGAL></PFEC_VERIF_DOMLEGAL>';
                    //testData = testData + '         <PFLG_FIRMA_COBPREJUD></PFLG_FIRMA_COBPREJUD>';
                    //testData = testData + '         <PFEC_FIRMA_COBPREJUD></PFEC_FIRMA_COBPREJUD>';
                    //testData = testData + '         <PNUM_TAX_ID></PNUM_TAX_ID>';
                    //testData = testData + '         <PCOD_SII_EXEIMP></PCOD_SII_EXEIMP>';
                    //testData = testData + '         <PFLG_SII_CONTPRIMERACAT></PFLG_SII_CONTPRIMERACAT>';
                    //testData = testData + '         <PCOD_TIPO_ALERTA></PCOD_TIPO_ALERTA>';
                    //testData = testData + '         <PFEC_ALERTA></PFEC_ALERTA>';
                    //testData = testData + '         <PFLAG_MANDATO_INVERSION></PFLAG_MANDATO_INVERSION>';
                    //testData = testData + '         <PCOD_GIROSII></PCOD_GIROSII>';
                    //testData = testData + '         <PCOD_FRAUDE></PCOD_FRAUDE>';
                    testData = testData + '         <PFLG_EMPLEADO>'+PFLG_EMPLEADO+'</PFLG_EMPLEADO>';
                    if(PCOD_TIPO_JURIDI == '1'){
                        if(a.LastName != null){
                            testData = testData + '         <PNOM_PATERNO>'+a.LastName+'</PNOM_PATERNO>';
                        }
                        if(a.Apellido_materno__pc != null){
                            testData = testData + '         <PNOM_MATERNO>'+a.Apellido_materno__pc+'</PNOM_MATERNO>';
                        }
                        if(a.FirstName != null){
                            testData = testData + '         <PNOM_NOMBRES>'+a.FirstName+'</PNOM_NOMBRES>';
                        }
                        //testData = testData + '         <PNOM_NICKNAME></PNOM_NICKNAME>';
                        if(a.Nationality__c == null){
                            testData = testData + '<PCOD_NACION>No definido</PCOD_NACION>';
                        }else
                            testData = testData + '<PCOD_NACION>'+PCOD_NACION+'</PCOD_NACION>';
                        //testData = testData + '         <PCOD_RESIDENCIA></PCOD_RESIDENCIA>';
                        */
                        //testData = testData + '         <PCOD_PROFESION>'+PCOD_PROFESION+'</PCOD_PROFESION>';                            
                        /*
                        String fec;
                        if(a.PersonBirthdate != null){
                            Integer val = a.PersonBirthdate.day();
                            if(val < 10){ fec = '0'+String.valueOf(val)+'/'; }else{ fec = String.valueOf(val)+'/'; }
                            val = a.PersonBirthdate.month();
                            if(val < 10){ fec = fec + '0'+String.valueOf(val)+'/'; }else{ fec = fec + String.valueOf(val)+'/'; }
                            fec = fec + String.valueOf(a.PersonBirthdate.year());
                            //testData = testData + '         <PFEC_NACIM>'+fec+'</PFEC_NACIM>';
                        }
                        */
                        /*if(a.Sex__pc == null){
                            testData = testData + '         <PCOD_SEXO>NO INFORMADO</PCOD_SEXO>';
                        }else if(a.Sex__pc == 'Male'){
                            testData = testData + '         <PCOD_SEXO>Masculino</PCOD_SEXO>';
                        }else if(a.Sex__pc == 'Female'){
                            testData = testData + '         <PCOD_SEXO>Femenino</PCOD_SEXO>';
                        }
                        if(a.Educational_Level__pc != null){
                            testData = testData + '         <PCOD_NIV_EDUCAC>'+a.Educational_Level__pc+'</PCOD_NIV_EDUCAC>';
                        }
                        if(a.Estado_civil__pc != null){
                            if(a.Estado_civil__pc == 'Divorciado'){
                                testData = testData + '         <PCOD_ESTCIVIL>Divorciado/Separado</PCOD_ESTCIVIL>';
                            }else if(a.Estado_civil__pc == 'Ninguno'){
                                testData = testData + '         <PCOD_ESTCIVIL>Sin informacion</PCOD_ESTCIVIL>';
                            }else{
                                testData = testData + '         <PCOD_ESTCIVIL>'+a.Estado_civil__pc+'</PCOD_ESTCIVIL>';
                            }
                        }else{
                            testData = testData + '         <PCOD_ESTCIVIL>Sin informacion</PCOD_ESTCIVIL>';
                        }
                    }
                    if(PCOD_SEPBIENES != null)
                        testData = testData + '         <PCOD_SEPBIENES>'+PCOD_SEPBIENES+'</PCOD_SEPBIENES>';
                    //testData = testData + '         <PNUM_CARGAS></PNUM_CARGAS>';
                    //testData = testData + '         <PFEC_ANTIG_VIV></PFEC_ANTIG_VIV>';
                    //testData = testData + '         <PFEC_DEFUNCION></PFEC_DEFUNCION>';
                    //testData = testData + '         <PFEC_CERT_ECIVI></PFEC_CERT_ECIVI>';
                    */
                    if(a.Calle_Particular__c != null){
                        testData = testData + '         <DIRECCION>';
                        testData = testData + '            <PCOD_CIUDAD>'+a.Ciudad_o_Provincia_particular__c+'</PCOD_CIUDAD>';
                        if(PCOD_COMUNAPART != '')
                            testData = testData + '            <PCOD_COMUNA>'+PCOD_COMUNAPART+'</PCOD_COMUNA>'; //+a.Comuna_particular__r.Name+
                        testData = testData + '            <PCOD_PAIS>'+a.Pais_particular__c+'</PCOD_PAIS>';
                        //testData = testData + '            <PCOD_POSTAL></PCOD_POSTAL>';
                        testData = testData + '            <PCOD_REGION>'+a.Region_particular__c+'</PCOD_REGION>';
                        testData = testData + '            <PCOD_TIPODIR>2</PCOD_TIPODIR>';
                        if(a.Numero_particular__c != null && a.Apartment__c !=null){
                            testData = testData + '            <PGLS_DIRECCION>'+a.Calle_particular__c +' '+ a.Numero_particular__c+', '+ a.Apartment__c.toUpperCase()+'</PGLS_DIRECCION>';
                        }else if(a.Numero_particular__c != null && a.Apartment__c ==null){
                            testData = testData + '            <PGLS_DIRECCION>'+a.Calle_particular__c +' '+ a.Numero_particular__c+', '+'</PGLS_DIRECCION>';
                        }
                        else if(a.Numero_particular__c == null && a.Apartment__c !=null){
                            testData = testData + '            <PGLS_DIRECCION>'+a.Calle_particular__c +' '+ a.Numero_particular__c+', '+'</PGLS_DIRECCION>';
                        }
                        else{
                            testData = testData + '            <PGLS_DIRECCION>'+a.Calle_particular__c+'</PGLS_DIRECCION>';
                        }
                        //testData = testData + '            <PGLS_OFI_POST></PGLS_OFI_POST>';
                        //testData = testData + '            <PNUM_CASILLA></PNUM_CASILLA>';
                        //testData = testData + '            <PNUM_SECUENCIA></PNUM_SECUENCIA>';
                        //testData = testData + '            <!--Zero or more repetitions:-->';
                        if(a.PersonMobilePhone != null){
                            testData = testData + '            <TELEFONO>';
                            //testData = testData + '               <CODIGO_FONO></CODIGO_FONO>';
                            testData = testData + '               <PCOD_TIPO_FONO>CELULAR</PCOD_TIPO_FONO>';
                            testData = testData + '               <PNUM_FONO>'+a.PersonMobilePhone.replace(' ','')+'</PNUM_FONO>';
                            testData = testData + '            </TELEFONO>';
                        }else{
                             testData = testData + '            <TELEFONO></TELEFONO>';
                        }
                        if(a.Particular_Phone_Other__pc != null){
                            testData = testData + '            <TELEFONO>';
                            //testData = testData + '               <CODIGO_FONO></CODIGO_FONO>';
                            testData = testData + '               <PCOD_TIPO_FONO>OTRO</PCOD_TIPO_FONO>';
                            testData = testData + '               <PNUM_FONO>'+a.Particular_Phone_Other__pc.replace(' ','')+'</PNUM_FONO>';
                            testData = testData + '            </TELEFONO>';
                        }else{
                             testData = testData + '            <TELEFONO></TELEFONO>';
                        }
                        
                        if(a.Particular_Landline__pc != null){
                            testData = testData + '            <TELEFONO>';
                            //testData = testData + '               <CODIGO_FONO></CODIGO_FONO>';
                            testData = testData + '               <PCOD_TIPO_FONO>FIJO</PCOD_TIPO_FONO>';
                            testData = testData + '               <PNUM_FONO>'+a.Particular_Landline__pc.replace(' ','')+'</PNUM_FONO>';
                            testData = testData + '            </TELEFONO>';
                        }else{
                             testData = testData + '            <TELEFONO></TELEFONO>';
                        }
                        /*if(a.Phone_contact__pc != null){
                            testData = testData + '            <TELEFONO>';
                            //testData = testData + '               <CODIGO_FONO></CODIGO_FONO>';
                            testData = testData + '               <PCOD_TIPO_FONO>FIJO</PCOD_TIPO_FONO>';
                            testData = testData + '               <PNUM_FONO>'+a.Phone_contact__pc.replace(' ','')+'</PNUM_FONO>';
                            testData = testData + '            </TELEFONO>';
                        }else{
                             testData = testData + '            <TELEFONO></TELEFONO>';
                        }*/
                        testData = testData + '         </DIRECCION>';
                    }
                    if(a.Calle_comercial__c != null){
                        testData = testData + '         <DIRECCION>';
                        testData = testData + '            <PCOD_CIUDAD>'+a.Ciudad_o_Provincia_comercial__c+'</PCOD_CIUDAD>';
                        if(PCOD_COMUNACOM != '')
                            testData = testData + '            <PCOD_COMUNA>'+PCOD_COMUNACOM+'</PCOD_COMUNA>'; //a.Comuna_comercial__r.Name
                        testData = testData + '            <PCOD_PAIS>'+a.Pais_comercial__c+'</PCOD_PAIS>';
                        //testData = testData + '            <PCOD_POSTAL></PCOD_POSTAL>';
                        testData = testData + '            <PCOD_REGION>'+a.Region_comercial__c+'</PCOD_REGION>';
                        testData = testData + '            <PCOD_TIPODIR>3</PCOD_TIPODIR>';
                        if(a.Numero_comercial__c != null && a.Office_Number__c != null){
                            testData = testData + '            <PGLS_DIRECCION>'+a.Calle_comercial__c +' '+ a.Numero_comercial__c+', '+a.Office_Number__c.toUpperCase()+'</PGLS_DIRECCION>';
                        }else if(a.Numero_comercial__c == null && a.Office_Number__c != null){
                            testData = testData + '            <PGLS_DIRECCION>'+a.Calle_comercial__c +' '+ a.Office_Number__c.toUpperCase()+'</PGLS_DIRECCION>';
                        }else if(a.Numero_comercial__c != null && a.Office_Number__c == null){
                            testData = testData + '            <PGLS_DIRECCION>'+a.Calle_comercial__c +' '+ a.Numero_comercial__c+', '+'</PGLS_DIRECCION>';
                        }
                        else{
                            testData = testData + '            <PGLS_DIRECCION>'+a.Calle_comercial__c+'</PGLS_DIRECCION>';
                        }
                        //testData = testData + '            <PGLS_OFI_POST></PGLS_OFI_POST>';
                        //testData = testData + '            <PNUM_CASILLA></PNUM_CASILLA>';
                        //testData = testData + '            <PNUM_SECUENCIA></PNUM_SECUENCIA>';
                        //testData = testData + '            <!--Zero or more repetitions:-->';
                        /*if(a.PersonMobilePhone != null){
                            testData = testData + '            <TELEFONO>';
                            //testData = testData + '               <CODIGO_FONO></CODIGO_FONO>';
                            testData = testData + '               <PCOD_TIPO_FONO>FIJO</PCOD_TIPO_FONO>';
                            testData = testData + '               <PNUM_FONO>'+a.PersonMobilePhone.replace(' ','')+'</PNUM_FONO>';
                            testData = testData + '            </TELEFONO>';
                        }else{
                             testData = testData + '            <TELEFONO></TELEFONO>';
                        }*/
                        if(a.Commercial_Phone_Other__c != null){
                            testData = testData + '            <TELEFONO>';
                            //testData = testData + '               <CODIGO_FONO></CODIGO_FONO>';
                            testData = testData + '               <PCOD_TIPO_FONO>OTRO</PCOD_TIPO_FONO>';
                            testData = testData + '               <PNUM_FONO>'+a.Commercial_Phone_Other__c.replace(' ','')+'</PNUM_FONO>';
                            testData = testData + '            </TELEFONO>';
                        }else{
                             testData = testData + '            <TELEFONO></TELEFONO>';
                        }
                        if(a.Phone != null){
                            testData = testData + '            <TELEFONO>';
                            //testData = testData + '               <CODIGO_FONO></CODIGO_FONO>';
                            testData = testData + '               <PCOD_TIPO_FONO>FIJO</PCOD_TIPO_FONO>';
                            testData = testData + '               <PNUM_FONO>'+a.Phone.replace(' ','')+'</PNUM_FONO>';
                            testData = testData + '            </TELEFONO>';
                        }else{
                             testData = testData + '            <TELEFONO></TELEFONO>';
                        }
                        if(a.Commercial_FAX_Other__c != null){
                            testData = testData + '            <TELEFONO>';
                            //testData = testData + '               <CODIGO_FONO></CODIGO_FONO>';
                            testData = testData + '               <PCOD_TIPO_FONO>CELULAR</PCOD_TIPO_FONO>';
                            testData = testData + '               <PNUM_FONO>'+a.Commercial_Cellphone__c.replace(' ','')+'</PNUM_FONO>';
                            testData = testData + '            </TELEFONO>';
                        }else{
                             testData = testData + '            <TELEFONO></TELEFONO>';
                        }
                        testData = testData + '         </DIRECCION>';
                    }
                    if(a.PersonEmail != null){
                        testData = testData + '         <EMAIL>';
                        testData = testData + '            <PGLS_DIRMAIL>'+a.PersonEmail+'</PGLS_DIRMAIL>';
                        //testData = testData + '            <PNUM_SECUENCIA></PNUM_SECUENCIA>';
                        testData = testData + '         </EMAIL>';
                    }
                    if(a.Commercial_Email__pc != null){
                        testData = testData + '         <EMAIL>';
                        testData = testData + '            <PGLS_DIRMAIL>'+a.Commercial_Email__pc+'</PGLS_DIRMAIL>';
                        //testData = testData + '            <PNUM_SECUENCIA></PNUM_SECUENCIA>';
                        testData = testData + '         </EMAIL>';
                    }
                    /*List<Contact> cons = [SELECT Cargo__c, Tipo_de_Contacto__c, Email, Apellido_materno__c, FirstName, LastName, Phone, Fax, MobilePhone, AccountId
                                          FROM Contact
                                          WHERE AccountId=:a.Id];
                    for(Contact c : cons){
                        testData = testData + '         <CONTACTO>';
                        if(c.Cargo__c != null){
                            testData = testData + '            <PCOD_CARGO>'+c.Cargo__c+'</PCOD_CARGO>';
                        }
                        if(c.Tipo_de_Contacto__c !=null)
                            testData = testData + '            <PCOD_TIPO_CONTACTO>'+c.Tipo_de_Contacto__c+'</PCOD_TIPO_CONTACTO>';
                        if(c.Email != null){
                            testData = testData + '            <PGLS_EMAIL>'+c.Email+'</PGLS_EMAIL>';
                        }
                        testData = testData + '            <PNOM_MATERNO>'+c.Apellido_materno__c+'</PNOM_MATERNO>';
                        testData = testData + '            <PNOM_NOMBRES>'+c.FirstName+'</PNOM_NOMBRES>';
                        testData = testData + '            <PNOM_PATERNO>'+c.LastName+'</PNOM_PATERNO>';
                        if(c.MobilePhone != null){
                            testData = testData + '            <PNUM_CELULAR>'+c.MobilePhone+'</PNUM_CELULAR>';
                        }
                        if(c.FAX != null){
                            testData = testData + '            <PNUM_FAX>'+c.Fax+'</PNUM_FAX>';
                        }
                        if(c.Phone != null){
                            testData = testData + '            <PNUM_FONO>'+c.Phone+'</PNUM_FONO>';
                        }
                        testData = testData + '         </CONTACTO>';
                    }*/
                    //Nuevos campos 04072017//
                    if(PCOD_TIPOCLI != null)
                        testData = testData + '<PCOD_TIPOCLI>'+PCOD_TIPOCLI+'</PCOD_TIPOCLI>';
                    if(PCOD_SUBTIPOCLI != null)
                        testData = testData + '<PCOD_SUBTIPOCLI>'+PCOD_SUBTIPOCLI+'</PCOD_SUBTIPOCLI>';
                    /*if(PCOD_CLAS_SEG != null)
                        testData = testData + '<PCOD_CLAS_SEG>'+PCOD_CLAS_SEG+'</PCOD_CLAS_SEG>';
                    if(PCOD_TIP_CLI_CL != null)
                        testData = testData + '<PCOD_TIP_CLI_CL>'+PCOD_TIP_CLI_CL+'</PCOD_TIP_CLI_CL>';
                    if(PCOD_TIPO_FATCA != null)
                        testData = testData + '<PCOD_TIPO_FATCA>'+PCOD_TIPO_FATCA+'</PCOD_TIPO_FATCA>';
                    if(PCOD_INTIN != null)
                        testData = testData + '<PCOD_INTIN>'+PCOD_INTIN+'</PCOD_INTIN>';
                    if(PCOD_IDGIN != null)
                        testData = testData + '<PCOD_IDGIN>'+PCOD_IDGIN+'</PCOD_IDGIN>';
                    if(PCOD_CLARIE != null)
                        testData = testData + '<PCOD_CLARIE>'+PCOD_CLARIE+'</PCOD_CLARIE>'; */                   
                                                
                    //////////////////////////
                    testData = testData + '      </cif:crearCliente>';
                    testData = testData + '   </soapenv:Body>';
                    testData = testData + '</soapenv:Envelope>'; System.debug('Tipo de cliente (N):'+PCOD_TIPO_JURIDI);
                    BICE_Account_Int10.callInt10(a.Id, testData);
                }
            }
            else if(PCOD_TIPO_JURIDI == '2'){ //PERSONA JURIDICA
                u = [SELECT ROL_Number__c FROM User WHERE Id =:a.LastModifiedById];
                   if(u.size()>0)
                       COD_OPERADOR = u[0].ROL_Number__c;                  
                   else
                       COD_OPERADOR = '0'; 
                       
                List<Account> acc = [SELECT Giro_Inv__r.Name FROM Account WHERE Id =: a.Id];
                   if(acc.size()>0)
                       PCOD_GIROSII = acc[0].Giro_Inv__r.Name;                  
           
                //Nuevos campos 04072017               
                PCOD_TIPOCLI ='Minorista';
                PCOD_SUBTIPOCLI = 'Otros minoristas';
                PCOD_TIP_CLI_CL = A.Clasificacion_submargenes__c;
                PCOD_CLAS_SEG = A.Segmentation__c;
                PCOD_TIPO_FATCA = A.FATCA_Information__c;
                PCOD_INTIN = A.Numero_de_TIN__c;
                PCOD_IDGIN = A.Numero_de_GIN__c;
                PCOD_CATDEU = 'Productiva';
                PCOD_RELA_BICE = 'NO RELACIONADO';
                PCOD_GRUP_RELA = 'Sin Grupo';
                PCOD_ESTA_DEUD = 'DEM';
                PCOD_CLARIE = A.Clasificacion_de_Riesgo_SBIF__c;               
                PFEC_CLIENTE  = FormatoFecha(A.Fecha_Solicitud_Crear_Cliente__c,PFEC_CLIENTE);
                PFEC_CONSTITUCION = FormatoFecha(A.Fecha_Constitucion_Empresa__c ,PFEC_CONSTITUCION);
                PNUM_CARPETA = '0';
                PNUM_CASI_INTE = '0';
                PGLS_RAZON_SOCI = a.Raz_n_Social__c!=null?(a.Raz_n_Social__c.toUpperCase()).replace('&','&amp;'):'';
                PNOM_FANTASIA = a.Name!=null?(a.Name.toUpperCase()).replace('&','&amp;'):''; //Company
                PGLS_RAZON_SOCIAL_LEGAL = a.Raz_n_Social__c!=null?(a.Raz_n_Social__c.toUpperCase().replace('&','&amp;')):'';
                PCOD_GRUPO_ECON = 'Sin Clasificar';
                PCOD_TIPO_CLIENTE = a.BICE_Classification_del__c;
                PCOD_CLIENTE = A.Customer_type_other_rating_c__c;
                PCOD_ACTIVIDAD = a.Actividad_Economica_SBIF__c;
                PFEC_DECL_JURADA = FormatoFecha(a.Fecha_de_declaracion_de_margen__c,PFEC_DECL_JURADA);
                if(a.Taxes__c == true)
                    PCOD_PAGA_IVA = '1';
                else
                    PCOD_PAGA_IVA = '0';    
                /////////////////////////
                if(
                (a.Ciudad_o_Provincia_particular__c != old.Ciudad_o_Provincia_particular__c) || 
                (a.Comuna_Particular__c != old.Comuna_Particular__c) || 
                (a.Pais_Particular__c != old.Pais_Particular__c) || 
                (a.Region_Particular__c != old.Region_Particular__c) || 
                (a.Calle_Particular__c != old.Calle_Particular__c) || 
                (a.Numero_Particular__c != old.Numero_Particular__c) || 
                (a.Ciudad_o_Provincia_comercial__c != old.Ciudad_o_Provincia_comercial__c) || 
                (a.Comuna_comercial__c != old.Comuna_comercial__c) || 
                (a.Pais_comercial__c != old.Pais_comercial__c) || 
                (a.Region_comercial__c != old.Region_comercial__c) || 
                (a.Calle_comercial__c != old.Calle_comercial__c) || 
                (a.Numero_comercial__c != old.Numero_comercial__c) || 
                (a.Phone != old.Phone) ||
                (a.PersonHomePhone != old.PersonHomePhone) ||
                (a.Phone_contact__pc != old.Phone_contact__pc) ||
                (a.Commercial_Phone_Other__c != old.Commercial_Phone_Other__c) ||
                (a.Commercial_Landline__c != old.Commercial_Landline__c) || 
                (a.Commercial_FAX_Other__c != old.Commercial_FAX_Other__c) ||
                (a.Ejecutivo_de_Cuenta__c != old.Ejecutivo_de_Cuenta__c) ||
                (a.Fecha_de_declaracion_de_margen__c != old.Fecha_de_declaracion_de_margen__c))
                {
                        
                     testData = '';
                    testData = testData + '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cif="'+soapNS+'">';
                    testData = testData + '   <soapenv:Header/>';
                    testData = testData + '   <soapenv:Body>';
                    testData = testData + '      <cif:crearCliente>';
                    testData = testData + '         <COD_CANAL>501</COD_CANAL>';
                    testData = testData + '         <GLOSA_APLICACION>INGRESO POR CRM</GLOSA_APLICACION>';
                    testData = testData + '         <COD_SUCURSAL>'+a.Sucursal_Banco__c+'</COD_SUCURSAL>';
                    testData = testData + '         <COD_OPERADOR>'+COD_OPERADOR+'</COD_OPERADOR>';
                    testData = testData + '         <TIPO_IDEN_CLIENTE>1</TIPO_IDEN_CLIENTE>';
                    testData = testData + '         <IDEN_CLIENTE>'+(a.Rut__c.replace('-','')).replace('.','')+'</IDEN_CLIENTE>';                                                                             
                    //testData = testData + '         <FEC_CREACION></FEC_CREACION>';
                    if(PNUM_ROL_EMPLEADO!=null){
                        testData = testData + '         <PNUM_ROL_EMPLEADO>'+PNUM_ROL_EMPLEADO+'</PNUM_ROL_EMPLEADO>';
                    }else{
                        testData = testData + '         <PNUM_ROL_EMPLEADO>0</PNUM_ROL_EMPLEADO>';
                    }
                    testData = testData + '         <PCOD_TIPO_JURIDI>'+a.Tipo_de_Persona__c+'</PCOD_TIPO_JURIDI>';
                    testData = testData + '         <PCOD_CLIENTE>'+PCOD_CLIENTE+'</PCOD_CLIENTE>';
                    
                    testData = testData + '         <PCOD_TIPO_CLIENTE>'+PCOD_TIPO_CLIENTE+'</PCOD_TIPO_CLIENTE>';
                    if(a.Sub_Sector_Economico__c != null){
                      testData = testData + '         <PCOD_SECTOR_ECONOM>'+a.Sub_Sector_Economico__c+'</PCOD_SECTOR_ECONOM>';
                    }
                    else{
                      testData = testData + '         <PCOD_SECTOR_ECONOM>'+'Sin clasificar'+'</PCOD_SECTOR_ECONOM>';
                    }
                    testData = testData + '         <PFEC_CLIENTE>'+PFEC_CLIENTE+'</PFEC_CLIENTE>';
                    //testData = testData + '         <PNUM_COR_DOMLEGAL></PNUM_COR_DOMLEGAL>';
                    if(a.Actividad_Economica_SBIF__c!=null){
                        testData = testData + '         <PCOD_ACTIVIDAD>'+PCOD_ACTIVIDAD+'</PCOD_ACTIVIDAD>';
                    }
                    if(a.SBIF_Sector__c != null){
                        testData = testData + '         <PCOD_SECTOR>'+a.SBIF_Sector__c+'</PCOD_SECTOR>';
                    }
                    //testData = testData + '         <PCOD_GIROSII>'+PCOD_GIROSII+'</PCOD_GIROSII>';
                    //testData = testData + '         <PCOD_CATDEU>'+PCOD_CATDEU+'</PCOD_CATDEU>';
                    //testData = testData + '         <PCOD_RELA_BICE>'+PCOD_RELA_BICE+'</PCOD_RELA_BICE>';
                    //testData = testData + '         <PCOD_GRUP_RELA>'+PCOD_GRUP_RELA+'</PCOD_GRUP_RELA>';
                    //testData = testData + '         <PCOD_ESTA_DEUD>'+PCOD_ESTA_DEUD+'</PCOD_ESTA_DEUD>';
                    //testData = testData + '         <PNUM_CARPETA>'+PNUM_CARPETA+'</PNUM_CARPETA>';
                    //testData = testData + '         <PNUM_CASI_INTE>'+PNUM_CASI_INTE+'</PNUM_CASI_INTE>';
                    //testData = testData + '         <PGLS_SINO_SBIF></PGLS_SINO_SBIF>';
                    testData = testData + '         <PFEC_DECL_JURADA>'+PFEC_DECL_JURADA+'</PFEC_DECL_JURADA>';
                    /*//testData = testData + '         <PFEC_VERIF_DOMLEGAL></PFEC_VERIF_DOMLEGAL>';
                    //testData = testData + '         <PFLG_FIRMA_COBPREJUD></PFLG_FIRMA_COBPREJUD>';
                    //testData = testData + '         <PFEC_FIRMA_COBPREJUD></PFEC_FIRMA_COBPREJUD>';
                    //testData = testData + '         <PNUM_TAX_ID></PNUM_TAX_ID>';
                    //testData = testData + '         <PCOD_SII_EXEIMP></PCOD_SII_EXEIMP>';
                    //testData = testData + '         <PFLG_SII_CONTPRIMERACAT></PFLG_SII_CONTPRIMERACAT>';
                    //testData = testData + '         <PCOD_TIPO_ALERTA></PCOD_TIPO_ALERTA>';
                    //testData = testData + '         <PFEC_ALERTA></PFEC_ALERTA>';
                    //testData = testData + '         <PFLAG_MANDATO_INVERSION></PFLAG_MANDATO_INVERSION>';
                    //testData = testData + '         <PCOD_GIROSII></PCOD_GIROSII>';
                    //testData = testData + '         <PCOD_FRAUDE></PCOD_FRAUDE>';
                    testData = testData + '         <PFLG_EMPLEADO>'+PFLG_EMPLEADO+'</PFLG_EMPLEADO>';
                    if(PCOD_TIPO_JURIDI == '1'){
                        if(a.LastName != null){
                            testData = testData + '         <PNOM_PATERNO>'+a.LastName+'</PNOM_PATERNO>';
                        }
                        if(a.Apellido_materno__pc != null){
                            testData = testData + '         <PNOM_MATERNO>'+a.Apellido_materno__pc+'</PNOM_MATERNO>';
                        }
                        if(a.FirstName != null){
                            testData = testData + '         <PNOM_NOMBRES>'+a.FirstName+'</PNOM_NOMBRES>';
                        }
                        //testData = testData + '         <PNOM_NICKNAME></PNOM_NICKNAME>';
                        if(a.Nationality__c == null){
                            testData = testData + '<PCOD_NACION>No definido</PCOD_NACION>';
                        }else
                            testData = testData + '<PCOD_NACION>'+PCOD_NACION+'</PCOD_NACION>';
                        //testData = testData + '         <PCOD_RESIDENCIA></PCOD_RESIDENCIA>';
                        */
                       // testData = testData + '         <PCOD_PROFESION>'+PCOD_PROFESION+'</PCOD_PROFESION>';                            
                        /*
                        String fec;
                        if(a.PersonBirthdate != null){
                            Integer val = a.PersonBirthdate.day();
                            if(val < 10){ fec = '0'+String.valueOf(val)+'/'; }else{ fec = String.valueOf(val)+'/'; }
                            val = a.PersonBirthdate.month();
                            if(val < 10){ fec = fec + '0'+String.valueOf(val)+'/'; }else{ fec = fec + String.valueOf(val)+'/'; }
                            fec = fec + String.valueOf(a.PersonBirthdate.year());
                            //testData = testData + '         <PFEC_NACIM>'+fec+'</PFEC_NACIM>';
                        }
                        */
                        /*if(a.Sex__pc == null){
                            testData = testData + '         <PCOD_SEXO>NO INFORMADO</PCOD_SEXO>';
                        }else if(a.Sex__pc == 'Male'){
                            testData = testData + '         <PCOD_SEXO>Masculino</PCOD_SEXO>';
                        }else if(a.Sex__pc == 'Female'){
                            testData = testData + '         <PCOD_SEXO>Femenino</PCOD_SEXO>';
                        }
                        if(a.Educational_Level__pc != null){
                            testData = testData + '         <PCOD_NIV_EDUCAC>'+a.Educational_Level__pc+'</PCOD_NIV_EDUCAC>';
                        }
                        if(a.Estado_civil__pc != null){
                            if(a.Estado_civil__pc == 'Divorciado'){
                                testData = testData + '         <PCOD_ESTCIVIL>Divorciado/Separado</PCOD_ESTCIVIL>';
                            }else if(a.Estado_civil__pc == 'Ninguno'){
                                testData = testData + '         <PCOD_ESTCIVIL>Sin informacion</PCOD_ESTCIVIL>';
                            }else{
                                testData = testData + '         <PCOD_ESTCIVIL>'+a.Estado_civil__pc+'</PCOD_ESTCIVIL>';
                            }
                        }else{
                            testData = testData + '         <PCOD_ESTCIVIL>Sin informacion</PCOD_ESTCIVIL>';
                        }
                    }
                    if(PCOD_SEPBIENES != null)
                        testData = testData + '         <PCOD_SEPBIENES>'+PCOD_SEPBIENES+'</PCOD_SEPBIENES>';
                    //testData = testData + '         <PNUM_CARGAS></PNUM_CARGAS>';
                    //testData = testData + '         <PFEC_ANTIG_VIV></PFEC_ANTIG_VIV>';
                    //testData = testData + '         <PFEC_DEFUNCION></PFEC_DEFUNCION>';
                    //testData = testData + '         <PFEC_CERT_ECIVI></PFEC_CERT_ECIVI>';
                    */
                    /*if(a.Calle_Particular__c != null){
                        testData = testData + '         <DIRECCION>';
                        testData = testData + '            <PCOD_CIUDAD>'+a.Ciudad_o_Provincia_particular__c+'</PCOD_CIUDAD>';
                        //if(a.Comuna_particular__r.Name != null)
                        testData = testData + '            <PCOD_COMUNA>'+a.Comuna_particular__r.Name+'</PCOD_COMUNA>'; //+a.Comuna_particular__r.Name+
                        testData = testData + '            <PCOD_PAIS>'+a.Pais_particular__c+'</PCOD_PAIS>';
                        //testData = testData + '            <PCOD_POSTAL></PCOD_POSTAL>';
                        testData = testData + '            <PCOD_REGION>'+a.Region_particular__c+'</PCOD_REGION>';
                        testData = testData + '            <PCOD_TIPODIR>2</PCOD_TIPODIR>';
                        if(a.Numero_particular__c != null){
                            testData = testData + '            <PGLS_DIRECCION>'+a.Calle_particular__c +' '+ a.Numero_particular__c+'</PGLS_DIRECCION>';
                        }else{
                            testData = testData + '            <PGLS_DIRECCION>'+a.Calle_particular__c+'</PGLS_DIRECCION>';
                        }
                        //testData = testData + '            <PGLS_OFI_POST></PGLS_OFI_POST>';
                        //testData = testData + '            <PNUM_CASILLA></PNUM_CASILLA>';
                        //testData = testData + '            <PNUM_SECUENCIA></PNUM_SECUENCIA>';
                        //testData = testData + '            <!--Zero or more repetitions:-->';
                        
                        if(a.Phone != null){
                            testData = testData + '            <TELEFONO>';
                            //testData = testData + '               <CODIGO_FONO></CODIGO_FONO>';
                            testData = testData + '               <PCOD_TIPO_FONO>FIJO</PCOD_TIPO_FONO>';
                            testData = testData + '               <PNUM_FONO>'+a.Phone.replace(' ','')+'</PNUM_FONO>';
                            testData = testData + '            </TELEFONO>';
                        }else{
                             testData = testData + '            <TELEFONO></TELEFONO>';
                        }
                        
                        if(a.PersonHomePhone != null){
                            testData = testData + '            <TELEFONO>';
                            //testData = testData + '               <CODIGO_FONO></CODIGO_FONO>';
                            testData = testData + '               <PCOD_TIPO_FONO>CELULAR</PCOD_TIPO_FONO>';
                            testData = testData + '               <PNUM_FONO>'+a.PersonHomePhone.replace(' ','')+'</PNUM_FONO>';
                            testData = testData + '            </TELEFONO>';
                        }else{
                             testData = testData + '            <TELEFONO></TELEFONO>';
                        }
                        if(a.Phone_contact__pc != null){
                            testData = testData + '            <TELEFONO>';
                            //testData = testData + '               <CODIGO_FONO></CODIGO_FONO>';
                            testData = testData + '               <PCOD_TIPO_FONO>FIJO</PCOD_TIPO_FONO>';
                            testData = testData + '               <PNUM_FONO>'+a.Phone_contact__pc.replace(' ','')+'</PNUM_FONO>';
                            testData = testData + '            </TELEFONO>';
                        }else{
                             testData = testData + '            <TELEFONO></TELEFONO>';
                        }
                        testData = testData + '         </DIRECCION>';
                    }*/
                    if(a.Calle_comercial__c != null){
                        testData = testData + '         <DIRECCION>';
                        testData = testData + '            <PCOD_CIUDAD>'+a.Ciudad_o_Provincia_comercial__c+'</PCOD_CIUDAD>';
                        if(PCOD_COMUNACOM != '')
                            testData = testData + '            <PCOD_COMUNA>'+PCOD_COMUNACOM+'</PCOD_COMUNA>'; //a.Comuna_comercial__r.Name
                        testData = testData + '            <PCOD_PAIS>'+a.Pais_comercial__c+'</PCOD_PAIS>';
                        //testData = testData + '            <PCOD_POSTAL></PCOD_POSTAL>';
                        testData = testData + '            <PCOD_REGION>'+a.Region_comercial__c+'</PCOD_REGION>';
                        testData = testData + '            <PCOD_TIPODIR>3</PCOD_TIPODIR>';
                        if(a.Numero_comercial__c != null && a.Office_Number__c != null){
                            testData = testData + '            <PGLS_DIRECCION>'+a.Calle_comercial__c +' '+ a.Numero_comercial__c+', '+a.Office_Number__c.toUpperCase()+'</PGLS_DIRECCION>';
                        }else if(a.Numero_comercial__c == null && a.Office_Number__c != null){
                            testData = testData + '            <PGLS_DIRECCION>'+a.Calle_comercial__c +' '+ a.Office_Number__c.toUpperCase()+'</PGLS_DIRECCION>';
                        }else if(a.Numero_comercial__c != null && a.Office_Number__c == null){
                            testData = testData + '            <PGLS_DIRECCION>'+a.Calle_comercial__c +' '+ a.Numero_comercial__c+', '+'</PGLS_DIRECCION>';
                        }
                        else{
                            testData = testData + '            <PGLS_DIRECCION>'+a.Calle_comercial__c+'</PGLS_DIRECCION>';
                        }
                        //testData = testData + '            <PGLS_OFI_POST></PGLS_OFI_POST>';
                        //testData = testData + '            <PNUM_CASILLA></PNUM_CASILLA>';
                        //testData = testData + '            <PNUM_SECUENCIA></PNUM_SECUENCIA>';
                        //testData = testData + '            <!--Zero or more repetitions:-->';
                        if(a.Commercial_Cellphone__c != null){
                            testData = testData + '            <TELEFONO>';
                            //testData = testData + '               <CODIGO_FONO></CODIGO_FONO>';
                            testData = testData + '               <PCOD_TIPO_FONO>CELULAR</PCOD_TIPO_FONO>';
                            testData = testData + '               <PNUM_FONO>'+a.Commercial_Cellphone__c.replace(' ','')+'</PNUM_FONO>';
                            testData = testData + '            </TELEFONO>';
                        }else{
                             testData = testData + '            <TELEFONO></TELEFONO>';
                        }
                        if(a.Phone != null){
                            testData = testData + '            <TELEFONO>';
                            //testData = testData + '               <CODIGO_FONO></CODIGO_FONO>';
                            testData = testData + '               <PCOD_TIPO_FONO>FIJO</PCOD_TIPO_FONO>';
                            testData = testData + '               <PNUM_FONO>'+a.Phone.replace(' ','')+'</PNUM_FONO>';
                            testData = testData + '            </TELEFONO>';
                        }else{
                             testData = testData + '            <TELEFONO></TELEFONO>';
                        }
                        if(a.Commercial_Phone_Other__c != null){
                            testData = testData + '            <TELEFONO>';
                            //testData = testData + '               <CODIGO_FONO></CODIGO_FONO>';
                            testData = testData + '               <PCOD_TIPO_FONO>OTRO</PCOD_TIPO_FONO>';
                            testData = testData + '               <PNUM_FONO>'+a.Commercial_Phone_Other__c.replace(' ','')+'</PNUM_FONO>';
                            testData = testData + '            </TELEFONO>';
                        }else{
                             testData = testData + '            <TELEFONO></TELEFONO>';
                        }
                        
                        testData = testData + '         </DIRECCION>';
                    }
                    /*if(a.PersonEmail != null){
                        testData = testData + '         <EMAIL>';
                        testData = testData + '            <PGLS_DIRMAIL>'+a.PersonEmail+'</PGLS_DIRMAIL>';
                        //testData = testData + '            <PNUM_SECUENCIA></PNUM_SECUENCIA>';
                        testData = testData + '         </EMAIL>';
                    }*/
                    /*if(a.Commercial_Email__pc != null){
                        testData = testData + '         <EMAIL>';
                        testData = testData + '            <PGLS_DIRMAIL>'+a.Commercial_Email__pc+'</PGLS_DIRMAIL>';
                        //testData = testData + '            <PNUM_SECUENCIA></PNUM_SECUENCIA>';
                        testData = testData + '         </EMAIL>';
                    }*/
                    List<Contact> cons = [SELECT Cargo__c, Tipo_de_Contacto__c, Email, Apellido_materno__c, FirstName, LastName, Phone, Fax, MobilePhone, AccountId
                                          FROM Contact
                                          WHERE AccountId=:a.Id]; 
                    for(Contact c : cons){
                        testData = testData + '         <CONTACTO>';
                        if(c.Cargo__c != null){
                            testData = testData + '            <PCOD_CARGO>'+c.Cargo__c+'</PCOD_CARGO>';
                        }
                        if(c.Tipo_de_Contacto__c !=null)
                            testData = testData + '            <PCOD_TIPO_CONTACTO>'+c.Tipo_de_Contacto__c+'</PCOD_TIPO_CONTACTO>';
                        if(c.Email != null){
                            testData = testData + '            <PGLS_EMAIL>'+c.Email+'</PGLS_EMAIL>';
                        }
                        testData = testData + '            <PNOM_MATERNO>'+c.Apellido_materno__c+'</PNOM_MATERNO>';
                        testData = testData + '            <PNOM_NOMBRES>'+c.FirstName+'</PNOM_NOMBRES>';
                        testData = testData + '            <PNOM_PATERNO>'+c.LastName+'</PNOM_PATERNO>';
                        if(c.MobilePhone != null){
                            testData = testData + '            <PNUM_CELULAR>'+c.MobilePhone+'</PNUM_CELULAR>';
                        }
                        if(c.FAX != null){
                            testData = testData + '            <PNUM_FAX>'+c.Fax+'</PNUM_FAX>';
                        }
                        if(c.Phone != null){
                            testData = testData + '            <PNUM_FONO>'+c.Phone+'</PNUM_FONO>';
                        }
                        testData = testData + '         </CONTACTO>';
                    }
                    //Nuevos campos 04072017//
                    /*if(PCOD_TIPOCLI != null)
                        testData = testData + '<PCOD_TIPOCLI>'+PCOD_TIPOCLI+'</PCOD_TIPOCLI>';
                    if(PCOD_SUBTIPOCLI != null)
                        testData = testData + '<PCOD_SUBTIPOCLI>'+PCOD_SUBTIPOCLI+'</PCOD_SUBTIPOCLI>';
                    if(PCOD_CLAS_SEG != null)
                        testData = testData + '<PCOD_CLAS_SEG>'+PCOD_CLAS_SEG+'</PCOD_CLAS_SEG>';
                    if(PCOD_TIP_CLI_CL != null)
                        testData = testData + '<PCOD_TIP_CLI_CL>'+PCOD_TIP_CLI_CL+'</PCOD_TIP_CLI_CL>';
                    if(PCOD_TIPO_FATCA != null)
                        testData = testData + '<PCOD_TIPO_FATCA>'+PCOD_TIPO_FATCA+'</PCOD_TIPO_FATCA>';
                    if(PCOD_INTIN != null)
                        testData = testData + '<PCOD_INTIN>'+PCOD_INTIN+'</PCOD_INTIN>';
                    if(PCOD_IDGIN != null)
                        testData = testData + '<PCOD_IDGIN>'+PCOD_IDGIN+'</PCOD_IDGIN>';
                    if(PCOD_CLARIE != null)
                        testData = testData + '<PCOD_CLARIE>'+PCOD_CLARIE+'</PCOD_CLARIE>';                     
                    //////////////////////////*/
                    testData = testData + '<PCOD_PAGA_IVA>'+PCOD_PAGA_IVA+'</PCOD_PAGA_IVA>'; 
                    testData = testData + '      </cif:crearCliente>';
                    testData = testData + '   </soapenv:Body>';
                    testData = testData + '</soapenv:Envelope>';System.debug('Tipo de cliente:'+PCOD_TIPO_JURIDI);
                    
                    //if(System.isScheduled() == true)
                        BICE_Account_Int10.callInt10(a.Id, testData); 
                    
                }
            }
            else{
                System.debug('Otro tipo de cliente');
            }
            
           // } //cierra catch
        }//Cierra FOR que recorre registro de cuenta
        
           
    }
  
/* END Integration INT-10 */

    if(Trigger.isAfter && Trigger.isInsert){
/** START Household Creation **/
    /*    List<BICE_HouseHold__c> houseHoldList = new List<BICE_HouseHold__c>();
        List<Id> IdCuentas = new List<Id>();
        List<Account> accUpdate = new List<Account>();
        Set<Id> nombHH = new Set<Id>();
        for (Account acc : Trigger.new) {
            if(acc.IsPersonAccount == true){ 
                 System.debug('Cuenta: '+acc);
                  BICE_HouseHold__c t = new BICE_HouseHold__c();
                  t.Name   = (acc.FirstName+acc.LastName+acc.RUT__c).toLowerCase();
                 // t.Id_Cuenta_Persona__c = acc.Id;  
                  houseHoldList.add(t);
            }
        }
        system.debug('Tamaño House: '+houseHoldList.size());
        if(houseHoldList.size()>0)
            insert houseHoldList;*/
/** END Household Creation **/
    }else if(Trigger.isBefore && Trigger.isUpdate){
/** START Update Mac Status **/
        Set<ID> aID = new Set<ID>();
        List<Lead> l = new List<Lead>();
        List<Lead> lUp = new List<Lead>();
        //Obtain Account Ids
        for(Account a : Trigger.New){
            if(Trigger.oldMap.get(a.Id).Current_MAC_Status__c != a.Current_MAC_Status__c){
              aID.add(a.Id);
            }
        }
        //Get converted Leads
        l = [SELECT Id, ConvertedAccountId, Current_MAC_Staus__c,Fecha_resultado_comit__c 
             FROM Lead 
             WHERE ConvertedAccountId IN :aID ];
        //Fill list to update
        for(Lead uL : l){
            for(Account a : Trigger.New){
                if(a.Id == uL.ConvertedAccountId){
                    uL.Current_MAC_Staus__c = a.Current_MAC_Status__c;
                    uL.Fecha_resultado_comit__c = a.Current_MAC_Presentation_Date__c;
                    lUp.add(uL);
                }
            }
        }
        //update Leads
        try{
          update lUp;
        }catch(Exception e){
            System.debug(e.getMessage());
        }
/** END Update Mac Status **/
    }

 }
}     
    public String FormatoFecha(Date fecha, String salida){
        
            if(fecha != null){
                        Integer val = fecha.day();
                        if(val < 10){ salida = '0'+String.valueOf(val)+'/'; }else{ salida = String.valueOf(val)+'/'; }
                        val = fecha.month();
                        if(val < 10){ salida = salida + '0'+String.valueOf(val)+'/'; }else{ salida = salida + String.valueOf(val)+'/'; }
                        salida = salida + String.valueOf(fecha.year());
                        return salida;
                    }else{
                        salida = '';
                    }
                    return salida;
            }
            
          
}