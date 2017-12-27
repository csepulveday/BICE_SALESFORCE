/**
 * Created by Carlos Bastidas on 21-12-2017.
 */

public with sharing class BICE_Base_Controller {
    @AuraEnabled
    public static List<Account> getUserAccounts() {

        List<Account> userAccount = [
                Select Id, Name, Oportunidaes__c, Segmento__c, CreatedDate, Cargo__pc,Profession__pc, RUT__c
                From Account
        ];

        return userAccount;
    }
}