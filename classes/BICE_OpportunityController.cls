public class BICE_OpportunityController {

    public Opportunity opp{ get; set; }

    public BICE_OpportunityController(ApexPages.StandardController controller) {
        String id = controller.getRecord().id; 
        this.opp = [SELECT Id, Name, AccountId FROM Opportunity WHERE Id =:id];
    }
    
    public PageReference redirect(){
        System.debug('Account ID: '+this.opp.AccountId);
        Account a = [SELECT Id 
                    ,Actividad_Economica_SBIF__c
                    ,Email_Comercial_Inv__c
                    ,Apartment__c
                    ,Apellido_Materno__pc
                    ,Spouse_Mothers_Last_Name__pc
                    ,apellidoMaterno__c
                    ,LastName
                    ,Spouse_Fathers_Last_Name__pc
                    ,apellidoPaterno__c
                    ,Atencion_diferencial__c
                    ,AUM__c
                    ,Autorizaci_n_de_informar_a_organismo_FAT__c
                    ,Balances__c
                    ,Banco__c
                    ,BCS_Circ_10672_10673_BCS__c
                    ,Calle_comercial__c
                    ,Calle_comercial_Inv__c
                    ,Calle_particular__c
                    ,Calle_particular_Inv__c
                    ,Celular_Particular_Inv__pc
                    ,Cargo__pc
                    ,Carpeta_comercial__c
                    ,Carpeta_operativa__c
                    ,Categoria_Deudor__c
                    ,Celular_Comercial_Inv__c
                    ,Circ_57_2017_UAF__c
                    ,Ciudad_o_Provincia_comercial__c
                    ,Ciudad_o_Provincia_comercial_Inv__c
                    ,Ciudad_o_Provincia_particular__c
                    ,Ciudad_o_Provincia_particular_Inv__c
                    ,BICE_Classification_del__c
                    ,Clasificacion_de_Riesgo_SBIF__c
                    ,Clasificacion_submargenes__c
                    ,Cliente_AP_con_Administraci_n_Cartera__c
                    ,Cliente_AP__c
                    ,Cliente_APV__c
                    ,Cliente_ARE_s__c
                    ,Cliente_Banco__c
                    ,Cliente_BIA__c
                    ,Cliente_desde__c
                    ,Cliente_Relacionado__c
                    ,Cluster__c
                    ,Commercial_Classification__c
                    ,Commercial_FAX_Other__c
                    ,Commercial_Landline__c
                    ,Commercial_Phone_Other__c
                    ,Comuna_comercial__c
                    ,Comuna_comercial_Inv__c
                    ,Comuna_particular__c
                    ,Comuna_particular_Inv__c
                    ,Copia_inscripcion_original__c
                    ,Estado_Creaci_n_de_Cliente__c
                    ,Customer_Legal_Person_Consumer__c
                    ,DAI_de_la_Soc__c
                    ,DCV_Circ_190_SVS__c
                    ,Descripci_n_cuenta__c
                    ,Deuda_Sistema_Financiero_MM_pesos__c
                    ,Documentaci_n_sustentatoria_EESS__c
                    ,Ejecutivo_de_Inversiones__c
                    ,Email_Comercial_Inv__pc
                    ,Email_facturacion_Inv__c
                    ,Email_Personal_Inv__pc
                    ,Email_Rep_Legal_Inv__c
                    ,Employer__pc
                    ,Escritura_publica__c
                    ,Estado_civil__pc
                    ,Estado_Deudor__c
                    ,Estracto_Diario_Oficial__c
                    ,Fecha_apertura_cta_cte__c
                    ,Fecha_Constitucion_Empresa__c
                    ,Fecha_creacion_Sebra__c
                    ,Fecha_declaracion_jurada_art_85__c
                    ,Fecha_de_conversi_n_a_cliente__c
                    ,Fecha_de_declaracion_de_margen__c
                    ,Fecha_de_vencimiento_MAC__c
                    ,Fecha_fin_relaci_n__c
                    ,Fecha_inicio_relaci_n__c
                    ,Fecha_resultado_comit__c
                    ,Fecha_Solicitud_Crear_Cliente__c
                    ,Ficha_cuenta__c
                    ,Filial_de_participacion__c
                    ,Form_Art_85__c
                    ,Form_EESS__c
                    ,Form_FATCA__c
                    ,Form_Ingreso_Maestro_de_Clientes__c
                    ,Form_Solicitud_de_Productos__c
                    ,Giro_Inv__c
                    ,Grupo_Deudor_Relacionado__c
                    ,Socios_de_la_empresa_Grupo_Econ_mico__c
                    ,Hobbies__c
                    ,Idea_de_negocio__c
                    ,Industry
                    ,Info_adicional_Inv_Depto__c
                    ,Info_adicional_Inv_Oficina__c
                    ,Informacion_adicional_comercial__c
                    ,FATCA_Information__c
                    ,Informacion_privilegiada__c
                    ,Informacion_privilegiada_Cargo_SVS_171__c
                    ,Intereses__c
                    ,KYC_Aprobado__c
                    ,Lugar_de_Nacimiento__c
                    ,MDR__c
                    ,Medios_de_pago_para_productos_CDB__c
                    ,Modalidad_de_operaci_n__c
                    ,Modelo_facturaci_n__c
                    ,Monto_MAC_creado__c
                    ,Monto_Preaprobado__c
                    ,N_de_cuenta__c
                    ,N_cuenta_bancaria__c
                    ,Nationality__c
                    ,Name
                    ,Nivel_de_Riesgo_de_la_Cartera__c
                    ,Firstname
                    ,Spouse_First_Name__pc
                    ,Nombre_Factoring__c
                    ,Nombres__c
                    ,Numero_comercial__c
                    ,Numero_calle_comercial_Inv__c
                    ,Numero_particular__c
                    ,Numero_calle_particular_Inv__c
                    ,Numero_de_GIN__c
                    ,Numero_de_TIN__c
                    ,Observacion_Area_Cliente__c
                    ,Obtener_Foto_y_Huellas__c
                    ,Office_Number__c
                    ,SBIF_Sector__c
                    ,Otra_idea_de_negocio__c
                    ,Otras_Sociedades__c
                    ,Otro_telefono_Comercial_Inv__c
                    ,Otro_telefono_particular_Inv__pc
                    ,Taxes__c
                    ,Pa_s_Casa_Matriz__c
                    ,Pais_comercial__c
                    ,Pais_comercial_Inv__c
                    ,Pa_s_de_Constituci_n__c
                    ,Pais_particular__c
                    ,Pais_particular_Inv__c
                    ,Perfil_de_inversionista__c
                    ,Perfil_de_Riesgo__c
                    ,PersonAssistantName
                    ,PersonAssistantPhone
                    ,PersonBirthdate
                    ,PersonDepartment
                    ,PersonEmail
                    ,PersonHomePhone
                    ,PersonMailingAddress
                    ,PersonMobilePhone
                    ,PersonOtherAddress
                    ,PersonOtherPhone
                    ,PersonTitle
                    ,Phone
                    ,Plantilla_cobro__c
                    ,Plantilla_Producto__c
                    ,Plataforma_de_captacion__c
                    ,Plataforma_Siga_CRM__c
                    ,Plataforma_Torre__c
                    ,Profession__pc
                    ,Prop_sito_cuenta__c
                    ,Raz_n_Social__c
                    ,RecordTypeId
                    ,Conjugal_Regime__pc
                    ,Region_comercial__c
                    ,Region_comercial_Inv__c
                    ,Region_particular__c
                    ,Region_particular_Inv__c
                    ,Registro_de_Firma__c
                    ,Registro_Fotogr_fico__c
                    ,Relacionado_con_la_corredora__c
                    ,Relacion_con_corredora_Circ_1064__c
                    ,Relacion_Gestion_Banco__c
                    ,Rentabilidad_12_meses__c
                    ,Rentabilidad_1_dia__c
                    ,Rentabilidad_30_dias__c
                    ,Rentabilidad_7_dias__c
                    ,Rentabilidad_YTD__c
                    ,Rep_Legal_email__c
                    ,Requerimiento_comercial_de_la_empresa__c
                    ,Resultado_verificacion_requisitos__c
                    ,ROA_12_meses__c
                    ,ROA_1_dia__c
                    ,ROA_30_dias__c
                    ,ROA_7_dias__c
                    ,ROA_YTD__c
                    ,Spouse_RUT__pc
                    ,Rut__c
                    ,rut_inv__c
                    ,RUT_Sociedad_participacion__c
                    ,Segmentaci_n_BI__c
                    ,Segmentacion_Liquidez_Codigo__c
                    ,Segmentacion_Liquidez_SubCodigo__c
                    ,Segmentation__c
                    ,Segmento__c
                    ,Sex__pc
                    ,SII_DJ_1820_1829__c
                    ,Situac_Laboral__c
                    ,Socio_Solidario__c
                    ,Sub_Sector_Economico__c
                    ,Subsegmento__c
                    ,Sucursal_Banco__c
                    ,Sucursal_BI__c
                    ,Sucursal_creaci_n_registro__c
                    ,Susceptible_conflicto_de_interes__c
                    ,Telefono_fijo_comercial_Inv__c
                    ,Telefono_fijo_particular_Inv__pc
                    ,Commercial_Cellphone__c
                    ,Tipo_Cliente_Gestion__c
                    ,Tipo_cuenta__c
                    ,Tipo_cuenta_DCV__c
                    ,Tipo_de_Banca__c
                    ,Tipo_de_Cliente__c
                    ,Tipo_de_Cliente_Empresa__c
                    ,Customer_type_other_rating_c__c
                    ,Tipo_de_Documento_Relacionado__c
                    ,Tipo_de_Persona__c
                    ,Tipo_de_Relacion__c
                    ,Tipo_perfil_comercial__c
                    ,Tipo_relaci_n__c
                    ,VIP__c
                    ,Website
                    ,isPersonAccount
                    ,Calle_particular_de_Conyuge__pc
                    ,Ciudad_particular_de_Conyuge__pc
                    ,Comuna_de_Direccion_Conyuge__pc
                    ,DeptoCasaSector_particular_de_Conyuge__pc
                    ,Numero_de_calle_particular_de_Conyuge__pc
                    ,Region_particular_de_Conyuge__pc
                  FROM Account
                  WHERE Id =: this.opp.AccountId 
                  LIMIT 1];
        if(a != null){
            RecordType rt = [SELECT Name FROM RecordType WHERE Id =:a.RecordTypeId LIMIT 1];
            RecordType rtPN = [SELECT Id FROM RecordType WHERE Name = 'Solicitud Cliente Inversiones Persona Natural' LIMIT 1];
            RecordType rtPJ = [SELECT Id FROM RecordType WHERE Name = 'Solicitud Cliente Inversiones Persona Jurídica' LIMIT 1];
            BICE_Solicitud_Cliente__c bx = new BICE_Solicitud_Cliente__c();
            IF(a.Actividad_Economica_SBIF__c != null){ bx.New_Actividad_Economica_SBIF__c = a.Actividad_Economica_SBIF__c; }
            IF(a.Apartment__c != null){ bx.New_Apartment__c = a.Apartment__c; }
            IF(a.Apellido_Materno__pc != null){ bx.New_Apellido_Materno__c = a.Apellido_Materno__pc; }
            IF(a.Spouse_Mothers_Last_Name__pc != null){ bx.New_Apellido_Materno_Conyuge__c = a.Spouse_Mothers_Last_Name__pc; }
            IF(a.apellidoMaterno__c != null){ bx.New_apellidoMaterno__c = a.apellidoMaterno__c; }
            IF(a.LastName != null){ bx.New_Apellido_Paterno__c = a.LastName; }
            IF(a.Spouse_Fathers_Last_Name__pc != null){ bx.New_Apellido_Paterno_Conyuge__c = a.Spouse_Fathers_Last_Name__pc; }
            IF(a.apellidoPaterno__c != null){ bx.New_apellidoPaterno__c = a.apellidoPaterno__c; }
            IF(a.Atencion_diferencial__c != null){ bx.New_Atencion_diferencial__c = a.Atencion_diferencial__c; }
            IF(a.AUM__c != null){ bx.New_AUM__c = a.AUM__c; }
            IF(a.Autorizaci_n_de_informar_a_organismo_FAT__c != null){ bx.New_Autoriz_de_informar_a_organism_FATCA__c = a.Autorizaci_n_de_informar_a_organismo_FAT__c; }
            IF(a.Balances__c != null){ bx.New_Balances__c = a.Balances__c; }
            IF(a.Banco__c != null){ bx.New_Banco__c = a.Banco__c; }
            IF(a.BCS_Circ_10672_10673_BCS__c != null){ bx.New_BCS_Circ_10672_10673_BCS__c = a.BCS_Circ_10672_10673_BCS__c; }
            IF(a.Calle_comercial__c != null){ bx.New_Calle_comercial__c = a.Calle_comercial__c; }
            IF(a.Calle_comercial_Inv__c != null){ bx.New_Calle_comercial_Inv__c = a.Calle_comercial_Inv__c; }
            IF(a.Calle_particular__c != null){ bx.New_Calle_particular__c = a.Calle_particular__c; }
            IF(a.Calle_particular_Inv__c != null){ bx.New_Calle_particular_Inv__c = a.Calle_particular_Inv__c; }
            IF(a.Cargo__pc != null){ bx.New_Cargo__c = a.Cargo__pc; }
            IF(a.Carpeta_comercial__c != null){ bx.New_Carpeta_comercial__c = a.Carpeta_comercial__c; }
            IF(a.Carpeta_operativa__c != null){ bx.New_Carpeta_operativa__c = a.Carpeta_operativa__c; }
            IF(a.Categoria_Deudor__c != null){ bx.New_Categoria_Deudor__c = a.Categoria_Deudor__c; }
            IF(a.Celular_Comercial_Inv__c != null){ bx.New_Celular_Comercial_Inv__c = a.Celular_Comercial_Inv__c; }
            IF(a.Celular_Particular_Inv__pc != null){ bx.New_Celular_particular_Inv__c = a.Celular_Particular_Inv__pc; }
            IF(a.Circ_57_2017_UAF__c != null){ bx.New_Circ_57_2017_UAF__c = a.Circ_57_2017_UAF__c; }
            IF(a.Ciudad_o_Provincia_comercial__c != null){ bx.New_Ciudad_o_Provincia_comercial__c = a.Ciudad_o_Provincia_comercial__c; }
            IF(a.Ciudad_o_Provincia_comercial_Inv__c != null){ bx.New_Ciudad_o_Provincia_comercial_Inv__c = a.Ciudad_o_Provincia_comercial_Inv__c; }
            IF(a.Ciudad_o_Provincia_particular__c != null){ bx.New_Ciudad_o_Provincia_particular__c = a.Ciudad_o_Provincia_particular__c; }
            IF(a.Ciudad_o_Provincia_particular_Inv__c != null){ bx.New_Ciudad_o_Provincia_particular_Inv__c = a.Ciudad_o_Provincia_particular_Inv__c; }
            IF(a.BICE_Classification_del__c != null){ bx.New_BICE_Classification_del__c = a.BICE_Classification_del__c; }
            IF(a.Clasificacion_de_Riesgo_SBIF__c != null){ bx.New_Clasificacion_de_Riesgo_SBIF__c = a.Clasificacion_de_Riesgo_SBIF__c; }
            IF(a.Clasificacion_submargenes__c != null){ bx.New_Clasificacion_submargenes__c = a.Clasificacion_submargenes__c; }
            IF(a.Cliente_AP_con_Administraci_n_Cartera__c != null){ bx.New_Cte_AP_Administraci_n_Cartera__c = a.Cliente_AP_con_Administraci_n_Cartera__c; }
            IF(a.Cliente_AP__c != null){ bx.New_Cliente_AP__c = a.Cliente_AP__c; }
            IF(a.Cliente_APV__c != null){ bx.New_Cliente_APV__c = a.Cliente_APV__c; }
            IF(a.Cliente_ARE_s__c != null){ bx.New_Cliente_ARE_s__c = a.Cliente_ARE_s__c; }
            IF(a.Cliente_Banco__c != null){ bx.New_Cliente_Banco__c = a.Cliente_Banco__c; }
            IF(a.Cliente_BIA__c != null){ bx.New_Cliente_BIA__c = a.Cliente_BIA__c; }
            IF(a.Cliente_desde__c != null){ bx.New_Cliente_desde__c = a.Cliente_desde__c; }
            IF(a.Cliente_Relacionado__c != null){ bx.New_Cliente_Relacionado__c = a.Cliente_Relacionado__c; }
            IF(a.Cluster__c != null){ bx.New_Cluster__c = a.Cluster__c; }
            IF(a.Commercial_Classification__c != null){ bx.New_Commercial_Classification__c = a.Commercial_Classification__c; }
            IF(a.Commercial_FAX_Other__c != null){ bx.New_Commercial_FAX_Other__c = a.Commercial_FAX_Other__c; }
            IF(a.Commercial_Landline__c != null){ bx.New_Commercial_Landline__c = a.Commercial_Landline__c; }
            IF(a.Commercial_Phone_Other__c != null){ bx.New_Commercial_Phone_Other__c = a.Commercial_Phone_Other__c; }
            IF(a.Comuna_comercial__c != null){ bx.New_Comuna_comercial__c = a.Comuna_comercial__c; }
            IF(a.Comuna_comercial_Inv__c != null){ bx.New_Comuna_comercial_Inv__c = a.Comuna_comercial_Inv__c; }
            IF(a.Comuna_particular__c != null){ bx.New_Comuna_particular__c = a.Comuna_particular__c; }
            IF(a.Comuna_particular_Inv__c != null){ bx.New_Comuna_particular_Inv__c = a.Comuna_particular_Inv__c; }
            IF(a.Copia_inscripcion_original__c != null){ bx.New_Copia_inscripcion_original__c = a.Copia_inscripcion_original__c; }
            IF(a.Estado_Creaci_n_de_Cliente__c != null){ bx.New_Estado_Creaci_n_de_Cliente__c = a.Estado_Creaci_n_de_Cliente__c; }
            IF(a.Customer_Legal_Person_Consumer__c != null){ bx.New_Customer_Legal_Person_Consumer__c = a.Customer_Legal_Person_Consumer__c; }
            IF(a.DAI_de_la_Soc__c != null){ bx.New_DAI_de_la_Soc__c = a.DAI_de_la_Soc__c; }
            IF(a.DCV_Circ_190_SVS__c != null){ bx.New_DCV_Circ_190_SVS__c = a.DCV_Circ_190_SVS__c; }
            IF(a.Descripci_n_cuenta__c != null){ bx.New_Descripci_n_cuenta__c = a.Descripci_n_cuenta__c; }
            IF(a.Deuda_Sistema_Financiero_MM_pesos__c != null){ bx.New_Deuda_Sistema_Financiero_MM_pesos__c = a.Deuda_Sistema_Financiero_MM_pesos__c; }
            IF(a.Documentaci_n_sustentatoria_EESS__c != null){ bx.New_Documentaci_n_sustentatoria_EESS__c = a.Documentaci_n_sustentatoria_EESS__c; }
            IF(a.Ejecutivo_de_Inversiones__c != null){ bx.New_Ejecutivo_de_Inversiones__c = a.Ejecutivo_de_Inversiones__c; }
            IF(a.Email_Comercial_Inv__c != null){ bx.New_Email_comercial_Inv__c = a.Email_Comercial_Inv__c; }
            IF(a.Email_facturacion_Inv__c != null){ bx.New_Email_facturacion_Inv__c = a.Email_facturacion_Inv__c; }
            IF(a.Email_Personal_Inv__pc != null){ bx.New_Email_personal_Inv__c = a.Email_Personal_Inv__pc; }
            IF(a.Email_Rep_Legal_Inv__c != null){ bx.New_Email_Rep_Legal_Inv__c = a.Email_Rep_Legal_Inv__c; }
            IF(a.Employer__pc != null){ bx.New_Empleador__c = a.Employer__pc; }
            IF(a.Escritura_publica__c != null){ bx.New_Escritura_publica__c = a.Escritura_publica__c; }
            IF(a.Estado_civil__pc != null){ bx.New_Estado_civil__c = a.Estado_civil__pc; }
            IF(a.Estado_Deudor__c != null){ bx.New_Estado_Deudor__c = a.Estado_Deudor__c; }
            IF(a.Estracto_Diario_Oficial__c != null){ bx.New_Estracto_Diario_Oficial__c = a.Estracto_Diario_Oficial__c; }
            IF(a.Fecha_apertura_cta_cte__c != null){ bx.New_Fecha_apertura_cta_cte__c = a.Fecha_apertura_cta_cte__c; }
            IF(a.Fecha_Constitucion_Empresa__c != null){ bx.New_Fecha_Constitucion_Empresa__c = a.Fecha_Constitucion_Empresa__c; }
            IF(a.Fecha_creacion_Sebra__c != null){ bx.New_Fecha_creacion_Sebra__c = a.Fecha_creacion_Sebra__c; }
            IF(a.Fecha_declaracion_jurada_art_85__c != null){ bx.New_Fecha_declaracion_jurada_art_85__c = a.Fecha_declaracion_jurada_art_85__c; }
            IF(a.Fecha_de_declaracion_de_margen__c != null){ bx.New_Fecha_de_declaracion_de_margen__c = a.Fecha_de_declaracion_de_margen__c; }
            IF(a.Fecha_de_vencimiento_MAC__c != null){ bx.New_Fecha_de_vencimiento_MAC__c = a.Fecha_de_vencimiento_MAC__c; }
            IF(a.Fecha_fin_relaci_n__c != null){ bx.New_Fecha_fin_relaci_n__c = a.Fecha_fin_relaci_n__c; }
            IF(a.Fecha_inicio_relaci_n__c != null){ bx.New_Fecha_inicio_relaci_n__c = a.Fecha_inicio_relaci_n__c; }
            IF(a.Fecha_resultado_comit__c != null){ bx.New_Fecha_resultado_comit__c = a.Fecha_resultado_comit__c; }
            IF(a.Fecha_Solicitud_Crear_Cliente__c != null){ bx.New_Fecha_Solicitud_Crear_Cliente__c = a.Fecha_Solicitud_Crear_Cliente__c; }
            IF(a.Ficha_cuenta__c != null){ bx.New_Ficha_cuenta__c = a.Ficha_cuenta__c; }
            IF(a.Filial_de_participacion__c != null){ bx.New_Filial_de_participacion__c = a.Filial_de_participacion__c; }
            IF(a.Form_Art_85__c != null){ bx.New_Form_Art_85__c = a.Form_Art_85__c; }
            IF(a.Form_EESS__c != null){ bx.New_Form_EESS__c = a.Form_EESS__c; }
            IF(a.Form_FATCA__c != null){ bx.New_Form_FATCA__c = a.Form_FATCA__c; }
            IF(a.Form_Ingreso_Maestro_de_Clientes__c != null){ bx.New_Form_Ingreso_Maestro_de_Clientes__c = a.Form_Ingreso_Maestro_de_Clientes__c; }
            IF(a.Form_Solicitud_de_Productos__c != null){ bx.New_Form_Solicitud_de_Productos__c = a.Form_Solicitud_de_Productos__c; }
            IF(a.Giro_Inv__c != null){ bx.New_Giro_Inv__c = a.Giro_Inv__c; }
            IF(a.Grupo_Deudor_Relacionado__c != null){ bx.New_Grupo_Deudor_Relacionado__c = a.Grupo_Deudor_Relacionado__c; }
            IF(a.Socios_de_la_empresa_Grupo_Econ_mico__c != null){ bx.New_Socios_de_la_empresa_Grupo_Econ_mico__c = a.Socios_de_la_empresa_Grupo_Econ_mico__c; }
            IF(a.Hobbies__c != null){ bx.New_Hobbies__c = a.Hobbies__c; }
            IF(a.Idea_de_negocio__c != null){ bx.New_Idea_de_negocio__c = a.Idea_de_negocio__c; }
            IF(a.Industry != null){ bx.New_Industry__c = a.Industry; }
            IF(a.Info_adicional_Inv_Depto__c != null){ bx.New_Info_adicional_Inv_Depto__c = a.Info_adicional_Inv_Depto__c; }
            IF(a.Info_adicional_Inv_Oficina__c != null){ bx.New_Info_adicional_Inv_Oficina__c = a.Info_adicional_Inv_Oficina__c; }
            IF(a.Informacion_adicional_comercial__c != null){ bx.New_Informacion_adicional_comercial__c = a.Informacion_adicional_comercial__c; }
            IF(a.FATCA_Information__c != null){ bx.New_FATCA_Information__c = a.FATCA_Information__c; }
            IF(a.Informacion_privilegiada__c != null){ bx.New_Informacion_privilegiada__c = a.Informacion_privilegiada__c; }
            IF(a.Informacion_privilegiada_Cargo_SVS_171__c != null){ bx.New_Inf_privilegiada_Cargo_SVS_171__c = a.Informacion_privilegiada_Cargo_SVS_171__c; }
            IF(a.Intereses__c != null){ bx.New_Intereses__c = a.Intereses__c; }
            IF(a.KYC_Aprobado__c != null){ bx.New_KYC_Aprobado__c = a.KYC_Aprobado__c; }
            IF(a.Lugar_de_Nacimiento__c != null){ bx.New_Lugar_de_Nacimiento__c = a.Lugar_de_Nacimiento__c; }
            System.debug('Lugar de Nacimiento Original: '+a.Lugar_de_Nacimiento__c);
            System.debug('Lugar de Nacimiento Modificado: '+bx.New_Lugar_de_Nacimiento__c);
            IF(a.MDR__c != null){ bx.New_MDR__c = a.MDR__c; }
            IF(a.Medios_de_pago_para_productos_CDB__c != null){ bx.New_Medios_de_pago_para_productos_CDB__c = a.Medios_de_pago_para_productos_CDB__c; }
            IF(a.Modalidad_de_operaci_n__c != null){ bx.New_Modalidad_de_operaci_n__c = a.Modalidad_de_operaci_n__c; }
            IF(a.Modelo_facturaci_n__c != null){ bx.New_Modelo_facturaci_n__c = a.Modelo_facturaci_n__c; }
            IF(a.Monto_MAC_creado__c != null){ bx.New_Monto_MAC_creado__c = a.Monto_MAC_creado__c; }
            IF(a.Monto_Preaprobado__c != null){ bx.New_Monto_Preaprobado__c = a.Monto_Preaprobado__c; }
            IF(a.N_de_cuenta__c != null){ bx.New_N_de_cuenta__c = a.N_de_cuenta__c; }
            IF(a.N_cuenta_bancaria__c != null){ bx.New_N_cuenta_bancaria__c = a.N_cuenta_bancaria__c; }
            IF(a.Nationality__c != null){ bx.New_Nationality__c = a.Nationality__c; }
            IF(a.Name != null){ bx.New_Name__c = a.Name; }
            IF(a.Nivel_de_Riesgo_de_la_Cartera__c != null){ bx.New_Nivel_de_Riesgo_de_la_Cartera__c = a.Nivel_de_Riesgo_de_la_Cartera__c; }
            IF(a.Firstname != null){ bx.New_Nombre__c = a.Firstname; }
            IF(a.Spouse_First_Name__pc != null){ bx.New_Nombre_Conyuge__c = a.Spouse_First_Name__pc; }
            IF(a.Name != null){ bx.New_Nombre_de_fantasia__c = a.Name; }
            IF(a.Nombre_Factoring__c != null){ bx.New_Nombre_Factoring__c = a.Nombre_Factoring__c; }
            IF(a.Nombres__c != null){ bx.New_Nombres__c = a.Nombres__c; }
            IF(a.Numero_comercial__c != null){ bx.New_Numero_comercial__c = a.Numero_comercial__c; }
            IF(a.Numero_calle_comercial_Inv__c != null){ bx.New_Numero_calle_comercial_Inv__c = a.Numero_calle_comercial_Inv__c; }
            IF(a.Numero_particular__c != null){ bx.New_Numero_particular__c = a.Numero_particular__c; }
            IF(a.Numero_calle_particular_Inv__c != null){ bx.New_Numero_calle_particular_Inv__c = a.Numero_calle_particular_Inv__c; }
            IF(a.Numero_de_GIN__c != null){ bx.New_Numero_de_GIN__c = a.Numero_de_GIN__c; }
            IF(a.Numero_de_TIN__c != null){ bx.New_Numero_de_TIN__c = a.Numero_de_TIN__c; }
            IF(a.Observacion_Area_Cliente__c != null){ bx.New_Observacion_Area_Cliente__c = a.Observacion_Area_Cliente__c; }
            IF(a.Obtener_Foto_y_Huellas__c != null){ bx.New_Obtener_Foto_y_Huellas__c = a.Obtener_Foto_y_Huellas__c; }
            IF(a.Office_Number__c != null){ bx.New_Office_Number__c = a.Office_Number__c; }
            IF(a.SBIF_Sector__c != null){ bx.New_SBIF_Sector__c = a.SBIF_Sector__c; }
            IF(a.Otra_idea_de_negocio__c != null){ bx.New_Otra_idea_de_negocio__c = a.Otra_idea_de_negocio__c; }
            IF(a.Otras_Sociedades__c != null){ bx.New_Otras_Sociedades__c = a.Otras_Sociedades__c; }
            IF(a.Otro_telefono_Comercial_Inv__c != null){ bx.New_Otro_telefono_Comercial_Inv__c = a.Otro_telefono_Comercial_Inv__c; }
            IF(a.Otro_telefono_particular_Inv__pc != null){ bx.New_Otro_telefono_particular_Inv__c = a.Otro_telefono_particular_Inv__pc; }
            IF(a.Taxes__c != null){ bx.New_Taxes__c = a.Taxes__c; }
            IF(a.Pa_s_Casa_Matriz__c != null){ bx.New_Pa_s_Casa_Matriz__c = a.Pa_s_Casa_Matriz__c; }
            IF(a.Pais_comercial__c != null){ bx.New_Pais_comercial__c = a.Pais_comercial__c; }
            IF(a.Pais_comercial_Inv__c != null){ bx.New_Pais_comercial_Inv__c = a.Pais_comercial_Inv__c; }
            IF(a.Pa_s_de_Constituci_n__c != null){ bx.New_Pa_s_de_Constituci_n__c = a.Pa_s_de_Constituci_n__c; }
            IF(a.Pais_particular__c != null){ bx.New_Pais_particular__c = a.Pais_particular__c; }
            IF(a.Pais_particular_Inv__c != null){ bx.New_Pais_particular_Inv__c = a.Pais_particular_Inv__c; }
            IF(a.Perfil_de_inversionista__c != null){ bx.New_Perfil_de_inversionista__c = a.Perfil_de_inversionista__c; }
            IF(a.PersonAssistantName != null){ bx.New_PersonAssistantName__c = a.PersonAssistantName; }
            IF(a.PersonAssistantPhone != null){ bx.New_PersonAssistantPhone__c = a.PersonAssistantPhone; }
            IF(a.PersonBirthdate != null){ bx.New_PersonBirthdate__c = a.PersonBirthdate; }
            IF(a.PersonDepartment != null){ bx.New_PersonDepartment__c = a.PersonDepartment; }
            IF(a.PersonEmail != null){ bx.New_PersonEmail__c = a.PersonEmail; }
            IF(a.PersonHomePhone != null){ bx.New_PersonHomePhone__c = a.PersonHomePhone; }
            //IF(a.PersonMailingAddress != null){ bx.New_PersonMailingAddress__c = a.PersonMailingAddress; }
            IF(a.PersonMobilePhone != null){ bx.New_PersonMobilePhone__c = a.PersonMobilePhone; }
            //IF(a.PersonOtherAddress != null){ bx.New_PersonOtherAddress__c = a.PersonOtherAddress; }
            IF(a.PersonOtherPhone != null){ bx.New_PersonOtherPhone__c = a.PersonOtherPhone; }
            IF(a.PersonTitle != null){ bx.New_PersonTitle__c = a.PersonTitle; }
            IF(a.Phone != null){ bx.New_Phone__c = a.Phone; }
            IF(a.Plantilla_cobro__c != null){ bx.New_Plantilla_cobro__c = a.Plantilla_cobro__c; }
            IF(a.Plantilla_Producto__c != null){ bx.New_Plantilla_Producto__c = a.Plantilla_Producto__c; }
            IF(a.Plataforma_de_captacion__c != null){ bx.New_Plataforma_de_captacion__c = a.Plataforma_de_captacion__c; }
            IF(a.Plataforma_Siga_CRM__c != null){ bx.New_Plataforma_Siga_CRM__c = a.Plataforma_Siga_CRM__c; }
            IF(a.Plataforma_Torre__c != null){ bx.New_Plataforma_Torre__c = a.Plataforma_Torre__c; }
            IF(a.Profession__pc != null){ bx.New_Profession__c = a.Profession__pc; }
            IF(a.Prop_sito_cuenta__c != null){ bx.New_Prop_sito_cuenta__c = a.Prop_sito_cuenta__c; }
            IF(a.Raz_n_Social__c != null){ bx.New_Raz_n_Social__c = a.Raz_n_Social__c; }
            IF(a.Conjugal_Regime__pc != null){ bx.New_Regimen_Conyugal__c = a.Conjugal_Regime__pc; }
            IF(a.Region_comercial__c != null){ bx.New_Region_comercial__c = a.Region_comercial__c; }
            IF(a.Region_comercial_Inv__c != null){ bx.New_Region_comercial_Inv__c = a.Region_comercial_Inv__c; }
            IF(a.Region_particular__c != null){ bx.New_Region_particular__c = a.Region_particular__c; }
            IF(a.Region_particular_Inv__c != null){ bx.New_Region_particular_Inv__c = a.Region_particular_Inv__c; }
            IF(a.Registro_de_Firma__c != null){ bx.New_Registro_de_Firma__c = a.Registro_de_Firma__c; }
            IF(a.Registro_Fotogr_fico__c != null){ bx.New_Registro_Fotogr_fico__c = a.Registro_Fotogr_fico__c; }
            IF(a.Relacionado_con_la_corredora__c != null){ bx.New_Relacionado_con_la_corredora__c = a.Relacionado_con_la_corredora__c; }
            IF(a.Relacion_con_corredora_Circ_1064__c != null){ bx.New_Relacion_con_corredora_Circ_1064__c = a.Relacion_con_corredora_Circ_1064__c; }
            IF(a.Relacion_Gestion_Banco__c != null){ bx.New_Relacion_Gestion_Banco__c = a.Relacion_Gestion_Banco__c; }
            IF(a.Rentabilidad_12_meses__c != null){ bx.New_Rentabilidad_12_meses__c = a.Rentabilidad_12_meses__c; }
            IF(a.Rentabilidad_1_dia__c != null){ bx.New_Rentabilidad_1_dia__c = a.Rentabilidad_1_dia__c; }
            IF(a.Rentabilidad_30_dias__c != null){ bx.New_Rentabilidad_30_dias__c = a.Rentabilidad_30_dias__c; }
            IF(a.Rentabilidad_7_dias__c != null){ bx.New_Rentabilidad_7_dias__c = a.Rentabilidad_7_dias__c; }
            IF(a.Rentabilidad_YTD__c != null){ bx.New_Rentabilidad_YTD__c = a.Rentabilidad_YTD__c; }
            IF(a.Rep_Legal_email__c != null){ bx.New_Rep_Legal_email__c = a.Rep_Legal_email__c; }
            IF(a.Requerimiento_comercial_de_la_empresa__c != null){ bx.New_Req_comercial_de_la_empresa__c = a.Requerimiento_comercial_de_la_empresa__c; }
            IF(a.Resultado_verificacion_requisitos__c != null){ bx.New_Resultado_verificacion_requisitos__c = a.Resultado_verificacion_requisitos__c; }
            IF(a.ROA_12_meses__c != null){ bx.New_ROA_12_meses__c = a.ROA_12_meses__c; }
            IF(a.ROA_1_dia__c != null){ bx.New_ROA_1_dia__c = a.ROA_1_dia__c; }
            IF(a.ROA_30_dias__c != null){ bx.New_ROA_30_dias__c = a.ROA_30_dias__c; }
            IF(a.ROA_7_dias__c != null){ bx.New_ROA_7_dias__c = a.ROA_7_dias__c; }
            IF(a.ROA_YTD__c != null){ bx.New_ROA_YTD__c = a.ROA_YTD__c; }
            IF(a.Spouse_RUT__pc != null){ bx.New_RUT_Conyuge__c = a.Spouse_RUT__pc; }
            IF(a.rut_inv__c != null){ bx.New_rut_inv__c = a.rut_inv__c; }
            IF(a.RUT_Sociedad_participacion__c != null){ bx.New_RUT_Sociedad_participacion__c = a.RUT_Sociedad_participacion__c; }
            IF(a.Segmentaci_n_BI__c != null){ bx.New_Segmentaci_n_BI__c = a.Segmentaci_n_BI__c; }
            IF(a.Segmentacion_Liquidez_Codigo__c != null){ bx.New_Segmentacion_Liquidez_Codigo__c = a.Segmentacion_Liquidez_Codigo__c; }
            IF(a.Segmentacion_Liquidez_SubCodigo__c != null){ bx.New_Segmentacion_Liquidez_SubCodigo__c = a.Segmentacion_Liquidez_SubCodigo__c; }
            IF(a.Segmentation__c != null){ bx.New_Segmentation__c = a.Segmentation__c; }
            IF(a.Segmento__c != null){ bx.New_Segmento__c = a.Segmento__c; }
            IF(a.Sex__pc != null){ bx.New_Sex__c = a.Sex__pc; }
            IF(a.SII_DJ_1820_1829__c != null){ bx.New_SII_DJ_1820_1829__c = a.SII_DJ_1820_1829__c; }
            IF(a.Situac_Laboral__c != null){ bx.New_Situac_Laboral__c = a.Situac_Laboral__c; }
            IF(a.Socio_Solidario__c != null){ bx.New_Socio_Solidario__c = a.Socio_Solidario__c; }
            IF(a.Sub_Sector_Economico__c != null){ bx.New_Sub_Sector_Economico__c = a.Sub_Sector_Economico__c; }
            IF(a.Subsegmento__c != null){ bx.New_Subsegmento__c = a.Subsegmento__c; }
            IF(a.Sucursal_Banco__c != null){ bx.New_Sucursal_Banco__c = a.Sucursal_Banco__c; }
            IF(a.Sucursal_BI__c != null){ bx.New_Sucursal_BI__c = a.Sucursal_BI__c; }
            IF(a.Sucursal_creaci_n_registro__c != null){ bx.New_Sucursal_creaci_n_registro__c = a.Sucursal_creaci_n_registro__c; }
            IF(a.Susceptible_conflicto_de_interes__c != null){ bx.New_Susceptible_conflicto_de_interes__c = a.Susceptible_conflicto_de_interes__c; }
            IF(a.Telefono_fijo_comercial_Inv__c != null){ bx.New_Telefono_fijo_comercial_Inv__c = a.Telefono_fijo_comercial_Inv__c; }
            IF(a.Telefono_fijo_particular_Inv__pc != null){ bx.New_Telefono_fijo_particular_Inv__c = a.Telefono_fijo_particular_Inv__pc; }
            IF(a.Commercial_Cellphone__c != null){ bx.New_Commercial_Cellphone__c = a.Commercial_Cellphone__c; }
            IF(a.Tipo_Cliente_Gestion__c != null){ bx.New_Tipo_Cliente_Gestion__c = a.Tipo_Cliente_Gestion__c; }
            IF(a.Tipo_cuenta__c != null){ bx.New_Tipo_cuenta__c = a.Tipo_cuenta__c; }
            IF(a.Tipo_cuenta_DCV__c != null){ bx.New_Tipo_cuenta_DCV__c = a.Tipo_cuenta_DCV__c; }
            IF(a.Tipo_de_Banca__c != null){ bx.New_Tipo_de_Banca__c = a.Tipo_de_Banca__c; }
            IF(a.Tipo_de_Cliente__c != null){ bx.New_Tipo_de_Cliente__c = a.Tipo_de_Cliente__c; }
            IF(a.Tipo_de_Cliente_Empresa__c != null){ bx.New_Tipo_de_Cliente_Empresa__c = a.Tipo_de_Cliente_Empresa__c; }
            IF(a.Customer_type_other_rating_c__c != null){ bx.New_Customer_type_other_rating_c__c = a.Customer_type_other_rating_c__c; }
            IF(a.Tipo_de_Documento_Relacionado__c != null){ bx.New_Tipo_de_Documento_Relacionado__c = a.Tipo_de_Documento_Relacionado__c; }
            IF(a.Tipo_de_Persona__c != null){ bx.New_Tipo_de_Persona__c = a.Tipo_de_Persona__c; }
            IF(a.Tipo_de_Relacion__c != null){ bx.New_Tipo_de_Relacion__c = a.Tipo_de_Relacion__c; }
            IF(a.Tipo_perfil_comercial__c != null){ bx.New_Tipo_perfil_comercial__c = a.Tipo_perfil_comercial__c; }
            IF(a.Tipo_relaci_n__c != null){ bx.New_Tipo_relaci_n__c = a.Tipo_relaci_n__c; }
            IF(a.VIP__c != null){ bx.New_VIP__c = a.VIP__c; }
            IF(a.Website != null){ bx.New_Website__c = a.Website; }
            IF(a.Calle_particular_de_Conyuge__pc!=null){ bx.New_Calle_particular_de_Conyuge__c = a.Calle_particular_de_Conyuge__pc; }
            IF(a.Ciudad_particular_de_Conyuge__pc!= null){ bx.New_Ciudad_particular_de_Conyuge__c = a.Ciudad_particular_de_Conyuge__pc; }
            IF(a.Comuna_de_Direccion_Conyuge__pc!= null){ bx.New_Comuna_de_Direccion_Conyuge__c = a.Comuna_de_Direccion_Conyuge__pc; }
            IF(a.DeptoCasaSector_particular_de_Conyuge__pc!=null){ bx.New_DeptoCasaSectorParticular_de_Conyuge__c = a.DeptoCasaSector_particular_de_Conyuge__pc; }
            IF(a.Numero_de_calle_particular_de_Conyuge__pc!=null){ bx.New_Numero_calle_particular_de_Conyuge__c = a.Numero_de_calle_particular_de_Conyuge__pc; }
            IF(a.Region_particular_de_Conyuge__pc!=null){ bx.New_Region_particular_de_Conyuge__c = a.Region_particular_de_Conyuge__pc; }
            bx.Cliente__c = a.Id;
            bx.Rut__c = a.Rut__c;
            Boolean result = rt.Name.contains('Cuenta Empresa');
            if(result){
                bx.RecordTypeId = rtPJ.Id;
            }else{
                bx.RecordTypeId = rtPN.Id;
            }
            try{
                insert bx;
                PageReference pr = new PageReference('/'+bx.Id);
                pr.setRedirect(true);
                return pr;
            }catch(Exception err){
                System.debug('Errors '+err.getMessage());
                return null;
            }
        }
        return null;
    }
}