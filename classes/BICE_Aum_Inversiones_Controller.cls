public class BICE_Aum_Inversiones_Controller{
    
    public Endpoint_Setting__mdt xEx;
    public Decimal SumaMontoApv;
    public Decimal SumaMontoEur;
    public Decimal SumaMontoPeso;
    public Decimal SumaMontoUsd;
    
    public HttpResponse AUM_INVERS_Callout(String rut){
        
        xEx = [SELECT Id, Endpoint__c, Namespace__c FROM Endpoint_Setting__mdt WHERE MasterLabel = 'INTAUMINV'];
        HttpResponse respuestaTest = new HttpResponse();
        String xmltest = '<S:Envelope xmlns:S="http://schemas.xmlsoap.org/soap/envelope/">    <S:Body>       <ns0:obtenerAumInversionesResponse xmlns:ns0="http://auminversiones.ws.ddc.crm.bice.cl/">          <return>             <listAumInversiones>                <montoApv>0</montoApv>                <montoEur>0</montoEur>                <montoPeso>0</montoPeso>                <montoUsd>0</montoUsd>                <nombreGrupo>Disponible en Caja</nombreGrupo>                <tipoBalance>A</tipoBalance>             </listAumInversiones>             <listAumInversiones>                <montoApv>0</montoApv>                <montoEur>0</montoEur>                <montoPeso>0</montoPeso>                <montoUsd>0</montoUsd>                <nombreGrupo>Depósitos a Plazo BICE</nombreGrupo>                <tipoBalance>A</tipoBalance>             </listAumInversiones>             <listAumInversiones>                <montoApv>0</montoApv>                <montoEur>0</montoEur>                <montoPeso>0</montoPeso>                <montoUsd>0</montoUsd>                <nombreGrupo>Libreta de Ahorro</nombreGrupo>                <tipoBalance>A</tipoBalance>             </listAumInversiones>             <listAumInversiones>                <montoApv>0</montoApv>                <montoEur>0</montoEur>                <montoPeso>2207696</montoPeso>                <montoUsd>0</montoUsd>                <nombreGrupo>Acciones</nombreGrupo>                <tipoBalance>A</tipoBalance>             </listAumInversiones>             <listAumInversiones>                <montoApv>0</montoApv>                <montoEur>0</montoEur>                <montoPeso>63064338</montoPeso>                <montoUsd>0</montoUsd>                <nombreGrupo>Fondos Mutuos</nombreGrupo>                <tipoBalance>A</tipoBalance>             </listAumInversiones>             <listAumInversiones>                <montoApv>0</montoApv>                <montoEur>0</montoEur>                <montoPeso>0</montoPeso>                <montoUsd>0</montoUsd>                <nombreGrupo>Renta Fija</nombreGrupo>                <tipoBalance>A</tipoBalance>             </listAumInversiones>             <listAumInversiones>                <montoApv>0</montoApv>                <montoEur>0</montoEur>                <montoPeso>0</montoPeso>                <montoUsd>0</montoUsd>                <nombreGrupo>Operaciones en Tránsito</nombreGrupo>                <tipoBalance>A</tipoBalance>             </listAumInversiones>             <listAumInversiones>                <montoApv>0</montoApv>                <montoEur>0</montoEur>                <montoPeso>0</montoPeso>                <montoUsd>0</montoUsd>                <nombreGrupo>Simultáneas</nombreGrupo>                <tipoBalance>P</tipoBalance>             </listAumInversiones>             <listAumInversiones>                <montoApv>0</montoApv>                <montoEur>0</montoEur>                <montoPeso>0</montoPeso>                <montoUsd>0</montoUsd>                <nombreGrupo>Forward (Resultado Neto)</nombreGrupo>                <tipoBalance>A</tipoBalance>             </listAumInversiones>             <listAumInversiones>                <montoApv>0</montoApv>                <montoEur>0</montoEur>                <montoPeso>0</montoPeso>                <montoUsd>0</montoUsd>                <nombreGrupo>Venta Corta</nombreGrupo>                <tipoBalance>A</tipoBalance>             </listAumInversiones>             <listAumInversiones>                <montoApv>0</montoApv>                <montoEur>0</montoEur>                <montoPeso>0</montoPeso>                <montoUsd>0</montoUsd>                <nombreGrupo>Patrimonio Custodia Pershing</nombreGrupo>                <tipoBalance>A</tipoBalance>             </listAumInversiones>             <p_CODIGO>000</p_CODIGO>             <p_MENSAJE>OK</p_MENSAJE>          </return>       </ns0:obtenerAumInversionesResponse>    </S:Body> </S:Envelope>';  
        respuestaTest.setBody(xmltest);
        Http http = new Http();
        HttpRequest request = new HttpRequest();
         HttpResponse response = new  HttpResponse();
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
            
            RequestBody = RequestBody + '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:aum="'+xEx.Namespace__c+'">';
            RequestBody = RequestBody + '<soapenv:Header/>';
            RequestBody = RequestBody +     '<soapenv:Body>';
            RequestBody = RequestBody +         '<aum:obtenerAumInversiones>';
            RequestBody = RequestBody +             '<pRUTCLIENTE>'+rut+'</pRUTCLIENTE>';
            RequestBody = RequestBody +         '</aum:obtenerAumInversiones>';
            RequestBody = RequestBody +     '</soapenv:Body>';
            RequestBody = RequestBody + '</soapenv:Envelope>';
       
         }
        return RequestBody;
    }
    
    public String deserializarRespuesta(HttpResponse respuestaXML){
            String[] montoApv = new String[] {};
            String[] montoEur = new String[] {};
            String[] montoPeso = new String[] {};
            String[] montoUsd = new String[] {};
            dom.Document resDoc = respuestaXML.getBodyDocument();
            dom.XmlNode envelope = resDoc.getRootElement();
            System.debug(envelope);
            dom.XmlNode envB = envelope.getChildElement('Body', 'http://schemas.xmlsoap.org/soap/envelope/');
            System.debug('Body: '+envB);
            dom.XmlNode bRes = envB.getChildElement('obtenerAumInversionesResponse', xEx.Namespace__c);
            System.debug('obtenerAumInversionesResponse: '+bRes);
            dom.XmlNode ret = bRes.getChildElement('return', null);
            System.debug('return: '+ret.getChildElements());
            for (Dom.XmlNode t : ret.getChildElements()) {
                System.debug('T: '+t);
                Dom.XmlNode apv = t.getChildElement('montoApv', null);
                Dom.XmlNode eur = t.getChildElement('montoEur', null);
                Dom.XmlNode peso = t.getChildElement('montoPeso', null);
                Dom.XmlNode usd = t.getChildElement('montoUsd', null);
                
                if(apv != null)
                    montoApv.add(apv.getText());
                if(eur != null)
                    montoEur.add(eur.getText());
                if(peso != null)
                    montoPeso.add(peso.getText());
                if(usd != null)
                    montoUsd.add(usd.getText());            
            }
            
            SumaMontoAPV = SumaMonedas(montoApv);
            SumaMontoEUR = SumaMonedas(montoEur);
            SumaMontoPeso = SumaMonedas(montoPeso);
            SumaMontoUSD = SumaMonedas(montoUsd);
            System.debug('SumaMontoAPV: '+SumaMontoAPV); 
            System.debug('SumaMontoEUR: '+SumaMontoEUR);
            System.debug('SumaMontoPeso: '+SumaMontoPeso);
            System.debug('SumaMontoUSD: '+SumaMontoUSD);  
        
      return '';
    
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