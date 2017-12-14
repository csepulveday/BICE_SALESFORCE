public class BICE_IntOnline_RedirectController{
    public String lid {get;set;}
    public String msg {get;set;}
    public String urlToRedirect {get;set;}
    
    public BICE_IntOnline_RedirectController(){
        lid = ApexPages.currentPage().getParameters().get('LID');
        System.debug(lid);
        msg = ApexPages.currentPage().getParameters().get('msg');
        System.debug(msg);
        urlToRedirect = System.Url.getSalesforceBaseURL().toExternalForm()+'/'+ApexPages.currentPage().getParameters().get('LID');
        System.debug(urlToRedirect);
    }
}