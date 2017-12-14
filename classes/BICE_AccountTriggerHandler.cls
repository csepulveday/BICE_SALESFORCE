public with sharing class BICE_AccountTriggerHandler {
    // This should be used in conjunction with the ApexTriggerComprehensive.trigger template
    // The origin of this pattern is http://www.embracingthecloud.com/2010/07/08/ASimpleTriggerTemplateForSalesforce.aspx
    private boolean m_isExecuting = false;
    private integer BatchSize = 0;
    private boolean x_execute = false;

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

    // List of Comunas commented
    private static List<Comuna__c> comunas = new List<Comuna__c>();
    /*
    private static List<Comuna__c> comunas = [  SELECT Id, Name, GLS_CIUDAD__c,
                                                COD_CIUDAD__c, COD_COMUNA__c,
                                                COD_REGION__c, Pais__c,
                                                GLS_REGIONLARGA__c FROM Comuna__c ];
    */
    private static Endpoint_Setting__mdt INT10_EP = [ SELECT Id, Endpoint__c, Namespace__c
                                                        FROM Endpoint_Setting__mdt
                                                        WHERE MasterLabel = 'INT10'];

    private static List<Contact> contacts;                                                    
    // Static initialization of variables and methods - to assure single execution
    static {
        getAccountRecordTypes();
    }

    // Initialization Method
    public BICE_AccountTriggerHandler(boolean isExecuting, integer size){
        m_isExecuting = isExecuting;
        BatchSize = size;
    }
    
    public Boolean isExecutable(String profileId){
        Profile p = [SELECT Name FROM Profile WHERE id =:profileId];
        //NOT CALL INT 10 FROM Integration User
        if(p.Name == 'Integration User' || p.Name == 'Administrador del sistema'){ 
            x_execute = false;
        }else{
            x_execute = true;
        }
        return x_execute;
    }

    public void setComunas(Account[] accounts){
        Set<ID> iComunas = new Set<ID>();
        for ( Account a : accounts ){
            if(a.Comuna_comercial__c != null){ iComunas.add(a.Comuna_comercial__c); }
            if(a.Comuna_comercial_Inv__c != null){ iComunas.add(a.Comuna_comercial_Inv__c); }
            if(a.Comuna_de_Direccion_Conyuge__pc != null){ iComunas.add(a.Comuna_de_Direccion_Conyuge__pc); }
            if(a.Comuna_particular__c != null){ iComunas.add(a.Comuna_particular__c); }
            if(a.Comuna_particular_Inv__c != null){ iComunas.add(a.Comuna_particular_Inv__c); }
            if(a.Comuna_RL__c != null){ iComunas.add(a.Comuna_RL__c); }
        }
        List<Comuna__c> coms = [SELECT Id, Name, GLS_CIUDAD__c,
                  COD_CIUDAD__c, COD_COMUNA__c,
                  COD_REGION__c, Pais__c,
                  GLS_REGIONLARGA__c 
                  FROM Comuna__c
                  WHERE Id IN :iComunas];
        comunas = coms;
    }
    public void OnBeforeInsert ( Account[] newAccounts ){

        for ( Account a : newAccounts ){
            /* ***START***  Account Type and Owner Setting */
            // Set account information according to Account Type and Owner
            if ( a.Crear_Cliente__c == true ){ // Comes from the Workflow >> Creación Cliente >>
                // Check Owner Banca Personas
                if ( isOwnedByBancaPersonas(a) ){
                    if ( a.RecordTypeId == personAccountRType ){
                        a.Tipo_Cliente_Gestion__c = 'Personas Naturales';
                        a.Clasificacion_submargenes__c = 'Personas';
                    }
                    else if ( a.RecordTypeId == enterpriseAccountRType ){
                        a.Tipo_Cliente_Gestion__c = 'Mediana Empresa';
                        a.Clasificacion_submargenes__c = 'Clientes Corporativos';
                    }
                    a.Customer_type_other_rating_c__c = 'Gerencia Finanzas';
                }
                //Check Owner Banca Empresas or EYC
                if ( isOwnedByBancaEmpresas(a) ){
                    if ( a.RecordTypeId == personAccountRType ){
                        a.Tipo_Cliente_Gestion__c = 'Personas Naturales';
                        a.Clasificacion_submargenes__c = 'Personas';
                    }
                    else if ( a.RecordTypeId == enterpriseAccountRType ){
                        a.Tipo_Cliente_Gestion__c = 'Mediana Empresa';
                        a.Clasificacion_submargenes__c = 'Clientes Corporativos';
                    }
                    a.Customer_type_other_rating_c__c = 'Gerencia Comercial';
                }
            }
            /* ***END*** Account Type and Owner Setting */

            /* Check Comuna and manipulate Account Addresses accordingly */
            handleAccountsAddresses(newAccounts);
        }
    }

    public void OnAfterInsert(Account[] newAccounts){
    }


    @future public static void OnAfterInsertAsync(Set<ID> newAccountIDs){

        // From the AccountIds received, gather all Accounts
        List<Account> newAccounts = [ SELECT Id, isPersonAccount, FirstName, LastName, RUT__c
                                      FROM   Account
                                      WHERE  Id IN :newAccountIDs ];

        /** START Household Creation **/
        List<BICE_HouseHold__c> houseHoldList = new List<BICE_HouseHold__c>();
        List<Account> accUpdate = new List<Account>();

        for (Account acc : newAccounts) {
            if ( acc.IsPersonAccount == true ){
                // Create and set new HouseHold
                BICE_HouseHold__c hh = new BICE_HouseHold__c();
                // Add default HouseHoldName
                hh.Name = (acc.LastName + '_' + acc.FirstName + '_' + acc.RUT__c).toLowerCase();
                hh.Id_Cuenta_Persona__c = acc.Id;
                houseHoldList.add(hh);

            }
        }

        if ( houseHoldList.size() > 0 ) insert houseHoldList;
        /** END Household Creation **/
    }

    public Boolean validateIfCallInt10(Account[] updatedAccounts){
        for(Account a : updatedAccounts){
            if(a.Integracion_Sebra__c == true){
                a.Integracion_Sebra__c = false;
                return false;
            }
        }
        return true;
    }
    
    public void OnBeforeUpdate(Account[] oldAccounts, Account[] updatedAccounts, Map<ID, Account> oldMap, Map<ID, Account> newMap ){
        /* Check Comuna and manipulate Account Addresses accordingly */
        handleAccountsAddresses(updatedAccounts);

        /* Validation for Integration INT-10 */
        Boolean callInt10 = true;
        callInt10 = validateIfCallInt10(updatedAccounts);
        /* Integration INT-10 */
        if(callInt10){
          handleINT10(updatedAccounts, oldMap);
        }

        /* Update Mac Status **/
        updateMacStatusOnLeads(oldMap, newMap);
    }
    
    public void OnAfterUpdate(Account[] oldRecords, Account[] updatedRecords, Map<ID, Account> recordMap){

    }

    @future public static void OnAfterUpdateAsync(Set<ID> updatedRecordIDs){
        //List<Account> updatedRecords = [select Id, Name from Account where Id IN :updatedRecordIDs];
    }
/*
    public void OnBeforeDelete(Account[] recordsToDelete, Map<ID, Account> recordMap){

    }

    public void OnAfterDelete(Account[] deletedRecords, Map<ID, Account> recordMap){

    }

    @future public static void OnAfterDeleteAsync(Set<ID> deletedRecordIDs){

    }

    public void OnUndelete(Account[] restoredRecords){

    }
*/
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
        List<RecordType> recordTypes = [SELECT Id, Name FROM RecordType WHERE Name ='Cuenta Empresa' OR Name = 'Cuentas personales' OR Name = 'Cuentas personales en CIF' OR Name = 'Cuenta Empresa en CIF'];

        for (RecordType rt : recordTypes){
            if ( rt.Name == 'Cuenta Empresa' ){
                enterpriseAccountRType = rt.Id;
            } else if ( rt.Name == 'Cuentas personales' ){
                personAccountRType = rt.Id;
            }else if ( rt.Name == 'Cuenta Empresa en CIF' ){
                enterpriseAccountRType = rt.Id;
            } else if ( rt.Name == 'Cuentas personales en CIF' ){
                personAccountRType = rt.Id;
            }
        }
    }


    // Get Comunas from a set of Ids
//    private static List<Comuna__c> getComunas(Set<ID> ccomIds) {
//        List<Comuna__c> comunas = [ SELECT Id, Name, GLS_CIUDAD__c, COD_CIUDAD__c, COD_COMUNA__c, COD_REGION__c, Pais__c, GLS_REGIONLARGA__c FROM Comuna__c WHERE Id IN:ccomIds];
//        return comunas;
//    }

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
    private static void handleAccountsAddresses( Account[] accounts ) {

        for (Account account : accounts ){
            boolean mustInsert = false;

            /* ***START*** Handle(filter and clean) == Comuna Comercial == */
            // check for Comuna reference existence
            if ( account.Comuna_comercial__c != null ){
                // If Communa Exist, then, fulfill the rest of the custom address fields
                Comuna__c comuna = getComunaById( account.Comuna_comercial__c);
                account.Region_comercial__c = comuna.GLS_REGIONLARGA__c;
                account.Ciudad_o_Provincia_comercial__c = comuna.GLS_CIUDAD__c;
                account.Pais_comercial__c = comuna.Pais__c;

                //
                // BillingAddress is the Salesforce equivalent to Direccion Comercial
                //
                // Assemble the person address according to availability of fields
                account.BillingStreet = account.Calle_comercial__c +
                    (String.isNotBlank( account.Numero_comercial__c )
                        ? ' ' + account.Numero_comercial__c
                        : '') +
                    (String.isNotBlank( account.Office_Number__c)
                        ? ', ' + account.Office_Number__c
                        : '');

                account.BillingCity = comuna.Name;
                account.BillingState = account.Ciudad_o_Provincia_comercial__c;
                account.BillingCountry = account.Pais_comercial__c;

            }
            // don't have Comuna Comercial and is from Chile >> cleanup custom fields
            else if ( account.Pais_comercial__c == 'Chile'){
                account.Region_comercial__c = '';
                account.Ciudad_o_Provincia_comercial__c = '';
                account.Office_Number__c = '';
                account.BillingStreet = '';
                account.BillingCity = '';
                account.BillingState = '';
                account.BillingCountry = ''; // Clean up everythig
                account.Region_comercial__c = '';
                account.Ciudad_o_Provincia_comercial__c = '';
                account.Pais_comercial__c = '';
            }
            // don't have Comuna and is another country
            else {
                account.Region_comercial__c = '';
            }
            /* ***END*** Handle(filter and clean) == Comuna Comercial == */


            /* ***START*** Handle(filter and clean) == Comuna Particular == */
            // check for Comuna reference existence
            if ( account.Comuna_particular__c != null ){
                // If Communa Exist, then, fulfill the rest of the custom address fields
                Comuna__c comuna = getComunaById( account.Comuna_particular__c);
                account.Region_particular__c = comuna.GLS_REGIONLARGA__c;
                account.Ciudad_o_Provincia_particular__c = comuna.GLS_CIUDAD__c;
                account.Pais_particular__c = comuna.Pais__c;
                System.debug('Comuna particular: '+comuna);

                //
                // PersonMailingAddress is the Salesforce equivalent to Direccion Comercial
                //
                // Assemble the PersonMailingStreet address according to availability of fields
                account.PersonMailingStreet = account.Calle_particular__c +
                    (String.isNotBlank( account.Numero_particular__c)
                        ? ' ' + account.Numero_particular__c
                        : '') +
                    (String.isNotBlank( account.Apartment__c)
                        ? ', ' + account.Apartment__c
                        : '');

                account.PersonMailingCity = comuna.Name;
                account.PersonMailingState = account.Ciudad_o_Provincia_particular__c;
                account.PersonMailingCountry = account.Pais_particular__c;
            }
            // don't have Comuna Comercial and is from Chile >> cleanup custom fields
            else if ( account.Pais_particular__c == 'Chile'){
                account.Region_particular__c = '';
                account.Ciudad_o_Provincia_particular__c = '';
                //account.Apartment__c = '';
                account.PersonMailingCity = '';
                account.PersonMailingCountry = '';
                account.PersonMailingState = '';
                account.PersonMailingStreet = '';
                account.Region_particular__c = '';
                account.Ciudad_o_Provincia_particular__c = '';
                account.Pais_particular__c = '';
            }
            // don't have Comuna and is another country
            else {
                account.Region_particular__c = '';
            }
            /* ***END*** Handle(filter and clean) == Comuna Partiular == */
        }

    }

    private static void handleINT10(Account[] updatedAccounts, Map<Id, Account> oldMap) {
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
        String PCOD_AGRUPACION;
        String PCOD_OPERADOR_COMEX;
        String GIRO;
        
        String testData = '';
        String soapNS = INT10_EP.Namespace__c;

        for ( Account a: updatedAccounts ){
            Account old = oldMap.get(a.Id);

            PCOD_COMUNACOM = a.Comuna_comercial__c != null
                            ? getComunaById(a.Comuna_comercial__c).Name
                            : '';
            PCOD_COMUNAPART = a.Comuna_particular__c != null
                            ? getComunaById(a.Comuna_particular__c).Name
                            : '';
            system.debug('Comuna Comercial  :' + PCOD_COMUNACOM);
            system.debug('Comuna Particular : '+ PCOD_COMUNAPART);

            // Account Executive User >> ROL_Number is needed
            List<User> u = [SELECT ROL_Number__c FROM User WHERE Id =:a.Ejecutivo_de_Cuenta__c];
            PNUM_ROL_EMPLEADO = u.size() > 0
                                ? u[0].ROL_Number__c
                                : '0' ;
            system.debug('Empleado: '+PNUM_ROL_EMPLEADO );

            PCOD_TIPO_JURIDI = a.recordTypeId == personAccountRType
                                ? '1' // Persona Natural
                                : '2';// Persona Juridica

            if( PCOD_TIPO_JURIDI == '1' ){ //PERSONA NATURAL
                   
                  system.debug('Empleado: '+PNUM_ROL_EMPLEADO );
                  List<User> users = [SELECT ROL_Number__c FROM User WHERE Id =:a.LastModifiedById];
                   if(users.size()>0)
                       COD_OPERADOR = users[0].ROL_Number__c;                  
                   else
                       COD_OPERADOR = '0';    
                //Nuevos Campos 04072017//
                PCOD_TIPOCLI = a.Segmentacion_Liquidez_Codigo__c;
                PCOD_SUBTIPOCLI = a.Segmentacion_Liquidez_Subcodigo__c;
                PCOD_TIP_CLI_CL = 'Personas';
                PCOD_CLAS_SEG = a.Segmentation__c;
                PCOD_TIPO_FATCA = a.FATCA_Information__c;
                PCOD_INTIN = a.Numero_de_TIN__c;
                PCOD_IDGIN = a.Numero_de_GIN__c;
                PCOD_CATDEU = 'Persona natural';
                PCOD_RELA_BICE = 'NO RELACIONADO';
                PCOD_GRUP_RELA = 'Sin Grupo';
                PCOD_ESTA_DEUD = 'DEM';
                PFEC_CLIENTE = BICE_AccountTriggerHandler.FormatoFecha(a.Fecha_Solicitud_Crear_Cliente__c,PFEC_CLIENTE);
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
                PFEC_DECL_JURADA = BICE_AccountTriggerHandler.FormatoFecha(a.Fecha_de_declaracion_de_margen__c,PFEC_DECL_JURADA);

                // Consider only changes in contactability fields (Addresses & such)
                if (
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
                (a.SBIF_Sector__c != old.SBIF_Sector__c) ||
                    Test.isRunningTest()
                )
                {
                    testData = '';
                    testData += '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cre="'+soapNS+'">';
                    testData += '   <soapenv:Header/>';
                    testData += '   <soapenv:Body>';
                    testData += '      <cre:CrearCleinteBice>';
                    testData += '         <cre:indicadorCif>1</cre:indicadorCif>';
                    //testData += '         <indicadorSebra>1</indicadorSebra>';
                    testData += '         <cre:Cif>';                   
                    testData += '         <cre:COD_CANAL>501</cre:COD_CANAL>';
                    testData += '         <cre:GLOSA_APLICACION>INGRESO POR CRM</cre:GLOSA_APLICACION>';
                    testData += '         <cre:COD_SUCURSAL>'+a.Sucursal_Banco__c+'</cre:COD_SUCURSAL>';
                    testData += '         <cre:COD_OPERADOR>'+COD_OPERADOR+'</cre:COD_OPERADOR>';
                    testData += '         <cre:TIPO_IDEN_CLIENTE>1</cre:TIPO_IDEN_CLIENTE>';
                    testData += '         <cre:IDEN_CLIENTE>'+(a.Rut__c.replace('-','')).replace('.','')+'</cre:IDEN_CLIENTE>';
                    testData += '         <cre:PNUM_ROL_EMPLEADO>'+PNUM_ROL_EMPLEADO+'</cre:PNUM_ROL_EMPLEADO>';
                    testData += '         <cre:PCOD_TIPO_JURIDI>'+a.Tipo_de_Persona__c+'</cre:PCOD_TIPO_JURIDI>';
                    testData += '         <cre:PCOD_CLIENTE>'+PCOD_CLIENTE+'</cre:PCOD_CLIENTE>';
                    testData += '         <cre:PCOD_SECTOR_ECONOM>'+'Sin clasificar'+'</cre:PCOD_SECTOR_ECONOM>';
                    testData += '         <cre:PFEC_CLIENTE>'+PFEC_CLIENTE+'</cre:PFEC_CLIENTE>';
                    testData += '         <cre:PCOD_ACTIVIDAD>'+PCOD_ACTIVIDAD+'</cre:PCOD_ACTIVIDAD>';
                    if ( a.SBIF_Sector__c != null){
                       testData += '         <cre:PCOD_SECTOR>'+a.SBIF_Sector__c+'</cre:PCOD_SECTOR>';
                    
                    testData = testData + '         <cre:PFEC_DECL_JURADA>'+PFEC_DECL_JURADA+'</cre:PFEC_DECL_JURADA>';     
                    }

                    if(a.Calle_Particular__c != null){
                        testData = testData + '         <cre:DIRECCION>';

                        testData = testData + '            <cre:PCOD_CIUDAD>'+a.Ciudad_o_Provincia_particular__c+'</cre:PCOD_CIUDAD>';
                        if(PCOD_COMUNAPART != '')
                            testData = testData + '            <cre:PCOD_COMUNA>'+PCOD_COMUNAPART+'</cre:PCOD_COMUNA>'; //+a.Comuna_particular__r.Name+
                        testData = testData + '            <cre:PCOD_PAIS>'+a.Pais_particular__c+'</cre:PCOD_PAIS>';
                        //testData = testData + '            <cre:PCOD_POSTAL></cre:PCOD_POSTAL>';
                        testData = testData + '            <cre:PCOD_REGION>'+a.Region_particular__c+'</cre:PCOD_REGION>';
                        testData = testData + '            <cre:PCOD_TIPODIR>2</cre:PCOD_TIPODIR>';
                        if(a.Numero_particular__c != null && a.Apartment__c !=null){
                            testData = testData + '            <cre:PGLS_DIRECCION>'+a.Calle_particular__c +' '+ a.Numero_particular__c+', '+ a.Apartment__c.toUpperCase()+'</cre:PGLS_DIRECCION>';
                        }else if(a.Numero_particular__c != null && a.Apartment__c ==null){
                            testData = testData + '            <cre:PGLS_DIRECCION>'+a.Calle_particular__c +' '+ a.Numero_particular__c+', '+'</cre:PGLS_DIRECCION>';
                        }
                        else if(a.Numero_particular__c == null && a.Apartment__c !=null){

                            testData = testData + '            <cre:PGLS_DIRECCION>'+a.Calle_particular__c +' '+ a.Numero_particular__c+', '+'</cre:PGLS_DIRECCION>';
                        }
                        else{
                            testData = testData + '            <cre:PGLS_DIRECCION>'+a.Calle_particular__c+'</cre:PGLS_DIRECCION>';
                        }
                       
                        if(a.PersonMobilePhone != null){
                            testData = testData + '            <cre:TELEFONO>';
                            //testData = testData + '               <CODIGO_FONO></cre:CODIGO_FONO>';
                            testData = testData + '               <cre:PCOD_TIPO_FONO>CELULAR</cre:PCOD_TIPO_FONO>';
                            testData = testData + '               <cre:PNUM_FONO>'+a.PersonMobilePhone.replace(' ','')+'</cre:PNUM_FONO>';
                            testData = testData + '            </cre:TELEFONO>';
                        }else{
                             testData = testData + '            <cre:TELEFONO></cre:TELEFONO>';

                        }
                        if(a.Particular_Phone_Other__pc != null){
                            testData = testData + '            <cre:TELEFONO>';
                            //testData = testData + '               <CODIGO_FONO></cre:CODIGO_FONO>';
                            testData = testData + '               <cre:PCOD_TIPO_FONO>FAX</cre:PCOD_TIPO_FONO>';
                            testData = testData + '               <cre:PNUM_FONO>'+a.Particular_Phone_Other__pc.replace(' ','')+'</cre:PNUM_FONO>';
                            testData = testData + '            </cre:TELEFONO>';

                        }else{
                             testData = testData + '            <cre:TELEFONO></cre:TELEFONO>';
                        }
                        
                        if(a.Particular_Landline__pc != null){
                            testData = testData + '            <cre:TELEFONO>';
                            //testData = testData + '               <CODIGO_FONO></cre:CODIGO_FONO>';
                            testData = testData + '               <cre:PCOD_TIPO_FONO>FIJO</cre:PCOD_TIPO_FONO>';
                            testData = testData + '               <cre:PNUM_FONO>'+a.Particular_Landline__pc.replace(' ','')+'</cre:PNUM_FONO>';
                            testData = testData + '            </cre:TELEFONO>';

                        }else{
                             testData = testData + '            <cre:TELEFONO></cre:TELEFONO>';
                        }                       
                        testData = testData + '         </cre:DIRECCION>';


                    }
                    if(a.Calle_comercial__c != null){
                        testData = testData + '         <cre:DIRECCION>';

                        testData = testData + '            <cre:PCOD_CIUDAD>'+a.Ciudad_o_Provincia_comercial__c+'</cre:PCOD_CIUDAD>';
                        if(PCOD_COMUNACOM != '')
                            testData = testData + '            <cre:PCOD_COMUNA>'+PCOD_COMUNACOM+'</cre:PCOD_COMUNA>'; //a.Comuna_comercial__r.Name
                        testData = testData + '            <cre:PCOD_PAIS>'+a.Pais_comercial__c+'</cre:PCOD_PAIS>';
                        //testData = testData + '            <PCOD_POSTAL></cre:PCOD_POSTAL>';
                        testData = testData + '            <cre:PCOD_REGION>'+a.Region_comercial__c+'</cre:PCOD_REGION>';
                        testData = testData + '            <cre:PCOD_TIPODIR>3</cre:PCOD_TIPODIR>';
                        if(a.Numero_comercial__c != null && a.Office_Number__c != null){
                            testData = testData + '            <cre:PGLS_DIRECCION>'+a.Calle_comercial__c +' '+ a.Numero_comercial__c+', '+a.Office_Number__c.toUpperCase()+'</cre:PGLS_DIRECCION>';
                        }else if(a.Numero_comercial__c == null && a.Office_Number__c != null){
                            testData = testData + '            <cre:PGLS_DIRECCION>'+a.Calle_comercial__c +' '+ a.Office_Number__c.toUpperCase()+'</cre:PGLS_DIRECCION>';
                        }else if(a.Numero_comercial__c != null && a.Office_Number__c == null){

                            testData = testData + '            <cre:PGLS_DIRECCION>'+a.Calle_comercial__c +' '+ a.Numero_comercial__c+', '+'</cre:PGLS_DIRECCION>';
                        }
                        else{

                            testData = testData + '            <cre:PGLS_DIRECCION>'+a.Calle_comercial__c+'</cre:PGLS_DIRECCION>';
                        }                        

                        if(a.Commercial_Phone_Other__c != null){
                            testData = testData + '            <cre:TELEFONO>';

                            //testData = testData + '               <CODIGO_FONO></cre:CODIGO_FONO>';
                            testData = testData + '               <cre:PCOD_TIPO_FONO>FAX</cre:PCOD_TIPO_FONO>';
                            testData = testData + '               <cre:PNUM_FONO>'+a.Commercial_Phone_Other__c.replace(' ','')+'</cre:PNUM_FONO>';
                            testData = testData + '            </cre:TELEFONO>';

                        }else{
                             testData = testData + '            <cre:TELEFONO></cre:TELEFONO>';
                        }
                        if(a.Phone != null){
                            testData = testData + '            <cre:TELEFONO>';
                            //testData = testData + '               <CODIGO_FONO></cre:CODIGO_FONO>';
                            testData = testData + '               <cre:PCOD_TIPO_FONO>FIJO</cre:PCOD_TIPO_FONO>';
                            testData = testData + '               <cre:PNUM_FONO>'+a.Phone.replace(' ','')+'</cre:PNUM_FONO>';
                            testData = testData + '            </cre:TELEFONO>';

                        }else{
                             testData = testData + '            <cre:TELEFONO></cre:TELEFONO>';
                        }
                        if(a.Commercial_FAX_Other__c != null){
                            testData = testData + '            <cre:TELEFONO>';
                            //testData = testData + '               <CODIGO_FONO></cre:CODIGO_FONO>';
                            testData = testData + '               <cre:PCOD_TIPO_FONO>CELULAR</cre:PCOD_TIPO_FONO>';
                            testData = testData + '               <cre:PNUM_FONO>'+a.Commercial_Cellphone__c.replace(' ','')+'</cre:PNUM_FONO>';
                            testData = testData + '            </cre:TELEFONO>';

                        }else{
                             testData = testData + '            <cre:TELEFONO></cre:TELEFONO>';
                        }
                        testData = testData + '         </cre:DIRECCION>';

                    }
                    if(a.PersonEmail != null){
                        testData = testData + '         <cre:EMAIL>';

                        testData = testData + '            <cre:PGLS_DIRMAIL>'+a.PersonEmail+'</cre:PGLS_DIRMAIL>';
                        //testData = testData + '            <PNUM_SECUENCIA></cre:PNUM_SECUENCIA>';
                        testData = testData + '         </cre:EMAIL>';

                    }
                    if(a.Commercial_Email__pc != null){
                        testData = testData + '         <cre:EMAIL>';

                        testData = testData + '            <cre:PGLS_DIRMAIL>'+a.Commercial_Email__pc+'</cre:PGLS_DIRMAIL>';
                        //testData = testData + '            <PNUM_SECUENCIA></cre:PNUM_SECUENCIA>';
                        testData = testData + '         </cre:EMAIL>';

                    }
                    if(PCOD_TIPOCLI != null)
                        testData += '<cre:PCOD_TIPOCLI>'+PCOD_TIPOCLI+'</cre:PCOD_TIPOCLI>';
                    if(PCOD_SUBTIPOCLI != null)
                       testData += '<cre:PCOD_SUBTIPOCLI>'+PCOD_SUBTIPOCLI+'</cre:PCOD_SUBTIPOCLI>';
                    if(PCOD_CLAS_SEG != null)
                        testData += '<cre:PCOD_CLAS_SEG>'+PCOD_CLAS_SEG+'</cre:PCOD_CLAS_SEG>';
                    if(PCOD_TIP_CLI_CL != null)
                        testData += '<cre:PCOD_TIP_CLI_CL>'+PCOD_TIP_CLI_CL+'</cre:PCOD_TIP_CLI_CL>';
                    if(PCOD_TIPO_FATCA != null)
                        testData += '<cre:PCOD_TIPO_FATCA>'+PCOD_TIPO_FATCA+'</cre:PCOD_TIPO_FATCA>';
                    if(PCOD_INTIN != null)
                        testData += '<cre:PCOD_INTIN>'+PCOD_INTIN+'</cre:PCOD_INTIN>';
                    if(PCOD_IDGIN != null)
                        testData += '<cre:PCOD_IDGIN>'+PCOD_IDGIN+'</cre:PCOD_IDGIN>';
                    if(PCOD_CLARIE != null)
                        testData += '<cre:PCOD_CLARIE>'+PCOD_CLARIE+'</cre:PCOD_CLARIE>';                     
                    
                    
                    testData += '        </cre:Cif>';
                    testData += '      </cre:CrearCleinteBice>';
                    testData += '   </soapenv:Body>';
                    testData += '</soapenv:Envelope>'; System.debug('Tipo de cliente (N):'+PCOD_TIPO_JURIDI);
                    BICE_Account_Int10.callInt10(a.Id, testData);
               }
           }

           else if(PCOD_TIPO_JURIDI == '2'){ //PERSONA JURIDICA
                 List<User> EjComex = [SELECT ROL_Number__c FROM User WHERE Id =:a.Ejecutivo_COMEX__c];
                 if(EjComex.size()>0)
                       PCOD_OPERADOR_COMEX  = EjComex[0].ROL_Number__c;                  
                   else
                       PCOD_OPERADOR_COMEX  = '0'; 
                 List<User> us = [SELECT ROL_Number__c FROM User WHERE Id =:a.LastModifiedById];
                   if(us.size()>0)
                       COD_OPERADOR = us[0].ROL_Number__c;                  
                   else
                       COD_OPERADOR = '0';
                  
                  List<Giro__c> GiroList = [SELECT Name FROM Giro__c WHERE Id =:a.Giro_Inv__c];
                   if(GiroList.size()>0)
                       GIRO = GiroList[0].Name;                  
                          
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
                //PCOD_OPERADOR_COMEX = a.Ejecutivo_COMEX__r.Rol_Number__c;
                
                if(a.Taxes__c == true)
                    PCOD_PAGA_IVA = '1';
                else
                    PCOD_PAGA_IVA = '0';    
                /////////////////////////
                PCOD_AGRUPACION = a.Customer_Legal_Person_Consumer__c;
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
                (a.Fecha_de_declaracion_de_margen__c != old.Fecha_de_declaracion_de_margen__c) ||
                (a.Ejecutivo_COMEX__c != old.Ejecutivo_COMEX__c) ||
                (a.Giro_Inv__c != old.Giro_Inv__c)||
                    Test.isRunningTest())
                {

                    testData = '';
                    testData += '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cre="'+soapNS+'">';
                    testData += '   <soapenv:Header/>';
                    testData += '   <soapenv:Body>';
                    testData += '      <cre:CrearCleinteBice>';
                    testData += '         <cre:indicadorCif>1</cre:indicadorCif>';
                    //testData += '         <cre:indicadorSebra>1</cre:indicadorSebra>';
                    testData += '         <cre:Cif>';  
                    testData += '         <cre:COD_CANAL>501</cre:COD_CANAL>';
                    testData += '         <cre:GLOSA_APLICACION>INGRESO POR CRM</cre:GLOSA_APLICACION>';
                    testData += '         <cre:COD_SUCURSAL>'+a.Sucursal_Banco__c+'</cre:COD_SUCURSAL>';
                    testData += '         <cre:COD_OPERADOR>'+COD_OPERADOR+'</cre:COD_OPERADOR>';
                    testData += '         <cre:TIPO_IDEN_CLIENTE>1</cre:TIPO_IDEN_CLIENTE>';
                    testData += '         <cre:IDEN_CLIENTE>'+(a.Rut__c.replace('-','')).replace('.','')+'</cre:IDEN_CLIENTE>';
                    if ( PNUM_ROL_EMPLEADO!=null ){
                       testData += '         <cre:PNUM_ROL_EMPLEADO>'+PNUM_ROL_EMPLEADO+'</cre:PNUM_ROL_EMPLEADO>';
                    }else{
                       testData += '         <cre:PNUM_ROL_EMPLEADO>0</cre:PNUM_ROL_EMPLEADO>';
                    }
                    testData += '         <cre:PCOD_TIPO_JURIDI>'+a.Tipo_de_Persona__c+'</cre:PCOD_TIPO_JURIDI>';
                    testData += '         <cre:PCOD_CLIENTE>'+PCOD_CLIENTE+'</cre:PCOD_CLIENTE>';
                    testData += '         <cre:PCOD_TIPO_CLIENTE>'+PCOD_TIPO_CLIENTE+'</cre:PCOD_TIPO_CLIENTE>';
                    if ( a.Sub_Sector_Economico__c != null ){
                        testData += '         <cre:PCOD_SECTOR_ECONOM>'+a.Sub_Sector_Economico__c+'</cre:PCOD_SECTOR_ECONOM>';
                    }
                    else{
                        testData += '         <cre:PCOD_SECTOR_ECONOM>'+'Sin clasificar'+'</cre:PCOD_SECTOR_ECONOM>';
                    }
                    testData += '         <cre:PFEC_CLIENTE>'+PFEC_CLIENTE+'</cre:PFEC_CLIENTE>';
                    if(a.Actividad_Economica_SBIF__c!=null){
                        testData += '         <cre:PCOD_ACTIVIDAD>'+PCOD_ACTIVIDAD+'</cre:PCOD_ACTIVIDAD>';
                    }
                    if(a.SBIF_Sector__c != null){
                        testData += '         <cre:PCOD_SECTOR>'+a.SBIF_Sector__c+'</cre:PCOD_SECTOR>';
                    }
                    testData = testData + '         <cre:PFEC_DECL_JURADA>'+PFEC_DECL_JURADA+'</cre:PFEC_DECL_JURADA>';

                    if(a.Calle_comercial__c != null){
                        testData = testData + '         <cre:DIRECCION>';

                        testData = testData + '            <cre:PCOD_CIUDAD>'+a.Ciudad_o_Provincia_comercial__c+'</cre:PCOD_CIUDAD>';
                        if(PCOD_COMUNACOM != '')
                            testData = testData + '            <cre:PCOD_COMUNA>'+PCOD_COMUNACOM+'</cre:PCOD_COMUNA>'; //a.Comuna_comercial__r.Name
                        testData = testData + '            <cre:PCOD_PAIS>'+a.Pais_comercial__c+'</cre:PCOD_PAIS>';
                        //testData = testData + '            <cre:PCOD_POSTAL></cre:PCOD_POSTAL>';
                        testData = testData + '            <cre:PCOD_REGION>'+a.Region_comercial__c+'</cre:PCOD_REGION>';
                        testData = testData + '            <cre:PCOD_TIPODIR>3</cre:PCOD_TIPODIR>';
                        if(a.Numero_comercial__c != null && a.Office_Number__c != null){
                            testData = testData + '            <cre:PGLS_DIRECCION>'+a.Calle_comercial__c +' '+ a.Numero_comercial__c+', '+a.Office_Number__c.toUpperCase()+'</cre:PGLS_DIRECCION>';
                        }else if(a.Numero_comercial__c == null && a.Office_Number__c != null){
                            testData = testData + '            <cre:PGLS_DIRECCION>'+a.Calle_comercial__c +' '+ a.Office_Number__c.toUpperCase()+'</cre:PGLS_DIRECCION>';
                        }else if(a.Numero_comercial__c != null && a.Office_Number__c == null){

                            testData = testData + '            <cre:PGLS_DIRECCION>'+a.Calle_comercial__c +' '+ a.Numero_comercial__c+', '+'</cre:PGLS_DIRECCION>';
                        }
                        else{

                            testData = testData + '            <cre:PGLS_DIRECCION>'+a.Calle_comercial__c+'</cre:PGLS_DIRECCION>';
                        }
                  
                        if(a.Commercial_Cellphone__c != null){
                            testData = testData + '            <cre:TELEFONO>';                           
                            testData = testData + '               <cre:PCOD_TIPO_FONO>CELULAR</cre:PCOD_TIPO_FONO>';
                            testData = testData + '               <cre:PNUM_FONO>'+a.Commercial_Cellphone__c.replace(' ','')+'</cre:PNUM_FONO>';
                            testData = testData + '            </cre:TELEFONO>';
                        }else{
                             testData = testData + '            <cre:TELEFONO></cre:TELEFONO>';
                        }
                        if(a.Phone != null){
                            testData = testData + '            <cre:TELEFONO>';                          
                            testData = testData + '               <cre:PCOD_TIPO_FONO>FIJO</cre:PCOD_TIPO_FONO>';
                            testData = testData + '               <cre:PNUM_FONO>'+a.Phone.replace(' ','')+'</cre:PNUM_FONO>';
                            testData = testData + '            </cre:TELEFONO>';
                        }else{
                             testData = testData + '            <cre:TELEFONO></cre:TELEFONO>';
                        }
                        if(a.Commercial_Phone_Other__c != null){
                            testData = testData + '            <cre:TELEFONO>';
                            testData = testData + '               <cre:PCOD_TIPO_FONO>FAX</cre:PCOD_TIPO_FONO>';
                            testData = testData + '               <cre:PNUM_FONO>'+a.Commercial_Phone_Other__c.replace(' ','')+'</cre:PNUM_FONO>';
                            testData = testData + '            </cre:TELEFONO>';

                        }else{
                             testData = testData + '            <cre:TELEFONO></cre:TELEFONO>';
                        }
                        
                       // testData = testData + '         </cre:DIRECCION>';
                    
                        if ( a.Commercial_Landline__c != null ){
                            testData += '            <cre:TELEFONO>';
                            testData += '               <cre:PCOD_TIPO_FONO>CELULAR</cre:PCOD_TIPO_FONO>';
                            testData += '               <cre:PNUM_FONO>'+a.Commercial_Landline__c.replace(' ','')+'</cre:PNUM_FONO>';
                            testData += '            </cre:TELEFONO>';
                        } else{
                            testData += '            <cre:TELEFONO></cre:TELEFONO>';
                        }
                        if(a.Commercial_FAX_Other__c != null){
                            testData += '            <cre:TELEFONO>';
                            testData += '               <cre:PCOD_TIPO_FONO>FAX</cre:PCOD_TIPO_FONO>';
                            testData += '               <cre:PNUM_FONO>'+a.Commercial_FAX_Other__c.replace(' ','')+'</cre:PNUM_FONO>';
                            testData += '            </cre:TELEFONO>';
                        }else{
                            testData += '            <cre:TELEFONO></cre:TELEFONO>';
                        }
                        testData += '         </cre:DIRECCION>';
                    }
                
                for(Contact c : BICE_AccountTriggerHandler.getAccountContacts(a.Id)){
                        testData = testData + '         <cre:CONTACTO>';
                        if(c.Cargo__c != null){
                            testData = testData + '            <cre:PCOD_CARGO>'+c.Cargo__c+'</cre:PCOD_CARGO>';
                        }
                        if(c.Tipo_de_Contacto__c !=null)
                            testData = testData + '            <cre:PCOD_TIPO_CONTACTO>'+c.Tipo_de_Contacto__c+'</cre:PCOD_TIPO_CONTACTO>';
                        if(c.Email != null){
                            testData = testData + '            <cre:PGLS_EMAIL>'+c.Email+'</cre:PGLS_EMAIL>';
                        }
                        testData = testData + '            <cre:PNOM_MATERNO>'+c.Apellido_materno__c+'</cre:PNOM_MATERNO>';
                        testData = testData + '            <cre:PNOM_NOMBRES>'+c.FirstName+'</cre:PNOM_NOMBRES>';
                        testData = testData + '            <cre:PNOM_PATERNO>'+c.LastName+'</cre:PNOM_PATERNO>';
                        if(c.MobilePhone != null){
                            testData = testData + '            <cre:PNUM_CELULAR>'+c.MobilePhone+'</cre:PNUM_CELULAR>';
                        }
                        if(c.FAX != null){
                            testData = testData + '            <cre:PNUM_FAX>'+c.Fax+'</cre:PNUM_FAX>';
                        }
                        if(c.Phone != null){
                            testData = testData + '            <cre:PNUM_FONO>'+c.Phone+'</cre:PNUM_FONO>';
                        }
                        testData = testData + '         </cre:CONTACTO>';
                    }
                    if(PCOD_PAGA_IVA != null){
                        testData += '<cre:PCOD_PAGA_IVA>'+PCOD_PAGA_IVA+'</cre:PCOD_PAGA_IVA>';                    
                        testData += '<cre:PCOD_AGRUPACION>'+PCOD_AGRUPACION+'</cre:PCOD_AGRUPACION >';
                        }
                     if(GIRO != null){    
                        testData = testData + '<cre:GIRO>';
                        testData = testData +   '<cre:PGLS_GIRO>'+GIRO+'</cre:PGLS_GIRO>';
                        testData = testData +   '<cre:PCOD_PRINCIPAL>'+'SI'+'</cre:PCOD_PRINCIPAL>';
                        testData = testData + '</cre:GIRO>'; 
                     }   
                    if(PCOD_OPERADOR_COMEX != null)
                        testData = testData +'<cre:PCOD_OPERADOR_COMEX>'+PCOD_OPERADOR_COMEX+'</cre:PCOD_OPERADOR_COMEX>';    
                    testData += '        </cre:Cif>';
                    testData += '      </cre:CrearCleinteBice>';
                    testData += '   </soapenv:Body>';                    
                    testData += '</soapenv:Envelope>';System.debug('Tipo de cliente:'+PCOD_TIPO_JURIDI);

                    BICE_Account_Int10.callInt10(a.Id, testData);

                    }
                
                else {
                    System.debug('Otro tipo de cliente');
                }
            } //cierra persona juridica
        } //Cierra FOR que recorre registro de cuenta
        /* END Integration INT-10 */
    }


    private static void updateMacStatusOnLeads(Map<Id, Account> oldMap, Map<Id, Account> newMap) {
        Set<Id> accountIdsToUpdate = new Set<Id>();
        List<Lead> leads = new List<Lead>(); // All Leads from Updated Mac Status Accounts

        for (Id accountId : newMap.keySet()) {
            Account newAccount = newMap.get(accountId);
            Account oldAccount = oldMap.get(accountId);
            if (newAccount.Current_MAC_Status__c != oldAccount.Current_MAC_Status__c ||  
            newAccount.Tiene_Cuenta_Corriente__c!= oldAccount.Tiene_Cuenta_Corriente__c ||
            newAccount.Tiene_Garantia_Hipotecaria__c != oldAccount.Tiene_Garantia_Hipotecaria__c ||  
            newAccount.Tiene_Margen_Hipotecario__c != oldAccount.Tiene_Margen_Hipotecario__c
            )
                accountIdsToUpdate.add(accountId);
        }
        //Get converted Leads
        leads = [ SELECT  Id, ConvertedAccountId, Current_MAC_Staus__c,Tiene_Cuenta_Corriente__c,Tiene_Garantia_Hipotecaria__c,Tiene_Margen_Hipotecario__c
                    FROM  Lead
                    WHERE ConvertedAccountId IN :accountIdsToUpdate ];

        //Fill list to update
        for(Lead lead : leads){
            lead.Current_MAC_Staus__c = newMap.get(lead.ConvertedAccountId).Current_MAC_Status__c;
           // lead.Fecha_resultado_comit__c = newMap.get(lead.ConvertedAccountId).Current_MAC_Presentation_Date__c;
            lead.Tiene_Cuenta_Corriente__c = newMap.get(lead.ConvertedAccountId).Tiene_Cuenta_Corriente__c;
            lead.Tiene_Garantia_Hipotecaria__c = newMap.get(lead.ConvertedAccountId).Tiene_Garantia_Hipotecaria__c;
            lead.Tiene_Margen_Hipotecario__c = newMap.get(lead.ConvertedAccountId).Tiene_Margen_Hipotecario__c;
            lead.Account_Executive__c = newMap.get(lead.ConvertedAccountId).Ejecutivo_de_Cuenta__c;
        }

        //update Leads
        if (leads.size() > 0) update leads;
    }

}