public class BICE_LeadChangesVF {
    public Lead l{get; set;}
    public Account a{get; set;}
    private static Id enterpriseAccountRType = null;
    private static Id personAccountRType = null;
    public Boolean existeCuenta{ get; set; }
    
    public BICE_LeadChangesVF (ApexPages.StandardController controller){
        existeCuenta = false;
        String lId = controller.getRecord().id;
        if(lId != null){
            try{
                this.l = [SELECT OwnerId, Sucursal_de_Apertura_del__c, Rut__c, Customer_type_other_rating__c, Sub_Sector_Economico__c, 
                        Actividad_Economica_SBIF__c, SBIF_Sector__c, LastName, Apellido_Materno__c, FirstName, Nationality__c,
                        Profession__c, Birth_Date__c, Sex__c, Educational_Level__c, Estado_civil__c , Apartment__c, Office_Number__c,
                        Raz_n_Social__c, Socios_de_la_empresa_grupo_econ_mico__c, Ciudad_Particular__c, BICE_Classification__c, 
                        Comuna_Particular__r.Name, Pais_Particular__c, Region_Particular__c, Calle_Particular__c,
                        Numero_Particular__c, Ciudad_Comercial__c, Comuna_Comercial__r.Name, Pais_Comercial__c, Title, 
                        Region_Comercial__c, Calle_Comercial__c, Numero_Comercial__c, Phone, MobilePhone, Commercial_Cellphone__c,
                        Commercial_Phone_Other__c, Particular_Phone_Other__c, Phone_contact__c, Fax, Email, Commercial_Email__c, Website,
                        Segmentation__c, FATCA_Information__c,Numero_de_TIN__c, Numero_de_GIN__c,Fecha_Solicitud_Crear_Cliente__c,
                        Conjugal_Regime__c, Clasificacion_de_Riesgo_SBIF__c,Tipo_de_Persona__c,Account_Executive__r.ROL_Number__c,
                        Commercial_Landline__c,Subsegmento__c, Commercial_Classification__c,Particular_Landline__c,
                        LastModifiedBy.ROL_Number__c,Segmentacion_Liquidez_Codigo__c,Segmentacion_Liquidez_Subcodigo__c,
                        Ejecutivo_COMEX__r.Rol_Number__c
                     FROM Lead
                     WHERE Id = :lId];
                     checkLeadChanges();
            }catch(Exception ex){
                existeCuenta = false;
            }
        }
    }
    
    public void checkLeadChanges() {
        String rutAcc;
        rutAcc = this.l.Rut__c;
        this.a = [SELECT recordTypeId, LastModifiedById, Rut__c, Ejecutivo_de_Cuenta__c, Tipo_de_Persona__c, 
                    Customer_type_other_rating_c__c, Fecha_Solicitud_Crear_Cliente__c, SBIF_Sector__c, 
                    Fecha_de_declaracion_de_margen__c, Ciudad_o_Provincia_particular__c, Ciudad_o_Provincia_comercial__c, 
                    Comuna_comercial__c, Comuna_particular__c, Pais_particular__c, Pais_comercial__c, Region_particular__c, 
                    Region_comercial__c, Calle_particular__c, Numero_particular__c, Apartment__c, Calle_comercial__c, 
                    Numero_comercial__c, Office_Number__c, PersonMobilePhone, Particular_Phone_Other__pc, Particular_Landline__pc, 
                    Commercial_Phone_Other__c, Phone, Commercial_Cellphone__c, PersonEmail, Commercial_Email__pc, 
                    Segmentacion_Liquidez_Codigo__c, Segmentacion_Liquidez_Subcodigo__c, Segmentation__c, FATCA_Information__c, 
                    Numero_de_TIN__c, Numero_de_GIN__c, Clasificacion_de_Riesgo_SBIF__c, Sucursal_Banco__c, Sub_Sector_Economico__c,
                    Actividad_Economica_SBIF__c, LastName, Apellido_materno__pc, FirstName, Nationality__c, Profession__pc, PersonBirthdate, 
                    Sex__pc, Estado_civil__pc, Raz_n_Social__c, Socios_de_la_empresa_Grupo_Econ_mico__c, Ciudad_o_Provincia_particular_Inv__c,
                    Comuna_particular_Inv__c, Pais_particular_Inv__c, Region_particular_Inv__c, Calle_particular_Inv__c, Numero_calle_particular_Inv__c,
                    Comuna_comercial_Inv__c , Pais_comercial_Inv__c, Cargo__pc, Region_comercial_Inv__c, Calle_comercial_Inv__c, Numero_calle_comercial_Inv__c,
                    Telefono_fijo_comercial_Inv__c, Celular_Particular_Inv__pc, Celular_Comercial_Inv__c, Telefono_fijo_particular_Inv__pc, Email_Comercial_Inv__pc,
                    Website, Conjugal_Regime__pc, Commercial_Landline__c, Subsegmento__c, Commercial_Classification__c                       
                  FROM Account
                  WHERE Rut__c =: rutAcc];
         try{
             if(this.a != null){
                 system.debug('EXISTE LA CUENTA');
                 existeCuenta = true;
             }
         }catch(Exception ex){
             system.debug('NO EXISTE CUENTA  - CATCH');
             existeCuenta = false;
         }
         
    }
    
    public PageReference saveIt(){
        
        return null;
    }

}