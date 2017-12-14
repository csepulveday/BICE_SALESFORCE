//Methods Included: wsCreaTokenAgente, wsValidaToken, wscreatoken
// Primary Port Class Name: WscreatokenejbWebPortBindingQSPort  
public class BICE_ConsultaBolsaWS {
    public class wscreatoken {
        public String usuario;
        public Integer perfil;
        private String[] usuario_type_info = new String[]{'usuario','http://ejecuciones.ordenes.session.ejb.bcomercio.cl/','string','0','1','true'};
        private String[] perfil_type_info = new String[]{'perfil','','int','1','1','true'};
        private String[] apex_schema_type_info = new String[]{'','true','false'};
        private String[] field_order_type_info = new String[]{'usuario','perfil'};
    }
    public class wsCreaTokenAgente {
        public String usuario; //Requerido
        public Integer perfil; //opcional
        public String rutCliente; //opcional
        public Integer cuenta; //opcional
        public String opcionMenu; //opcional
        private String[] usuario_type_info = new String[]{'usuario','http://ejecuciones.ordenes.session.ejb.bcomercio.cl/','string','0','1','false'};
        private String[] perfil_type_info = new String[]{'perfil','http://ejecuciones.ordenes.session.ejb.bcomercio.cl/','int','1','1','false'};
        private String[] rutCliente_type_info = new String[]{'rutCliente','http://ejecuciones.ordenes.session.ejb.bcomercio.cl/','string','0','1','false'};
        private String[] cuenta_type_info = new String[]{'cuenta','http://ejecuciones.ordenes.session.ejb.bcomercio.cl/','int','1','1','false'};
        private String[] opcionMenu_type_info = new String[]{'opcionMenu','http://ejecuciones.ordenes.session.ejb.bcomercio.cl/','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'','true','false'};
        private String[] field_order_type_info = new String[]{'usuario','perfil','rutCliente','cuenta','opcionMenu'};
    }
    public class wsCreaTokenAgenteResponse {
        public BICE_ConsultaBolsaWS.wscreatokenResult return_x;
        private String[] return_x_type_info = new String[]{'return','http://ejecuciones.ordenes.session.ejb.bcomercio.cl/','wscreatokenResult','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'','true','false'};
        private String[] field_order_type_info = new String[]{'return_x'};
    }
    public class WscreatokenejbWebPortBindingQSPort {
        //public String endpoint_x = 'https://sfqa.bice.cl/desarrollo/ConsultaBolsaFacade/Consultar';
        Endpoint_Setting__mdt bolsaEP = [select DeveloperName, Endpoint__c from Endpoint_Setting__mdt where DeveloperName =: 'INTBOLSA'];
        public String endpoint_x = bolsaEP.Endpoint__c;
        public Map<String,String> inputHttpHeaders_x;
        public Map<String,String> outputHttpHeaders_x;
        public String clientCertName_x;
        public String clientCert_x;
        public String clientCertPasswd_x;
        public Integer timeout_x;
        private String[] ns_map_type_info = new String[]{'http://ejecuciones.ordenes.session.ejb.bcomercio.cl/','BICE_ConsultaBolsaWS'};

        public BICE_ConsultaBolsaWS.wscreatokenResult wscreatoken(String usuario,Integer perfil) {
            BICE_ConsultaBolsaWS.wscreatoken request_x = new BICE_ConsultaBolsaWS.wscreatoken();
            BICE_ConsultaBolsaWS.wscreatokenResponse response_x;
            request_x.usuario = usuario;
            request_x.perfil = perfil;
            Map<String, BICE_ConsultaBolsaWS.wscreatokenResponse> response_map_x = new Map<String, BICE_ConsultaBolsaWS.wscreatokenResponse>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
                this,
                request_x,
                response_map_x,
                new String[]{endpoint_x,
                '',
                'http://ejecuciones.ordenes.session.ejb.bcomercio.cl/',
                'wscreatoken',
                'http://ejecuciones.ordenes.session.ejb.bcomercio.cl/',
                'wscreatokenResponse',
                'BICE_ConsultaBolsaWS.wscreatokenResponse'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.return_x;
        }

        public BICE_ConsultaBolsaWS.wscreatokenResult wsCreaTokenAgente(String usuario,Integer perfil,String rutCliente,Integer cuenta,String opcionMenu) {
            BICE_ConsultaBolsaWS.wsCreaTokenAgente request_x = new BICE_ConsultaBolsaWS.wsCreaTokenAgente();
            BICE_ConsultaBolsaWS.wsCreaTokenAgenteResponse response_x;
            request_x.usuario = usuario;
            request_x.perfil = perfil;
            request_x.rutCliente = rutCliente;
            request_x.cuenta = cuenta;
            request_x.opcionMenu = opcionMenu;
            Map<String, BICE_ConsultaBolsaWS.wsCreaTokenAgenteResponse> response_map_x = new Map<String, BICE_ConsultaBolsaWS.wsCreaTokenAgenteResponse>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
                this,
                request_x,
                response_map_x,
                new String[]{endpoint_x,
                '',
                'http://ejecuciones.ordenes.session.ejb.bcomercio.cl/',
                'wsCreaTokenAgente',
                'http://ejecuciones.ordenes.session.ejb.bcomercio.cl/',
                'wsCreaTokenAgenteResponse',
                'BICE_ConsultaBolsaWS.wsCreaTokenAgenteResponse'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.return_x;
        }

        public BICE_ConsultaBolsaWS.wsValidaTokenResult wsValidaToken(String token) {
            BICE_ConsultaBolsaWS.wsValidaToken request_x = new BICE_ConsultaBolsaWS.wsValidaToken();
            BICE_ConsultaBolsaWS.wsValidaTokenResponse response_x;
            request_x.token = token;
            Map<String, BICE_ConsultaBolsaWS.wsValidaTokenResponse> response_map_x = new Map<String, BICE_ConsultaBolsaWS.wsValidaTokenResponse>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
                this,
                request_x,
                response_map_x,
                new String[]{endpoint_x,
                '',
                'http://ejecuciones.ordenes.session.ejb.bcomercio.cl/',
                'wsValidaToken',
                'http://ejecuciones.ordenes.session.ejb.bcomercio.cl/',
                'wsValidaTokenResponse',
                'BICE_ConsultaBolsaWS.wsValidaTokenResponse'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.return_x;
        }
    }
    public class wscreatokenResponse {
        public BICE_ConsultaBolsaWS.wscreatokenResult return_x;
        private String[] return_x_type_info = new String[]{'return','http://ejecuciones.ordenes.session.ejb.bcomercio.cl/','wscreatokenResult','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'','true','false'};
        private String[] field_order_type_info = new String[]{'return_x'};
    }
    public class wscreatokenResult {
        public Integer codError;
        public String descError;
        public Integer returnValue;
        public String token;
        private String[] codError_type_info = new String[]{'codError','http://ejecuciones.ordenes.session.ejb.bcomercio.cl/','int','1','1','false'};
        private String[] descError_type_info = new String[]{'descError','http://ejecuciones.ordenes.session.ejb.bcomercio.cl/','string','0','1','false'};
        private String[] returnValue_type_info = new String[]{'returnValue','http://ejecuciones.ordenes.session.ejb.bcomercio.cl/','int','1','1','false'};
        private String[] token_type_info = new String[]{'token','http://ejecuciones.ordenes.session.ejb.bcomercio.cl/','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'','true','false'};
        private String[] field_order_type_info = new String[]{'codError','descError','returnValue','token'};
    }
    public class wsValidaToken {
        public String token;
        private String[] token_type_info = new String[]{'token','http://ejecuciones.ordenes.session.ejb.bcomercio.cl/','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'','true','false'};
        private String[] field_order_type_info = new String[]{'token'};
    }
    public class wsValidaTokenResponse {
        public BICE_ConsultaBolsaWS.wsValidaTokenResult return_x;
        private String[] return_x_type_info = new String[]{'return','http://ejecuciones.ordenes.session.ejb.bcomercio.cl/','wsValidaTokenResult','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'','true','false'};
        private String[] field_order_type_info = new String[]{'return_x'};
    }
    public class wsValidaTokenResult {
        public String corredor;
        public String glosa;
        public String msgStatus;
        public Integer myReturnValue;
        public String usuario;
        private String[] corredor_type_info = new String[]{'corredor','http://ejecuciones.ordenes.session.ejb.bcomercio.cl/','string','0','1','false'};
        private String[] glosa_type_info = new String[]{'glosa','http://ejecuciones.ordenes.session.ejb.bcomercio.cl/','string','0','1','false'};
        private String[] msgStatus_type_info = new String[]{'msgStatus','http://ejecuciones.ordenes.session.ejb.bcomercio.cl/','string','0','1','false'};
        private String[] myReturnValue_type_info = new String[]{'myReturnValue','http://ejecuciones.ordenes.session.ejb.bcomercio.cl/','int','1','1','false'};
        private String[] usuario_type_info = new String[]{'usuario','http://ejecuciones.ordenes.session.ejb.bcomercio.cl/','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'','true','false'};
        private String[] field_order_type_info = new String[]{'corredor','glosa','msgStatus','myReturnValue','usuario'};
    }
}