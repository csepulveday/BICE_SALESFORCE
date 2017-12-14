/**********************************************************************************
Desarrollado por: Nectia
Autor: Esteban Flores (EFR)
Proyecto: BICE
Descripción: Clase que permite cambiar el propietario de un Lead en cierto tiempo y
             notifica al nuevo propietario por correo electrónico.
---------------------------------------------------------------------------------
No. Fecha                Autor                     Descripción
------ ---------- ---------------------------------------------------------------
1.0 26-04-2017            EFR            Creación de la Clase.
1.1 07-08-2017            EFR            Agregar filtro de perfil y estado de Lead.
***********************************************************************************/
global class BICE_ChangeOwnerLeadSchedule implements Schedulable{

    List<Lead> listaLeads{ get; set; }
    List<Lead> listaLeadsUp{ get; set; }
    List<RecordType> rt{ get; set; }
    List<User> managers{get; set;}
    Set<ID> IdUsuarios{get; set;}
    Set<ID> IdGestores{get; set;}
    
    global void execute(SchedulableContext SC) {
        Integer diasPasados = 0;
        if(Test.isRunningTest()){
            diasPasados = 0;
        }else{
            diasPasados = 90;
        }    
        listaLeadsUp = new List<Lead>();
        IdUsuarios = new Set<ID>();
        IdGestores = new Set<ID>();
        rt = [SELECT Id
              FROM RecordType
              WHERE Name = 'Lead Persona Natural (Fuerza de Ventas)' 
                  OR Name = 'Lead Persona Jurídica (Fuerza Ventas)'];
        listaLeads = [SELECT Days_from_last_modify__c, OwnerId
                      FROM Lead
                      WHERE Status != 'No Califica' AND RecordTypeId IN:rt];
        try{
            for(Lead l : listaLeads){
                IdUsuarios.add(l.OwnerId);
            }
            managers = [SELECT Id, ManagerId
                        FROM User
                        WHERE Id IN :IdUsuarios
                        AND Profile.Name = 'Banca Personas Ejecutivos Fuerza de Ventas'];
            try{
                for(User u : managers){
                    IdGestores.add(u.ManagerId);
                    for(Lead l : listaLeads){
                        System.debug('Lead: '+l);
                        if(l.Days_from_last_modify__c == diasPasados && l.OwnerId == u.Id){
                            l.OwnerId = u.ManagerId;
                            listaLeadsUp.add(l);
                        }
                    }
                }
                System.debug(listaLeadsUp);
                if(listaLeadsUp.size() > 0){
                    try{
                        update listaLeadsUp;
                    }catch(Exception e){
                        System.debug(e.getMessage());
                    }
                }else{
                    System.debug('No hay nada que hacer');
                }
                List<User> gestores = [SELECT Id, Email 
                                       FROM User 
                                       WHERE Id IN:IdGestores];
                EmailTemplate emT = [SELECT Id
                              FROM EmailTemplate 
                              WHERE Name = 'Asignacion de candidato 90 días'
                              LIMIT 1];
                List<Messaging.SingleEmailMessage> aTodos = new List<Messaging.SingleEmailMessage>();
                for(Lead eL : listaLeadsUp){
                    for(User g : gestores){
                        if(eL.OwnerId == g.Id){
                            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                            mail.setReplyTo('bice@noreply.com');
                            mail.setSenderDisplayName('Salesforce System');
                            mail.setTemplateID(emT.Id);
                            mail.setSaveAsActivity(false);
                            mail.setToAddresses(new String[] { g.Email });
                            mail.setTargetObjectId(eL.Id);
                            mail.setTreatTargetObjectAsRecipient(false);
                            aTodos.add(mail);
                        }
                    }
                }
                System.debug(aTodos);
                Messaging.SendEmailResult[] results = Messaging.sendEmail(aTodos,false);
                if (results[0].success) {
                    System.debug('The email was sent successfully.');
                } else {
                    System.debug('The email failed to send: '+ results[0].errors[0].message);
                }
            }catch(Exception e){
                System.debug('El propietario no es del tipo de perfil requerido: '+e.getMessage());
            }
        }catch(Exception ex){
            System.debug('No existen leads para cambiar propietario: '+ex.getMessage());
        }
    }
}