@isTest
private class BICE_ComplianceTrackerWSWebSvcTest {
    
    @isTest static void coverGeneratedCodeTypes() {
        Test.setMock(WebServiceMock.class, new BICE_ComplianceTrackerWSMockImpl());
        BICE_ComplianceTrackerWS parentObject = new BICE_ComplianceTrackerWS();
        new BICE_ComplianceTrackerWS.ArrayOfString();
        new BICE_ComplianceTrackerWS.search_x_element();
        new BICE_ComplianceTrackerWS.search2_element();
        new BICE_ComplianceTrackerWS.search2Response_element();
        new BICE_ComplianceTrackerWS.Search2Test1_element();
        new BICE_ComplianceTrackerWS.Search2Test1Response_element();
        new BICE_ComplianceTrackerWS.Search2Test2_element();
        new BICE_ComplianceTrackerWS.Search2Test2Response_element();
        new BICE_ComplianceTrackerWS.search3_element();
        new BICE_ComplianceTrackerWS.search3Response_element();
        new BICE_ComplianceTrackerWS.SearchRequest();
        new BICE_ComplianceTrackerWS.SearchRequest3();
        new BICE_ComplianceTrackerWS.SearchResponse();
        new BICE_ComplianceTrackerWS.searchResponse_element();
        new BICE_ComplianceTrackerWS.SearchTest1_element();
        new BICE_ComplianceTrackerWS.SearchTest1Response_element();
        new BICE_ComplianceTrackerWS.SearchTest2_element();
        new BICE_ComplianceTrackerWS.SearchTest2Response_element();
        new BICE_ComplianceTrackerWS.searchwstxt_element();
        new BICE_ComplianceTrackerWS.searchwstxtResponse_element();
    }
    @isTest static void coverCodeForsearch_x(){
        Test.setMock(WebServiceMock.class, new BICE_ComplianceTrackerWSMockImpl());
        BICE_ComplianceTrackerWS.ComplianceTrackerSoapQSPort testObject = new BICE_ComplianceTrackerWS.ComplianceTrackerSoapQSPort();
        testObject.search_x(null, null, null, null, null, null, null, null, null, null, null);
    }
    @isTest static void coverCodeForsearch2(){
        Test.setMock(WebServiceMock.class, new BICE_ComplianceTrackerWSMockImpl());
        BICE_ComplianceTrackerWS.ComplianceTrackerSoapQSPort testObject = new BICE_ComplianceTrackerWS.ComplianceTrackerSoapQSPort();
        System.assertEquals(null, testObject.search2(null));
    }
    @isTest static void coverCodeForSearch2Test1(){
        Test.setMock(WebServiceMock.class, new BICE_ComplianceTrackerWSMockImpl());
        BICE_ComplianceTrackerWS.ComplianceTrackerSoapQSPort testObject = new BICE_ComplianceTrackerWS.ComplianceTrackerSoapQSPort();
        System.assertEquals(null, testObject.Search2Test1());
    }
    @isTest static void coverCodeForSearch2Test2(){
        Test.setMock(WebServiceMock.class, new BICE_ComplianceTrackerWSMockImpl());
        BICE_ComplianceTrackerWS.ComplianceTrackerSoapQSPort testObject = new BICE_ComplianceTrackerWS.ComplianceTrackerSoapQSPort();
        System.assertEquals(null, testObject.Search2Test2());
    }
    @isTest static void coverCodeForsearch3(){
        Test.setMock(WebServiceMock.class, new BICE_ComplianceTrackerWSMockImpl());
        BICE_ComplianceTrackerWS.ComplianceTrackerSoapQSPort testObject = new BICE_ComplianceTrackerWS.ComplianceTrackerSoapQSPort();
        testObject.search3(null, null, null, null, null, null, null, null, null, null, null, null);
    }
    @isTest static void coverCodeForSearchTest1(){
        Test.setMock(WebServiceMock.class, new BICE_ComplianceTrackerWSMockImpl());
        BICE_ComplianceTrackerWS.ComplianceTrackerSoapQSPort testObject = new BICE_ComplianceTrackerWS.ComplianceTrackerSoapQSPort();
        System.assertEquals(null, testObject.SearchTest1());
    }
    @isTest static void coverCodeForSearchTest2(){
        Test.setMock(WebServiceMock.class, new BICE_ComplianceTrackerWSMockImpl());
        BICE_ComplianceTrackerWS.ComplianceTrackerSoapQSPort testObject = new BICE_ComplianceTrackerWS.ComplianceTrackerSoapQSPort();
        System.assertEquals(null, testObject.SearchTest2());
    }
    @isTest static void coverCodeForsearchwstxt(){
        Test.setMock(WebServiceMock.class, new BICE_ComplianceTrackerWSMockImpl());
        BICE_ComplianceTrackerWS.ComplianceTrackerSoapQSPort testObject = new BICE_ComplianceTrackerWS.ComplianceTrackerSoapQSPort();
        System.assertEquals(null, testObject.searchwstxt(null));
    }
}