@isTest
public class BICE_ComplianceTrackerWSMockImpl implements WebServiceMock {
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
       
        System.debug(LoggingLevel.INFO, 'BICE_ComplianceTrackerWSMockImpl.doInvoke() - ' +
            '\n request: ' + request +
            '\n response: ' + response +
            '\n endpoint: ' + endpoint +
            '\n soapAction: ' + soapAction +
            '\n requestName: ' + requestName +
            '\n responseNS: ' + responseNS +
            '\n responseName: ' + responseName +
            '\n responseType: ' + responseType);

        if(request instanceOf BICE_ComplianceTrackerWS.search_x_element) {
            response.put( 'response_x', new BICE_ComplianceTrackerWS.searchResponse_element());
        }
        else if(request instanceOf BICE_ComplianceTrackerWS.search2_element) {
            response.put( 'response_x', new BICE_ComplianceTrackerWS.search2Response_element());
        }
        else if(request instanceOf BICE_ComplianceTrackerWS.Search2Test1_element) {
            response.put( 'response_x', new BICE_ComplianceTrackerWS.Search2Test1Response_element());
        }
        else if(request instanceOf BICE_ComplianceTrackerWS.Search2Test2_element) {
            response.put( 'response_x', new BICE_ComplianceTrackerWS.Search2Test2Response_element());
        }
        else if(request instanceOf BICE_ComplianceTrackerWS.search3_element) {
            response.put( 'response_x', new BICE_ComplianceTrackerWS.search3Response_element());
        }
        else if(request instanceOf BICE_ComplianceTrackerWS.SearchTest1_element) {
            response.put( 'response_x', new BICE_ComplianceTrackerWS.SearchTest1Response_element());
        }
        else if(request instanceOf BICE_ComplianceTrackerWS.SearchTest2_element) {
            response.put( 'response_x', new BICE_ComplianceTrackerWS.SearchTest2Response_element());
        }
        else if(request instanceOf BICE_ComplianceTrackerWS.searchwstxt_element) {
            response.put( 'response_x', new BICE_ComplianceTrackerWS.searchwstxtResponse_element());
        }
    }
}