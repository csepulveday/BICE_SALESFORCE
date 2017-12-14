public class MyContactListController {
    
    @AuraEnabled
    public String NumCamp {get;set;}
    @AuraEnabled
    public String NumCasos {get;set;}
    @AuraEnabled
    public List<CampaignMember> ListaCampanas {get;set;}
    @AuraEnabled
    public List<BICE_Fin_Account__c> ListaFinAccounts {get;set;} 
    @AuraEnabled
    public List<BICE_Fin_Account__c> ListaProductos {get;set;} 
    /*@AuraEnabled
    public List<BICE_Alert__c> ListaAlertasTrans {get;set;}
    @AuraEnabled
    public Integer ListaAlertasTransCont {get;set;}
    @AuraEnabled
    public List<BICE_Alert__c> ListaAlertasReg {get;set;}
    @AuraEnabled
    public List<BICE_Alert__c> ListaAlertasVio {get;set;}
    @AuraEnabled*/
    public Date FechaUltimoContacto {get;set;}    
    @AuraEnabled
    public String CanalUltimoContacto {get;set;} 
    @AuraEnabled
    public List<String> StringProductos {get;set;}              
    public String urlfp;
    @AuraEnabled
    public List<String> IconosFamilia {get;set;} 
    @AuraEnabled
    public Decimal SumaMontoApv;
    @AuraEnabled
    public Decimal SumaMontoEur;
    @AuraEnabled
    public Decimal SumaMontoPeso;
    @AuraEnabled
    public Decimal SumaMontoUsd;
    @AuraEnabled
    public List<String> ListaAum {get;set;}
    @AuraEnabled
    public Decimal SumaValorDeudaBICE;
    @AuraEnabled
    public Decimal SumaValorDeudaSBIF;
    @AuraEnabled
    public Decimal SumaFactoring;
    @AuraEnabled
    public Decimal SumaLeasing;
    @AuraEnabled
    public List<String> ListaDeuda {get;set;}
    
    public MyContactListController(){
        ListaAum = new List<String>();
        ListaDeuda = new List<String>();
    }
    
    @AuraEnabled
    public static List<Account> getContacts(Id accountId) {
        system.debug('Id Cuenta: '+accountId);

        return [Select Id, 
                Name,
                Inv_Tipo_Cliente__c,
                AUM__c,
                Amount_Opps__c,
                Oportunidaes__c,
                Cliente_BIA__c,
                Favorite_Channel__c,
                Perfil_de_inversionista__c,
                Filled_Client_Data__c,
                Perfil_de_Riesgo__c,
                Rentabilidad_30_dias__c,
                Rentabilidad_12_meses__c,
                Rentabilidad_1_dia__c,
                LastActivityDate,
                Segmento__c,
                CreatedDate,
                Cargo__pc,
                X360_view_Net_Profit__c,
                X360_view_Net_Profit_Group_PJ__c,
                X360_view_Occupation__c,
                X360_view_mail_icon__c,
                X360_view_Maximum_exposure_level__c,
                X360_view_Current_Exposure_Level__c,
                X360_view_IVC__c,
                X360_view_EyC_Filled_Data_Client__c,
                X360_view_MN_Saldos_Activos__c,
                X360_view_MX_Saldos_Activos__c,
                X360_View_MN_Creditos_Pasivos__c,
                X360_View_MX_Creditos_Pasivos__c,
                X360_View_Fecha_Ultimo_IVA__c,
                X360_View_Fecha_Ultimo_Balance__c,
                X360_View_Deuda_BICE__c,
                X360_View_Deuda_SBIF__c,
                X360_view_Total_Risk__c,
                X360_view_Company__c,
                X360_view_Line_Duedate__c,
                Cluster__c,
                X360_View_Dolares_BICE__c,
                X360_View_Alertas_Banco__c,
                Segmentation__c,
                Current_MAC_Expiration_Date__c,
                Monto_MAC_creado__c,
                Cliente_desde__c,
                Clasificacion_de_Riesgo_SBIF__c,
                Industry,
                MDR__c,
                Profession__pc,
                RUT__c,
                Actividad_Economica_SBIF__c,
                Prior_MAC_Expiration_Date__c,
                Prior_MAC_Credit_Limit__c,
                X360_SPREAD_PROM__C,
                X360_SPREAD_BRUT__c,
                X360_MASCO__c,
                X360_Inv_Rentabilidad_12_USD__c,
                X360_Inv_Rentabilidad_12_APV__c,
                X360_Nmb_Subsegmento__c
                From Account WHERE Id =:accountId];      
    }
    
    @AuraEnabled
    public static String getActiveCampaigns(Id accountId){ 
        MyContactListController mc = new MyContactListController();
        AggregateResult[] groupedResults= 
            [SELECT Count(Id)camp FROM CampaignMember 
             WHERE CompanyOrAccount =:MyContactListController.getAccountName(accountId).Name];
        for (AggregateResult ar : groupedResults)  {
            System.debug('Average amount' + ar.get('camp'));
            mc.NumCamp = String.valueOf(ar.get('camp'));
        }
  
        return mc.NumCamp;
    }
    
    @AuraEnabled
    public static List<CampaignMember> getCampaignList(Id accountId){ 
        MyContactListController mc = new MyContactListController();
        mc.ListaCampanas = 
        [SELECT Campaign.Name, Campaign.Id FROM CampaignMember 
         WHERE CompanyOrAccount =:MyContactListController.getAccountName(accountId).Name];
        /*for(CampaignMember a: mc.ListaCampanas){
           if(mc.ListaCampanas.size() == 0)
                mc.auxListaCampanas.add('No tiene campañas asociadas.');
           else
                mc.auxListaCampanas.add(String.valueOf(a));
        }*/
            
        return mc.ListaCampanas;
    }
    
    @AuraEnabled
    public static List<BICE_Fin_Account__c> getFinAccounts(Id accountId){ 
        MyContactListController mc = new MyContactListController();
        mc.ListaFinAccounts = 
        [SELECT Name   /*X360_view_Line_Duedate__c*/ 
         FROM BICE_Fin_Account__c 
         WHERE Customer__c =:accountId AND X360_view_Product_Family__c = 'Línea Sobregiro'];
            
        return mc.ListaFinAccounts;
    }
    
    @AuraEnabled
    public static List<BICE_Fin_Account__c> getProductList(Id accountId){ 
        MyContactListController mc = new MyContactListController();
        mc.ListaProductos = 
        [SELECT Product__r.Name,Product__r.Family
         FROM BICE_Fin_Account__c 
         WHERE Customer__c =:accountId];
        
      /*  for(BICE_Fin_Account__c s: mc.ListaProductos){
           mc.StringProductos.add(s + '<br/>');
            System.debug('Lista Prods: '+mc.StringProductos);
        }*/
        
        return mc.ListaProductos;
    }
    
    @AuraEnabled
    public static String getCountCases(Id accountId){ 
        MyContactListController mc = new MyContactListController();
        AggregateResult[] groupedResults = [SELECT Count(Id)cont FROM Case 
                                            WHERE AccountId =:accountId];
        for (AggregateResult ar : groupedResults)  {
            System.debug('Casos' + ar.get('cont'));
            mc.NumCasos = String.valueOf(ar.get('cont'));
        }
  
        return mc.NumCasos;
    }
    
    @AuraEnabled
    public static String getLastContact(Id accountId){
        MyContactListController mc = new MyContactListController();
        Date FechaContactoTarea;
        Date FechaContactoEvento;
        String InfoContacto = '';
        List<Task> UltimaTarea = new List<Task>();
        List<Event> UltimoEvento = new List<Event>();
        /*try{*/
        
        UltimaTarea = [    SELECT LastModifiedDate,Tasksubtype 
                                FROM Task 
                                WHERE WHATID =: accountId
                                AND (TaskSubtype = 'Email' OR Tasksubtype = 'Call')
                                ORDER BY LastModifiedDate DESC LIMIT 1];
        
       UltimoEvento = [SELECT StartDateTime 
                              FROM Event 
                              WHERE WHATID =: accountId
                              ORDER BY StartDateTime DESC LIMIT 1];
        if(UltimaTarea.size() <= 0 & UltimoEvento.size() <= 0)
            return 'Sin contactar';
        else{
            If(UltimaTarea.size() > 0)
                    FechaContactoTarea = UltimaTarea[0].LastModifiedDate.date();
            
            If(UltimoEvento.size() > 0)
                    FechaContactoEvento = UltimoEvento[0].StartDateTime.date();    
            
            System.debug('FechaContactoTarea: '+FechaContactoTarea+'FechaContactoEvento: '+FechaContactoEvento);
            
         //   If(FechaContactoTarea != null && FechaContactoEvento != null){
                
                if(FechaContactoEvento > FechaContactoTarea){
                    mc.FechaUltimoContacto = FechaContactoEvento;
                    mc.CanalUltimoContacto = 'Evento';
                   InfoContacto = mc.CanalUltimoContacto+'<br/><br/>'+DateTimeConversion(mc.FechaUltimoContacto);
                }
                else{
                    mc.FechaUltimoContacto = FechaContactoTarea;
                    mc.CanalUltimoContacto =  UltimaTarea[0].Tasksubtype;
                    InfoContacto = String.valueOf(mc.FechaUltimoContacto.daysBetween(System.TODAY()));

                   // InfoContacto = mc.CanalUltimoContacto+'<br/><br/>'+DateTimeConversion(mc.FechaUltimoContacto);
                }          
                
           // }
            }
            
        /* }catch(Exception e){
          
        }    */
        system.debug('MC: '+mc);    
        return InfoContacto;
    }
    
    @AuraEnabled
    public static String DateTimeConversion(Date FechaContacto){       
        
        Date newDate = date.newInstance(FechaContacto.year(), FechaContacto.month(), FechaContacto.day());
        String newFormat = newDate.format();

        return newFormat;
    }
    
    /*@AuraEnabled
    public static List<BICE_Alert__c> getAlertList(Id accountId){ 
        MyContactListController mc = new MyContactListController();
        mc.ListaAlertasTrans = new List<BICE_Alert__c>();
        mc.ListaAlertasTransCont = 0;
      /*  for(BICE_Fin_Account__c b :
        [SELECT (SELECT Type_of_alert__c FROM BICE_Alerts__r) FROM BICE_Fin_Account__c 
        WHERE Customer__c =:accountId AND Id IN (SELECT BICE_Fin_Account__c FROM BICE_Alert__c)])
        {   
             for(BICE_Alert__c balert: b.BICE_Alerts__r){
                 if(balert != null)
                   mc.ListaAlertasTrans.add(balert);          
             }
            mc.ListaAlertasTransCont = mc.ListaAlertasTrans.size();
            System.debug('Numero Alertas: '+mc.ListaAlertasTransCont);
        }*/
       // return mc.ListaAlertasTrans;
    //}
    
    @AuraEnabled
    public static Account getAccountName(Id accountId) {
        return [Select Id, 
                Name,
                Rut__c
                From Account WHERE Id =:accountId];
        
    }
    
    @AuraEnabled
    public Static String getMostrarURLFP(Id accountId){
        MyContactListController mc = new MyContactListController();
       /* Account acc = [SELECT RUT__c FROM Account WHERE Id =:accountId ];
        MyContactListController mc = new MyContactListController();
        FinanzasPersonalesController fp = new FinanzasPersonalesController();
        String rutSinPuntos = (acc.RUT__c).remove('.');
        System.debug('RUTSINPUNTO: '+rutSinPuntos);
        String rutSinPuntosGuion = rutSinPuntos.remove('-');
       // String rutFinal = rutSinPuntosGuion.replaceAll('', String replacement)(' ');
       // System.debug('rutFinal: '+rutFinal);        
        if(!Test.isRunningTest()){
                fp.FinPersonalesCallout(rutSinPuntosGuion);
                mc.urlfp = fp.URLFPersonales;
        }else
             mc.urlfp = '';
        System.debug('URL:'+mc.urlfp);*/
        mc.urlfp = '';
        return mc.urlfp;
    }

    @AuraEnabled
    public Static String getIconosFamiliaProd(Id accountId){

        MyContactListController mc = new MyContactListController();
        Document doc = new Document();
        set<string> setFamilias = new set<string>();
        mc.IconosFamilia = new List<String>();
        List<String> auxFamilias = new List<String>();
        integer ct = 0;
        mc.ListaProductos = 
        [SELECT Product__r.Family,Product__r.Name
         FROM BICE_Fin_Account__c
         WHERE Customer__c =:accountId];

        for(BICE_Fin_Account__c bfa: mc.ListaProductos){
            
            System.debug('FAMILIAS: '+bfa.Product__r.Family);
            doc = [SELECT Id,Name FROM Document WHERE Name =: bfa.Product__r.Family];
              
                    if(!String.isBlank(doc.Id))
                        setFamilias.add(ArmarURLFAMILIAS(doc.Id, doc.Name));
                
        }
        mc.IconosFamilia.addAll(setFamilias);
        System.debug('mc.IconosFamilia: '+mc.IconosFamilia);
        for(String a: mc.IconosFamilia){           
            ct = ct + 1;
                if(ct == 3){
                    auxFamilias.add(a+'<br/>');
                    System.debug('auxFamilias: '+auxFamilias);
                    ct = 0;
                }
                else{
                     auxFamilias.add(a);
                }
        }
        string allstring = string.join(auxFamilias,',');
        string allstring2 = allstring.remove(',');

        return allstring2;
    }

    public static String ArmarURLFAMILIAS(String IdDoc, String nombreFamilia){
        String urlfamilia = '/servlet/servlet.FileDownload?file='+IdDoc;
        String ImgHTML = '<img src="'+urlfamilia+'" height="30" width="30" title="'+nombreFamilia+'"/>';

        return ImgHTML;      

    }
    
    @AuraEnabled
    public Static List<String> getAumInversiones(Id accountId){
        String APV = '';
        String Euro = '';
        String Peso = '';
        String USD = '';
        
        MyContactListController mc = new MyContactListController();
        BICE_Aum_Inversiones_Controller auminv = new BICE_Aum_Inversiones_Controller();
        String rutSinPuntos = (MyContactListController.getAccountName(accountId).RUT__c).remove('.');
        System.debug('RUTSINPUNTO: '+rutSinPuntos);
        String rutSinPuntosGuion = rutSinPuntos.remove('-');
       // String rutFinal = rutSinPuntosGuion.replaceAll('', String replacement)(' ');
       // System.debug('rutFinal: '+rutFinal);        
        //if(!Test.isRunningTest()){
                auminv.AUM_INVERS_Callout(rutSinPuntosGuion);
                mc.SumaMontoApv = auminv.SumaMontoApv;
                mc.SumaMontoEur = auminv.SumaMontoEur;
                mc.SumaMontoPeso = auminv.SumaMontoPeso;
                mc.SumaMontoUsd = auminv.SumaMontoUsd;
            
            APV = String.valueOf(mc.SumaMontoApv);
            Euro = String.valueOf(mc.SumaMontoEur);
            Peso = String.valueOf(mc.SumaMontoPeso);
            USD = String.valueOf(mc.SumaMontoUsd);
            
            mc.ListaAum.add(APV);
            mc.ListaAum.add(Euro);
            mc.ListaAum.add(Peso);
            mc.ListaAum.add(USD);
            System.debug('ListaAum: '+mc.ListaAum); 
            System.debug('SumaMontoAPVMC: '+mc.SumaMontoAPV); 
            System.debug('SumaMontoEURMC: '+mc.SumaMontoEUR);
            System.debug('SumaMontoPesoMC: '+mc.SumaMontoPeso);
            System.debug('SumaMontoUSDMC: '+mc.SumaMontoUSD); 
        //}else{}
        return mc.ListaAum;
    }
    
    @AuraEnabled
    public Static List<String> getDeudaEYC(Id accountId){
        String APV = '';
        String Euro = '';
        String Peso = '';
        String USD = '';
        
        MyContactListController mc = new MyContactListController();
        BICE_Deuda360_Controller auminv = new BICE_Deuda360_Controller();
        String rutSinPuntos = (MyContactListController.getAccountName(accountId).RUT__c).remove('.');
        System.debug('RUTSINPUNTO: '+rutSinPuntos);
        String rutSinPuntosGuion = rutSinPuntos.remove('-');
       // String rutFinal = rutSinPuntosGuion.replaceAll('', String replacement)(' ');
       // System.debug('rutFinal: '+rutFinal);        
        //if(!Test.isRunningTest()){
                auminv.Deuda_SBIF_BICE_Callout(rutSinPuntosGuion);
                mc.SumaValorDeudaBICE = auminv.SumaValorDeudaBICE;
                mc.SumaValorDeudaSBIF = auminv.SumaValorDeudaSBIF;
                mc.SumaFactoring = auminv.SumaFactoring;
                mc.SumaLeasing = auminv.SumaLeasing;
            
            APV = String.valueOf(mc.SumaValorDeudaBICE);
            Euro = String.valueOf(mc.SumaValorDeudaSBIF);
            Peso = String.valueOf(mc.SumaFactoring);
            USD = String.valueOf(mc.SumaLeasing);
            
            mc.ListaDeuda.add(APV);
            mc.ListaDeuda.add(Euro);
            mc.ListaDeuda.add(Peso);
            mc.ListaDeuda.add(USD);
            System.debug('ListaAum: '+mc.ListaAum); 
            System.debug('SumaValorDeudaBICE: '+mc.SumaValorDeudaBICE); 
            System.debug('SumaValorDeudaSBIF: '+mc.SumaValorDeudaSBIF);
            System.debug('SumaFactoring: '+mc.SumaFactoring);
            System.debug('SumaLeasing: '+mc.SumaLeasing); 
        //}else{}
        return mc.ListaDeuda;
    }
}