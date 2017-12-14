@isTest(seeAllData= true) 
public class BICE_OpportunityControllerTest {

    public static testMethod void testMyController() {
        Profile p = [SELECT Id FROM Profile WHERE Name = 'Banca Inversiones Ejecutivo'];
        User u = [SELECT Id FROM User WHERE ProfileId =:p.Id AND IsActive = true AND ManagerId <> NULL LIMIT 1];
        List<Lead> lInsert = new List<Lead>();
        System.runAs(u) {
            Comuna__c com = [SELECT Id FROM Comuna__c WHERE Name = 'SANTIAGO'];
            RecordType rtPersona = [SELECT Id FROM RecordType WHERE Name = 'Cuentas personales'];
            RecordType rtEmpresa = [SELECT Id FROM RecordType WHERE Name = 'Cuenta Empresa'];
            RecordType rtOpp = [SELECT Id FROM RecordType WHERE Name = 'Monoproducto'];
            
            Account acc = new Account();
            //////Cuenta Persona///////////
            acc.FirstName = 'INT';
            acc.LastName = '20';
            acc.RUT__c = '1234567-4';
            acc.RecordTypeId = rtPersona.Id;
            acc.Ciudad_o_Provincia_particular__c = 'SANTI';
            acc.Comuna_particular__c = com.Id;
            acc.Comuna_comercial__c = com.Id;
            acc.Comuna_comercial_Inv__c = com.Id;
            acc.Numero_comercial__c = '23213';
            //acc.Commercial_FAX_Other__c = '213213';
            acc.Office_Number__c = '111';
            acc.PersonMobilePhone = '+569898987';
            acc.Particular_Phone_Other__pc = '+568998989';
            acc.Particular_Landline__pc = '+568987878';
            acc.Spouse_RUT__pc = '16049291-0'; //Conyuge
            acc.rut_inv__c = '16049291-0'; //representante legal
            acc.Comuna_particular_Inv__c = com.Id;
            acc.Ciudad_o_Provincia_particular_Inv__c = 'asdasd';
            acc.Calle_particular_Inv__c = 'calle';
            acc.Telefono_fijo_particular_Inv__pc = '23323';
            acc.Celular_Particular_Inv__pc = '2222';
            acc.Otro_telefono_particular_Inv__pc = '111';
            acc.Calle_comercial_Inv__c = 'calle com';
            acc.Ciudad_o_Provincia_comercial_Inv__c = 'ciudad com';
            acc.Pais_comercial_Inv__c = 'Chile';
            acc.Numero_calle_comercial_Inv__c = '111';
            acc.Region_comercial_Inv__c = 'rm';
            acc.Info_adicional_Inv_Oficina__c = 'info';
            acc.Telefono_fijo_comercial_Inv__c = '12121';
            acc.Celular_comercial_Inv__c = '11111';
            acc.Otro_telefono_comercial_Inv__c = '1111';
            acc.Email_personal_Inv__pc = 'a@g.cl';
            acc.Email_comercial_Inv__c = 'a@g.cl';
            acc.Email_Rep_Legal_Inv__c = 'a@g.cl';
            acc.Raz_n_Social__c = 'razon';
            
            insert acc;
            
            Account acc2 = new Account();
            //////Cuenta Persona///////////
            acc2.Name = 'Empresa';
            acc2.RUT__c = '22385241-6';
            acc2.RecordTypeId = rtEmpresa.Id;
            
            acc2.Comuna_comercial__c = com.Id;
            acc2.Pais_comercial__c = 'Chile';
            acc2.Calle_comercial__c = 'Calle';
            acc2.Numero_comercial__c = '1111';
            acc2.Office_Number__c = '111';          
            acc2.Numero_comercial__c = '23213';
            //acc.Commercial_FAX_Other__c = '213213';
            acc2.Office_Number__c = '111';           
            acc2.Fecha_Solicitud_Crear_Cliente__c = Date.today();  
            acc2.Crear_Cliente__c = true;
            acc2.Ejecutivo_de_Cuenta__c = u.id;
            insert acc2;
            
            Opportunity op = new Opportunity();
            op.RecordTypeId = rtOpp.Id;
            op.CloseDate = Date.today();
            op.StageName = 'Contacto';
            op.Amount = 100.00;
            op.Type = 'Monoproducto';
            op.Name = 'Esta es una opp nueva';
            op.AccountId = acc.Id;
            
            insert op;
            
            Opportunity op2 = new Opportunity();
            op2.RecordTypeId = rtOpp.Id;
            op2.CloseDate = Date.today();
            op2.StageName = 'Contacto';
            op2.Amount = 100.00;
            op2.Type = 'Monoproducto';
            op2.Name = 'Esta es una opp nueva';
            op2.AccountId = acc2.Id;
            
            insert op2;
            
            ApexPages.StandardController sc = new ApexPages.standardController(op);
            BICE_OpportunityController ext = new BICE_OpportunityController(sc);
            PageReference page = ext.redirect();
            
            ApexPages.StandardController sc2 = new ApexPages.standardController(op2);
            BICE_OpportunityController ext2 = new BICE_OpportunityController(sc2);
            PageReference page2 = ext2.redirect();
            
            BICE_Solicitud_Cliente__c bc = [SELECT Id ,Cliente__c
                    ,New_Actividad_Economica_SBIF__c
                    ,New_Apartment__c
                    ,New_Apellido_Materno__c
                    ,New_Apellido_Materno_Conyuge__c
                    ,New_apellidoMaterno__c
                    ,New_Apellido_Paterno__c
                    ,New_Apellido_Paterno_Conyuge__c
                    ,New_apellidoPaterno__c
                    ,New_Atencion_diferencial__c
                    ,New_AUM__c
                    ,New_Autoriz_de_informar_a_organism_FATCA__c
                    ,New_Balances__c
                    ,New_Banco__c
                    ,New_BCS_Circ_10672_10673_BCS__c
                    ,New_Calle_comercial__c
                    ,New_Calle_comercial_Inv__c
                    ,New_Calle_particular__c
                    ,New_Calle_particular_Inv__c
                    ,New_Cargo__c
                    ,New_Carpeta_comercial__c
                    ,New_Carpeta_operativa__c
                    ,New_Categoria_Deudor__c
                    ,New_Celular_Comercial_Inv__c
                    ,New_Celular_particular_Inv__c
                    ,New_Circ_57_2017_UAF__c
                    ,New_Ciudad_o_Provincia_comercial__c
                    ,New_Ciudad_o_Provincia_comercial_Inv__c
                    ,New_Ciudad_o_Provincia_particular__c
                    ,New_Ciudad_o_Provincia_particular_Inv__c
                    ,New_BICE_Classification_del__c
                    ,New_Clasificacion_de_Riesgo_SBIF__c
                    ,New_Clasificacion_submargenes__c
                    ,New_Cte_AP_Administraci_n_Cartera__c
                    ,New_Cliente_AP__c
                    ,New_Cliente_APV__c
                    ,New_Cliente_ARE_s__c
                    ,New_Cliente_Banco__c
                    ,New_Cliente_BIA__c
                    ,New_Cliente_desde__c
                    ,New_Cliente_Relacionado__c
                    ,New_Cluster__c
                    ,New_Commercial_Classification__c
                    ,New_Commercial_FAX_Other__c
                    ,New_Commercial_Landline__c
                    ,New_Commercial_Phone_Other__c
                    ,New_Comuna_comercial__c
                    ,New_Comuna_comercial_Inv__r.Name
                    ,New_Comuna_particular__c
                    ,New_Comuna_particular_Inv__r.Name
                    ,New_Copia_inscripcion_original__c
                    ,New_Estado_Creaci_n_de_Cliente__c
                    ,New_Customer_Legal_Person_Consumer__c
                    ,New_DAI_de_la_Soc__c
                    ,New_DCV_Circ_190_SVS__c
                    ,New_Descripci_n_cuenta__c
                    ,New_Deuda_Sistema_Financiero_MM_pesos__c
                    ,New_Documentaci_n_sustentatoria_EESS__c
                    ,New_Ejecutivo_de_Inversiones__r.Name
                    ,New_Email_comercial_Inv__c
                    ,New_Email_facturacion_Inv__c
                    ,New_Email_personal_Inv__c
                    ,New_Email_Rep_Legal_Inv__c
                    ,New_Empleador__c
                    ,New_Escritura_publica__c
                    ,New_Estado_civil__c
                    ,New_Estado_Deudor__c
                    ,New_Estracto_Diario_Oficial__c
                    ,New_Fecha_apertura_cta_cte__c
                    ,New_Fecha_Constitucion_Empresa__c
                    ,New_Fecha_creacion_Sebra__c
                    ,New_Fecha_declaracion_jurada_art_85__c
                    ,New_Fecha_de_conversi_n_a_cliente__c
                    ,New_Fecha_de_declaracion_de_margen__c
                    ,New_Fecha_de_vencimiento_MAC__c
                    ,New_Fecha_fin_relaci_n__c
                    ,New_Fecha_inicio_relaci_n__c
                    ,New_Fecha_resultado_comit__c
                    ,New_Fecha_Solicitud_Crear_Cliente__c
                    ,New_Ficha_cuenta__c
                    ,New_Filial_de_participacion__c
                    ,New_Form_Art_85__c
                    ,New_Form_EESS__c
                    ,New_Form_FATCA__c
                    ,New_Form_Ingreso_Maestro_de_Clientes__c
                    ,New_Form_Solicitud_de_Productos__c
                    ,New_Giro_Inv__c
                    ,New_Giro_Inv__r.Name
                    ,New_Grupo_Deudor_Relacionado__c
                    ,New_Socios_de_la_empresa_Grupo_Econ_mico__c
                    ,New_Hobbies__c
                    ,New_Idea_de_negocio__c
                    ,New_Industry__c
                    ,New_Info_adicional_Inv_Depto__c
                    ,New_Info_adicional_Inv_Oficina__c
                    ,New_Informacion_adicional_comercial__c
                    ,New_FATCA_Information__c
                    ,New_Informacion_privilegiada__c
                    ,New_Inf_privilegiada_Cargo_SVS_171__c
                    ,New_Intereses__c
                    ,New_KYC_Aprobado__c
                    ,New_Lugar_de_Nacimiento__c
                    ,New_MDR__c
                    ,New_Medios_de_pago_para_productos_CDB__c
                    ,New_Modalidad_de_operaci_n__c
                    ,New_Modelo_facturaci_n__c
                    ,New_Monto_MAC_creado__c
                    ,New_Monto_Preaprobado__c
                    ,New_N_de_cuenta__c
                    ,New_N_cuenta_bancaria__c
                    ,New_Nationality__c
                    ,New_Name__c
                    ,New_Nivel_de_Riesgo_de_la_Cartera__c
                    ,New_Nombre__c
                    ,New_Nombre_Conyuge__c
                    ,New_Nombre_de_fantasia__c
                    ,New_Nombre_Factoring__c
                    ,New_Nombres__c
                    ,New_Numero_comercial__c
                    ,New_Numero_calle_comercial_Inv__c
                    ,New_Numero_particular__c
                    ,New_Numero_calle_particular_Inv__c
                    ,New_Numero_de_GIN__c
                    ,New_Numero_de_TIN__c
                    ,New_Observacion_Area_Cliente__c
                    ,New_Obtener_Foto_y_Huellas__c
                    ,New_Office_Number__c
                    ,New_SBIF_Sector__c
                    ,New_Otra_idea_de_negocio__c
                    ,New_Otras_Sociedades__c
                    ,New_Otro_telefono_Comercial_Inv__c
                    ,New_Otro_telefono_particular_Inv__c
                    ,New_Taxes__c
                    ,New_Pa_s_Casa_Matriz__c
                    ,New_Pais_comercial__c
                    ,New_Pais_comercial_Inv__c
                    ,New_Pa_s_de_Constituci_n__c
                    ,New_Pais_particular__c
                    ,New_Pais_particular_Inv__c
                    ,New_Perfil_de_inversionista__c
                    ,New_Perfil_de_Riesgo__c
                    ,New_PersonAssistantName__c
                    ,New_PersonAssistantPhone__c
                    ,New_PersonBirthdate__c
                    ,New_PersonDepartment__c
                    ,New_PersonEmail__c
                    ,New_PersonHomePhone__c
                    ,New_PersonMailingAddress__c
                    ,New_PersonMobilePhone__c
                    ,New_PersonOtherAddress__c
                    ,New_PersonOtherPhone__c
                    ,New_PersonTitle__c
                    ,New_Phone__c
                    ,New_Plantilla_cobro__c
                    ,New_Plantilla_Producto__c
                    ,New_Plataforma_de_captacion__c
                    ,New_Plataforma_Siga_CRM__c
                    ,New_Plataforma_Torre__c
                    ,New_Profession__c
                    ,New_Prop_sito_cuenta__c
                    ,New_Raz_n_Social__c
                    ,New_Regimen_Conyugal__c
                    ,New_Region_comercial__c
                    ,New_Region_comercial_Inv__c
                    ,New_Region_particular__c
                    ,New_Region_particular_Inv__c
                    ,New_Registro_de_Firma__c
                    ,New_Registro_Fotogr_fico__c
                    ,New_Relacionado_con_la_corredora__c
                    ,New_Relacion_con_corredora_Circ_1064__c
                    ,New_Relacion_Gestion_Banco__c
                    ,New_Rentabilidad_12_meses__c
                    ,New_Rentabilidad_1_dia__c
                    ,New_Rentabilidad_30_dias__c
                    ,New_Rentabilidad_7_dias__c
                    ,New_Rentabilidad_YTD__c
                    ,New_Rep_Legal_email__c
                    ,New_Req_comercial_de_la_empresa__c
                    ,New_Resultado_verificacion_requisitos__c
                    ,New_ROA_12_meses__c
                    ,New_ROA_1_dia__c
                    ,New_ROA_30_dias__c
                    ,New_ROA_7_dias__c
                    ,New_ROA_YTD__c
                    ,New_RUT_Conyuge__c
                    ,New_rut_inv__c
                    ,New_RUT_Sociedad_participacion__c
                    ,New_Segmentaci_n_BI__c
                    ,New_Segmentacion_Liquidez_Codigo__c
                    ,New_Segmentacion_Liquidez_SubCodigo__c
                    ,New_Segmentation__c
                    ,New_Segmento__c
                    ,New_Sex__c
                    ,New_SII_DJ_1820_1829__c
                    ,New_Situac_Laboral__c
                    ,New_Socio_Solidario__c
                    ,New_Sub_Sector_Economico__c
                    ,New_Subsegmento__c
                    ,New_Sucursal_Banco__c
                    ,New_Sucursal_BI__c
                    ,New_Sucursal_creaci_n_registro__c
                    ,New_Susceptible_conflicto_de_interes__c
                    ,New_Telefono_fijo_comercial_Inv__c
                    ,New_Telefono_fijo_particular_Inv__c
                    ,New_Commercial_Cellphone__c
                    ,New_Tipo_Cliente_Gestion__c
                    ,New_Tipo_cuenta__c
                    ,New_Tipo_cuenta_DCV__c
                    ,New_Tipo_de_Banca__c
                    ,New_Tipo_de_Cliente__c
                    ,New_Tipo_de_Cliente_Empresa__c
                    ,New_Customer_type_other_rating_c__c
                    ,New_Tipo_de_Documento_Relacionado__c
                    ,New_Tipo_de_Persona__c
                    ,New_Tipo_de_Relacion__c
                    ,New_Tipo_perfil_comercial__c
                    ,New_Tipo_relaci_n__c
                    ,New_VIP__c
                    ,New_Website__c
                    ,New_Calle_particular_de_Conyuge__c
                    ,New_Ciudad_particular_de_Conyuge__c
                    ,New_Comuna_de_Direccion_Conyuge__c
                    ,New_Comuna_de_Direccion_Conyuge__r.Name
                    ,New_DeptoCasaSectorParticular_de_Conyuge__c
                    ,New_Numero_calle_particular_de_Conyuge__c
                    ,New_Region_particular_de_Conyuge__c
                    ,RecordType.Name
                  FROM BICE_Solicitud_Cliente__c
                  WHERE Cliente__c =: acc.Id 
                  LIMIT 1];
            BICE_Solicitud_Cliente__c bc2 = [SELECT Id ,Cliente__c
                    ,New_Actividad_Economica_SBIF__c
                    ,New_Apartment__c
                    ,New_Apellido_Materno__c
                    ,New_Apellido_Materno_Conyuge__c
                    ,New_apellidoMaterno__c
                    ,New_Apellido_Paterno__c
                    ,New_Apellido_Paterno_Conyuge__c
                    ,New_apellidoPaterno__c
                    ,New_Atencion_diferencial__c
                    ,New_AUM__c
                    ,New_Autoriz_de_informar_a_organism_FATCA__c
                    ,New_Balances__c
                    ,New_Banco__c
                    ,New_BCS_Circ_10672_10673_BCS__c
                    ,New_Calle_comercial__c
                    ,New_Calle_comercial_Inv__c
                    ,New_Calle_particular__c
                    ,New_Calle_particular_Inv__c
                    ,New_Cargo__c
                    ,New_Carpeta_comercial__c
                    ,New_Carpeta_operativa__c
                    ,New_Categoria_Deudor__c
                    ,New_Celular_Comercial_Inv__c
                    ,New_Celular_particular_Inv__c
                    ,New_Circ_57_2017_UAF__c
                    ,New_Ciudad_o_Provincia_comercial__c
                    ,New_Ciudad_o_Provincia_comercial_Inv__c
                    ,New_Ciudad_o_Provincia_particular__c
                    ,New_Ciudad_o_Provincia_particular_Inv__c
                    ,New_BICE_Classification_del__c
                    ,New_Clasificacion_de_Riesgo_SBIF__c
                    ,New_Clasificacion_submargenes__c
                    ,New_Cte_AP_Administraci_n_Cartera__c
                    ,New_Cliente_AP__c
                    ,New_Cliente_APV__c
                    ,New_Cliente_ARE_s__c
                    ,New_Cliente_Banco__c
                    ,New_Cliente_BIA__c
                    ,New_Cliente_desde__c
                    ,New_Cliente_Relacionado__c
                    ,New_Cluster__c
                    ,New_Commercial_Classification__c
                    ,New_Commercial_FAX_Other__c
                    ,New_Commercial_Landline__c
                    ,New_Commercial_Phone_Other__c
                    ,New_Comuna_comercial__c
                    ,New_Comuna_comercial_Inv__r.Name
                    ,New_Comuna_particular__c
                    ,New_Comuna_particular_Inv__r.Name
                    ,New_Copia_inscripcion_original__c
                    ,New_Estado_Creaci_n_de_Cliente__c
                    ,New_Customer_Legal_Person_Consumer__c
                    ,New_DAI_de_la_Soc__c
                    ,New_DCV_Circ_190_SVS__c
                    ,New_Descripci_n_cuenta__c
                    ,New_Deuda_Sistema_Financiero_MM_pesos__c
                    ,New_Documentaci_n_sustentatoria_EESS__c
                    ,New_Ejecutivo_de_Inversiones__r.Name
                    ,New_Email_comercial_Inv__c
                    ,New_Email_facturacion_Inv__c
                    ,New_Email_personal_Inv__c
                    ,New_Email_Rep_Legal_Inv__c
                    ,New_Empleador__c
                    ,New_Escritura_publica__c
                    ,New_Estado_civil__c
                    ,New_Estado_Deudor__c
                    ,New_Estracto_Diario_Oficial__c
                    ,New_Fecha_apertura_cta_cte__c
                    ,New_Fecha_Constitucion_Empresa__c
                    ,New_Fecha_creacion_Sebra__c
                    ,New_Fecha_declaracion_jurada_art_85__c
                    ,New_Fecha_de_conversi_n_a_cliente__c
                    ,New_Fecha_de_declaracion_de_margen__c
                    ,New_Fecha_de_vencimiento_MAC__c
                    ,New_Fecha_fin_relaci_n__c
                    ,New_Fecha_inicio_relaci_n__c
                    ,New_Fecha_resultado_comit__c
                    ,New_Fecha_Solicitud_Crear_Cliente__c
                    ,New_Ficha_cuenta__c
                    ,New_Filial_de_participacion__c
                    ,New_Form_Art_85__c
                    ,New_Form_EESS__c
                    ,New_Form_FATCA__c
                    ,New_Form_Ingreso_Maestro_de_Clientes__c
                    ,New_Form_Solicitud_de_Productos__c
                    ,New_Giro_Inv__c
                    ,New_Giro_Inv__r.Name
                    ,New_Grupo_Deudor_Relacionado__c
                    ,New_Socios_de_la_empresa_Grupo_Econ_mico__c
                    ,New_Hobbies__c
                    ,New_Idea_de_negocio__c
                    ,New_Industry__c
                    ,New_Info_adicional_Inv_Depto__c
                    ,New_Info_adicional_Inv_Oficina__c
                    ,New_Informacion_adicional_comercial__c
                    ,New_FATCA_Information__c
                    ,New_Informacion_privilegiada__c
                    ,New_Inf_privilegiada_Cargo_SVS_171__c
                    ,New_Intereses__c
                    ,New_KYC_Aprobado__c
                    ,New_Lugar_de_Nacimiento__c
                    ,New_MDR__c
                    ,New_Medios_de_pago_para_productos_CDB__c
                    ,New_Modalidad_de_operaci_n__c
                    ,New_Modelo_facturaci_n__c
                    ,New_Monto_MAC_creado__c
                    ,New_Monto_Preaprobado__c
                    ,New_N_de_cuenta__c
                    ,New_N_cuenta_bancaria__c
                    ,New_Nationality__c
                    ,New_Name__c
                    ,New_Nivel_de_Riesgo_de_la_Cartera__c
                    ,New_Nombre__c
                    ,New_Nombre_Conyuge__c
                    ,New_Nombre_de_fantasia__c
                    ,New_Nombre_Factoring__c
                    ,New_Nombres__c
                    ,New_Numero_comercial__c
                    ,New_Numero_calle_comercial_Inv__c
                    ,New_Numero_particular__c
                    ,New_Numero_calle_particular_Inv__c
                    ,New_Numero_de_GIN__c
                    ,New_Numero_de_TIN__c
                    ,New_Observacion_Area_Cliente__c
                    ,New_Obtener_Foto_y_Huellas__c
                    ,New_Office_Number__c
                    ,New_SBIF_Sector__c
                    ,New_Otra_idea_de_negocio__c
                    ,New_Otras_Sociedades__c
                    ,New_Otro_telefono_Comercial_Inv__c
                    ,New_Otro_telefono_particular_Inv__c
                    ,New_Taxes__c
                    ,New_Pa_s_Casa_Matriz__c
                    ,New_Pais_comercial__c
                    ,New_Pais_comercial_Inv__c
                    ,New_Pa_s_de_Constituci_n__c
                    ,New_Pais_particular__c
                    ,New_Pais_particular_Inv__c
                    ,New_Perfil_de_inversionista__c
                    ,New_Perfil_de_Riesgo__c
                    ,New_PersonAssistantName__c
                    ,New_PersonAssistantPhone__c
                    ,New_PersonBirthdate__c
                    ,New_PersonDepartment__c
                    ,New_PersonEmail__c
                    ,New_PersonHomePhone__c
                    ,New_PersonMailingAddress__c
                    ,New_PersonMobilePhone__c
                    ,New_PersonOtherAddress__c
                    ,New_PersonOtherPhone__c
                    ,New_PersonTitle__c
                    ,New_Phone__c
                    ,New_Plantilla_cobro__c
                    ,New_Plantilla_Producto__c
                    ,New_Plataforma_de_captacion__c
                    ,New_Plataforma_Siga_CRM__c
                    ,New_Plataforma_Torre__c
                    ,New_Profession__c
                    ,New_Prop_sito_cuenta__c
                    ,New_Raz_n_Social__c
                    ,New_Regimen_Conyugal__c
                    ,New_Region_comercial__c
                    ,New_Region_comercial_Inv__c
                    ,New_Region_particular__c
                    ,New_Region_particular_Inv__c
                    ,New_Registro_de_Firma__c
                    ,New_Registro_Fotogr_fico__c
                    ,New_Relacionado_con_la_corredora__c
                    ,New_Relacion_con_corredora_Circ_1064__c
                    ,New_Relacion_Gestion_Banco__c
                    ,New_Rentabilidad_12_meses__c
                    ,New_Rentabilidad_1_dia__c
                    ,New_Rentabilidad_30_dias__c
                    ,New_Rentabilidad_7_dias__c
                    ,New_Rentabilidad_YTD__c
                    ,New_Rep_Legal_email__c
                    ,New_Req_comercial_de_la_empresa__c
                    ,New_Resultado_verificacion_requisitos__c
                    ,New_ROA_12_meses__c
                    ,New_ROA_1_dia__c
                    ,New_ROA_30_dias__c
                    ,New_ROA_7_dias__c
                    ,New_ROA_YTD__c
                    ,New_RUT_Conyuge__c
                    ,New_rut_inv__c
                    ,New_RUT_Sociedad_participacion__c
                    ,New_Segmentaci_n_BI__c
                    ,New_Segmentacion_Liquidez_Codigo__c
                    ,New_Segmentacion_Liquidez_SubCodigo__c
                    ,New_Segmentation__c
                    ,New_Segmento__c
                    ,New_Sex__c
                    ,New_SII_DJ_1820_1829__c
                    ,New_Situac_Laboral__c
                    ,New_Socio_Solidario__c
                    ,New_Sub_Sector_Economico__c
                    ,New_Subsegmento__c
                    ,New_Sucursal_Banco__c
                    ,New_Sucursal_BI__c
                    ,New_Sucursal_creaci_n_registro__c
                    ,New_Susceptible_conflicto_de_interes__c
                    ,New_Telefono_fijo_comercial_Inv__c
                    ,New_Telefono_fijo_particular_Inv__c
                    ,New_Commercial_Cellphone__c
                    ,New_Tipo_Cliente_Gestion__c
                    ,New_Tipo_cuenta__c
                    ,New_Tipo_cuenta_DCV__c
                    ,New_Tipo_de_Banca__c
                    ,New_Tipo_de_Cliente__c
                    ,New_Tipo_de_Cliente_Empresa__c
                    ,New_Customer_type_other_rating_c__c
                    ,New_Tipo_de_Documento_Relacionado__c
                    ,New_Tipo_de_Persona__c
                    ,New_Tipo_de_Relacion__c
                    ,New_Tipo_perfil_comercial__c
                    ,New_Tipo_relaci_n__c
                    ,New_VIP__c
                    ,New_Website__c
                    ,New_Calle_particular_de_Conyuge__c
                    ,New_Ciudad_particular_de_Conyuge__c
                    ,New_Comuna_de_Direccion_Conyuge__c
                    ,New_Comuna_de_Direccion_Conyuge__r.Name
                    ,New_DeptoCasaSectorParticular_de_Conyuge__c
                    ,New_Numero_calle_particular_de_Conyuge__c
                    ,New_Region_particular_de_Conyuge__c
                    ,RecordType.Name
                  FROM BICE_Solicitud_Cliente__c
                  WHERE Cliente__c =: acc2.Id 
                  LIMIT 1];
            
            //BICE_SolCteChangesVF 
            ApexPages.StandardController sc3 = new ApexPages.standardController(bc);
            BICE_SolCteChangesVF ext3 = new BICE_SolCteChangesVF(sc3);
            
            bc.Apellido_Materno__c = 'Otro';
            update bc;
            
            delete bc;
            
            undelete bc;

            ApexPages.StandardController sc4 = new ApexPages.standardController(bc2);
            BICE_SolCteChangesVF ext4 = new BICE_SolCteChangesVF(sc4);
            
            bc2.Apellido_Materno__c = 'Otro';
            update bc2;
            
            delete bc2;
            
            undelete bc2;
            
            BICE_SolCteTriggerHandler scth = new BICE_SolCteTriggerHandler(true,200);
            scth.OnAfterInsert(new List<Account>());
            BICE_SolCteTriggerHandler.OnAfterInsertAsync(new Set<ID>());
            scth.OnAfterUpdate(new List<Account>(), new List<Account>(), new Map<Id, Account>());
            BICE_SolCteTriggerHandler.OnAfterUpdateAsync(new Set<ID>());
            scth.OnBeforeDelete(new List<Account>(), new Map<Id, Account>());
            scth.OnAfterDelete(new List<Account>(), new Map<Id, Account>());
            BICE_SolCteTriggerHandler.OnAfterDeleteAsync(new Set<ID>());
            scth.OnUndelete(new List<Account>());
            Contact c = new Contact(LastName='test',AccountId=acc2.Id);
            insert c;
            Boolean x;
            x = scth.IsTriggerContext;
            x = scth.IsVisualforcePageContext;
            x = scth.IsWebServiceContext;
            x = scth.IsExecuteAnonymousContext;
            BICE_SolCteTriggerHandler.getAccountContacts(c.Id);
            BICE_SolCteTriggerHandler.FormatoFecha(Date.today(),'');
            BICE_SolCteTriggerHandler.FormatoFecha(null,'');
            // Persona Natural
            //bc.Estado_solicitud__c = 'Aprobado';
            bc.New_N_cuenta_bancaria__c = '123';
            bc.New_Banco__c = 'BANCO BBVA';
            bc.Estado_solicitud__c = 'Aprobado';
            update bc;
            bc.New_N_cuenta_bancaria__c = '123';
            bc.New_Banco__c = 'BANCO BBVA';
            bc.Estado_solicitud__c = 'Aprobado';
            update bc;
            // Persona Jurídica
            bc2.Estado_solicitud__c = 'Aprobado';
            bc2.New_N_cuenta_bancaria__c = '123';
            bc2.New_Banco__c = 'BANCO BBVA';
            //bc2.Sebra_Ok__c = true;
            update bc2;
        }
    }
}