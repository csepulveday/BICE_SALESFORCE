public class BICE_Account_Int10{

    private static Endpoint_Setting__mdt xEx = [SELECT Id, Endpoint__c, Namespace__c FROM Endpoint_Setting__mdt WHERE MasterLabel = 'INT10'];

    public BICE_Account_Int10(){
    }

    public static void updateAccount(String aid, String CifId){
        Account myObj = [SELECT CIF_Id__c FROM Account WHERE Id =:aid];
        If(String.isBlank(CifId) == false){
            myObj.CIF_Id__c = CifId;
            update myObj;
        }
    }

    @future(callout=true)
    public static void callInt10(String aid, String xml){
        String soapNS = xEx.Namespace__c;
        //String endpoint = 'https://sfqa.bice.cl/bus/CrearClienteCifFacade/Crear';
        String endpoint = xEx.Endpoint__c;
        System.debug('XML======================>');
        System.debug(xml);
        Dom.Document doc = new Dom.Document();
        doc.load(xml);

        System.debug(doc.toXmlString());

        // Send the request
        HttpRequest req = new HttpRequest();
        //req.setClientCertificateName('sfqabice');
        req.setMethod('POST');
        req.setEndpoint(endpoint);
        req.setHeader('Content-Type', 'text/xml;charset=utf-8');
        req.setBody(doc.toXmlString());
        //req.setBodyDocument(doc);
        System.debug('Request: '+req);
        try{
            Http http = new Http();
            HttpResponse res;
                res = http.send(req);

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
            

            //updateAccount(aid, ret.getChildElement('n_CIF_ID', null).getText());
        }catch(Exception e){
            System.debug('error: '+e.getMessage());
        }
    }
}