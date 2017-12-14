@isTest
public class BICE_ConsultaBolsaWS_Test implements WebServiceMock {
    public void doInvoke(
            Object stub,
            Object request,
            Map<String, Object> response,
            String endpoint,
            String soapAction,
            String requestName,
            String responseNS,
            String responseName,
            String responseType) {
       
        System.debug(LoggingLevel.INFO, 'BICE_ConsultaBolsaWS_Test.doInvoke() - ' +
            '\n request: ' + request +
            '\n response: ' + response +
            '\n endpoint: ' + endpoint +
            '\n soapAction: ' + soapAction +
            '\n requestName: ' + requestName +
            '\n responseNS: ' + responseNS +
            '\n responseName: ' + responseName +
            '\n responseType: ' + responseType);

        if(request instanceOf BICE_ConsultaBolsaWS.wscreatoken) {
            response.put( 'response_x', new BICE_ConsultaBolsaWS.wscreatokenResponse());
        }
        else if(request instanceOf BICE_ConsultaBolsaWS.wsCreaTokenAgente) {
            response.put( 'response_x', new BICE_ConsultaBolsaWS.wsCreaTokenAgenteResponse());
        }
        else if(request instanceOf BICE_ConsultaBolsaWS.wscreatokenResult) {
            response.put( 'response_x', new BICE_ConsultaBolsaWS.wscreatokenResult());
        }
        else if(request instanceOf BICE_ConsultaBolsaWS.wsValidaToken) {
            response.put( 'response_x', new BICE_ConsultaBolsaWS.wsValidaTokenResponse());
        }
        else if(request instanceOf BICE_ConsultaBolsaWS.wsValidaTokenResult) {
            response.put( 'response_x', new BICE_ConsultaBolsaWS.wsValidaTokenResult());
        }
        
    }
}