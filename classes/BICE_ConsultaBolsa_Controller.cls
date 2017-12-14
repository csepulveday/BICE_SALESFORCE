public class BICE_ConsultaBolsa_Controller{

    public BICE_ConsultaBolsa_Controller(ApexPages.StandardController controller) {

    }


    public BICE_ConsultaBolsa_Controller() {

    }

        public string Rut_usuario;
        public string Rut_cliente;
        public integer cuenta = 0;
        public integer perfil;
        public String url_redirect;
        public string AccId;
        public String OppId;
        public string token_resp {get;set;}
        public string token_status {get;set;}
        
        
        public PageReference ConsultaBolsaCallout(){
                
                string usuario = userinfo.getUserId();
                Rut_usuario = [Select Username_Bolsa__c from User where Id =: usuario].Username_Bolsa__c;
                perfil = integer.valueOf([Select Perfil_Bolsa__c from User where Id =: usuario].Perfil_Bolsa__c);
                String id = ApexPages.currentpage().getparameters().get('id');
                if(id.startsWith('006')){
                        OppId = id;
                }else{
                        if(id.startsWith('001')){
                                AccId = id;
                        }
                }
                if(AccId != null){
                        Rut_cliente = [select RUT__c from Account Where Id =: AccId].RUT__c;
                }
                if(OppId != null){
                        Rut_cliente = [select Account.RUT__c from Opportunity Where Id =: OppId].Account.RUT__c;
                }
                BICE_ConsultaBolsaWS.WscreatokenejbWebPortBindingQSPort conx = new BICE_ConsultaBolsaWS.WscreatokenejbWebPortBindingQSPort();
        BICE_ConsultaBolsaWS.wscreatokenResponse wsresult_1 = new BICE_ConsultaBolsaWS.wscreatokenResponse ();
        BICE_ConsultaBolsaWS.wscreatokenResult wsresult_2 = new BICE_ConsultaBolsaWS.wscreatokenResult();
        
        BICE_ConsultaBolsaWS.wscreatoken test1 = new BICE_ConsultaBolsaWS.wscreatoken();
        BICE_ConsultaBolsaWS.wsValidaTokenResult detalle_1 =  new BICE_ConsultaBolsaWS.wsValidaTokenResult();
        system.debug('Usuario:    '+Rut_usuario);
        system.debug('Perfil:    '+perfil);
        system.debug('Cuenta:    '+cuenta);
        system.debug('Cliente:    '+Rut_cliente);
        if(!Test.isRunningTest())
        	wsresult_2 = conx.wsCreaTokenAgente(Rut_usuario, perfil, Rut_cliente, cuenta, null);
        system.debug('wsresult_2 :    '+wsresult_2 );
        token_resp = wsresult_2.token;
        system.debug('token_resp :    '+token_resp );
        if(!Test.isRunningTest())
        	detalle_1 = conx.wsValidaToken(token_resp);
        token_status  = detalle_1.msgStatus;
        if(token_status == 'Ok'){
                url_redirect = 'http://ppsigaagentebice.bcs.cl/BCSWEB/validateLoginAgente/bice.data?token='+token_resp;
                PageReference p = new PageReference(url_redirect);
                return p;
        }else{
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,' No se ha reconocido al usuario'));
                return null;
        }
                
        }
        
        public PageReference loginBolsa(){
            
            string Idusuario = userinfo.getUserId();
            string usuario = [Select Username_Bolsa__c from User where Id =: Idusuario].Username_Bolsa__c;
            if(!Test.isRunningTest())
            	integer perfil = integer.valueOf([Select Perfil_Bolsa__c from User where Id =: usuario].Perfil_Bolsa__c);
            
            BICE_ConsultaBolsaWS.WscreatokenejbWebPortBindingQSPort conx = new BICE_ConsultaBolsaWS.WscreatokenejbWebPortBindingQSPort();
            BICE_ConsultaBolsaWS.wscreatokenResponse wsresult_1 = new BICE_ConsultaBolsaWS.wscreatokenResponse ();
            BICE_ConsultaBolsaWS.wscreatokenResult wsresult_2 = new BICE_ConsultaBolsaWS.wscreatokenResult();
            BICE_ConsultaBolsaWS.wscreatoken test1 = new BICE_ConsultaBolsaWS.wscreatoken();
            BICE_ConsultaBolsaWS.wsValidaTokenResult detalle_1 =  new BICE_ConsultaBolsaWS.wsValidaTokenResult();
            if(!Test.isRunningTest())
            	wsresult_2 = conx.wscreatoken(usuario, perfil);                
            system.debug('wsresult_2 :    '+wsresult_2 );            
            token_resp = wsresult_2.token;
            system.debug('token_resp :    '+token_resp );
            if(!Test.isRunningTest())
            	detalle_1 = conx.wsValidaToken(token_resp);
            token_status  = detalle_1.msgStatus;
            string tmp_url = [Select URL__c from URL_Bolsa__c].URL__c;
            if(token_status == 'Ok'){
                    url_redirect = tmp_url+token_resp;
                    PageReference p = new PageReference(url_redirect);
                    return p;
            }else{
                    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,' No se ha reconocido al usuario'));
                    return null;
            }
        }
}