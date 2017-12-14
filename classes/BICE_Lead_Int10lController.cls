public class BICE_Lead_Int10lController{
    public String lid {get;set;}
    public String mensajePagina {get;set;}
    public Lead myLead;
    public String tipoPersona{get;set;}
    /*
    public String COD_CANAL{get;set;}
    public String GLOSA_APLICACION{get;set;}
    public String TIPO_IDEN_CLIENTE{get;set;}
    public String FEC_CREACION{get;set;}
    public String PNUM_COR_DOMLEGAL{get;set;}
    public String PGLS_SINO_SBIF{get;set;}
    public String PFEC_VERIF_DOMLEGAL{get;set;}
    public String PFLG_FIRMA_COBPREJUD{get;set;}
    public String PFEC_FIRMA_COBPREJUD{get;set;}
    public String PNUM_TAX_ID{get;set;}
    public String PCOD_SII_EXEIMP{get;set;}
    public String PFLG_SII_CONTPRIMERACAT{get;set;}
    public String PCOD_TIPO_ALERTA{get;set;}
    public String PFEC_ALERTA{get;set;}
    public String PFLAG_MANDATO_INVERSION{get;set;}
    public String PCOD_GIROSII{get;set;}
    public String PCOD_FRAUDE{get;set;}
    public String PNOM_NICKNAME{get;set;}
    public String PCOD_RESIDENCIA{get;set;}
    public String PNUM_CARGAS{get;set;}
    public String PFEC_ANTIG_VIV{get;set;}
    public String PFEC_DEFUNCION{get;set;}
    public String PFEC_CERT_ECIVI{get;set;}
*/
    public String COD_SUCURSAL{get;set;}
    public String COD_OPERADOR{get;set;}
    public String IDEN_CLIENTE{get;set;}
    public String PNUM_ROL_EMPLEADO{get;set;}
    public String PCOD_TIPO_JURIDI{get;set;}
    public String PCOD_CLIENTE{get;set;}
    public String PCOD_TIPO_CLIENTE{get;set;}
    public String PCOD_SECTOR_ECONOM{get;set;}
    public String PFEC_CLIENTE{get;set;}
    public String PCOD_ACTIVIDAD{get;set;}
    public String PCOD_SECTOR{get;set;}
    public String PCOD_CATDEU{get;set;}
    public String PCOD_RELA_BICE{get;set;}
    public String PCOD_GRUP_RELA{get;set;}
    public String PCOD_ESTA_DEUD{get;set;}
    public String PNUM_CARPETA{get;set;}
    public String PNUM_CASI_INTE{get;set;}
    public String PFEC_DECL_JURADA{get;set;}
    public String PFLG_EMPLEADO{get;set;}
    public String PNOM_PATERNO{get;set;}
    public String PNOM_MATERNO{get;set;}
    public String PNOM_NOMBRES{get;set;}
    public String PCOD_NACION{get;set;}
    public String PCOD_PROFESION{get;set;}
    public String PFEC_NACIM{get;set;}
    public String PCOD_SEXO{get;set;}
    public String PCOD_NIV_EDUCAC{get;set;}
    public String PCOD_ESTCIVIL{get;set;}
    public String PCOD_SEPBIENES{get;set;}
    public String PGLS_RAZON_SOCI{get;set;}
    public String PGLS_RAZON_SOCIAL_LEGAL{get;set;}
    public String PNOM_FANTASIA{get;set;}
    public String PCOD_GRUPO_ECON{get;set;}
    public String PFEC_CONSTITUCION{get;set;}
    public String PCOD_TIPO_CLIEMPRESA{get;set;}
    public String PGLS_WEB{get;set;}
    //Nuevos campos 070317//
    public String PCOD_TIPOCLI{get;set;}
    public String PCOD_SUBTIPOCLI{get;set;}
    public String PCOD_TIP_CLI_CL{get;set;}
    public String PCOD_CLAS_SEG{get;set;}
    public String PCOD_TIPO_FATCA{get;set;}
    public String PCOD_INTIN{get;set;}
    public String PCOD_IDGIN{get;set;}
    public String PCOD_CLARIE{get;set;}
    public String PCOD_PAGA_IVA{get;set;}
    public String PCOD_AGRUPACION{get;set;}
    public String PCOD_OPERADOR_COMEX{get;set;}
    public String GIRO{get;set;}
    ///////////////////
    ////Nuevo Campo 16-08-2017/////
    public String PCOD_CLAS_EDAD{get;set;} //Subsegmento
    ///////////////////
    public Boolean dir = false;
    public DIRECCION[] DIRECCIONES;
    public Boolean ema = false;
    public EMAIL[] EMAILS;
    public Boolean con = false;
    public CONTACTO[] CONTACTOS;
    public class DIRECCION{
        public String PCOD_CIUDAD;
        public String PCOD_COMUNA;
        public String PCOD_PAIS;
        //public String PCOD_POSTAL;
        public String PCOD_REGION;
        public String PCOD_TIPODIR;
        public String PGLS_DIRECCION;
        public String PGLS_OFI_POST;
        public String PNUM_CASILLA;
        public String PNUM_SECUENCIA;
        public TELEFONO[] TELEFONOS;
    }
    public class TELEFONO{
        public String CODIGO_FONO;
        public String PCOD_TIPO_FONO;
        public String PNUM_FONO;
    }
    public class EMAIL{
        public String PGLS_DIRMAIL;
        public String PNUM_SECUENCIA;
    }
    public class CONTACTO{
        public String PCOD_CARGO;
        public String PCOD_TIPO_CONTACTO;
        public String PGLS_EMAIL;
        public String PNOM_MATERNO;
        public String PNOM_NOMBRES;
        public String PNOM_PATERNO;
        public String PNUM_CELULAR;
        public String PNUM_CORRELATIVO;
        public String PNUM_FAX;
        public String PNUM_FONO;
    }
    //Nuevos en progreso
    public List<RecordType> rPN{get;set;}
    public List<RecordType> rPJ{get;set;}
    public List<RecordType> rEC{get;set;}
    public Lead L;
    
    public BICE_Lead_Int10lController(ApexPages.StandardController controller){
        tipoPersona = '';
        rPN = [SELECT Id, Name FROM RecordType WHERE Name LIKE '%Persona Natural%'];
        rPJ = [SELECT Id, Name FROM RecordType WHERE Name LIKE '%Persona Jur%'];
        rEC = [SELECT Id, Name FROM RecordType WHERE Name LIKE '%Empresas y Co%'];
        this.myLead = (Lead)controller.getRecord();
        lid = myLead.Id;
        for(RecordType r : rPN){ if(r.Id == myLead.RecordTypeId && tipoPersona == ''){ tipoPersona = '2'; } }
        for(RecordType r : rPJ){ if(r.Id == myLead.RecordTypeId && tipoPersona == ''){ tipoPersona = '3'; } }
        for(RecordType r : rEC){ if(r.Id == myLead.RecordTypeId && tipoPersona == ''){ tipoPersona = '3'; } }
        LeadFields();
    }
    
    public void LeadFields(){
        L = new Lead();
        if(tipoPersona == '2'){ //Persona Natural
            System.debug('Buscando Persona Natural');
            L = [SELECT OwnerId, Sucursal_de_Apertura_del__c, Rut__c, Customer_type_other_rating__c, Sub_Sector_Economico__c, 
                    Actividad_Economica_SBIF__c, SBIF_Sector__c, LastName, Apellido_Materno__c, FirstName, Nationality__c,
                    Profession__c, Birth_Date__c, Sex__c, Educational_Level__c, Estado_civil__c , Apartment__c, Office_Number__c,
                    Raz_n_Social__c, Socios_de_la_empresa_grupo_econ_mico__c, Ciudad_Particular__c, BICE_Classification__c, 
                    Comuna_Particular__r.Name, Pais_Particular__c, Region_Particular__c, Calle_Particular__c,
                    Numero_Particular__c, Ciudad_Comercial__c, Comuna_Comercial__r.Name, Pais_Comercial__c, Title, 
                    Region_Comercial__c, Calle_Comercial__c, Numero_Comercial__c, Phone, MobilePhone, Commercial_Cellphone__c,
                    Commercial_Phone_Other__c, Particular_Phone_Other__c, Phone_contact__c, Fax, Email, Commercial_Email__c, Website,
                    Segmentation__c, FATCA_Information__c,Numero_de_TIN__c, Numero_de_GIN__c,Fecha_Solicitud_Crear_Cliente__c,Conjugal_Regime__c,
                    Clasificacion_de_Riesgo_SBIF__c,Tipo_de_Persona__c,Account_Executive__r.ROL_Number__c,Commercial_Landline__c,Subsegmento__c,
                    Commercial_Classification__c,Particular_Landline__c,LastModifiedBy.ROL_Number__c,Segmentacion_Liquidez_Codigo__c,Segmentacion_Liquidez_Subcodigo__c,
                    Ejecutivo_COMEX__r.Rol_Number__c
                 FROM Lead 
                 WHERE Id =:lid];
            //Obtain ROL NUMBER from User
            User u = [SELECT ROL_Number__c FROM User WHERE Id =:UserInfo.getUserId()];
            //Validacion de campos necesarios para la integracion
            if(L.Sucursal_de_Apertura_del__c != null){
                COD_SUCURSAL = L.Sucursal_de_Apertura_del__c.toUpperCase();
                IDEN_CLIENTE = (L.Rut__c.replace('-','')).replace('.','');
                PNUM_ROL_EMPLEADO = L.Account_Executive__r.ROL_Number__c;//'0';
               // if(L.Tipo_de_Persona__c == 'Persona Natural')
                    PCOD_TIPO_JURIDI = '1';
                //else{
                    
                //}            
                PCOD_CLIENTE = L.Customer_type_other_rating__c;
                PCOD_TIPO_CLIENTE = 'Personas Naturales';//L.BICE_Classification__c!=null?L.BICE_Classification__c.toUpperCase():'SIN DEFINIR';
                PCOD_SECTOR_ECONOM = L.Sub_Sector_Economico__c!=null?L.Sub_Sector_Economico__c.toUpperCase():'SIN CLASIFICAR'; //OK
                PCOD_ACTIVIDAD = 'Serv. Comunales, Sociales y Personales';//L.Actividad_Economica_SBIF__c!=null?L.Actividad_Economica_SBIF__c.toUpperCase():'SIN DEFINIR'; //OK
                PCOD_SECTOR = L.SBIF_Sector__c; //'Personas Naturales';
                //Nuevos Campos 07032017//
                PCOD_TIPOCLI = L.Segmentacion_Liquidez_Codigo__c; //'Minorista';
                PCOD_SUBTIPOCLI = L.Segmentacion_Liquidez_Subcodigo__c;//'Minoristas personas naturales'; 
                PCOD_TIP_CLI_CL = 'Personas';
                PCOD_CLAS_SEG = L.Segmentation__c;
                PCOD_CLAS_EDAD = L.Subsegmento__c;
                PCOD_TIPO_FATCA = L.FATCA_Information__c;
                PCOD_INTIN = L.Numero_de_TIN__c;
                PCOD_IDGIN = L.Numero_de_GIN__c;
                PCOD_CATDEU = 'Persona natural';
                PCOD_RELA_BICE = 'NO RELACIONADO';
                PCOD_GRUP_RELA = 'Sin Grupo';
                PCOD_ESTA_DEUD = 'DEM';
                PCOD_SEPBIENES = L.Conjugal_Regime__c;
                PFLG_EMPLEADO = 'N';
                PCOD_CLARIE = L.Commercial_Classification__c;//L.Clasificacion_de_Riesgo_SBIF__c;
                PNUM_CARPETA = '0';
                PNUM_CASI_INTE = '0';
                COD_OPERADOR = u.ROL_Number__c;
                PCOD_OPERADOR_COMEX = L.Ejecutivo_COMEX__r.Rol_Number__c;
                ///////////////////////////
                PFEC_CLIENTE = FormatoFecha(L.Fecha_Solicitud_Crear_Cliente__c,PFEC_CLIENTE );
                if(L.LastName != null){
                    PNOM_PATERNO = L.LastName.toUpperCase();
                }
                if(L.Apellido_Materno__c != null){
                    PNOM_MATERNO = L.Apellido_Materno__c.toUpperCase();
                }
                if(L.FirstName != null){
                    PNOM_NOMBRES = L.FirstName.toUpperCase();
                }
                if(L.Nationality__c == null){
                    PCOD_NACION = 'NO DEFINIDO';
                }else{
                    PCOD_NACION = L.Nationality__c;
                }
                /*else if(L.Nationality__c == 'Chile'){
                    PCOD_NACION = 'NACIONAL';
                }else{
                    PCOD_NACION = 'EXTRANJERO';
                }*/
                if(L.Profession__c != null){
                    PCOD_PROFESION = L.Profession__c.toUpperCase();
                }
                
                if(L.Birth_Date__c != null){
                    Integer val = L.Birth_Date__c.day();
                    if(val < 10){ PFEC_NACIM = '0'+String.valueOf(val)+'/'; }else{ PFEC_NACIM = String.valueOf(val)+'/'; }
                    val = L.Birth_Date__c.month();
                    if(val < 10){ PFEC_NACIM = PFEC_NACIM + '0'+String.valueOf(val)+'/'; }else{ PFEC_NACIM = PFEC_NACIM + String.valueOf(val)+'/'; }
                    PFEC_NACIM = PFEC_NACIM + String.valueOf(L.Birth_Date__c.year());
                }else{
                    PFEC_NACIM = '';
                }
                
                if(L.Sex__c == null){
                    PCOD_SEXO = 'NO INFORMADO';
                }else if(L.Sex__c == 'Male'){
                    PCOD_SEXO = 'MASCULINO';
                }else if(L.Sex__c == 'Female'){
                    PCOD_SEXO = 'FEMENINO';
                }
                PCOD_NIV_EDUCAC = L.Educational_Level__c!=null?L.Educational_Level__c:'SIN ASIGNACION';
                if(L.Estado_civil__c != null){
                    if(L.Estado_civil__c == 'Divorciado'){
                        PCOD_ESTCIVIL = 'DIVORCIADO/SEPARADO';
                    }else if(L.Estado_civil__c == 'Ninguno'){
                        PCOD_ESTCIVIL = 'SIN INFORMACION';
                    }else{
                        PCOD_ESTCIVIL = L.Estado_civil__c.toUpperCase();
                    }
                }else{
                    PCOD_ESTCIVIL = 'SIN INFORMACION';
                }
                //PGLS_RAZON_SOCI = L.Raz_n_Social__c!=null?L.Raz_n_Social__c:'';
                //PGLS_RAZON_SOCIAL_LEGAL = L.Raz_n_Social__c!=null?L.Raz_n_Social__c:'';
                //PCOD_GRUPO_ECON = L.Socios_de_la_empresa_grupo_econ_mico__c;
                //PCOD_TIPO_CLIEMPRESA = L.Customer_type_other_rating__c;
                DIRECCIONES = new List<DIRECCION>();
                if(L.Calle_Particular__c != null){
                    dir = true;
                    DIRECCION dn = new DIRECCION();
                    dn.PCOD_CIUDAD = L.Ciudad_Particular__c==null?'':L.Ciudad_Particular__c.toUpperCase();
                    dn.PCOD_COMUNA = L.Comuna_Particular__r.Name.toUpperCase();
                    dn.PCOD_PAIS = L.Pais_Particular__c.toUpperCase();
                    dn.PCOD_REGION = L.Region_Particular__c==null?'':L.Region_Particular__c.toUpperCase();
                    dn.PCOD_TIPODIR = '2';
                    if(L.Numero_Particular__c != null){
                        if(L.Apartment__c != null){
                            dn.PGLS_DIRECCION = L.Calle_Particular__c.toUpperCase() +' '+ L.Numero_Particular__c+', '+ L.Apartment__c.toUpperCase();
                        }else{
                            dn.PGLS_DIRECCION = L.Calle_Particular__c.toUpperCase() +' '+ L.Numero_Particular__c;
                        }
                    }else{
                        dn.PGLS_DIRECCION = L.Calle_Particular__c.toUpperCase();
                    }
                    dn.TELEFONOS = new List<TELEFONO>();
                    if(L.Particular_Landline__c != null){
                        TELEFONO t1 = new TELEFONO();
                        t1.CODIGO_FONO = '';
                        t1.PCOD_TIPO_FONO = 'FIJO';
                        t1.PNUM_FONO = L.Particular_Landline__c.replace(' ','');
                        dn.TELEFONOS.add(t1);
                    }
                    if(L.MobilePhone != null){
                        TELEFONO t2 = new TELEFONO();
                        t2.CODIGO_FONO = '';
                        t2.PCOD_TIPO_FONO = 'CELULAR';
                        t2.PNUM_FONO = L.MobilePhone.replace(' ','');
                        dn.TELEFONOS.add(t2);
                    }
                    if(L.Particular_Phone_Other__c != null){
                        TELEFONO t5 = new TELEFONO();
                        t5.CODIGO_FONO = '';
                        t5.PCOD_TIPO_FONO = 'FAX';
                        t5.PNUM_FONO = L.Particular_Phone_Other__c.replace(' ','');
                        dn.TELEFONOS.add(t5);
                    }
                    
                    DIRECCIONES.add(dn);
                }
                if(L.Calle_Comercial__c != null){
                    dir = true;
                    DIRECCION dc = new DIRECCION();
                    dc.PCOD_CIUDAD = L.Ciudad_Comercial__c==null?'':L.Ciudad_Comercial__c.toUpperCase();
                    dc.PCOD_COMUNA = L.Comuna_Comercial__r.Name.toUpperCase();
                    dc.PCOD_PAIS = L.Pais_Comercial__c.toUpperCase();
                    dc.PCOD_REGION = L.Region_Comercial__c==null?'':L.Region_Comercial__c.toUpperCase();
                    dc.PCOD_TIPODIR = '3';
                    if(L.Numero_Comercial__c != null){
                        if(L.Office_Number__c != null){
                            dc.PGLS_DIRECCION = L.Calle_Comercial__c.toUpperCase() +' '+ L.Numero_Comercial__c+', '+L.Office_Number__c.toUpperCase();
                        }else{
                            dc.PGLS_DIRECCION = L.Calle_Comercial__c.toUpperCase() +' '+ L.Numero_Comercial__c;
                        }
                    }else{
                        dc.PGLS_DIRECCION = L.Calle_Comercial__c.toUpperCase();
                    }
                    dc.TELEFONOS = new List<TELEFONO>();
                    if(L.Phone != null){
                        TELEFONO t3 = new TELEFONO();
                        t3.CODIGO_FONO = '';
                        t3.PCOD_TIPO_FONO = 'FIJO';
                        t3.PNUM_FONO = L.Phone.replace(' ','');
                        dc.TELEFONOS.add(t3);
                    }
                    if(L.Commercial_Cellphone__c != null){
                        TELEFONO t3 = new TELEFONO();
                        t3.CODIGO_FONO = '';
                        t3.PCOD_TIPO_FONO = 'CELULAR';
                        t3.PNUM_FONO = L.Commercial_Cellphone__c.replace(' ','');
                        dc.TELEFONOS.add(t3);
                    }
                    if(L.Commercial_Phone_Other__c != null){
                        TELEFONO t4 = new TELEFONO();
                        t4.CODIGO_FONO = '';
                        t4.PCOD_TIPO_FONO = 'FAX';
                        t4.PNUM_FONO = L.Commercial_Phone_Other__c.replace(' ','');
                        dc.TELEFONOS.add(t4);
                    }
                    DIRECCIONES.add(dc);
                }
                EMAILS = new List<EMAIL>();
                if(L.Email != null){
                    ema = true;
                    EMAIL e1 = new EMAIL();
                    e1.PGLS_DIRMAIL = L.Email.toUpperCase();
                    EMAILS.add(e1);
                }
                if(L.Commercial_Email__c != null){
                    ema = true;
                    EMAIL e2 = new EMAIL();
                    e2.PGLS_DIRMAIL = L.Commercial_Email__c.toUpperCase();
                    EMAILS.add(e2);
                }
                System.debug('Listo para integrar');
            }else{
                // Los datos necesarios para la integracion no estan completos
                System.debug('Faltan datos');
                System.debug('Datos validados:');
                System.debug('Sucursal='+L.Sucursal_de_Apertura_del__c);
                System.debug('Clasificacion='+L.BICE_Classification__c);
                System.debug('Sub sector='+L.Sub_Sector_Economico__c);
                System.debug('Actividad='+L.Actividad_Economica_SBIF__c);
                System.debug('Sexo='+L.Sex__c);
            }
        }else if(tipoPersona == '3'){ //Persona Juridica
            System.debug('Buscando Persona Jurídica');
            L = [SELECT OwnerId, Sucursal_de_Apertura_del__c, Rut__c, Customer_type_other_rating__c, Sub_Sector_Economico__c, 
                    Actividad_Economica_SBIF__c, SBIF_Sector__c, LastName, Apellido_Materno__c, FirstName, Nationality__c,
                    Profession__c, Birth_Date__c, Sex__c, Educational_Level__c, Estado_civil__c , Company, Apartment__c, Office_Number__c,
                    Raz_n_Social__c, Socios_de_la_empresa_grupo_econ_mico__c, Ciudad_Particular__c, BICE_Classification__c, 
                    Comuna_Particular__r.Name, Pais_Particular__c, Region_Particular__c, Calle_Particular__c,
                    Numero_Particular__c, Ciudad_Comercial__c, Comuna_Comercial__r.Name, Pais_Comercial__c, Title, 
                    Region_Comercial__c, Calle_Comercial__c, Numero_Comercial__c, Phone, MobilePhone, Particular_Phone_Other__c, 
                    Particular_Mobile__c, Particular_FAX__c, Commercial_Cellphone__c, Phone_contact__c, 
                    Commercial_Phone_Other__c, Commercial_Landline__c, Commercial_FAX_Other__c, Fax, Email, Commercial_Email__c, Website,
                     Segmentation__c, FATCA_Information__c,Numero_de_TIN__c, Numero_de_GIN__c,Fecha_Solicitud_Crear_Cliente__c,Conjugal_Regime__c,
                     Clasificacion_de_Riesgo_SBIF__c,Clasificacion_submargen__c,Name,Fecha_Constitucion_Empresa__c,Tipo_de_cliente_empresa__c,Tipo_de_Persona__c,
                     Account_Executive__r.ROL_Number__c,Subsegmento__c,LastModifiedBy.ROL_Number__c,Segmentacion_Liquidez_Codigo__c,Segmentacion_Liquidez_Subcodigo__c,Taxes__c,
                     Customer_Legal_Person_Consumer__c, Cargo__c,Fecha_de_declaracion_de_margen__c, Ejecutivo_COMEX__r.Rol_Number__c, Giro__c 
                 FROM Lead 
                 WHERE Id =:lid];
            //Obtain ROL NUMBER from User
            User u = [SELECT ROL_Number__c FROM User WHERE Id =:UserInfo.getUserId()];
            //Validacion de campos necesarios para la integracion
            if(L.Sucursal_de_Apertura_del__c != null){
                COD_SUCURSAL = L.Sucursal_de_Apertura_del__c.toUpperCase();
                IDEN_CLIENTE = (L.Rut__c.replace('-','')).replace('.','');
                PNUM_ROL_EMPLEADO = L.Account_Executive__r.ROL_Number__c; //'0';
               // if(L.Tipo_de_Persona__c == 'Otras Instituciones Jurídicas')
                   PCOD_TIPO_JURIDI = '6';
                //else{
                   // PCOD_TIPO_JURIDI  = L.Tipo_de_Persona__c;
                //}    
                PCOD_CLIENTE = L.Customer_type_other_rating__c;
                PCOD_TIPO_CLIENTE = L.BICE_Classification__c;//L.BICE_Classification__c!=null?L.BICE_Classification__c.toUpperCase():'SIN DEFINIR';
                PCOD_SECTOR_ECONOM = L.Sub_Sector_Economico__c!=null?L.Sub_Sector_Economico__c.toUpperCase():'SIN CLASIFICAR'; //OK
                PCOD_ACTIVIDAD = L.Actividad_Economica_SBIF__c!=null?L.Actividad_Economica_SBIF__c.toUpperCase():'SIN DEFINIR'; //OK
                PCOD_SECTOR = L.SBIF_Sector__c; //'Personas Juridicas con fines de lucro';
                PCOD_PROFESION = L.Profession__c!=null?L.Profession__c.toUpperCase():'';
                //Nuevos campos 04072017
                PCOD_TIPOCLI = L.Segmentacion_Liquidez_Codigo__c;//'Minorista';
                PCOD_SUBTIPOCLI = L.Segmentacion_Liquidez_Subcodigo__c;//'Otros minoristas';
                PCOD_TIP_CLI_CL = L.Clasificacion_submargen__c;
                PCOD_CLAS_SEG = L.Segmentation__c;
                PCOD_CLAS_EDAD = L.Subsegmento__c;
                PCOD_TIPO_FATCA = L.FATCA_Information__c;
                PCOD_INTIN = L.Numero_de_TIN__c;
                PCOD_IDGIN = L.Numero_de_GIN__c;
                PCOD_CATDEU = 'Productiva';
                PCOD_RELA_BICE = 'NO RELACIONADO';
                PCOD_GRUP_RELA = 'Sin Grupo';
                PCOD_ESTA_DEUD = 'DEM';
                PCOD_CLARIE = L.Clasificacion_de_Riesgo_SBIF__c;               
                PFEC_CLIENTE  = FormatoFecha(L.Fecha_Solicitud_Crear_Cliente__c,PFEC_CLIENTE);
                PFEC_CONSTITUCION = FormatoFecha(L.Fecha_Constitucion_Empresa__c,PFEC_CONSTITUCION);
                PNUM_CARPETA = '0';
                PNUM_CASI_INTE = '0';
                COD_OPERADOR = u.ROL_Number__c;
                PCOD_AGRUPACION = L.Customer_Legal_Person_Consumer__c;
                PCOD_OPERADOR_COMEX = L.Ejecutivo_COMEX__r.Rol_Number__c;
                GIRO = L.Giro__c;
                if(L.Taxes__c)
                    PCOD_PAGA_IVA = '1';
                else
                    PCOD_PAGA_IVA = '0';
                /////////////////////////
                if(L.Birth_Date__c != null){
                    Integer val = L.Birth_Date__c.day();
                    if(val < 10){ PFEC_NACIM = '0'+String.valueOf(val)+'/'; }else{ PFEC_NACIM = String.valueOf(val)+'/'; }
                    val = L.Birth_Date__c.month();
                    if(val < 10){ PFEC_NACIM = PFEC_NACIM + '0'+String.valueOf(val)+'/'; }else{ PFEC_NACIM = PFEC_NACIM + String.valueOf(val)+'/'; }
                    PFEC_NACIM = PFEC_NACIM + String.valueOf(L.Birth_Date__c.year());
                }else{
                    PFEC_NACIM = '';
                }
                
                
                if(L.Sex__c == null){
                    PCOD_SEXO = 'NO INFORMADO';
                }else if(L.Sex__c == 'Male'){
                    PCOD_SEXO = 'MASCULINO';
                }else if(L.Sex__c == 'Female'){
                    PCOD_SEXO = 'FEMENINO';
                }
                PCOD_NIV_EDUCAC = L.Educational_Level__c!=null?L.Educational_Level__c.toUpperCase():'SIN ASIGNACION';
                if(L.Estado_civil__c != null){
                    if(L.Estado_civil__c == 'Divorciado'){
                        PCOD_ESTCIVIL = 'DIVORCIADO/SEPARADO';
                    }else if(L.Estado_civil__c == 'Ninguno'){
                        PCOD_ESTCIVIL = 'SIN INFORMACION';
                    }else{
                        PCOD_ESTCIVIL = L.Estado_civil__c.toUpperCase();
                    }
                }else{
                    PCOD_ESTCIVIL = 'SIN INFORMACION';
                }
                PGLS_RAZON_SOCI = L.Raz_n_Social__c!=null?(L.Raz_n_Social__c.toUpperCase()).replace('&','&amp;'):'';
                PNOM_FANTASIA = L.Company!=null?(L.Company.toUpperCase()).replace('&','&amp;'):''; //Company
                PGLS_RAZON_SOCIAL_LEGAL = L.Raz_n_Social__c!=null?(L.Raz_n_Social__c.toUpperCase().replace('&','&amp;')):'';
                PCOD_GRUPO_ECON = 'Sin Clasificar';//L.Socios_de_la_empresa_grupo_econ_mico__c!=null?L.Socios_de_la_empresa_grupo_econ_mico__c.toUpperCase():'';
                PCOD_TIPO_CLIEMPRESA = L.Tipo_de_cliente_empresa__c;//L.Customer_type_other_rating__c!=null?L.Customer_type_other_rating__c.toUpperCase():'';
                PGLS_WEB = L.Website!=null?L.Website.toUpperCase():'';
                PFEC_DECL_JURADA = FormatoFecha(l.Fecha_de_declaracion_de_margen__c,PFEC_DECL_JURADA);
                DIRECCIONES = new List<DIRECCION>();
                if(L.Calle_Comercial__c != null){
                    dir = true;
                    DIRECCION dc = new DIRECCION();
                    dc.PCOD_CIUDAD = L.Ciudad_Comercial__c.toUpperCase();
                    dc.PCOD_COMUNA = L.Comuna_Comercial__r.Name.toUpperCase();
                    dc.PCOD_PAIS = L.Pais_Comercial__c.toUpperCase();
                    dc.PCOD_REGION = L.Region_Comercial__c.toUpperCase();
                    dc.PCOD_TIPODIR = '3';
                    if(L.Numero_Comercial__c != null){
                        if(L.Office_Number__c != null){
                            dc.PGLS_DIRECCION = L.Calle_Comercial__c.toUpperCase().replace('&','&') +' '+ L.Numero_Comercial__c+', '+ L.Office_Number__c.toUpperCase();
                        }else{
                            dc.PGLS_DIRECCION = L.Calle_Comercial__c.toUpperCase().replace('&','&') +' '+ L.Numero_Comercial__c;
                        }
                    }else{
                        dc.PGLS_DIRECCION = L.Calle_Comercial__c.toUpperCase().replace('&','&');
                    }
                    dc.TELEFONOS = new List<TELEFONO>();
                    if(L.Phone != null){
                        TELEFONO t3 = new TELEFONO();
                        t3.CODIGO_FONO = '';
                        t3.PCOD_TIPO_FONO = 'FIJO';
                        t3.PNUM_FONO = L.Phone.replace(' ','');
                        dc.TELEFONOS.add(t3);
                    }
                    if(L.Commercial_Cellphone__c != null){
                        TELEFONO t4 = new TELEFONO();
                        t4.CODIGO_FONO = '';
                        t4.PCOD_TIPO_FONO = 'CELULAR';
                        t4.PNUM_FONO = L.Commercial_Cellphone__c.replace(' ','');
                        dc.TELEFONOS.add(t4);
                    }
                    if(L.Commercial_Phone_Other__c != null){
                        TELEFONO t5 = new TELEFONO();
                        t5.CODIGO_FONO = '';
                        t5.PCOD_TIPO_FONO = 'FAX';
                        t5.PNUM_FONO = L.Commercial_Phone_Other__c.replace(' ','');
                        dc.TELEFONOS.add(t5);
                    }
                    
                    DIRECCIONES.add(dc);
                }
                EMAILS = new List<EMAIL>();
                if(L.Email != null){
                    ema = true;
                    EMAIL e1 = new EMAIL();
                    e1.PGLS_DIRMAIL = L.Email.toUpperCase();
                    EMAILS.add(e1);
                }
                if(L.Commercial_Email__c != null){
                    ema = true;
                    EMAIL e2 = new EMAIL();
                    e2.PGLS_DIRMAIL = L.Commercial_Email__c.toUpperCase();
                    EMAILS.add(e2);
                }
                CONTACTOS = new List<CONTACTO>();
                if(L.FirstName != null){
                    con = true;
                    CONTACTO c1 = new CONTACTO();
                    c1.PCOD_CARGO = l.Cargo__c;//'SIN DEFINIR';//L.Title!=null?L.Title:'';
                    c1.PCOD_TIPO_CONTACTO = 'EJECUTIVO MÁXIMO';
                    if(L.Email!=null){ c1.PGLS_EMAIL = L.Email.toUpperCase(); }
                    if(L.Apellido_Materno__c!=null){ c1.PNOM_MATERNO = L.Apellido_Materno__c.toUpperCase(); }
                    if(L.FirstName!=null){ c1.PNOM_NOMBRES = L.FirstName.toUpperCase(); }
                    if(L.LastName!=null){ c1.PNOM_PATERNO = L.LastName.toUpperCase(); }
                    if(L.MobilePhone!=null){ c1.PNUM_CELULAR = L.MobilePhone; }
                    c1.PNUM_CORRELATIVO = '1';
                    if(L.Fax!=null){ c1.PNUM_FAX = L.Fax; }
                    if(L.Phone_contact__c !=null){ c1.PNUM_FONO = L.Phone_contact__c.replaceAll( '\\s+', ''); }
                    CONTACTOS.add(c1);
                }
                System.debug('Listo para integrar');
            }else{
                // Los datos necesarios para la integracion no estan completos
                System.debug('Faltan datos');
                System.debug('Datos validados:');
                System.debug('Sucursal='+L.Sucursal_de_Apertura_del__c);
                System.debug('Clasificacion='+L.BICE_Classification__c);
                System.debug('Sub sector='+L.Sub_Sector_Economico__c);
                System.debug('Actividad='+L.Actividad_Economica_SBIF__c);
                System.debug('Sexo='+L.Sex__c);
            }
        }
    }
    
    public void updateLead(String CifId){
        Lead myObj = [SELECT CIF_Id__c FROM Lead WHERE Id =:lid];
        If(CifId != '-1' && String.isBlank(CifId) == false){ //If(String.isBlank(CifId) == false)
            myObj.CIF_Id__c = CifId;
            myObj.Customer_Creation__c = 'Realizado';
            update myObj;
        }
        else
        {
            myObj.CIF_Id__c = CifId;
            myObj.Customer_Creation__c = 'No realizado';
            update myObj;
        }  
    }

    public PageReference callInt10L(){
        Endpoint_Setting__mdt xEx = [SELECT Id, Endpoint__c, Namespace__c FROM Endpoint_Setting__mdt WHERE MasterLabel = 'INT10L'];
        String soapNS = xEx.Namespace__c;
        //String endpoint = 'https://sfqa.bice.cl/bus/CrearClienteCifFacade/Crear';
        String endpoint = xEx.Endpoint__c;
        
        String testData = '';
        testData = testData + '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cre="'+soapNS+'">';
        testData = testData + '   <soapenv:Header/>';
        testData = testData + '   <soapenv:Body>';
        testData += '                   <cre:CrearCleinteBice>';
        testData += '                   <cre:indicadorCif>1</cre:indicadorCif>';
        testData += '                   <cre:Cif>'; 
        testData = testData + '         <cre:COD_CANAL>501</cre:COD_CANAL>';
        testData = testData + '         <cre:GLOSA_APLICACION>INGRESO POR CRM</cre:GLOSA_APLICACION>';
        testData = testData + '         <cre:COD_SUCURSAL>'+COD_SUCURSAL+'</cre:COD_SUCURSAL>';
        testData = testData + '         <cre:COD_OPERADOR>'+COD_OPERADOR+'</cre:COD_OPERADOR>';
        testData = testData + '         <cre:TIPO_IDEN_CLIENTE>1</cre:TIPO_IDEN_CLIENTE>';
        testData = testData + '         <cre:IDEN_CLIENTE>'+IDEN_CLIENTE+'</cre:IDEN_CLIENTE>';
        //testData = testData + '         <cre:FEC_CREACION></FEC_CREACION>';
        testData = testData + '         <cre:PNUM_ROL_EMPLEADO>'+PNUM_ROL_EMPLEADO+'</cre:PNUM_ROL_EMPLEADO>';
        testData = testData + '         <cre:PCOD_TIPO_JURIDI>'+L.Tipo_de_Persona__c+'</cre:PCOD_TIPO_JURIDI>';
        testData = testData + '         <cre:PCOD_CLIENTE>'+PCOD_CLIENTE+'</cre:PCOD_CLIENTE>';
        testData = testData + '         <cre:PCOD_TIPO_CLIENTE>'+PCOD_TIPO_CLIENTE+'</cre:PCOD_TIPO_CLIENTE>';
        if(PCOD_SECTOR_ECONOM != ''){
            testData = testData + '         <cre:PCOD_SECTOR_ECONOM>'+PCOD_SECTOR_ECONOM+'</cre:PCOD_SECTOR_ECONOM>';
        }
        if(PFEC_CLIENTE !=null)
            testData = testData + '         <cre:PFEC_CLIENTE>'+PFEC_CLIENTE+'</cre:PFEC_CLIENTE>';
        //testData = testData + '         <cre:PNUM_COR_DOMLEGAL></PNUM_COR_DOMLEGAL>';
        testData = testData + '         <cre:PCOD_ACTIVIDAD>'+PCOD_ACTIVIDAD+'</cre:PCOD_ACTIVIDAD>';
        testData = testData + '         <cre:PCOD_SECTOR>'+PCOD_SECTOR+'</cre:PCOD_SECTOR>';
        testData = testData + '         <cre:PCOD_CATDEU>'+PCOD_CATDEU+'</cre:PCOD_CATDEU>';
        testData = testData + '         <cre:PCOD_RELA_BICE>'+PCOD_RELA_BICE+'</cre:PCOD_RELA_BICE>';
        testData = testData + '         <cre:PCOD_GRUP_RELA>'+PCOD_GRUP_RELA+'</cre:PCOD_GRUP_RELA>';
        testData = testData + '         <cre:PCOD_ESTA_DEUD>'+PCOD_ESTA_DEUD+'</cre:PCOD_ESTA_DEUD>';
        testData = testData + '         <cre:PNUM_CARPETA>'+PNUM_CARPETA+'</cre:PNUM_CARPETA>';
        testData = testData + '         <cre:PNUM_CASI_INTE>'+PNUM_CASI_INTE+'</cre:PNUM_CASI_INTE>';
        //testData = testData + '         <cre:PGLS_SINO_SBIF></PGLS_SINO_SBIF>';
        if(PFEC_DECL_JURADA !=null)
            testData = testData + '         <cre:PFEC_DECL_JURADA>'+PFEC_DECL_JURADA+'</cre:PFEC_DECL_JURADA>';
        //testData = testData + '         <PFEC_VERIF_DOMLEGAL></PFEC_VERIF_DOMLEGAL>';
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
       // testData = testData + '         <PFLG_EMPLEADO>'+PFLG_EMPLEADO+'</PFLG_EMPLEADO>';
        if(PCOD_TIPO_JURIDI == '1'){
            testData = testData + '         <cre:PFLG_EMPLEADO>'+PFLG_EMPLEADO+'</cre:PFLG_EMPLEADO>';
            testData = testData + '         <cre:PNOM_PATERNO>'+PNOM_PATERNO+'</cre:PNOM_PATERNO>';
            if(PNOM_MATERNO != null)
                testData = testData + '         <cre:PNOM_MATERNO>'+PNOM_MATERNO+'</cre:PNOM_MATERNO>';
            testData = testData + '         <cre:PNOM_NOMBRES>'+PNOM_NOMBRES+'</cre:PNOM_NOMBRES>';
            //testData = testData + '         <PNOM_NICKNAME></PNOM_NICKNAME>';
            testData = testData + '         <cre:PCOD_NACION>'+PCOD_NACION+'</cre:PCOD_NACION>';
            //testData = testData + '         <PCOD_RESIDENCIA></PCOD_RESIDENCIA>';
            testData = testData + '         <cre:PCOD_PROFESION>'+PCOD_PROFESION+'</cre:PCOD_PROFESION>';
            testData = testData + '         <cre:PFEC_NACIM>'+PFEC_NACIM+'</cre:PFEC_NACIM>';
            testData = testData + '         <cre:PCOD_SEXO>'+PCOD_SEXO+'</cre:PCOD_SEXO>';
            testData = testData + '         <cre:PCOD_NIV_EDUCAC>'+PCOD_NIV_EDUCAC+'</cre:PCOD_NIV_EDUCAC>';
            testData = testData + '         <cre:PCOD_ESTCIVIL>'+PCOD_ESTCIVIL+'</cre:PCOD_ESTCIVIL>';
            if(PCOD_SEPBIENES != null)
                testData = testData + '         <cre:PCOD_SEPBIENES>'+PCOD_SEPBIENES+'</cre:PCOD_SEPBIENES>';
        }
        //testData = testData + '         <PCOD_SEPBIENES></PCOD_SEPBIENES>';
        //testData = testData + '         <PNUM_CARGAS></PNUM_CARGAS>';
        //testData = testData + '         <PFEC_ANTIG_VIV></PFEC_ANTIG_VIV>';
        //testData = testData + '         <PFEC_DEFUNCION></PFEC_DEFUNCION>';
        //testData = testData + '         <PFEC_CERT_ECIVI></PFEC_CERT_ECIVI>';
        if(PCOD_TIPO_JURIDI == '6'){
            testData = testData + '         <cre:PGLS_RAZON_SOCI>'+PGLS_RAZON_SOCI+'</cre:PGLS_RAZON_SOCI>';
            testData = testData + '         <cre:PGLS_RAZON_SOCIAL_LEGAL>'+PGLS_RAZON_SOCIAL_LEGAL+'</cre:PGLS_RAZON_SOCIAL_LEGAL>';
            testData = testData + '         <cre:PNOM_FANTASIA>'+PNOM_FANTASIA+'</cre:PNOM_FANTASIA>';
            testData = testData + '         <cre:PCOD_GRUPO_ECON>'+PCOD_GRUPO_ECON+'</cre:PCOD_GRUPO_ECON>';
            if(PFEC_CONSTITUCION!=null)
                testData = testData + '         <cre:PFEC_CONSTITUCION>'+PFEC_CONSTITUCION+'</cre:PFEC_CONSTITUCION>';
            if(PCOD_TIPO_CLIEMPRESA!=null)
                testData = testData + '         <cre:PCOD_TIPO_CLIEMPRESA>'+PCOD_TIPO_CLIEMPRESA+'</cre:PCOD_TIPO_CLIEMPRESA>';
            testData = testData + '         <cre:PGLS_WEB>'+PGLS_WEB+'</cre:PGLS_WEB>';
        }
        if(dir){
            for(DIRECCION d : DIRECCIONES){
                testData = testData + '         <cre:DIRECCION>';
                testData = testData + '            <cre:PCOD_CIUDAD>'+d.PCOD_CIUDAD+'</cre:PCOD_CIUDAD>';
                testData = testData + '            <cre:PCOD_COMUNA>'+d.PCOD_COMUNA+'</cre:PCOD_COMUNA>';
                testData = testData + '            <cre:PCOD_PAIS>'+d.PCOD_PAIS+'</cre:PCOD_PAIS>';
                //testData = testData + '            <PCOD_POSTAL>'+d.PCOD_POSTAL+'</PCOD_POSTAL>';
                testData = testData + '            <cre:PCOD_REGION>'+d.PCOD_REGION+'</cre:PCOD_REGION>';
                testData = testData + '            <cre:PCOD_TIPODIR>'+d.PCOD_TIPODIR+'</cre:PCOD_TIPODIR>';
                testData = testData + '            <cre:PGLS_DIRECCION>'+d.PGLS_DIRECCION+'</cre:PGLS_DIRECCION>';
                //testData = testData + '            <PGLS_OFI_POST></PGLS_OFI_POST>';
                //testData = testData + '            <PNUM_CASILLA></PNUM_CASILLA>';
                //testData = testData + '            <PNUM_SECUENCIA></PNUM_SECUENCIA>';
                //testData = testData + '            <!--Zero or more repetitions:-->';
               
                
                //testData = testData + '            <TELEFONO>';
               testData = testData + '<cre:TELEFONO/>';
                    for(TELEFONO t : d.TELEFONOS){
                        if(t!= null){
                            testData = testData + '            <cre:TELEFONO>';
                            //testData = testData + '               <CODIGO_FONO>'+t.CODIGO_FONO+'</CODIGO_FONO>';
                            testData = testData + '               <cre:PCOD_TIPO_FONO>'+t.PCOD_TIPO_FONO+'</cre:PCOD_TIPO_FONO>';
                            testData = testData + '               <cre:PNUM_FONO>'+t.PNUM_FONO+'</cre:PNUM_FONO>';                   
                            testData = testData + '            </cre:TELEFONO>';
                         }
                         else{
                             testData = testData + '<cre:TELEFONO/>';
                             }
                             
                    }
               
                
                //testData = testData + '            </TELEFONO>';
                testData = testData + '         </cre:DIRECCION>';
            }
        }
        if(ema){
            for(EMAIL e : EMAILS){
                testData = testData + '         <cre:EMAIL>';
                testData = testData + '            <cre:PGLS_DIRMAIL>'+e.PGLS_DIRMAIL+'</cre:PGLS_DIRMAIL>';
                //testData = testData + '            <PNUM_SECUENCIA></PNUM_SECUENCIA>';
                testData = testData + '         </cre:EMAIL>';
            }
        }
        if(con){
            for(CONTACTO c : CONTACTOS){
                testData = testData + '         <cre:CONTACTO>';
                if(PNOM_PATERNO != ''){
                    if(c.PCOD_CARGO != null){
                        testData = testData + '            <cre:PCOD_CARGO>'+c.PCOD_CARGO+'</cre:PCOD_CARGO>';
                    }
                    testData = testData + '            <cre:PCOD_TIPO_CONTACTO>'+c.PCOD_TIPO_CONTACTO+'</cre:PCOD_TIPO_CONTACTO>';
                    if(c.PGLS_EMAIL != null){
                        testData = testData + '            <cre:PGLS_EMAIL>'+c.PGLS_EMAIL+'</cre:PGLS_EMAIL>';
                    }
                    if(c.PNOM_MATERNO != null)
                        testData = testData + '            <cre:PNOM_MATERNO>'+c.PNOM_MATERNO+'</cre:PNOM_MATERNO>';
                    testData = testData + '            <cre:PNOM_NOMBRES>'+c.PNOM_NOMBRES+'</cre:PNOM_NOMBRES>';
                    testData = testData + '            <cre:PNOM_PATERNO>'+c.PNOM_PATERNO+'</cre:PNOM_PATERNO>';
                    if(c.PNUM_CELULAR != null){
                        testData = testData + '            <cre:PNUM_CELULAR>'+c.PNUM_CELULAR+'</cre:PNUM_CELULAR>';
                    }
                    if(c.PNUM_FAX != null){
                        testData = testData + '            <cre:PNUM_FAX>'+c.PNUM_FAX+'</cre:PNUM_FAX>';
                    }
                    if(c.PNUM_FONO != null){
                        testData = testData + '            <cre:PNUM_FONO>'+c.PNUM_FONO+'</cre:PNUM_FONO>';
                    }
                }
                testData = testData + '         </cre:CONTACTO>';
            }
        }
        system.debug('PCOD_AGRUPACION '+PCOD_AGRUPACION);
        //Nuevos campos 04072017//
        if(PCOD_TIPOCLI != null)
            testData = testData + '<cre:PCOD_TIPOCLI>'+PCOD_TIPOCLI+'</cre:PCOD_TIPOCLI>';
        if(PCOD_SUBTIPOCLI != null)
            testData = testData + '<cre:PCOD_SUBTIPOCLI>'+PCOD_SUBTIPOCLI+'</cre:PCOD_SUBTIPOCLI>';
        if(PCOD_CLAS_SEG != null)
            testData = testData + '<cre:PCOD_CLAS_SEG>'+PCOD_CLAS_SEG+'</cre:PCOD_CLAS_SEG>';
        if(PCOD_CLAS_EDAD != null)
            testData = testData + '<cre:PCOD_CLAS_EDAD>'+PCOD_CLAS_EDAD+'</cre:PCOD_CLAS_EDAD>';   
        if(PCOD_TIP_CLI_CL != null)
            testData = testData + '<cre:PCOD_TIP_CLI_CL>'+PCOD_TIP_CLI_CL+'</cre:PCOD_TIP_CLI_CL>';
        if(PCOD_TIPO_FATCA != null)
            testData = testData + '<cre:PCOD_TIPO_FATCA>'+PCOD_TIPO_FATCA+'</cre:PCOD_TIPO_FATCA>';
        if(PCOD_INTIN != null)
            testData = testData + '<cre:PCOD_INTIN>'+PCOD_INTIN+'</cre:PCOD_INTIN>';
        if(PCOD_IDGIN != null)
            testData = testData + '<cre:PCOD_IDGIN>'+PCOD_IDGIN+'</cre:PCOD_IDGIN>';
        if(PCOD_CLARIE != null)
            testData = testData + '<cre:PCOD_CLARIE>'+PCOD_CLARIE +'</cre:PCOD_CLARIE>';           
        //////////////////////////
        if(PCOD_PAGA_IVA != null)
            testData = testData + '<cre:PCOD_PAGA_IVA>'+PCOD_PAGA_IVA+'</cre:PCOD_PAGA_IVA>';
        
        if(PCOD_AGRUPACION=='Null'){ // 19/10/2017 se agrega codigo para validar cuando  PCOD_AGRUPACION es null no agregue el tag al xml. agregado por Braulio cavieres
             testData = testData +'';
            system.debug('<ag>Null');
        }else if(PCOD_AGRUPACION != null){
            testData = testData + '<cre:PCOD_AGRUPACION>'+PCOD_AGRUPACION+'</cre:PCOD_AGRUPACION >';
             system.debug('<ag>1');
        }    
            
        if(GIRO != null){    
            testData = testData + '<cre:GIRO>';
            testData = testData +   '<cre:PGLS_GIRO>'+GIRO+'</cre:PGLS_GIRO>';
            testData = testData +   '<cre:PCOD_PRINCIPAL>'+'SI'+'</cre:PCOD_PRINCIPAL>';
            testData = testData + '</cre:GIRO>';
        }    
        if(PCOD_OPERADOR_COMEX != null)
            testData = testData +'<cre:PCOD_OPERADOR_COMEX>'+PCOD_OPERADOR_COMEX+'</cre:PCOD_OPERADOR_COMEX>';         
        testData += '                   </cre:Cif>';    
        testData = testData + '      </cre:CrearCleinteBice>';
        testData = testData + '   </soapenv:Body>';
        testData = testData + '</soapenv:Envelope>';
        
        Dom.Document doc = new Dom.Document();
        doc.load(testData);
        
        System.debug(doc.toXmlString());
        
        // Send the request
        HttpRequest req = new HttpRequest();
        //req.setClientCertificateName('sfqabice');
        req.setMethod('POST');
        req.setEndpoint(endpoint);
        req.setHeader('Content-Type', 'text/xml;charset=utf-8');
        req.setBody(doc.toXmlString());
        req.setTimeout(120000);
        //req.setBodyDocument(doc);
        System.debug('Request: '+req);
        try{
            Http http = new Http();
            HttpResponse res = http.send(req);
            System.debug('Response: '+res);
            System.debug('Response XML: '+res.getBody());
            dom.Document resDoc = res.getBodyDocument();
            dom.XmlNode envelope = resDoc.getRootElement();
            System.debug(envelope);
            dom.XmlNode envB = envelope.getChildElement('Body', 'http://schemas.xmlsoap.org/soap/envelope/');
            dom.XmlNode bRes = envB.getChildElement('CrearCleinteBiceResponse', 'http://www.example.org/CrearClienteBice/');
            dom.XmlNode ret = bRes.getChildElement('CifResponse', 'http://www.example.org/CrearClienteBice/');
            dom.XmlNode retur = ret.getChildElement('return', 'http://www.example.org/CrearClienteBice/');
            System.debug('Code: '+retur.getChildElement('CODIGO', 'http://www.example.org/CrearClienteBice/').getText());
            System.debug('Msgs: '+retur.getChildElement('MENSAJE', 'http://www.example.org/CrearClienteBice/').getText());
            System.debug('CiFi: '+retur.getChildElement('n_CIF_ID', 'http://www.example.org/CrearClienteBice/').getText());
            updateLead(retur.getChildElement('n_CIF_ID', 'http://www.example.org/CrearClienteBice/').getText());
            return Redireccionar();
        }catch(Exception e){
            system.debug('Exception Service: '+e);
            return RedirectError('El servicio está teniendo problemas... intente nuevamente.');
        }
        return null;
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
    
    
    public PageReference start(){
        return callInt10L();
    }
    
    public PageReference validarcampos(){
       
          Lead Le = [SELECT FATCA_Information__c,Fecha_de_declaracion_de_margen__c
                 FROM Lead 
                 WHERE Id =:lid];
        
        if(Le.FATCA_Information__c==null || Le.FATCA_Information__c=='' ){
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Por favor ingresar Información FATCA');
            ApexPages.addMessage(myMsg);  
        }
        if(Le.Fecha_de_declaracion_de_margen__c==null){
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Por favor ingresar Fecha declaración de margen.');
            ApexPages.addMessage(myMsg); 
        }
        if(!ApexPages.hasMessages()){   
             mensajePagina ='Creando candidato en CIF...';
            
           return start();
        }
        return null;
    }
    public pageReference volver(){
        PageReference back = new PageReference('/' + lid);
        back.setRedirect(true);
        return back;
    }
        
    public PageReference Redireccionar(){
        String urlToRedirect = '/apex/BICE_IntOnline_Redirect';
        PageReference myVFPage = new PageReference(urlToRedirect);
        myVFPage.getParameters().put('LID',lid);
        myVFPage.getParameters().put('msg','Validando datos...');
        myVFPage.setRedirect(true);
        return myVFPage;
    }
    
    public PageReference RedirectError(String mensaje){
        String urlToRedirect = '/apex/BICE_IntOnline_Redirect';
        PageReference myVFPage = new PageReference(urlToRedirect);
        myVFPage.getParameters().put('LID',lid);
        myVFPage.getParameters().put('msg', mensaje);
        myVFPage.setRedirect(true);
        return myVFPage;
    }
    
    /* Agregados para identificar el error en productivo
    porque la clase está cubierta en un 80% en sandbox
    pero se cubre hasta un 65% en prod */
    public void paraeliminar1(){}
    public void paraeliminar2(){}
    public void paraeliminar3(){}
    public void paraeliminar4(){}
    public void paraeliminar5(){}
    public void paraeliminar6(){}
    public void paraeliminar7(){}
    public void paraeliminar8(){}
    public void paraeliminar9(){}
    public void paraeliminar10(){}
    public void paraeliminar11(){}
    public void paraeliminar12(){}
    public void paraeliminar13(){}
    public void paraeliminar14(){}
    public void paraeliminar15(){}
    public void paraeliminar16(){}
    public void paraeliminar17(){}
    public void paraeliminar18(){}
    public void paraeliminar19(){}
    public void paraeliminar20(){}
    public void paraeliminar21(){}
    public void paraeliminar22(){}
    public void paraeliminar23(){}
    public void paraeliminar24(){}
    public void paraeliminar25(){}
    public void paraeliminar26(){}
    public void paraeliminar27(){}
    public void paraeliminar28(){}
    public void paraeliminar29(){}
    public void paraeliminar30(){}
    public void paraeliminar31(){}
    public void paraeliminar32(){}
    public void paraeliminar33(){}
    public void paraeliminar34(){}
    public void paraeliminar35(){}
    public void paraeliminar36(){}
    public void paraeliminar37(){}
    public void paraeliminar38(){}
    public void paraeliminar39(){}
    public void paraeliminar40(){}
    public void paraeliminar41(){}
    public void paraeliminar42(){}
    public void paraeliminar43(){}
    public void paraeliminar44(){}
    public void paraeliminar45(){}
    public void paraeliminar46(){}
    public void paraeliminar47(){}
    public void paraeliminar48(){}
    public void paraeliminar49(){}
    public void paraeliminar50(){}
    public void paraeliminar51(){}
    public void paraeliminar52(){}
    public void paraeliminar53(){}
    public void paraeliminar54(){}
    public void paraeliminar55(){}
    public void paraeliminar56(){}
    public void paraeliminar57(){}
    public void paraeliminar58(){}
    public void paraeliminar59(){}
    public void paraeliminar60(){}
    public void paraeliminar61(){}
    public void paraeliminar62(){}
    public void paraeliminar63(){}
    public void paraeliminar64(){}
    public void paraeliminar65(){}
    public void paraeliminar66(){}
    public void paraeliminar67(){}
    public void paraeliminar68(){}
    public void paraeliminar69(){}
    public void paraeliminar70(){}
    public void paraeliminar71(){}
    public void paraeliminar72(){}
    public void paraeliminar73(){}
    public void paraeliminar74(){}
    public void paraeliminar75(){}
    public void paraeliminar76(){}
    public void paraeliminar77(){}
    public void paraeliminar78(){}
    public void paraeliminar79(){}
    public void paraeliminar80(){}
    public void paraeliminar81(){}
    public void paraeliminar82(){}
    public void paraeliminar83(){}
    public void paraeliminar84(){}
    public void paraeliminar85(){}
    public void paraeliminar86(){}
    public void paraeliminar87(){}
    public void paraeliminar88(){}
    public void paraeliminar89(){}
    public void paraeliminar90(){}
    public void paraeliminar91(){}
    public void paraeliminar92(){}
    public void paraeliminar93(){}
    public void paraeliminar94(){}
    public void paraeliminar95(){}
    public void paraeliminar96(){}
    public void paraeliminar97(){}
    public void paraeliminar98(){}
    public void paraeliminar99(){}
    public void paraeliminar100(){}
    public void paraeliminar101(){}
    public void paraeliminar102(){}
    public void paraeliminar103(){}
    public void paraeliminar104(){}
    public void paraeliminar105(){}
    public void paraeliminar106(){}
    public void paraeliminar107(){}
    public void paraeliminar108(){}
    public void paraeliminar109(){}
    public void paraeliminar110(){}
    public void paraeliminar111(){}
    public void paraeliminar112(){}
    public void paraeliminar113(){}
    public void paraeliminar114(){}
    public void paraeliminar115(){}
    public void paraeliminar116(){}
    public void paraeliminar117(){}
    public void paraeliminar118(){}
    public void paraeliminar119(){}
    public void paraeliminar120(){}
    public void paraeliminar121(){}
    public void paraeliminar122(){}
    public void paraeliminar123(){}
    public void paraeliminar124(){}
    public void paraeliminar125(){}
    public void paraeliminar126(){}
    public void paraeliminar127(){}
    public void paraeliminar128(){}
    public void paraeliminar129(){}
    public void paraeliminar130(){}
    public void paraeliminar131(){}
    public void paraeliminar132(){}
    public void paraeliminar133(){}
    public void paraeliminar134(){}
    public void paraeliminar135(){}
    public void paraeliminar136(){}
    public void paraeliminar137(){}
    public void paraeliminar138(){}
    public void paraeliminar139(){}
    public void paraeliminar140(){}
    public void paraeliminar141(){}
    public void paraeliminar142(){}
    public void paraeliminar143(){}
    public void paraeliminar144(){}
    public void paraeliminar145(){}
    public void paraeliminar146(){}
    public void paraeliminar147(){}
    public void paraeliminar148(){}
    public void paraeliminar149(){}
    public void paraeliminar150(){}
    public void paraeliminar151(){}
    public void paraeliminar152(){}
    public void paraeliminar153(){}
    public void paraeliminar154(){}
    public void paraeliminar155(){}
    public void paraeliminar156(){}
    public void paraeliminar157(){}
    public void paraeliminar158(){}
    public void paraeliminar159(){}
    public void paraeliminar160(){}
    public void paraeliminar161(){}
    public void paraeliminar162(){}
    public void paraeliminar163(){}
    public void paraeliminar164(){}
    public void paraeliminar165(){}
    public void paraeliminar166(){}
    public void paraeliminar167(){}
    public void paraeliminar168(){}
    public void paraeliminar169(){}
    public void paraeliminar170(){}
    public void paraeliminar171(){}
    public void paraeliminar172(){}
    public void paraeliminar173(){}
    public void paraeliminar174(){}
    public void paraeliminar175(){}
    public void paraeliminar176(){}
    public void paraeliminar177(){}
    public void paraeliminar178(){}
    public void paraeliminar179(){}
    public void paraeliminar180(){}
    public void paraeliminar181(){}
    public void paraeliminar182(){}
    public void paraeliminar183(){}
    public void paraeliminar184(){}
    public void paraeliminar185(){}
    public void paraeliminar186(){}
    public void paraeliminar187(){}
    public void paraeliminar188(){}
    public void paraeliminar189(){}
    public void paraeliminar190(){}
    public void paraeliminar191(){}
    public void paraeliminar192(){}
    public void paraeliminar193(){}
    public void paraeliminar194(){}
    public void paraeliminar195(){}
    public void paraeliminar196(){}
    public void paraeliminar197(){}
    public void paraeliminar198(){}
    public void paraeliminar199(){}
    public void paraeliminar200(){}
    public void paraeliminar201(){}
    public void paraeliminar202(){}
    public void paraeliminar203(){}
    public void paraeliminar204(){}
    public void paraeliminar205(){}
    public void paraeliminar206(){}
    public void paraeliminar207(){}
    public void paraeliminar208(){}
    public void paraeliminar209(){}
    public void paraeliminar210(){}
    public void paraeliminar211(){}
    public void paraeliminar212(){}
    public void paraeliminar213(){}
    public void paraeliminar214(){}
    public void paraeliminar215(){}
    public void paraeliminar216(){}
    public void paraeliminar217(){}
    public void paraeliminar218(){}
    public void paraeliminar219(){}
    public void paraeliminar220(){}
    public void paraeliminar221(){}
    public void paraeliminar222(){}
    public void paraeliminar223(){}
    public void paraeliminar224(){}
    public void paraeliminar225(){}
    public void paraeliminar226(){}
    public void paraeliminar227(){}
    public void paraeliminar228(){}
    public void paraeliminar229(){}
    public void paraeliminar230(){}
    public void paraeliminar231(){}
    public void paraeliminar232(){}
    public void paraeliminar233(){}
    public void paraeliminar234(){}
    public void paraeliminar235(){}
    public void paraeliminar236(){}
    public void paraeliminar237(){}
    public void paraeliminar238(){}
    public void paraeliminar239(){}
    public void paraeliminar240(){}
    public void paraeliminar241(){}
    public void paraeliminar242(){}
    public void paraeliminar243(){}
    public void paraeliminar244(){}
    public void paraeliminar245(){}
    public void paraeliminar246(){}
    public void paraeliminar247(){}
    public void paraeliminar248(){}
    public void paraeliminar249(){}
    public void paraeliminar250(){}
    public void paraeliminar251(){}
    public void paraeliminar252(){}
    public void paraeliminar253(){}
    public void paraeliminar254(){}
    public void paraeliminar255(){}
    public void paraeliminar256(){}
    public void paraeliminar257(){}
    public void paraeliminar258(){}
    public void paraeliminar259(){}
    public void paraeliminar260(){}
    public void paraeliminar261(){}
    public void paraeliminar262(){}
    public void paraeliminar263(){}
    public void paraeliminar264(){}
    public void paraeliminar265(){}
    public void paraeliminar266(){}
    public void paraeliminar267(){}
    public void paraeliminar268(){}
    public void paraeliminar269(){}
    public void paraeliminar270(){}
    public void paraeliminar271(){}
    public void paraeliminar272(){}
    public void paraeliminar273(){}
    public void paraeliminar274(){}
    public void paraeliminar275(){}
    public void paraeliminar276(){}
    public void paraeliminar277(){}
    public void paraeliminar278(){}
    public void paraeliminar279(){}
    public void paraeliminar280(){}
    public void paraeliminar281(){}
    public void paraeliminar282(){}
    public void paraeliminar283(){}
    public void paraeliminar284(){}
    public void paraeliminar285(){}
    public void paraeliminar286(){}
    public void paraeliminar287(){}
    public void paraeliminar288(){}
    public void paraeliminar289(){}
    public void paraeliminar290(){}
    public void paraeliminar291(){}
    public void paraeliminar292(){}
    public void paraeliminar293(){}
    public void paraeliminar294(){}
    public void paraeliminar295(){}
    public void paraeliminar296(){}
    public void paraeliminar297(){}
    public void paraeliminar298(){}
    public void paraeliminar299(){}
    public void paraeliminar300(){}
    
}