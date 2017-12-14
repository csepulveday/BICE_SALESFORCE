public class BICE_Deuda360_Controller{
    
    public Endpoint_Setting__mdt xEx;
    public Decimal SumaValorDeudaBICE;
    public Decimal SumaValorDeudaSBIF;
    public Decimal SumaFactoring;
    public Decimal SumaLeasing;
 
    
    public HttpResponse Deuda_SBIF_BICE_Callout(String rut){       
        xEx = [SELECT Id, Endpoint__c, Namespace__c FROM Endpoint_Setting__mdt WHERE MasterLabel = 'INTDEUDA360'];
        HttpResponse respuestaTest = new HttpResponse();
        String xmltest = '<S:Envelope xmlns:S="http://schemas.xmlsoap.org/soap/envelope/">    <S:Body>       <ns0:obtenerDeudaResponse xmlns:ns0="http://deuda.ws.ddc.crm.bice.cl/">          <return>             <deudaBice>                <detalle>                   <producto>COMERCIAL</producto>                   <valorDeuda>0</valorDeuda>                </detalle>                <detalle>                   <producto>CONSUMO</producto>                   <valorDeuda>53181</valorDeuda>                </detalle>                <detalle>                   <producto>LEASING</producto>                   <valorDeuda>0</valorDeuda>                </detalle>                <detalle>                   <producto>VIVIENDA</producto>                   <valorDeuda>0</valorDeuda>                </detalle>                <detalle>                   <producto>FACTORING</producto>                   <valorDeuda>0</valorDeuda>                </detalle>                <detalle>                   <producto>OTRO</producto>                   <valorDeuda>0</valorDeuda>                </detalle>                <periodo>201608</periodo>             </deudaBice>             <deudaSbif>                <detalle>                   <producto>LEASING</producto>                   <valorDeuda>0</valorDeuda>                </detalle>                <detalle>                   <producto>COMERCIAL</producto>                   <valorDeuda>0</valorDeuda>                </detalle>                <detalle>                   <producto>CONSUMO</producto>                   <valorDeuda>340</valorDeuda>                </detalle>                <detalle>                   <producto>VIVIENDA</producto>                   <valorDeuda>0</valorDeuda>                </detalle>                <periodo>201608</periodo>             </deudaSbif>             <p_CODIGO>000</p_CODIGO>             <p_MENSAJE>OK</p_MENSAJE>          </return>       </ns0:obtenerDeudaResponse>    </S:Body> </S:Envelope>';  
        respuestaTest.setBody(xmltest);
        
        HttpResponse response = new HttpResponse();   
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(xEx.Endpoint__c);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/xml;charset=UTF-8');
        request.setBody(xmlRequest(rut));
        if(!Test.IsRunningTest()){
            response = http.send(request);
            System.debug('Request: '+request.getBody());     
              if (response.getStatusCode() == 200) {            
                System.debug('Respuesta: '+response.getBody());
                  System.debug('Estatus: ' +
                      response.getStatusCode() + ' ' + response.getStatus());
                      deserializarRespuesta(response);
              } else {
                  System.debug(response.getBody());
              }
        }
        else
            deserializarRespuesta(respuestaTest);  
        return response;
    }  
    
    public String xmlRequest(String rut){
      String RequestBody = ''; 
          if(!String.isBlank(rut)){
            
            RequestBody = RequestBody + '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:deud="'+xEx.Namespace__c+'">';
            RequestBody = RequestBody + '<soapenv:Header/>';
            RequestBody = RequestBody +     '<soapenv:Body>';
            RequestBody = RequestBody +         '<deud:obtenerDeuda>';
            RequestBody = RequestBody +             '<pRUTCLIENTE>'+rut+'</pRUTCLIENTE>';
            RequestBody = RequestBody +         '</deud:obtenerDeuda>';
            RequestBody = RequestBody +     '</soapenv:Body>';
            RequestBody = RequestBody + '</soapenv:Envelope>';
       
         }
        return RequestBody;
    }
    
    public void deserializarRespuesta(HttpResponse respuestaXML){
            String[] montoProd = new String[] {};
            String[] montoValorDeudaBICE = new String[] {};
            String[] montoValorDeudaSBIF = new String[] {};
            SumaFactoring = 0;
            SumaFactoring = 0;
            
            dom.Document resDoc = respuestaXML.getBodyDocument();
            dom.XmlNode envelope = resDoc.getRootElement();
            System.debug(envelope);
            dom.XmlNode envB = envelope.getChildElement('Body', 'http://schemas.xmlsoap.org/soap/envelope/');
            System.debug('Body: '+envB);
            dom.XmlNode bRes = envB.getChildElement('obtenerDeudaResponse', xEx.Namespace__c);
            System.debug('obtenerAumInversionesResponse: '+bRes);
            dom.XmlNode ret = bRes.getChildElement('return', null);
            System.debug('return: '+ret.getChildElements());
            dom.XmlNode deudaBice = ret.getChildElement('deudaBice', null);
            dom.XmlNode deudaSbif = ret.getChildElement('deudaSbif', null);
            for (Dom.XmlNode t : deudaBice.getChildElements()) { // DEUDA BICE
                System.debug('T: '+t);
                Dom.XmlNode prod = t.getChildElement('producto', null);
                Dom.XmlNode valorDeuda = t.getChildElement('valorDeuda', null);               
                
                if(prod != null && (prod.getText() != 'LEASING' && prod.getText() !='FACTORING')){ //productos que no sea ni "FACTORING" ni "LEASING"
                System.debug('Prods: '+prod.getText());
                    montoProd.add(prod.getText()); //solo guarda nombres de prods. no se muestra en la vista 360
                    if(valorDeuda != null)
                        montoValorDeudaBICE.add(valorDeuda.getText());
                }
                else if(prod!= null && prod.getText() == 'LEASING'){ //guarda valor "LEASING" de "DeudaBICE"
                    SumaLeasing =  Decimal.valueOf(valorDeuda.getText());
                    System.debug('LEASING: '+SumaLeasing);
                    System.debug('Nombre Leasing: '+prod.getText());
                    
                }
                else if(prod!= null && prod.getText() == 'FACTORING'){ //guarda valor "FACTORING" de "DeudaBICE"
                    SumaFactoring =  Decimal.valueOf(valorDeuda.getText());
                    System.debug('FACTORING: '+SumaFactoring);
                    System.debug('Nombre Factoring: '+prod.getText());
                }
                            
            }           
            
            SumaValorDeudaBICE = SumaMonedas(montoValorDeudaBICE); //suma los valores entregados para Deuda BICE que no sea de tipo "FACTORING" ni "LEASING".
            
            System.debug('Productos : '+montoProd ); 
            System.debug('SumaValorDeudaBICE : '+SumaValorDeudaBICE);
            
            for (Dom.XmlNode t : deudaSbif.getChildElements()) { // DEUDA SBIF
                System.debug('Deuda SBIF: '+t);
                Dom.XmlNode prod = t.getChildElement('producto', null);
                Dom.XmlNode valorDeuda = t.getChildElement('valorDeuda', null);               
                
                if(prod != null && (prod.getText() != 'LEASING' && prod.getText() !='FACTORING')){ //productos que no sea ni "FACTORING" ni "LEASING"
                System.debug('Prods: '+prod.getText());
                    
                    if(valorDeuda != null)
                        montoValorDeudaSBIF.add(valorDeuda.getText());
                }
                else if(prod!= null && prod.getText() == 'LEASING'){ //guarda valor "LEASING" de "DeudaSBIF"
                    SumaLeasing =  SumaLeasing + Decimal.valueOf(valorDeuda.getText());
                    System.debug('SUMA TOTAL LEASING: '+SumaLeasing);
                    System.debug('Nombre Leasing: '+prod.getText());
                    
                }
                else if(prod!= null && prod.getText() == 'FACTORING'){ //guarda valor "FACTORING" de "DeudaSBIF"
                    SumaFactoring =  SumaFactoring + Decimal.valueOf(valorDeuda.getText());
                    System.debug('SUMA TOTAL FACTORING: '+SumaFactoring);
                    System.debug('Nombre Factoring: '+prod.getText());
                }                           
            }
            
            SumaValorDeudaSBIF = SumaMonedas(montoValorDeudaSBIF); //suma los valores entregados para Deuda SBIF, que no sea de tipo "FACTORING" ni "LEASING".                     
            System.debug('SumaValorDeudaSBIF : '+SumaValorDeudaSBIF);
    }
    
    public Decimal SumaMonedas(List<String> monedas){
        Decimal Suma = 0;
        if(monedas != null){           
            for(String i: monedas){            
                suma = suma + Decimal.ValueOf(i);
                 System.debug('Suma: '+Suma);
            }
        }
    return suma;    
    }


  
}