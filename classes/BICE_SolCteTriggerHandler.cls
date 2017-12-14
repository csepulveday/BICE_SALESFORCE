public with sharing class BICE_SolCteTriggerHandler{
    private boolean m_isExecuting = false;
    private integer BatchSize = 0;
    // Account Record Types
    private static Id enterpriseAccountRType = null;
    private static Id personAccountRType = null;

    // Profile lists
    private static List<Profile> pUsers = [ SELECT Name, Id
                                            FROM Profile
                                            WHERE Name LIKE '%Banca Persona%' ];
    private static List<Profile> eUsers = [ SELECT Name, Id
                                            FROM Profile
                                            WHERE Name
                                            LIKE '%Banca Empresas%'
                                            OR Name LIKE '%EYC%' ];

    // List of Comunas
    private static List<Comuna__c> comunas = [  SELECT Id, Name, GLS_CIUDAD__c,
                                                COD_CIUDAD__c, COD_COMUNA__c,
                                                COD_REGION__c, Pais__c,
                                                GLS_REGIONLARGA__c FROM Comuna__c ];

    private static Endpoint_Setting__mdt INT10_EP = [ SELECT Id, Endpoint__c, Namespace__c
                                                        FROM Endpoint_Setting__mdt
                                                        WHERE MasterLabel = 'INT10'];

    private static List<Contact> contacts;                                                    
    // Static initialization of variables and methods - to assure single execution
    static {
        getAccountRecordTypes();
    }


    // Initialization Method
    public BICE_SolCteTriggerHandler(boolean isExecuting, integer size){
        m_isExecuting = isExecuting;
        BatchSize = size;
    }


    public void OnBeforeInsert ( BICE_Solicitud_Cliente__c[] newSolCtes ){
        handleUpdateAccount(newSolCtes);
        handleSolCteAddresses(newSolCtes);
    }

    public void OnAfterInsert(Account[] newAccounts){
    }


    @future public static void OnAfterInsertAsync(Set<ID> newAccountIDs){
    }

    public void OnBeforeUpdate(BICE_Solicitud_Cliente__c[] oldSolCte, BICE_Solicitud_Cliente__c[] upSolCte, Map<ID, BICE_Solicitud_Cliente__c> oldMap, Map<ID, BICE_Solicitud_Cliente__c> newMap ){
        handleUpdateAccount(upSolCte);
        handleSolCteAddresses(upSolCte);
    }

    public void OnAfterUpdate(Account[] oldRecords, Account[] updatedRecords, Map<ID, Account> recordMap){

    }

    @future public static void OnAfterUpdateAsync(Set<ID> updatedRecordIDs){
        //List<Account> updatedRecords = [select Id, Name from Account where Id IN :updatedRecordIDs];
    }

    public void OnBeforeDelete(Account[] recordsToDelete, Map<ID, Account> recordMap){

    }

    public void OnAfterDelete(Account[] deletedRecords, Map<ID, Account> recordMap){

    }

    @future public static void OnAfterDeleteAsync(Set<ID> deletedRecordIDs){

    }

    public void OnUndelete(Account[] restoredRecords){

    }

    public boolean IsTriggerContext{
        get{ return m_isExecuting;}
    }

    public boolean IsVisualforcePageContext{
        get{ return !IsTriggerContext;}
    }

    public boolean IsWebServiceContext{
        get{ return !IsTriggerContext;}
    }

    public boolean IsExecuteAnonymousContext{
        get{ return !IsTriggerContext;}
    }

    // Static Method to retrieve the different Record Types (Should there be 2 only)
    private static void getAccountRecordTypes() {
        List<RecordType> recordTypes = [SELECT Id, Name FROM RecordType WHERE Name ='Cuenta Empresa' OR Name = 'Cuentas personales'];

        for (RecordType rt : recordTypes){
            if ( rt.Name == 'Cuenta Empresa' ){
                enterpriseAccountRType = rt.Id;
            } else if ( rt.Name == 'Cuentas personales' ){
                personAccountRType = rt.Id;
            }
        }
    }


    // Get Comunas from a set of Ids
    private static List<Comuna__c> getComunas(Set<ID> ccomIds) {
        List<Comuna__c> comunas = [ SELECT Id, Name, GLS_CIUDAD__c, COD_CIUDAD__c, COD_COMUNA__c, COD_REGION__c, Pais__c, GLS_REGIONLARGA__c FROM Comuna__c WHERE Id IN:ccomIds];
        return comunas;
    }

    // Get Comunas byId
    private static Comuna__c getComunaById(ID comunaId) {
        Comuna__c comuna = null;
        for(Comuna__c c : comunas){
            if (c.Id == comunaId) {
                comuna = c;
                break;
            }
        }
        return comuna;
    }

    // Get Comunas byId
    public static List<Contact> getAccountContacts(ID contactsId) {
       List<Contact> contacts = [SELECT Cargo__c, Tipo_de_Contacto__c, Email, Apellido_materno__c, FirstName, LastName, Phone, Fax, MobilePhone, AccountId
                                          FROM Contact 
                                          WHERE AccountId =: contactsId]; 
       return contacts;                                       
    }

    private static Boolean isOwnedByBancaPersonas(Account account) {
        Boolean check = false;
        for( Profile p : pUsers ){
            System.debug('ID Banca Personas: ' + p.Id);
            System.debug('ID Owner: '+ account.Owner.ProfileId);
            if ( account.Owner.ProfileId == p.Id ){
                check = true;
                break;
            }
        }

        return check;
    }

    private static Boolean isOwnedByBancaEmpresas(Account account) {
        Boolean check = false;
        for( Profile e : eUsers ){
            System.debug('ID Banca Empresas: ' + e.Id);
            System.debug('ID Owner: '+ account.Owner.ProfileId);
            if ( account.Owner.ProfileId == e.Id ){
                check = true;
                break;
            }
        }

        return check;
    }

    public static String FormatoFecha(Date fecha, String salida){
        
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

    /*
     * handleAddresses:
     *      Uses information from Comunas and Chile specific directions to manipulate
     *      custom fields and fulfill Saesforce standard fields in order to present
     *      useful information to the end user (maps ans such)
     *
     *  This method is consumed in [isBefore && isInsert] and [isBefore && isUpdate]
     *
     *  Executions contexts:
     *      1. From Lead conversion process
     *      2. From Daily Batch load of addresses from legacy systems
     *
     *  NOTE: The convertion of Address type and normalization should happen BEFORE
     *        reaching Salesforce. As it is not the case, it is necessary to make
     *        some gymnastics to make sure that the user profits from the eye candy
     *        while the backend systems remains without Address Normalization, which
     *        should be done by MASTER DATA MANAGEMENT through Data Cleansing and
     *        Data Stewardship.
     */
    private static void handleSolCteAddresses( BICE_Solicitud_Cliente__c[] solCtes ) {

        for (BICE_Solicitud_Cliente__c solCte : solCtes ){
            boolean mustInsert = false;

            /* ***START*** Handle(filter and clean) == Comuna Comercial == */
            // check for Comuna reference existence
            if ( solCte.New_Comuna_comercial_Inv__c != null ){
                // If Communa Exist, then, fulfill the rest of the custom address fields
                Comuna__c comuna = getComunaById( solCte.New_Comuna_comercial_Inv__c );
                solCte.New_Region_comercial_Inv__c = comuna.GLS_REGIONLARGA__c;
                solCte.New_Ciudad_o_Provincia_comercial_Inv__c = comuna.GLS_CIUDAD__c;
                solCte.New_Pais_comercial_Inv__c = comuna.Pais__c;

            }
            // don't have Comuna Comercial and is from Chile >> cleanup custom fields
            else if ( solCte.New_Pais_comercial_Inv__c == 'Chile'){
                solCte.New_Region_comercial_Inv__c = '';
                solCte.New_Ciudad_o_Provincia_comercial_Inv__c = '';
                solCte.New_Pais_comercial_Inv__c = '';
            }
            // don't have Comuna and is another country
            else {
                solCte.New_Region_comercial_Inv__c  = '';
            }
            /* ***END*** Handle(filter and clean) == Comuna Comercial == */


            /* ***START*** Handle(filter and clean) == Comuna Particular == */
            // check for Comuna reference existence
            if ( solCte.New_Comuna_particular_Inv__c != null ){
                // If Communa Exist, then, fulfill the rest of the custom address fields
                Comuna__c comuna = getComunaById( solCte.New_Comuna_particular_Inv__c);
                solCte.New_Region_particular_Inv__c = comuna.GLS_REGIONLARGA__c;
                solCte.New_Ciudad_o_Provincia_particular_Inv__c = comuna.GLS_CIUDAD__c;
                solCte.New_Pais_particular_Inv__c = comuna.Pais__c;
            }
            // don't have Comuna Comercial and is from Chile >> cleanup custom fields
            else if ( solCte.New_Pais_particular_Inv__c == 'Chile'){
                solCte.New_Region_particular_Inv__c = '';
                solCte.New_Ciudad_o_Provincia_particular_Inv__c = '';
                solCte.New_Pais_particular_Inv__c = '';
            }
            // don't have Comuna and is another country
            else {
                solCte.New_Region_particular_Inv__c = '';
            }
            /* ***END*** Handle(filter and clean) == Comuna Partiular == */
            
            /* ***START*** Handle(filter and clean) == Comuna Conyuge == */
            // check for Comuna reference existence
            if ( solCte.New_Comuna_de_Direccion_Conyuge__c != null ){
                // If Communa Exist, then, fulfill the rest of the custom address fields
                Comuna__c comuna = getComunaById( solCte.New_Comuna_de_Direccion_Conyuge__c);
                solCte.New_Region_particular_de_Conyuge__c = comuna.GLS_REGIONLARGA__c;
                solCte.New_Ciudad_particular_de_Conyuge__c = comuna.GLS_CIUDAD__c;
            }
            // don't have Comuna and is another country
            else {
                solCte.New_Region_particular_de_Conyuge__c = '';
            }
            /* ***END*** Handle(filter and clean) == Comuna Conyuge == */
        }
    }

    @future(callout=true)
    private static void callSebra(String aId, string solcteId){
        Account a = [SELECT Id, Actividad_Economica_SBIF__c, Apartment__c, Apellido_materno__pc, Spouse_Mothers_Last_Name__pc,
                         apellidoMaterno__c, LastName, Spouse_Fathers_Last_Name__pc, apellidoPaterno__c, Atencion_diferencial__c,
                         AUM__c, Autorizaci_n_de_informar_a_organismo_FAT__c, Balances__c, Banco__c, BCS_Circ_10672_10673_BCS__c,
                         Calle_comercial__c, Calle_comercial_Inv__c, Calle_particular__c, Calle_particular_Inv__c, Cargo__pc,
                         Carpeta_comercial__c, Carpeta_operativa__c, Categoria_Deudor__c, Celular_Comercial_Inv__c, 
                         Celular_Particular_Inv__pc, Circ_57_2017_UAF__c, Ciudad_o_Provincia_comercial__c,
                         Ciudad_o_Provincia_comercial_Inv__c, Ciudad_o_Provincia_particular__c, Ciudad_o_Provincia_particular_Inv__c,
                         BICE_Classification_del__c, Clasificacion_de_Riesgo_SBIF__c, Clasificacion_submargenes__c, 
                         Cliente_AP_con_Administraci_n_Cartera__c, Cliente_AP__c, Cliente_APV__c, Cliente_ARE_s__c, Cliente_Banco__c,
                         Cliente_BIA__c, Cliente_desde__c, Cliente_Relacionado__c, Cluster__c, Commercial_Classification__c,
                         Commercial_FAX_Other__c, Commercial_Landline__c, Commercial_Phone_Other__c, Comuna_comercial__c,
                         Comuna_comercial_Inv__c, Comuna_particular__c, Comuna_particular_Inv__c,Copia_inscripcion_original__c,
                         Estado_Creaci_n_de_Cliente__c, Customer_Legal_Person_Consumer__c, DAI_de_la_Soc__c, DCV_Circ_190_SVS__c,
                         Descripci_n_cuenta__c, Deuda_Sistema_Financiero_MM_pesos__c, 
                         Documentaci_n_sustentatoria_EESS__c, Ejecutivo_de_Inversiones__c, Email_Comercial_Inv__c, 
                         Email_facturacion_Inv__c, Email_Personal_Inv__pc, Email_Rep_Legal_Inv__c, Employer__pc, Escritura_publica__c,
                         Estado_civil__pc, Estado_Deudor__c, Estracto_Diario_Oficial__c, Fecha_apertura_cta_cte__c,
                         Fecha_Constitucion_Empresa__c, Fecha_creacion_Sebra__c, Fecha_declaracion_jurada_art_85__c,
                         Fecha_de_conversi_n_a_cliente__c, Fecha_de_declaracion_de_margen__c, Fecha_de_vencimiento_MAC__c,
                         Fecha_fin_relaci_n__c, Fecha_inicio_relaci_n__c, Fecha_resultado_comit__c, Fecha_Solicitud_Crear_Cliente__c,
                         Ficha_cuenta__c, Filial_de_participacion__c, Form_Art_85__c, Form_EESS__c, Form_FATCA__c, 
                         Form_Ingreso_Maestro_de_Clientes__c, Form_Solicitud_de_Productos__c, Giro_Inv__c, Grupo_Deudor_Relacionado__c,
                         Socios_de_la_empresa_Grupo_Econ_mico__c, Hobbies__c, Idea_de_negocio__c, Industry, Info_adicional_Inv_Depto__c,
                         Info_adicional_Inv_Oficina__c, Informacion_adicional_comercial__c, FATCA_Information__c, 
                         Informacion_privilegiada__c, Informacion_privilegiada_Cargo_SVS_171__c, Intereses__c, KYC_Aprobado__c,
                         Lugar_de_Nacimiento__c, MDR__c, Medios_de_pago_para_productos_CDB__c, Modalidad_de_operaci_n__c,
                         Modelo_facturaci_n__c, Monto_MAC_creado__c, Monto_Preaprobado__c, N_de_cuenta__c, N_cuenta_bancaria__c,
                         Nationality__c, Nivel_de_Riesgo_de_la_Cartera__c, Firstname, Spouse_First_Name__pc, Name, Nombre_Factoring__c,
                         Nombres__c, Numero_comercial__c, Numero_calle_comercial_Inv__c, Numero_particular__c, 
                         Numero_calle_particular_Inv__c, Numero_de_GIN__c, Numero_de_TIN__c, Observacion_Area_Cliente__c,
                         Obtener_Foto_y_Huellas__c, Office_Number__c, SBIF_Sector__c, Otra_idea_de_negocio__c, Otras_Sociedades__c,
                         Otro_telefono_Comercial_Inv__c, Otro_telefono_particular_Inv__pc, Taxes__c, Pa_s_Casa_Matriz__c, 
                         Pais_comercial__c, Pais_comercial_Inv__c, Pa_s_de_Constituci_n__c, Pais_particular__c, Pais_particular_Inv__c,
                         Perfil_de_inversionista__c, Perfil_de_Riesgo__c, PersonAssistantName, PersonAssistantPhone, PersonBirthdate, 
                         PersonDepartment, PersonEmail, PersonHomePhone, PersonMobilePhone, PersonOtherPhone, PersonTitle, Phone,
                         Plantilla_cobro__c, Plantilla_Producto__c, Plataforma_de_captacion__c, Plataforma_Siga_CRM__c, 
                         Plataforma_Torre__c, Profession__pc, Prop_sito_cuenta__c, Raz_n_Social__c, Conjugal_Regime__pc, 
                         Region_comercial__c, Region_comercial_Inv__c, Region_particular__c, Region_particular_Inv__c,
                         Registro_de_Firma__c, Registro_Fotogr_fico__c, Relacionado_con_la_corredora__c, 
                         Relacion_con_corredora_Circ_1064__c, Relacion_Gestion_Banco__c, Rentabilidad_12_meses__c,
                         Rentabilidad_1_dia__c, Rentabilidad_30_dias__c, Rentabilidad_7_dias__c,Rentabilidad_YTD__c,
                         Rep_Legal_email__c, Requerimiento_comercial_de_la_empresa__c, Resultado_verificacion_requisitos__c,
                         ROA_12_meses__c, ROA_1_dia__c, ROA_30_dias__c, ROA_7_dias__c, ROA_YTD__c, Rut__c, Spouse_RUT__pc, rut_inv__c,
                         RUT_Sociedad_participacion__c, Segmentaci_n_BI__c, Segmentacion_Liquidez_Codigo__c,
                         Segmentacion_Liquidez_SubCodigo__c, Segmentation__c, Segmento__c, SII_DJ_1820_1829__c, 
                         Situac_Laboral__c, Socio_Solidario__c, Sub_Sector_Economico__c, Subsegmento__c, Sucursal_Banco__c, 
                         Sucursal_BI__c, Sucursal_creaci_n_registro__c, Susceptible_conflicto_de_interes__c, 
                         Telefono_fijo_comercial_Inv__c, Telefono_fijo_particular_Inv__pc, Commercial_Cellphone__c,
                         Tipo_Cliente_Gestion__c, Tipo_cuenta__c, Tipo_cuenta_DCV__c, Tipo_de_Banca__c, Tipo_de_Cliente__c,
                         Tipo_de_Cliente_Empresa__c, Customer_type_other_rating_c__c, Tipo_de_Documento_Relacionado__c,
                         Tipo_de_Persona__c, Tipo_de_Relacion__c, Tipo_perfil_comercial__c, Tipo_relaci_n__c, VIP__c, Website,
                         isPersonAccount, PersonContactId, RecordTypeId, Ejecutivo_de_Inversiones__r.Profile.Name, Giro_Inv__r.Name,
                         Sex__pc, Comuna_de_Direccion_Conyuge__pr.Name, Ejecutivo_de_Inversiones__r.ROL_Number__c,
                         Ciudad_particular_de_Conyuge__pc, Numero_de_calle_particular_de_Conyuge__pc, Comuna_comercial_Inv__r.Name,
                         Comuna_particular_Inv__r.Name, Numero_calle_RL__c, Calle_RL__c,Comuna_RL__c,Comuna_RL__r.Name, Pais_RL__c
                        FROM Account 
                        WHERE Id =:aId
                        LIMIT 1];
        BICE_Solicitud_Cliente__c sc = [SELECT Id, Sebra_Ok__c FROM BICE_Solicitud_Cliente__c WHERE Cliente__c =: aId ORDER BY LastModifiedDate ASC LIMIT 1];
        BICE_Account_SebraInt_Controller sebra = new BICE_Account_SebraInt_Controller();
        Boolean ok = false;
        if(!Test.isRunningTest()){
            ok = sebra.ClienteSF(a, sc);
        }else{
            ok = true;
        }
        System.debug('OK: '+ok);
        if(ok){
            System.debug('Todo correctamente guardado');
            System.debug('Updating a: ');
            System.debug(a);
            update a;
        }else{
            System.debug('El servicio no respondió correctamente');
        }
    }
    
    private static void handleUpdateAccount(BICE_Solicitud_Cliente__c[] newSolCtes) {
        for(BICE_Solicitud_Cliente__c solCte : newSolCtes){
            if(solCte.Estado_solicitud__c == 'Aprobado'){
                //Check if exists Cuenta Bancaria Inv
                if(solCte.New_N_cuenta_bancaria__c != ''){
                    Integer exists = 0;
                    try{
                        Cuenta_Bancaria_Inv__c cCheck = [SELECT Id 
                                                         FROM Cuenta_Bancaria_Inv__c 
                                                         WHERE Banco__c =:solCte.New_Banco__c 
                                                         AND Numero__c =:solCte.New_N_cuenta_bancaria__c
                                                         AND Cliente__c =:solCte.Cliente__c];
                        if(cCheck != null){
                            exists = 1;
                            System.debug('Cuenta Bancaria existe');
                        }
                    }catch(Exception ex){
                        exists = 0;
                        System.debug('Cuenta Bancaria NO existe');
                    }
                    if(exists == 0){
                        System.debug('Cuenta Bancaria NO existe');
                        Cuenta_Bancaria_Inv__c cBan = new Cuenta_Bancaria_Inv__c();
                        cBan.Banco__c = solCte.New_Banco__c;
                        cBan.Cliente__c = solCte.Cliente__c;
                        cBan.Esta_es_la_Cuenta_Principal__c = solCte.New_Cuenta_Principal__c;
                        cBan.Moneda__c = solCte.New_Moneda__c;
                        cBan.Numero__c = solCte.New_N_cuenta_bancaria__c;
                        cBan.Origen_de_la_Cuenta__c = 'Chile';
                        cBan.Sucursal__c = solCte.New_Sucursal__c;
                        cBan.Tipo_de_Cuenta__c = solCte.New_Tipo_cuenta__c;
                        insert cBan;
                    }
                }
                Account a = [SELECT Id, Actividad_Economica_SBIF__c, Apartment__c, Apellido_materno__pc, Spouse_Mothers_Last_Name__pc,
                             apellidoMaterno__c, LastName, Spouse_Fathers_Last_Name__pc, apellidoPaterno__c, Atencion_diferencial__c,
                             AUM__c, Autorizaci_n_de_informar_a_organismo_FAT__c, Balances__c, Banco__c, BCS_Circ_10672_10673_BCS__c,
                             Calle_comercial__c, Calle_comercial_Inv__c, Calle_particular__c, Calle_particular_Inv__c, Cargo__pc,
                             Carpeta_comercial__c, Carpeta_operativa__c, Categoria_Deudor__c, Celular_Comercial_Inv__c, 
                             Celular_Particular_Inv__pc, Circ_57_2017_UAF__c, Ciudad_o_Provincia_comercial__c,
                             Ciudad_o_Provincia_comercial_Inv__c, Ciudad_o_Provincia_particular__c, Ciudad_o_Provincia_particular_Inv__c,
                             BICE_Classification_del__c, Clasificacion_de_Riesgo_SBIF__c, Clasificacion_submargenes__c, 
                             Cliente_AP_con_Administraci_n_Cartera__c, Cliente_AP__c, Cliente_APV__c, Cliente_ARE_s__c, Cliente_Banco__c,
                             Cliente_BIA__c, Cliente_desde__c, Cliente_Relacionado__c, Cluster__c, Commercial_Classification__c,
                             Commercial_FAX_Other__c, Commercial_Landline__c, Commercial_Phone_Other__c, Comuna_comercial__c,
                             Comuna_comercial_Inv__c, Comuna_particular__c, Comuna_particular_Inv__c,Copia_inscripcion_original__c,
                             Estado_Creaci_n_de_Cliente__c, Customer_Legal_Person_Consumer__c, DAI_de_la_Soc__c, DCV_Circ_190_SVS__c,
                             Descripci_n_cuenta__c, Deuda_Sistema_Financiero_MM_pesos__c, 
                             Documentaci_n_sustentatoria_EESS__c, Ejecutivo_de_Inversiones__c, Email_Comercial_Inv__c, 
                             Email_facturacion_Inv__c, Email_Personal_Inv__pc, Email_Rep_Legal_Inv__c, Employer__pc, Escritura_publica__c,
                             Estado_civil__pc, Estado_Deudor__c, Estracto_Diario_Oficial__c, Fecha_apertura_cta_cte__c,
                             Fecha_Constitucion_Empresa__c, Fecha_creacion_Sebra__c, Fecha_declaracion_jurada_art_85__c,
                             Fecha_de_conversi_n_a_cliente__c, Fecha_de_declaracion_de_margen__c, Fecha_de_vencimiento_MAC__c,
                             Fecha_fin_relaci_n__c, Fecha_inicio_relaci_n__c, Fecha_resultado_comit__c, Fecha_Solicitud_Crear_Cliente__c,
                             Ficha_cuenta__c, Filial_de_participacion__c, Form_Art_85__c, Form_EESS__c, Form_FATCA__c, 
                             Form_Ingreso_Maestro_de_Clientes__c, Form_Solicitud_de_Productos__c, Giro_Inv__c, Grupo_Deudor_Relacionado__c,
                             Socios_de_la_empresa_Grupo_Econ_mico__c, Hobbies__c, Idea_de_negocio__c, Industry, Info_adicional_Inv_Depto__c,
                             Info_adicional_Inv_Oficina__c, Informacion_adicional_comercial__c, FATCA_Information__c, 
                             Informacion_privilegiada__c, Informacion_privilegiada_Cargo_SVS_171__c, Intereses__c, KYC_Aprobado__c,
                             Lugar_de_Nacimiento__c, MDR__c, Medios_de_pago_para_productos_CDB__c, Modalidad_de_operaci_n__c,
                             Modelo_facturaci_n__c, Monto_MAC_creado__c, Monto_Preaprobado__c, N_de_cuenta__c, N_cuenta_bancaria__c,
                             Nationality__c, Nivel_de_Riesgo_de_la_Cartera__c, Firstname, Spouse_First_Name__pc, Name, Nombre_Factoring__c,
                             Nombres__c, Numero_comercial__c, Numero_calle_comercial_Inv__c, Numero_particular__c, 
                             Numero_calle_particular_Inv__c, Numero_de_GIN__c, Numero_de_TIN__c, Observacion_Area_Cliente__c,
                             Obtener_Foto_y_Huellas__c, Office_Number__c, SBIF_Sector__c, Otra_idea_de_negocio__c, Otras_Sociedades__c,
                             Otro_telefono_Comercial_Inv__c, Otro_telefono_particular_Inv__pc, Taxes__c, Pa_s_Casa_Matriz__c, 
                             Pais_comercial__c, Pais_comercial_Inv__c, Pa_s_de_Constituci_n__c, Pais_particular__c, Pais_particular_Inv__c,
                             Perfil_de_inversionista__c, Perfil_de_Riesgo__c, PersonAssistantName, PersonAssistantPhone, PersonBirthdate, 
                             PersonDepartment, PersonEmail, PersonHomePhone, PersonMobilePhone, PersonOtherPhone, PersonTitle, Phone,
                             Plantilla_cobro__c, Plantilla_Producto__c, Plataforma_de_captacion__c, Plataforma_Siga_CRM__c, 
                             Plataforma_Torre__c, Profession__pc, Prop_sito_cuenta__c, Raz_n_Social__c, Conjugal_Regime__pc, 
                             Region_comercial__c, Region_comercial_Inv__c, Region_particular__c, Region_particular_Inv__c,
                             Registro_de_Firma__c, Registro_Fotogr_fico__c, Relacionado_con_la_corredora__c, 
                             Relacion_con_corredora_Circ_1064__c, Relacion_Gestion_Banco__c, Rentabilidad_12_meses__c,
                             Rentabilidad_1_dia__c, Rentabilidad_30_dias__c, Rentabilidad_7_dias__c,Rentabilidad_YTD__c,
                             Rep_Legal_email__c, Requerimiento_comercial_de_la_empresa__c, Resultado_verificacion_requisitos__c,
                             ROA_12_meses__c, ROA_1_dia__c, ROA_30_dias__c, ROA_7_dias__c, ROA_YTD__c, Spouse_RUT__pc, rut_inv__c,
                             RUT_Sociedad_participacion__c, Segmentaci_n_BI__c, Segmentacion_Liquidez_Codigo__c,
                             Segmentacion_Liquidez_SubCodigo__c, Segmentation__c, Segmento__c, SII_DJ_1820_1829__c, 
                             Situac_Laboral__c, Socio_Solidario__c, Sub_Sector_Economico__c, Subsegmento__c, Sucursal_Banco__c, 
                             Sucursal_BI__c, Sucursal_creaci_n_registro__c, Susceptible_conflicto_de_interes__c, 
                             Telefono_fijo_comercial_Inv__c, Telefono_fijo_particular_Inv__pc, Commercial_Cellphone__c,
                             Tipo_Cliente_Gestion__c, Tipo_cuenta__c, Tipo_cuenta_DCV__c, Tipo_de_Banca__c, Tipo_de_Cliente__c,
                             Tipo_de_Cliente_Empresa__c, Customer_type_other_rating_c__c, Tipo_de_Documento_Relacionado__c,
                             Tipo_de_Persona__c, Tipo_de_Relacion__c, Tipo_perfil_comercial__c, Tipo_relaci_n__c, VIP__c, Website,
                             isPersonAccount, PersonContactId, RecordTypeId, Sex__pc, Calle_particular_de_Conyuge__pc,
                             Ciudad_particular_de_Conyuge__pc, Comuna_de_Direccion_Conyuge__pc, DeptoCasaSector_particular_de_Conyuge__pc, 
                             Numero_de_calle_particular_de_Conyuge__pc, Region_particular_de_Conyuge__pc,
                             Comuna_particular_Inv__r.Name, Comuna_comercial_Inv__r.Name, Comuna_comercial__r.Name,
                             Comuna_particular__r.Name, Comuna_de_Direccion_Conyuge__pr.Name, Numero_calle_RL__c, Calle_RL__c,Comuna_RL__c,Comuna_RL__r.Name, Pais_RL__c
                            FROM Account 
                            WHERE Id =:solCte.Cliente__c 
                            LIMIT 1];
                if(a != null){
                    RecordType rt = [SELECT Name FROM RecordType WHERE Id =:a.RecordTypeId LIMIT 1];
                    Boolean result = rt.Name.contains('Cuenta Empresa');
                    if(result){
                        System.debug('Cuenta Empresa');
                        a.Tipo_cuenta__c = solCte.New_Tipo_cuenta__c;
                        a.Name = solCte.New_Nombre_de_fantasia__c;
                        a.Giro_Inv__c = solCte.New_Giro_Inv__c;
                        a.Website = solCte.New_Website__c;
                        a.Raz_n_Social__c = solCte.New_Raz_n_Social__c;
                        a.Nationality__c = solCte.New_Nationality__c;
                        a.Email_facturacion_Inv__c = solCte.New_Email_facturacion_Inv__c;
                        a.Email_Comercial_Inv__c = solCte.New_Email_comercial_Inv__c;
                        a.Telefono_fijo_comercial_Inv__c = solCte.New_Telefono_fijo_comercial_Inv__c;
                        a.Cluster__c = solCte.New_Cluster__c;
                        a.Celular_Comercial_Inv__c = solCte.New_Celular_Comercial_Inv__c;
                        a.Atencion_diferencial__c = solCte.New_Atencion_diferencial__c;
                        a.Otro_telefono_Comercial_Inv__c = solCte.New_Otro_telefono_Comercial_Inv__c;
                        a.VIP__c = solCte.New_VIP__c;
                        a.Segmentaci_n_BI__c = solCte.New_Segmentaci_n_BI__c;
                        a.Calle_comercial_Inv__c = solCte.New_Calle_comercial_Inv__c;
                        a.Numero_calle_comercial_Inv__c = solCte.New_Numero_calle_comercial_Inv__c;
                        a.Info_adicional_Inv_Oficina__c = solCte.New_Info_adicional_Inv_Oficina__c;
                        a.Comuna_comercial_Inv__c = solCte.New_Comuna_comercial_Inv__c;
                        a.Ciudad_o_Provincia_comercial_Inv__c = solCte.New_Ciudad_o_Provincia_comercial_Inv__c;
                        a.Region_comercial_Inv__c = solCte.New_Region_comercial_Inv__c;
                        a.Pais_comercial_Inv__c = solCte.New_Pais_comercial_Inv__c;
                        a.Nombres__c = solCte.New_Nombres__c;
                        //a.Sex__pc = solCte.New_Sex__c;
                        a.rut_inv__c = solCte.New_rut_inv__c;
                        a.apellidoPaterno__c = solCte.New_apellidoPaterno__c;
                        a.Email_Rep_Legal_Inv__c = solCte.New_Email_Rep_Legal_Inv__c;
                        a.apellidoMaterno__c = solCte.New_apellidoMaterno__c;
                        a.N_cuenta_bancaria__c = solCte.New_N_cuenta_bancaria__c;
                        a.Banco__c = solCte.New_Banco__c;
                        a.Tipo_de_Banca__c = solCte.New_Tipo_de_Banca__c;
                        a.Sucursal_Banco__c = solCte.New_Sucursal_Banco__c;
                        a.Segmento__c = solCte.New_Segmento__c;
                        a.Sucursal_BI__c = solCte.New_Sucursal_BI__c;
                        a.Segmentation__c = solCte.New_Segmentation__c;
                        a.Cliente_BIA__c = solCte.New_Cliente_BIA__c ;
                        a.Cliente_APV__c = solCte.New_Cliente_APV__c;
                        a.Cliente_AP_con_Administraci_n_Cartera__c = solCte.New_Cte_AP_Administraci_n_Cartera__c;
                        a.Cliente_ARE_s__c = solCte.New_Cliente_ARE_s__c;
                        a.Cliente_AP__c = solCte.New_Cliente_AP__c;
                        a.Cliente_Relacionado__c = solCte.New_Cliente_Relacionado__c;
                        a.Tipo_de_Documento_Relacionado__c = solCte.New_Tipo_de_Documento_Relacionado__c;
                        a.Autorizaci_n_de_informar_a_organismo_FAT__c = solCte.New_Autoriz_de_informar_a_organism_FATCA__c;
                        a.Tipo_de_Relacion__c = solCte.New_Tipo_de_Relacion__c;
                        //a.Pa_s_Casa_Matriz__c = solCte.New_Pa_s_Casa_Matriz__c;
                        a.Fecha_inicio_relaci_n__c = solCte.New_Fecha_inicio_relaci_n__c;
                        //a.Pa_s_de_Constituci_n__c = solCte.New_Pa_s_de_Constituci_n__c;
                        a.Fecha_fin_relaci_n__c = solCte.New_Fecha_fin_relaci_n__c;
                        a.Modalidad_de_operaci_n__c = solCte.New_Modalidad_de_operaci_n__c;
                        a.Tipo_de_Cliente__c = solCte.New_Tipo_de_Cliente__c;
                        a.Tipo_perfil_comercial__c = solCte.New_Tipo_perfil_comercial__c;
                        a.Ficha_cuenta__c = solCte.New_Ficha_cuenta__c;
                        a.N_de_cuenta__c = solCte.New_N_de_cuenta__c;
                        a.Informacion_privilegiada__c = solCte.New_Informacion_privilegiada__c;
                        a.Prop_sito_cuenta__c = solCte.New_Prop_sito_cuenta__c;
                        a.Plantilla_Producto__c = solCte.New_Plantilla_Producto__c;
                        a.Descripci_n_cuenta__c = solCte.New_Descripci_n_cuenta__c;
                        a.Tipo_cuenta_DCV__c = solCte.New_Tipo_cuenta_DCV__c;
                        a.Informacion_privilegiada_Cargo_SVS_171__c = solCte.New_Inf_privilegiada_Cargo_SVS_171__c;
                        a.Susceptible_conflicto_de_interes__c = solCte.New_Susceptible_conflicto_de_interes__c;
                        a.Relacion_con_corredora_Circ_1064__c = solCte.New_Relacion_con_corredora_Circ_1064__c;
                        a.SII_DJ_1820_1829__c = solCte.New_SII_DJ_1820_1829__c;
                        a.DCV_Circ_190_SVS__c = solCte.New_DCV_Circ_190_SVS__c;
                        a.Modelo_facturaci_n__c = solCte.New_Modelo_facturaci_n__c;
                        a.BCS_Circ_10672_10673_BCS__c = solCte.New_BCS_Circ_10672_10673_BCS__c;
                        a.Medios_de_pago_para_productos_CDB__c = solCte.New_Medios_de_pago_para_productos_CDB__c;
                        a.Plantilla_cobro__c = solCte.New_Plantilla_cobro__c;
                        a.Circ_57_2017_UAF__c = solCte.New_Circ_57_2017_UAF__c;
                        a.FATCA_Information__c = solCte.New_FATCA_Information__c;
                        a.Fecha_Constitucion_Empresa__c = solCte.New_Fecha_Constitucion_Empresa__c;
                        a.Plataforma_Torre__c = solCte.New_Plataforma_Torre__c;
                        a.Plataforma_Siga_CRM__c = solCte.New_Plataforma_Siga_CRM__c;
                        a.Plataforma_de_captacion__c = solCte.New_Plataforma_de_captacion__c;
                        a.Ejecutivo_de_Inversiones__c = solCte.New_Ejecutivo_de_Inversiones__c;
                        a.Integracion_sebra__c = true;
                        if(a.Customer_type_other_rating_c__c==null){
                            a.Customer_type_other_rating_c__c = 'Gerencia Finanzas';
                        }
                        /*petición Charles, para etiqueta "naturalidad" - 23/11/2017*/
                        a.Tipo_de_Persona__c = solCte.New_Tipo_de_Persona__c;
                        /*----------------------------------------------------------*/
                       /*petición Charles, para etiqueta dirección del repre legal - 30/11/2017*/
                        a.Numero_calle_RL__c = solCte.new_Numero_calle_RL__c;
                        a.Calle_RL__c = solCte.new_Calle_RL__c;
                        a.Comuna_RL__c =  solCte.new_Comuna_RL__c;
                        a.Pais_RL__c = solCte.new_Pais_RL__c;
                        /*----------------------------------------------------------*/
                    }else{
                        System.debug('Cuenta Persona');
                        /*
                        Contact c = [SELECT Apellido_materno__c, Email_Personal_Inv__c, Email_Comercial_Inv__c, 
                                      Celular_Particular_Inv__c, Telefono_fijo_particular_Inv__c, Otro_telefono_particular_Inv__pcProfession__c, 
                                      Employer__c, Estado_civil__c, Spouse_First_Name__c, Conjugal_Regime__c, 
                                      Spouse_Mothers_Last_Name__c, Spouse_RUT__c, Spouse_Fathers_Last_Name__c
                                     FROM Contact
                                     WHERE Id =: a.PersonContactId];
                        */
                        a.Nationality__c = solCte.New_Nationality__c;
                        a.Firstname = solCte.New_Nombre__c;
                        a.Lugar_de_Nacimiento__c = solCte.New_Lugar_de_Nacimiento__c;
                        a.LastName = solCte.New_Apellido_Paterno__c;
                        a.PersonBirthdate = solCte.New_PersonBirthdate__c;
                        a.Sex__pc = solCte.New_Sex__c;
                        a.Apellido_materno__pc = solCte.New_Apellido_Materno__c;
                        a.Email_facturacion_Inv__c = solCte.New_Email_facturacion_Inv__c;
                        a.Email_Personal_Inv__pc = solCte.New_Email_personal_Inv__c;
                        a.Email_Comercial_Inv__c = solCte.New_Email_comercial_Inv__c;
                        a.Telefono_fijo_particular_Inv__pc = solCte.New_Telefono_fijo_particular_Inv__c;
                        a.Telefono_fijo_comercial_Inv__c = solCte.New_Telefono_fijo_comercial_Inv__c;
                        a.Celular_Particular_Inv__pc = solCte.New_Celular_particular_Inv__c;
                        a.Celular_Comercial_Inv__c = solCte.New_Celular_Comercial_Inv__c;
                        a.Otro_telefono_particular_Inv__pc = solCte.New_Otro_telefono_particular_Inv__c;
                        a.Otro_telefono_Comercial_Inv__c = solCte.New_Otro_telefono_Comercial_Inv__c;
                        a.Calle_particular_Inv__c = solCte.New_Calle_particular_Inv__c;
                        a.Calle_comercial_Inv__c = solCte.New_Calle_comercial_Inv__c;
                        a.Numero_calle_particular_Inv__c = solCte.New_Numero_calle_particular_Inv__c;
                        a.Numero_calle_comercial_Inv__c = solCte.New_Numero_calle_comercial_Inv__c;
                        a.Info_adicional_Inv_Depto__c = solCte.New_Info_adicional_Inv_Depto__c;
                        a.Info_adicional_Inv_Oficina__c = solCte.New_Info_adicional_Inv_Oficina__c;
                        a.Comuna_particular_Inv__c = solCte.New_Comuna_particular_Inv__c;
                        a.Comuna_comercial_Inv__c = solCte.New_Comuna_comercial_Inv__c;
                        a.Ciudad_o_Provincia_particular_Inv__c = solCte.New_Ciudad_o_Provincia_particular_Inv__c;
                        a.Ciudad_o_Provincia_comercial_Inv__c = solCte.New_Ciudad_o_Provincia_comercial_Inv__c;
                        a.Region_particular_Inv__c = solCte.New_Region_particular_Inv__c;
                        a.Region_comercial_Inv__c = solCte.New_Region_comercial_Inv__c;
                        a.Pais_particular_Inv__c = solCte.New_Pais_particular_Inv__c;
                        a.Pais_comercial_Inv__c = solCte.New_Pais_comercial_Inv__c;
                        a.Profession__pc = solCte.New_Profession__c;
                        a.Situac_Laboral__c = solCte.New_Situac_Laboral__c;
                        a.Employer__pc = solCte.New_Empleador__c;
                        a.Estado_civil__pc = solCte.New_Estado_Civil__c;
                        a.Spouse_First_Name__pc = solCte.New_Nombre_Conyuge__c;
                        a.Conjugal_Regime__pc = solCte.New_Regimen_Conyugal__c;
                        a.Spouse_Mothers_Last_Name__pc = solCte.New_Apellido_Materno_Conyuge__c;
                        a.Spouse_RUT__pc = solCte.New_RUT_Conyuge__c;
                        a.Spouse_Fathers_Last_Name__pc = solCte.New_Apellido_Paterno_Conyuge__c;
                        a.Tipo_cuenta_DCV__c = solCte.New_Tipo_cuenta_DCV__c;
                        a.Modalidad_de_operaci_n__c = solCte.New_Modalidad_de_operaci_n__c;
                        a.Plantilla_Producto__c = solCte.New_Plantilla_Producto__c;
                        a.Tipo_perfil_comercial__c = solCte.New_Tipo_perfil_comercial__c;
                        a.Modelo_facturaci_n__c = solCte.New_Modelo_facturaci_n__c;
                        a.Plantilla_cobro__c = solCte.New_Plantilla_cobro__c;
                        a.Banco__c = solCte.New_Banco__c;
                        a.N_cuenta_bancaria__c = solCte.New_N_cuenta_bancaria__c;
                        a.Tipo_cuenta__c = solCte.New_Tipo_cuenta__c;
                        a.Ejecutivo_de_Inversiones__c = solCte.New_Ejecutivo_de_Inversiones__c;
                        a.Calle_particular_de_Conyuge__pc = solCte.New_Calle_particular_de_Conyuge__c;
                        a.Ciudad_particular_de_Conyuge__pc = solCte.New_Ciudad_particular_de_Conyuge__c;
                        a.Comuna_de_Direccion_Conyuge__pc = solCte.New_Comuna_de_Direccion_Conyuge__c;
                        a.DeptoCasaSector_particular_de_Conyuge__pc = solCte.New_DeptoCasaSectorParticular_de_Conyuge__c;
                        a.Numero_de_calle_particular_de_Conyuge__pc = solCte.New_Numero_calle_particular_de_Conyuge__c;
                        a.Region_particular_de_Conyuge__pc = solCte.New_Region_particular_de_Conyuge__c;
                        a.Integracion_sebra__c = true;
                        if(a.Customer_type_other_rating_c__c==null){
                            a.Customer_type_other_rating_c__c = 'Gerencia Finanzas';
                        }
                        /*petición Charles, para etiqueta "naturalidad" - 23/11/2017*/
                        a.Tipo_de_Persona__c = solCte.New_Tipo_de_Persona__c;
                        /*----------------------------------------------------------*/
                       
                    }
                    try{
                        update a;
                        callSebra(a.Id, solCte.Id);
                    }catch(Exception ex){
                        System.debug('Existe un problema con el registro: '+ex.getMessage());
                    }
                }else{
                    System.debug('No pudimos encontrar la cuenta asociada');
                }
            }
        }
    }
}