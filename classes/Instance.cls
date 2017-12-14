public class Instance {
    
    public String getInstanceName()
    {
        return (Userinfo.getOrganizationId() == '00D41000000LZ56EAG') ? 'Production' : 'Sandbox';
        										
    }
}