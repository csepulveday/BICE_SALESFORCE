public class BICE_ComplianceTrackerWS {
    public class ArrayOfString {
        public String[] string_x;
        private String[] string_x_type_info = new String[]{'string','http://tempuri.org/WebService1/Service1','string','0','-1','true'};
        private String[] apex_schema_type_info = new String[]{'http://tempuri.org/WebService1/Service1','true','false'};
        private String[] field_order_type_info = new String[]{'string_x'};
    }
    public class ComplianceTrackerSoapQSPort {
        Endpoint_Setting__mdt xEx = [SELECT Id, Endpoint__c, Namespace__c FROM Endpoint_Setting__mdt WHERE MasterLabel = 'INTCT'];
        public String endpoint_x = xEx.Endpoint__c;
        public Map<String,String> inputHttpHeaders_x;
        public Map<String,String> outputHttpHeaders_x;
        public String clientCertName_x;
        public String clientCert_x;
        public String clientCertPasswd_x;
        public Integer timeout_x;
        private String[] ns_map_type_info = new String[]{'http://tempuri.org/WebService1/Service1','BICE_ComplianceTrackerWS'};

        public BICE_ComplianceTrackerWS.searchResponse_element search_x(Integer id_usys,String idemp,String nombres,String apellidos,String nacionalidad,String tipo,Integer estatus,Integer autorizado,Long id_requestws,Integer id_emp,String source) {
            BICE_ComplianceTrackerWS.search_x_element request_x = new BICE_ComplianceTrackerWS.search_x_element();
            BICE_ComplianceTrackerWS.searchResponse_element response_x;
            request_x.id_usys = id_usys;
            request_x.idemp = idemp;
            request_x.nombres = nombres;
            request_x.apellidos = apellidos;
            request_x.nacionalidad = nacionalidad;
            request_x.tipo = tipo;
            request_x.estatus = estatus;
            request_x.autorizado = autorizado;
            request_x.id_requestws = id_requestws;
            request_x.id_emp = id_emp;
            request_x.source = source;
            Map<String, BICE_ComplianceTrackerWS.searchResponse_element> response_map_x = new Map<String, BICE_ComplianceTrackerWS.searchResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
                this,
                request_x,
                response_map_x,
                new String[]{endpoint_x,
                'http://tempuri.org/WebService1/Service1/search',
                'http://tempuri.org/WebService1/Service1',
                'search',
                'http://tempuri.org/WebService1/Service1',
                'searchResponse',
                'BICE_ComplianceTrackerWS.searchResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x;
        }

        public BICE_ComplianceTrackerWS.SearchResponse search2(BICE_ComplianceTrackerWS.SearchRequest request) {
            BICE_ComplianceTrackerWS.search2_element request_x = new BICE_ComplianceTrackerWS.search2_element();
            BICE_ComplianceTrackerWS.search2Response_element response_x;
            request_x.request = request;
            Map<String, BICE_ComplianceTrackerWS.search2Response_element> response_map_x = new Map<String, BICE_ComplianceTrackerWS.search2Response_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
                this,
                request_x,
                response_map_x,
                new String[]{endpoint_x,
                'http://tempuri.org/WebService1/Service1/search2',
                'http://tempuri.org/WebService1/Service1',
                'search2',
                'http://tempuri.org/WebService1/Service1',
                'search2Response',
                'BICE_ComplianceTrackerWS.search2Response_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.search2Result;
        }

        public BICE_ComplianceTrackerWS.ArrayOfString Search2Test1() {
            BICE_ComplianceTrackerWS.Search2Test1_element request_x = new BICE_ComplianceTrackerWS.Search2Test1_element();
            BICE_ComplianceTrackerWS.Search2Test1Response_element response_x;
            Map<String, BICE_ComplianceTrackerWS.Search2Test1Response_element> response_map_x = new Map<String, BICE_ComplianceTrackerWS.Search2Test1Response_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
                this,
                request_x,
                response_map_x,
                new String[]{endpoint_x,
                'http://tempuri.org/WebService1/Service1/Search2Test1',
                'http://tempuri.org/WebService1/Service1',
                'Search2Test1',
                'http://tempuri.org/WebService1/Service1',
                'Search2Test1Response',
                'BICE_ComplianceTrackerWS.Search2Test1Response_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.Search2Test1Result;
        }

        public BICE_ComplianceTrackerWS.ArrayOfString Search2Test2() {
            BICE_ComplianceTrackerWS.Search2Test2_element request_x = new BICE_ComplianceTrackerWS.Search2Test2_element();
            BICE_ComplianceTrackerWS.Search2Test2Response_element response_x;
            Map<String, BICE_ComplianceTrackerWS.Search2Test2Response_element> response_map_x = new Map<String, BICE_ComplianceTrackerWS.Search2Test2Response_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
                this,
                request_x,
                response_map_x,
                new String[]{endpoint_x,
                'http://tempuri.org/WebService1/Service1/Search2Test2',
                'http://tempuri.org/WebService1/Service1',
                'Search2Test2',
                'http://tempuri.org/WebService1/Service1',
                'Search2Test2Response',
                'BICE_ComplianceTrackerWS.Search2Test2Response_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.Search2Test2Result;
        }

        public BICE_ComplianceTrackerWS.search3Response_element search3(Integer id_usys,String idemp,String nombres,String apellidos,String nacionalidad,String tipo,Integer estatus,Integer autorizado,Long id_requestws,Integer id_emp,String source,Integer cod_estatus) {
            BICE_ComplianceTrackerWS.search3_element request_x = new BICE_ComplianceTrackerWS.search3_element();
            BICE_ComplianceTrackerWS.search3Response_element response_x;
            request_x.id_usys = id_usys;
            request_x.idemp = idemp;
            request_x.nombres = nombres;
            request_x.apellidos = apellidos;
            request_x.nacionalidad = nacionalidad;
            request_x.tipo = tipo;
            request_x.estatus = estatus;
            request_x.autorizado = autorizado;
            request_x.id_requestws = id_requestws;
            request_x.id_emp = id_emp;
            request_x.source = source;
            request_x.cod_estatus = cod_estatus;
            Map<String, BICE_ComplianceTrackerWS.search3Response_element> response_map_x = new Map<String, BICE_ComplianceTrackerWS.search3Response_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
                this,
                request_x,
                response_map_x,
                new String[]{endpoint_x,
                'http://tempuri.org/WebService1/Service1/search3',
                'http://tempuri.org/WebService1/Service1',
                'search3',
                'http://tempuri.org/WebService1/Service1',
                'search3Response',
                'BICE_ComplianceTrackerWS.search3Response_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x;
        }

        public BICE_ComplianceTrackerWS.ArrayOfString SearchTest1() {
            BICE_ComplianceTrackerWS.SearchTest1_element request_x = new BICE_ComplianceTrackerWS.SearchTest1_element();
            BICE_ComplianceTrackerWS.SearchTest1Response_element response_x;
            Map<String, BICE_ComplianceTrackerWS.SearchTest1Response_element> response_map_x = new Map<String, BICE_ComplianceTrackerWS.SearchTest1Response_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
                this,
                request_x,
                response_map_x,
                new String[]{endpoint_x,
                'http://tempuri.org/WebService1/Service1/SearchTest1',
                'http://tempuri.org/WebService1/Service1',
                'SearchTest1',
                'http://tempuri.org/WebService1/Service1',
                'SearchTest1Response',
                'BICE_ComplianceTrackerWS.SearchTest1Response_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.SearchTest1Result;
        }

        public BICE_ComplianceTrackerWS.ArrayOfString SearchTest2() {
            BICE_ComplianceTrackerWS.SearchTest2_element request_x = new BICE_ComplianceTrackerWS.SearchTest2_element();
            BICE_ComplianceTrackerWS.SearchTest2Response_element response_x;
            Map<String, BICE_ComplianceTrackerWS.SearchTest2Response_element> response_map_x = new Map<String, BICE_ComplianceTrackerWS.SearchTest2Response_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
                this,
                request_x,
                response_map_x,
                new String[]{endpoint_x,
                'http://tempuri.org/WebService1/Service1/SearchTest2',
                'http://tempuri.org/WebService1/Service1',
                'SearchTest2',
                'http://tempuri.org/WebService1/Service1',
                'SearchTest2Response',
                'BICE_ComplianceTrackerWS.SearchTest2Response_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.SearchTest2Result;
        }

        public BICE_ComplianceTrackerWS.SearchResponse searchwstxt(BICE_ComplianceTrackerWS.SearchRequest3 request) {
            BICE_ComplianceTrackerWS.searchwstxt_element request_x = new BICE_ComplianceTrackerWS.searchwstxt_element();
            BICE_ComplianceTrackerWS.searchwstxtResponse_element response_x;
            request_x.request = request;
            Map<String, BICE_ComplianceTrackerWS.searchwstxtResponse_element> response_map_x = new Map<String, BICE_ComplianceTrackerWS.searchwstxtResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
                this,
                request_x,
                response_map_x,
                new String[]{endpoint_x,
                'http://tempuri.org/WebService1/Service1/searchwstxt',
                'http://tempuri.org/WebService1/Service1',
                'searchwstxt',
                'http://tempuri.org/WebService1/Service1',
                'searchwstxtResponse',
                'BICE_ComplianceTrackerWS.searchwstxtResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.searchwstxtResult;
        }
    }
    public class search_x_element {
        public Integer id_usys;
        public String idemp;
        public String nombres;
        public String apellidos;
        public String nacionalidad;
        public String tipo;
        public Integer estatus;
        public Integer autorizado;
        public Long id_requestws;
        public Integer id_emp;
        public String source;
        private String[] id_usys_type_info = new String[]{'id_usys','http://tempuri.org/WebService1/Service1','int','1','1','false'};
        private String[] idemp_type_info = new String[]{'idemp','http://tempuri.org/WebService1/Service1','string','0','1','false'};
        private String[] nombres_type_info = new String[]{'nombres','http://tempuri.org/WebService1/Service1','string','0','1','false'};
        private String[] apellidos_type_info = new String[]{'apellidos','http://tempuri.org/WebService1/Service1','string','0','1','false'};
        private String[] nacionalidad_type_info = new String[]{'nacionalidad','http://tempuri.org/WebService1/Service1','string','0','1','false'};
        private String[] tipo_type_info = new String[]{'tipo','http://tempuri.org/WebService1/Service1','string','0','1','false'};
        private String[] estatus_type_info = new String[]{'estatus','http://tempuri.org/WebService1/Service1','int','1','1','false'};
        private String[] autorizado_type_info = new String[]{'autorizado','http://tempuri.org/WebService1/Service1','int','1','1','false'};
        private String[] id_requestws_type_info = new String[]{'id_requestws','http://tempuri.org/WebService1/Service1','long','1','1','false'};
        private String[] id_emp_type_info = new String[]{'id_emp','http://tempuri.org/WebService1/Service1','int','1','1','false'};
        private String[] source_type_info = new String[]{'source','http://tempuri.org/WebService1/Service1','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://tempuri.org/WebService1/Service1','true','false'};
        private String[] field_order_type_info = new String[]{'id_usys','idemp','nombres','apellidos','nacionalidad','tipo','estatus','autorizado','id_requestws','id_emp','source'};
    }
    public class search2_element {
        public BICE_ComplianceTrackerWS.SearchRequest request;
        private String[] request_type_info = new String[]{'request','http://tempuri.org/WebService1/Service1','SearchRequest','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://tempuri.org/WebService1/Service1','true','false'};
        private String[] field_order_type_info = new String[]{'request'};
    }
    public class search2Response_element {
        public BICE_ComplianceTrackerWS.SearchResponse search2Result;
        private String[] search2Result_type_info = new String[]{'search2Result','http://tempuri.org/WebService1/Service1','SearchResponse','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://tempuri.org/WebService1/Service1','true','false'};
        private String[] field_order_type_info = new String[]{'search2Result'};
    }
    public class Search2Test1_element {
        private String[] apex_schema_type_info = new String[]{'http://tempuri.org/WebService1/Service1','true','false'};
        private String[] field_order_type_info = new String[]{};
    }
    public class Search2Test1Response_element {
        public BICE_ComplianceTrackerWS.ArrayOfString Search2Test1Result;
        private String[] Search2Test1Result_type_info = new String[]{'Search2Test1Result','http://tempuri.org/WebService1/Service1','ArrayOfString','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://tempuri.org/WebService1/Service1','true','false'};
        private String[] field_order_type_info = new String[]{'Search2Test1Result'};
    }
    public class Search2Test2_element {
        private String[] apex_schema_type_info = new String[]{'http://tempuri.org/WebService1/Service1','true','false'};
        private String[] field_order_type_info = new String[]{};
    }
    public class Search2Test2Response_element {
        public BICE_ComplianceTrackerWS.ArrayOfString Search2Test2Result;
        private String[] Search2Test2Result_type_info = new String[]{'Search2Test2Result','http://tempuri.org/WebService1/Service1','ArrayOfString','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://tempuri.org/WebService1/Service1','true','false'};
        private String[] field_order_type_info = new String[]{'Search2Test2Result'};
    }
    public class search3_element {
        public Integer id_usys;
        public String idemp;
        public String nombres;
        public String apellidos;
        public String nacionalidad;
        public String tipo;
        public Integer estatus;
        public Integer autorizado;
        public Long id_requestws;
        public Integer id_emp;
        public String source;
        public Integer cod_estatus;
        private String[] id_usys_type_info = new String[]{'id_usys','http://tempuri.org/WebService1/Service1','int','1','1','false'};
        private String[] idemp_type_info = new String[]{'idemp','http://tempuri.org/WebService1/Service1','string','0','1','false'};
        private String[] nombres_type_info = new String[]{'nombres','http://tempuri.org/WebService1/Service1','string','0','1','false'};
        private String[] apellidos_type_info = new String[]{'apellidos','http://tempuri.org/WebService1/Service1','string','0','1','false'};
        private String[] nacionalidad_type_info = new String[]{'nacionalidad','http://tempuri.org/WebService1/Service1','string','0','1','false'};
        private String[] tipo_type_info = new String[]{'tipo','http://tempuri.org/WebService1/Service1','string','0','1','false'};
        private String[] estatus_type_info = new String[]{'estatus','http://tempuri.org/WebService1/Service1','int','1','1','false'};
        private String[] autorizado_type_info = new String[]{'autorizado','http://tempuri.org/WebService1/Service1','int','1','1','false'};
        private String[] id_requestws_type_info = new String[]{'id_requestws','http://tempuri.org/WebService1/Service1','long','1','1','false'};
        private String[] id_emp_type_info = new String[]{'id_emp','http://tempuri.org/WebService1/Service1','int','1','1','false'};
        private String[] source_type_info = new String[]{'source','http://tempuri.org/WebService1/Service1','string','0','1','false'};
        private String[] cod_estatus_type_info = new String[]{'cod_estatus','http://tempuri.org/WebService1/Service1','int','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://tempuri.org/WebService1/Service1','true','false'};
        private String[] field_order_type_info = new String[]{'id_usys','idemp','nombres','apellidos','nacionalidad','tipo','estatus','autorizado','id_requestws','id_emp','source','cod_estatus'};
    }
    public class search3Response_element {
        public Integer search3Result;
        public Integer estatus;
        public Integer autorizado;
        public Long id_requestws;
        public Integer id_emp;
        public String source;
        public Integer cod_estatus;
        private String[] search3Result_type_info = new String[]{'search3Result','http://tempuri.org/WebService1/Service1','int','1','1','false'};
        private String[] estatus_type_info = new String[]{'estatus','http://tempuri.org/WebService1/Service1','int','1','1','false'};
        private String[] autorizado_type_info = new String[]{'autorizado','http://tempuri.org/WebService1/Service1','int','1','1','false'};
        private String[] id_requestws_type_info = new String[]{'id_requestws','http://tempuri.org/WebService1/Service1','long','1','1','false'};
        private String[] id_emp_type_info = new String[]{'id_emp','http://tempuri.org/WebService1/Service1','int','1','1','false'};
        private String[] source_type_info = new String[]{'source','http://tempuri.org/WebService1/Service1','string','0','1','false'};
        private String[] cod_estatus_type_info = new String[]{'cod_estatus','http://tempuri.org/WebService1/Service1','int','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://tempuri.org/WebService1/Service1','true','false'};
        private String[] field_order_type_info = new String[]{'search3Result','estatus','autorizado','id_requestws','id_emp','source','cod_estatus'};
    }
    public class SearchRequest {
        public Integer UsuarioID;
        public String EmpresaID;
        public String Nombres;
        public String Apellidos;
        public String Nacionalidad;
        public String Tipo;
        public Long RequestwsID;
        private String[] UsuarioID_type_info = new String[]{'UsuarioID','http://tempuri.org/WebService1/Service1','int','1','1','false'};
        private String[] EmpresaID_type_info = new String[]{'EmpresaID','http://tempuri.org/WebService1/Service1','string','0','1','false'};
        private String[] Nombres_type_info = new String[]{'Nombres','http://tempuri.org/WebService1/Service1','string','0','1','false'};
        private String[] Apellidos_type_info = new String[]{'Apellidos','http://tempuri.org/WebService1/Service1','string','0','1','false'};
        private String[] Nacionalidad_type_info = new String[]{'Nacionalidad','http://tempuri.org/WebService1/Service1','string','0','1','false'};
        private String[] Tipo_type_info = new String[]{'Tipo','http://tempuri.org/WebService1/Service1','string','0','1','false'};
        private String[] RequestwsID_type_info = new String[]{'RequestwsID','http://tempuri.org/WebService1/Service1','long','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://tempuri.org/WebService1/Service1','true','false'};
        private String[] field_order_type_info = new String[]{'UsuarioID','EmpresaID','Nombres','Apellidos','Nacionalidad','Tipo','RequestwsID'};
    }
    public class SearchRequest3 {
        public Integer UsuarioID;
        public String EmpresaID;
        public String Nombres;
        public String Apellidos;
        public String Nacionalidad;
        public String Tipo;
        public Long RequestwsID;
        public Integer ws_escribir;
        public Integer ws_enviocorreo;
        private String[] UsuarioID_type_info = new String[]{'UsuarioID','http://tempuri.org/WebService1/Service1','int','1','1','false'};
        private String[] EmpresaID_type_info = new String[]{'EmpresaID','http://tempuri.org/WebService1/Service1','string','0','1','false'};
        private String[] Nombres_type_info = new String[]{'Nombres','http://tempuri.org/WebService1/Service1','string','0','1','false'};
        private String[] Apellidos_type_info = new String[]{'Apellidos','http://tempuri.org/WebService1/Service1','string','0','1','false'};
        private String[] Nacionalidad_type_info = new String[]{'Nacionalidad','http://tempuri.org/WebService1/Service1','string','0','1','false'};
        private String[] Tipo_type_info = new String[]{'Tipo','http://tempuri.org/WebService1/Service1','string','0','1','false'};
        private String[] RequestwsID_type_info = new String[]{'RequestwsID','http://tempuri.org/WebService1/Service1','long','1','1','false'};
        private String[] ws_escribir_type_info = new String[]{'ws_escribir','http://tempuri.org/WebService1/Service1','int','1','1','false'};
        private String[] ws_enviocorreo_type_info = new String[]{'ws_enviocorreo','http://tempuri.org/WebService1/Service1','int','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://tempuri.org/WebService1/Service1','true','false'};
        private String[] field_order_type_info = new String[]{'UsuarioID','EmpresaID','Nombres','Apellidos','Nacionalidad','Tipo','RequestwsID','ws_escribir','ws_enviocorreo'};
    }
    public class SearchResponse {
        public Integer Estatus;
        public Integer Autorizado;
        public String source;
        public Long RequestwsID;
        public Integer EmpresaID;
        public Integer ErrorID;
        private String[] Estatus_type_info = new String[]{'Estatus','http://tempuri.org/WebService1/Service1','int','1','1','false'};
        private String[] Autorizado_type_info = new String[]{'Autorizado','http://tempuri.org/WebService1/Service1','int','1','1','false'};
        private String[] source_type_info = new String[]{'source','http://tempuri.org/WebService1/Service1','string','0','1','false'};
        private String[] RequestwsID_type_info = new String[]{'RequestwsID','http://tempuri.org/WebService1/Service1','long','1','1','false'};
        private String[] EmpresaID_type_info = new String[]{'EmpresaID','http://tempuri.org/WebService1/Service1','int','1','1','false'};
        private String[] ErrorID_type_info = new String[]{'ErrorID','http://tempuri.org/WebService1/Service1','int','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://tempuri.org/WebService1/Service1','true','false'};
        private String[] field_order_type_info = new String[]{'Estatus','Autorizado','source','RequestwsID','EmpresaID','ErrorID'};
    }
    public class searchResponse_element {
        public Integer searchResult;
        public Integer estatus;
        public Integer autorizado;
        public Long id_requestws;
        public Integer id_emp;
        public String source;
        private String[] searchResult_type_info = new String[]{'searchResult','http://tempuri.org/WebService1/Service1','int','1','1','false'};
        private String[] estatus_type_info = new String[]{'estatus','http://tempuri.org/WebService1/Service1','int','1','1','false'};
        private String[] autorizado_type_info = new String[]{'autorizado','http://tempuri.org/WebService1/Service1','int','1','1','false'};
        private String[] id_requestws_type_info = new String[]{'id_requestws','http://tempuri.org/WebService1/Service1','long','1','1','false'};
        private String[] id_emp_type_info = new String[]{'id_emp','http://tempuri.org/WebService1/Service1','int','1','1','false'};
        private String[] source_type_info = new String[]{'source','http://tempuri.org/WebService1/Service1','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://tempuri.org/WebService1/Service1','true','false'};
        private String[] field_order_type_info = new String[]{'searchResult','estatus','autorizado','id_requestws','id_emp','source'};
    }
    public class SearchTest1_element {
        private String[] apex_schema_type_info = new String[]{'http://tempuri.org/WebService1/Service1','true','false'};
        private String[] field_order_type_info = new String[]{};
    }
    public class SearchTest1Response_element {
        public BICE_ComplianceTrackerWS.ArrayOfString SearchTest1Result;
        private String[] SearchTest1Result_type_info = new String[]{'SearchTest1Result','http://tempuri.org/WebService1/Service1','ArrayOfString','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://tempuri.org/WebService1/Service1','true','false'};
        private String[] field_order_type_info = new String[]{'SearchTest1Result'};
    }
    public class SearchTest2_element {
        private String[] apex_schema_type_info = new String[]{'http://tempuri.org/WebService1/Service1','true','false'};
        private String[] field_order_type_info = new String[]{};
    }
    public class SearchTest2Response_element {
        public BICE_ComplianceTrackerWS.ArrayOfString SearchTest2Result;
        private String[] SearchTest2Result_type_info = new String[]{'SearchTest2Result','http://tempuri.org/WebService1/Service1','ArrayOfString','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://tempuri.org/WebService1/Service1','true','false'};
        private String[] field_order_type_info = new String[]{'SearchTest2Result'};
    }
    public class searchwstxt_element {
        public BICE_ComplianceTrackerWS.SearchRequest3 request;
        private String[] request_type_info = new String[]{'request','http://tempuri.org/WebService1/Service1','SearchRequest3','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://tempuri.org/WebService1/Service1','true','false'};
        private String[] field_order_type_info = new String[]{'request'};
    }
    public class searchwstxtResponse_element {
        public BICE_ComplianceTrackerWS.SearchResponse searchwstxtResult;
        private String[] searchwstxtResult_type_info = new String[]{'searchwstxtResult','http://tempuri.org/WebService1/Service1','SearchResponse','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://tempuri.org/WebService1/Service1','true','false'};
        private String[] field_order_type_info = new String[]{'searchwstxtResult'};
    }
}