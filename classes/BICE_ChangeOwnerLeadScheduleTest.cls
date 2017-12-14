@isTest(seealldata=true)
public class BICE_ChangeOwnerLeadScheduleTest{
     testMethod static void myUnittest(){
         test.starttest();
         Profile p = [SELECT Id FROM Profile WHERE Name = 'Banca Personas Ejecutivos Fuerza de Ventas'];
         User u = [SELECT Id FROM User WHERE ProfileId =:p.Id AND IsActive = true AND ManagerId <> NULL LIMIT 1];
         List<Lead> lInsert = new List<Lead>();
         RecordType rt = [SELECT Id
              FROM RecordType
              WHERE Name = 'Lead Persona Jurídica (Fuerza Ventas)' LIMIT 1];
         String[] noms = new String[] {'Juan','Jose','Raul','Rosa','Emilio','Evaldo','Dark','Kronos','Zeus','Kratos'};
         String[] ruts = new String[] {'1234567-4','1234568-2','1234569-0','1234570-4','1234571-2','1234572-0','1234573-9','1234574-7','1234575-5','1234576-3'};
         String[] emas = new String[] {'a@test.cl','b@test.cl','c@test.cl','d@test.cl','e@test.cl','f@test.cl','g@test.cl','h@test.cl','i@test.cl','j@test.cl'};
         System.runAs(u) {
             for(Integer i=0 ; i < 10 ; i++ ){
                 Lead l = new Lead();
                 l.FirstName = noms[i];
                 l.LastName = 'Last';
                 l.RUT__c = ruts[i];
                 l.OwnerId = u.Id;
                 l.Phone = '+56912312312';
                 l.Email = emas[i];
                 l.RecordTypeId = rt.Id;
                 lInsert.add(l);
             }
             insert lInsert;
      	 }
         String chron = '0 0 23 * * ?';
         BICE_ChangeOwnerLeadSchedule ls = new BICE_ChangeOwnerLeadSchedule();        
         system.schedule('BICE_ChangeOwnerLeadScheduleTest', chron, ls);
         test.stopTest();
     }
}