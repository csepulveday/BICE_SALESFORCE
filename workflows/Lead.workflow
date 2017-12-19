<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Asignacion_Prospecto_AP</fullName>
        <description>Asignación Prospecto AP</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Inversiones/Primer_aviso_de_asignacion</template>
    </alerts>
    <alerts>
        <fullName>Avisa_Lead_no_contactado</fullName>
        <description>Avisa Lead no contactado</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Lead_no_contactado_en_5_d_as</template>
    </alerts>
    <alerts>
        <fullName>Avisa_Rechazo_de_Lead</fullName>
        <description>Avisa Rechazo de Lead</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>unfiled$public/Lead_Rechazado</template>
    </alerts>
    <alerts>
        <fullName>Aviso_creacion_de_cliente_con_reparos</fullName>
        <description>Aviso creacion de cliente con reparos</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Aviso_de_creaci_n_de_cliente_con_reparos</template>
    </alerts>
    <alerts>
        <fullName>Aviso_de_Perfil_de_Candidato_rechazado</fullName>
        <description>Aviso de Perfil de Candidato rechazado</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <field>Profin_Supervisor__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>unfiled$public/Aviso_perfil_rechazado</template>
    </alerts>
    <alerts>
        <fullName>Aviso_de_asignaci_n_de_Candidato</fullName>
        <description>Aviso de asignación de Candidato</description>
        <protected>false</protected>
        <recipients>
            <field>Profin_Supervisor__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Asignacion_de_candidato</template>
    </alerts>
    <alerts>
        <fullName>Aviso_de_cliente_creado</fullName>
        <description>Aviso de cliente creado</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Aviso_de_creaci_n_de_cliente</template>
    </alerts>
    <alerts>
        <fullName>Aviso_de_digitalizaci_n_de_documentos</fullName>
        <description>Aviso de digitalización de documentos</description>
        <protected>false</protected>
        <recipients>
            <field>EjecutivoCAC__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Aviso_para_digitalizar_documentos</template>
    </alerts>
    <alerts>
        <fullName>Aviso_de_resultado_aprobacion_de_Agente_Sucursal</fullName>
        <description>Aviso de resultado aprobacion de Agente Sucursal</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Resultado_proceso_aprobacion_Agente_Sucursal</template>
    </alerts>
    <alerts>
        <fullName>Aviso_de_resultado_aprobacion_de_Jefe_de_area_clientes</fullName>
        <description>Aviso de resultado aprobacion de Jefe de area clientes</description>
        <protected>false</protected>
        <recipients>
            <field>LastModifiedById</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Profin_Executive__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Resultado_proceso_aprobaci_n_Gerente_Area_Clientes</template>
    </alerts>
    <alerts>
        <fullName>Aviso_de_retiro_de_Carpeta</fullName>
        <description>Aviso de retiro de Carpeta Jefe de Grupo</description>
        <protected>false</protected>
        <recipients>
            <field>Profin_Supervisor__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Aviso_de_retiro_de_Carpeta</template>
    </alerts>
    <alerts>
        <fullName>Enviar_a_Jefe_de_Grupo</fullName>
        <description>Enviar a Jefe de Grupo</description>
        <protected>false</protected>
        <recipients>
            <field>Correo_jefe_de_grupo__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Inversiones/Lead_Creado_en_CIF</template>
    </alerts>
    <alerts>
        <fullName>Envio_de_alerta_MAC_aprobado</fullName>
        <description>Envio de alerta MAC aprobado</description>
        <protected>false</protected>
        <recipients>
            <field>Email_ejecutivo_de_ventas__c</field>
            <type>email</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>unfiled$public/MAC_aprobado</template>
    </alerts>
    <alerts>
        <fullName>Envio_de_alerta_de_MAC_rechazado</fullName>
        <description>Envio de alerta de MAC rechazado</description>
        <protected>false</protected>
        <recipients>
            <field>Email_ejecutivo_de_ventas__c</field>
            <type>email</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>unfiled$public/MAC_rechazado</template>
    </alerts>
    <alerts>
        <fullName>EyC_Lead_notifica_creaci_n_cliente_a_ej_comercial</fullName>
        <description>EyC - Lead - notifica creación cliente a ej comercial</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/EyC_notifica_creaci_n_cliente</template>
    </alerts>
    <alerts>
        <fullName>Inv_AP_LeadNoContactado</fullName>
        <description>Inv_AP_LeadNoContactado</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <field>Subgerente_AP__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Inversiones/Inv_AP_ContactarProspecto</template>
    </alerts>
    <alerts>
        <fullName>Inv_Subgerente_AP_NoCalifica</fullName>
        <description>Inv_AP_Aviso Subgerente AP rechazó prospecto</description>
        <protected>false</protected>
        <recipients>
            <field>LastModifiedById</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Inversiones/Inv_AP_Rechazo_de_Lead</template>
    </alerts>
    <alerts>
        <fullName>Notificaci_n_para_retirar_la_Carpeta_Jefe_Grupo</fullName>
        <description>Notificación para retirar la Carpeta Jefe Grupo</description>
        <protected>false</protected>
        <recipients>
            <field>Profin_Supervisor__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Notificacion</template>
    </alerts>
    <alerts>
        <fullName>Notificar_CAC_Jefe_de_Grupo</fullName>
        <description>Notificar CAC y Jefe de Grupo</description>
        <protected>false</protected>
        <recipients>
            <field>Correo_CAC__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Correo_jefe_de_grupo__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Inversiones/Lead_Creado_en_CIF</template>
    </alerts>
    <alerts>
        <fullName>Notificar_a_Supervisor_KYC_Ingresado</fullName>
        <description>Notificar a Supervisor KYC Ingresado</description>
        <protected>false</protected>
        <recipients>
            <field>Supervisor_Inversiones__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Inversiones/KYC_Ingresado</template>
    </alerts>
    <alerts>
        <fullName>Notificar_lead_enviado_a_sucursal</fullName>
        <description>Notificar lead enviado a sucursal</description>
        <protected>false</protected>
        <recipients>
            <recipient>Agente_Sucursal</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <recipient>C_A_C</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <recipient>Jefa_Comercial</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Notificacion_envio_lead_a_sucursal</template>
    </alerts>
    <alerts>
        <fullName>Retail_Banking_Lead_Aprobado</fullName>
        <description>Retail Banking - Lead Aprobado</description>
        <protected>false</protected>
        <recipients>
            <field>EjecutivoCAC__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Jefe_Plataforma_Agente_Sucursal__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>LastModifiedById</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Profin_Supervisor__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Retail_Banking_Lead_Aprobado</template>
    </alerts>
    <alerts>
        <fullName>Retail_Banking_Lead_enviado_a_sucursal</fullName>
        <description>Retail Banking - Lead enviado a sucursal</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Notificacion_envio_lead_a_sucursal</template>
    </alerts>
    <alerts>
        <fullName>Subgerente_AP_rechaz_prospecto</fullName>
        <description>Subgerente AP rechazó prospecto</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Inversiones/Inv_AP_Rechazo_de_Lead</template>
    </alerts>
    <fieldUpdates>
        <fullName>Act_Estado_aprobacion_Gte_BP_Aprobado</fullName>
        <field>Status_Approval_Manager_Banca_Privada__c</field>
        <literalValue>Aprobado</literalValue>
        <name>Act Estado aprobación Gte BP Aprobado</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Act_Estado_aprobacion_Gte_BP_Pendiente</fullName>
        <field>Status_Approval_Manager_Banca_Privada__c</field>
        <literalValue>Pendiente</literalValue>
        <name>Act Estado aprobación Gte BP Pendiente</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Act_Estado_aprobacion_Gte_BP_Rechazado</fullName>
        <field>Status_Approval_Manager_Banca_Privada__c</field>
        <literalValue>Rechazado</literalValue>
        <name>Act Estado aprobación Gte BP Rechazado</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Act_estado_aprob_jefe_area_cliente_pendi</fullName>
        <field>Status_approval_manager_customer_area__c</field>
        <literalValue>Pendiente</literalValue>
        <name>Act estado aprob jefe area cliente pendi</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Act_estado_aprobacion_area_clientes_Apro</fullName>
        <field>Status_approval_manager_customer_area__c</field>
        <literalValue>Aprobado</literalValue>
        <name>Act estado aprobacion area clientes Apro</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Act_estado_aprobacion_area_clientes_Rech</fullName>
        <field>Status_approval_manager_customer_area__c</field>
        <literalValue>Rechazado</literalValue>
        <name>Act estado aprobacion area clientes Rech</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Act_fecha_aprobacion_Gerente_area_client</fullName>
        <field>Fecha_aprobacion_gerente_area_clientes__c</field>
        <formula>now()</formula>
        <name>Act fecha aprobacion Gerente area client</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Act_fecha_de_aprobacion_Gte_de_BP</fullName>
        <field>Date_of_approval_private_banking_manager__c</field>
        <formula>NOW()</formula>
        <name>Act fecha de aprobacion Gte de BP</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualiza_Carpeta_Comercial</fullName>
        <field>Carpeta_comercial__c</field>
        <literalValue>1</literalValue>
        <name>Actualiza Carpeta Comercial</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualiza_Creacion_Cliente</fullName>
        <field>Customer_Creation__c</field>
        <literalValue>Pendiente</literalValue>
        <name>Actualiza Creación Cliente</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualiza_Estado_Candidato_Calificacion</fullName>
        <field>Status</field>
        <literalValue>Calificación</literalValue>
        <name>Actualiza Estado Candidato Calificacion</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualiza_Estado_aprobacion_agente_Pendi</fullName>
        <description>Pendiente</description>
        <field>Status_approval_branch_agent__c</field>
        <literalValue>Pendiente</literalValue>
        <name>Actualiza Estado aprobación agente Pendi</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualiza_Etapa_Agent_Lead</fullName>
        <field>Etapa__c</field>
        <literalValue>Aprobacion_Agente</literalValue>
        <name>Actualiza Etapa Agent Lead</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualiza_Etapa_Enviado_CAC</fullName>
        <field>Etapa__c</field>
        <literalValue>Enviado a CAC</literalValue>
        <name>Actualiza Etapa Enviado CAC</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualiza_Etapa_Gerente_Ventas_Lead</fullName>
        <field>Etapa__c</field>
        <literalValue>Aprobación Gerente de Venta</literalValue>
        <name>Actualiza Etapa Gerente Ventas Lead</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualiza_Etapa_Jefe_de_Grupo_Lead</fullName>
        <description>Actualiza la etapa a &quot;Jefe de Grupo&quot; cuando Ejecutivo Profin le solicita aprobación de Perfil</description>
        <field>Etapa__c</field>
        <literalValue>Jefe de Grupo</literalValue>
        <name>Actualiza Etapa Jefe de Grupo Lead</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualiza_Etapa_Lead</fullName>
        <field>Etapa__c</field>
        <literalValue>Enviado a CAC</literalValue>
        <name>Actualiza Etapa Lead</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualiza_Fecha_env_o_MAC</fullName>
        <field>Fecha_envio_MAC__c</field>
        <formula>now()</formula>
        <name>Actualiza Fecha envío MAC</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualiza_Fecha_env_o_a_CAC</fullName>
        <field>Fecha_env_o_a_CAC__c</field>
        <formula>now()</formula>
        <name>Actualiza Fecha envío a CAC</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualiza_Fecha_envio_carpeta_comercial</fullName>
        <field>Fecha_envio_carpeta_comercial_rechazada__c</field>
        <formula>now()</formula>
        <name>Actualiza Fecha envío carpeta comercial</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualiza_Fecha_recepci_n_MAC</fullName>
        <field>Fecha_recepcion_MAC__c</field>
        <formula>now()</formula>
        <name>Actualiza Fecha recepción MAC</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualiza_Motivo_Rechazo_Comite</fullName>
        <field>Motivo_rechazo__c</field>
        <literalValue>Perfil rechazado</literalValue>
        <name>Actualiza Motivo Rechazo Comite</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualiza_Motivo_de_rechazo_a_null</fullName>
        <field>Motivo_rechazo__c</field>
        <name>Actualiza Motivo de rechazo a null</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualiza_Perfil_aprobado_Gerente_de_ven</fullName>
        <field>Perfil_aprobado_Gerente_de_ventas__c</field>
        <literalValue>1</literalValue>
        <name>Actualiza Perfil aprobado Gerente de ven</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualiza_correo_CAC</fullName>
        <field>Correo_CAC__c</field>
        <formula>Owner:User.Email</formula>
        <name>Actualiza correo CAC</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualiza_correo_de_ejecutivo</fullName>
        <field>Email_ejecutivo_de_ventas__c</field>
        <formula>Profin_Executive__r.Email</formula>
        <name>Actualiza correo de ejecutivo</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualiza_estado_a_Calificaci_n</fullName>
        <field>Status</field>
        <literalValue>Calificación</literalValue>
        <name>Actualiza estado a Calificación</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualiza_estado_a_Calificacion</fullName>
        <field>Status</field>
        <literalValue>Calificación</literalValue>
        <name>Actualiza estado a Calificacion</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualiza_estado_a_Contacto</fullName>
        <field>Status</field>
        <literalValue>Contacto</literalValue>
        <name>Actualiza estado Contacto</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualiza_estado_a_Precalificaci_n</fullName>
        <field>Status</field>
        <literalValue>Precalificación</literalValue>
        <name>Actualiza estado a Precalificación</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualiza_estado_aprob_agente_aprobado</fullName>
        <field>Status_approval_branch_agent__c</field>
        <literalValue>Aprobado</literalValue>
        <name>Actualiza estado aprob agente aprobado</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualiza_estado_aprob_agente_rechazado</fullName>
        <field>Status_approval_branch_agent__c</field>
        <literalValue>Rechazado</literalValue>
        <name>Actualiza estado aprob agente rechazado</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualiza_estado_del_candidato_a_Pre</fullName>
        <field>Status</field>
        <literalValue>Precalificación</literalValue>
        <name>Actualiza estado del candidato a Precali</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualiza_fecha_aprobacion_agente_sucurs</fullName>
        <field>Fecha_aprobacion_agente_sucursal__c</field>
        <formula>NOW()</formula>
        <name>Actualiza fecha aprobación agente sucurs</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualiza_fecha_aprobacion_perfil_gerent</fullName>
        <field>Fecha_aprobacion_perfil_Gerente__c</field>
        <formula>now()</formula>
        <name>Actualiza fecha aprobacion perfil gerent</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualiza_fecha_aprobacion_perfil_jefe_v</fullName>
        <field>Fecha_aprobaci_n_perfil_Jefe_Ventas__c</field>
        <formula>now()</formula>
        <name>Actualiza fecha aprobacion perfil jefe v</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualiza_fecha_envio_jefe_grupo</fullName>
        <field>Fecha_env_o_a_Jefe_de_Grupo__c</field>
        <formula>now()</formula>
        <name>Actualiza fecha envio jefe grupo</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualiza_motivo_rechazo_a_Mora</fullName>
        <field>Motivo_rechazo__c</field>
        <literalValue>Mora</literalValue>
        <name>Actualiza motivo rechazo a Mora</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualiza_otro_motivo_de_rechazo_a_null</fullName>
        <field>Otro_motivo_de_rechazo__c</field>
        <name>Actualiza otro motivo de rechazo a null</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualiza_perfil_aprobado_gerente</fullName>
        <field>Perfil_aprobado_Gerente_de_ventas__c</field>
        <literalValue>1</literalValue>
        <name>Actualiza perfil aprobado gerente</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualiza_perfil_aprobado_jefe_de_ventas</fullName>
        <field>Perfil_aprobado_Jefe_de_ventas__c</field>
        <literalValue>1</literalValue>
        <name>Actualiza perfil aprobado jefe de ventas</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualiza_segmentacion_a_Banca_Personas</fullName>
        <field>Segmentation__c</field>
        <literalValue>Banca Personas</literalValue>
        <name>Actualiza segmentación a Banca Personas</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualizar_correo_Jefe_Plataforma</fullName>
        <field>Email</field>
        <formula>Jefe_Plataforma_Agente_Sucursal__r.Email</formula>
        <name>Actualizar correo Jefe Plataforma</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualizar_correo_jefe_de_grupo_gestor</fullName>
        <field>Correo_jefe_de_grupo__c</field>
        <formula>Owner:User.Manager.Email</formula>
        <name>Actualizar correo jefe de grupo (gestor)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Agrega_Funcion_del_Creador_del_Registro</fullName>
        <field>Funcion_del_Creador_del_registro__c</field>
        <formula>CreatedBy.UserRole.DeveloperName</formula>
        <name>Agrega Función del Creador del Registro</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Banca_Personas_Creaci_n_nuevo_registro</fullName>
        <field>Division_reporting__c</field>
        <literalValue>Personas</literalValue>
        <name>Banca Personas - Creación nuevo registro</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Cambia_de_Estado_de_Candidato_a_No_Calif</fullName>
        <field>Status</field>
        <literalValue>No califica</literalValue>
        <name>Cambia de Estado de Candidato a No Calif</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Desmarca_Solicita_Creacion_Area_Cliente</fullName>
        <field>Request_to_Create_Client_Area__c</field>
        <literalValue>0</literalValue>
        <name>Desmarca Solicita Creación Área Cliente</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Estado_Aprobado_Gerente_Ventas</fullName>
        <description>Actualizaciones de campo se usa para control de Estado de Aprobacíon</description>
        <field>Estado_Aprobacion_Gerente_Ventas__c</field>
        <literalValue>Aprobado</literalValue>
        <name>Estado Aprobado Gerente Ventas</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Estado_Aprobado_Jefe_Grupo</fullName>
        <description>Actualizaciones de campo se usa para control de Estado de Aprobacíon</description>
        <field>Estado_Aprobacion_Jefe_Grupo__c</field>
        <literalValue>Aprobado</literalValue>
        <name>Estado Aprobado Jefe Grupo</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Estado_Lead_Califica</fullName>
        <field>Status</field>
        <literalValue>Califica</literalValue>
        <name>Estado Lead Califica</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Estado_Lead_No_califica</fullName>
        <field>Status</field>
        <literalValue>No califica</literalValue>
        <name>Estado Lead No califica</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Estado_No_Califica</fullName>
        <field>Status</field>
        <literalValue>No califica</literalValue>
        <name>Estado No Califica</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Estado_Pendiente_Gerente_Ventas</fullName>
        <description>Actualizaciones de campo se usa para control de Estado de Aprobacíon</description>
        <field>Estado_Aprobacion_Gerente_Ventas__c</field>
        <literalValue>Pendiente</literalValue>
        <name>Estado Pendiente Gerente Ventas</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Estado_Pendiente_Jefe_Grupo</fullName>
        <description>Actualizaciones de campo se usa para control de Estado de Aprobacíon</description>
        <field>Estado_Aprobacion_Jefe_Grupo__c</field>
        <literalValue>Pendiente</literalValue>
        <name>Estado Pendiente Jefe Grupo</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Estado_Rechazado_Gerente_Ventas</fullName>
        <description>Actualizaciones de campo se usa para control de Estado de Aprobacíon</description>
        <field>Estado_Aprobacion_Gerente_Ventas__c</field>
        <literalValue>Rechazado</literalValue>
        <name>Estado Rechazado Gerente Ventas</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Estado_Rechazado_Jefe_Grupo</fullName>
        <description>Actualizaciones de campo se usa para control de Estado de Aprobacíon</description>
        <field>Estado_Aprobacion_Jefe_Grupo__c</field>
        <literalValue>Rechazado</literalValue>
        <name>Estado Rechazado Jefe Grupo</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Etapa_Crear_Cliente</fullName>
        <field>Etapa__c</field>
        <literalValue>Crear Cliente</literalValue>
        <name>Cambia etapa a Crear Cliente</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Actualiza_fecha_deuda_sbif</fullName>
        <field>Fecha_revisi_n_deuda_SBIF__c</field>
        <formula>TODAY()</formula>
        <name>EyC - Actualiza fecha deuda sbif</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Actualiza_fecha_rev_bolet_n_comerc</fullName>
        <field>Fecha_revisi_n_bolet_n_comercial__c</field>
        <formula>TODAY()</formula>
        <name>EyC - Actualiza fecha rev boletín comerc</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Actualiza_fecha_revisi_n_EEFF</fullName>
        <field>Fecha_revisi_n_EEFF__c</field>
        <formula>TODAY()</formula>
        <name>EyC - Actualiza fecha revisión EEFF</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Actualiza_solicitud_rea_cliente</fullName>
        <field>Request_to_Create_Client_Area__c</field>
        <literalValue>1</literalValue>
        <name>EyC - Actualiza solicitud área cliente</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Cambio_de_etapa_calif_cliAcivado</fullName>
        <description>En Lead, cambia la etapa desde calificación a cliente activado al no estar en lista negra</description>
        <field>Status</field>
        <literalValue>Cliente activado</literalValue>
        <name>EyC - Cambio de etapa calif-cliAcivado</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Desmarca_campo_creaci_n_cliente_ok</fullName>
        <field>Campos_para_creaci_n_clientes_OK__c</field>
        <literalValue>0</literalValue>
        <name>EyC - Desmarca campo creación cliente ok</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Env_a_candidato_a_creaci_n_en_rea</fullName>
        <field>Customer_Creation__c</field>
        <literalValue>Pendiente</literalValue>
        <name>EyC - Envía candidato a creación en área</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Lead_Actualiza_fecha_de_apertura</fullName>
        <description>Cuando se crea la cta cte, toma la fecha en que se creó la cta cte automáticamente</description>
        <field>Opening_date__c</field>
        <formula>TODAY()</formula>
        <name>EyC - Lead - Actualiza fecha de apertura</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Lead_Actualiza_fecha_res_comit</fullName>
        <field>Fecha_resultado_comit__c</field>
        <formula>TODAY()</formula>
        <name>EyC - Lead - Actualiza fecha res. comité</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Lead_Autocompleta_motivo_rechazo</fullName>
        <field>Motivo_rechazo__c</field>
        <literalValue>Rechazo comité</literalValue>
        <name>EyC - Lead - Autocompleta motivo rechazo</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Lead_Cambio_de_Contacto_a_Califi</fullName>
        <description>Cambio automático de Contacto a Calficicación una vez que tenga todos estos campos.</description>
        <field>Status</field>
        <literalValue>Calificación</literalValue>
        <name>EyC - Lead - Cambio de Contacto a Califi</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Lead_Cambio_de_Precalif_a_Contac</fullName>
        <description>Cambio automático de etapa del candidato desde precalificación a Contacto al tener todos los campos completos</description>
        <field>Status</field>
        <literalValue>Antecedentes</literalValue>
        <name>EyC - Lead - Cambio de Precalif a Contac</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Lead_EliminaMoraLeasing</fullName>
        <field>Deuda_Leasing_Factoring__c</field>
        <name>EyC-Lead-EliminaMoraLeasing</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Lead_ambiaCreacionCliente</fullName>
        <field>Customer_Creation__c</field>
        <name>EyC-Lead-cambiaCreacionCliente</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Lead_cambiaActEconomicaSBIF</fullName>
        <field>Actividad_Economica_SBIF__c</field>
        <name>EyC-Lead-cambiaActEconomicaSBIF</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Lead_cambiaBreveResena</fullName>
        <field>Breve_rese_a_de_la_empresa_o_Memoria__c</field>
        <name>EyC-Lead-cambiaBreveResena</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Lead_cambiaCamposCreacionOK</fullName>
        <field>Campos_para_creaci_n_clientes_OK__c</field>
        <literalValue>0</literalValue>
        <name>EyC-Lead-cambiaCamposCreacionOK</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Lead_cambiaCodigoResultadoCT</fullName>
        <field>CT_Result_Code__c</field>
        <formula>-1</formula>
        <name>EyC-Lead-cambiaCodigoResultadoCT</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Lead_cambiaCreaCtaCte</fullName>
        <field>Bank_account_created__c</field>
        <literalValue>0</literalValue>
        <name>EyC-Lead-cambiaCreaCtaCte</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Lead_cambiaDeudaSbif</fullName>
        <field>Deuda_SBIF__c</field>
        <name>EyC-Lead-cambiaDeudaSbif</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Lead_cambiaEEFFFLujoCaja</fullName>
        <field>EEFF_o_Flujo_de_caja__c</field>
        <literalValue>0</literalValue>
        <name>EyC-Lead-cambiaEEFFFLujoCaja</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Lead_cambiaFechaVencimMAC</fullName>
        <field>Fecha_de_vencimiento_MAC__c</field>
        <name>EyC-Lead-cambiaFechaVencimMAC</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Lead_cambiaInfoPropiedadEmp</fullName>
        <field>Informacion_de_la_Propiedad_de_empresa__c</field>
        <name>EyC-Lead-cambiaInfoPropiedadEmp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Lead_cambiaMontoMACAprob</fullName>
        <field>MAC_created_ammount__c</field>
        <name>EyC-Lead-cambiaMontoMACAprob</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Lead_cambiaMotivoRechazo</fullName>
        <field>Motivo_rechazo__c</field>
        <name>EyC-Lead-cambiaMotivoRechazo</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Lead_cambiaResultComite</fullName>
        <field>Resultado_comit__c</field>
        <name>EyC-Lead-cambiaResultComite</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Lead_cambiaStatusPrecalifi</fullName>
        <field>Status</field>
        <literalValue>Precalificación</literalValue>
        <name>EyC-Lead-cambiaStatusPrecalifi</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Lead_cambia_No_Califica_si_exi</fullName>
        <field>Status</field>
        <literalValue>No califica</literalValue>
        <name>EyC - Lead - cambia a No Califica si exi</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Lead_cambia_a_No_Califica_si_exi</fullName>
        <field>Status</field>
        <literalValue>No califica</literalValue>
        <name>EyC - Lead - cambia a No Califica si exi</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Lead_fecha_ultimo_comentario</fullName>
        <field>Fecha_ltimo_comentario__c</field>
        <formula>TODAY()</formula>
        <name>EyC - Lead - fecha ultimo comentario</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Lead_fuerza_crear_lead_precalifi</fullName>
        <field>Status</field>
        <literalValue>Precalificación</literalValue>
        <name>EyC - Lead - fuerza crear lead precalifi</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_LeadcambiaBoletinComercial</fullName>
        <field>Boletin_Comercial__c</field>
        <name>EyC-Lead-cambiaBoletinComercial</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_No_califica_por_lista_negra</fullName>
        <field>Status</field>
        <literalValue>No califica</literalValue>
        <name>EyC - No califica por lista negra</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fecha_Aprobacion_Gerente_Ventas</fullName>
        <description>Alerta se usa para control de Estado de Aprobacíon</description>
        <field>Fecha_Estado_Gerente_Venta__c</field>
        <formula>Now()</formula>
        <name>Fecha Aprobacion Gerente Ventas</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fecha_Aprobacion_Jefe_Grupo</fullName>
        <description>Campo se usa para control de Estado de Aprobacíon</description>
        <field>Fecha_autorizaci_n_Jefe_de_Grupo__c</field>
        <formula>NOW()</formula>
        <name>Fecha Aprobacion Jefe Grupo</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fecha_Pendente_Jefe_Grupo</fullName>
        <description>Alerta se usa para control de Estado de Aprobacíon</description>
        <field>Fecha_Estado_Jefe_Grupo__c</field>
        <formula>NOW()</formula>
        <name>Fecha Pendente Jefe Grupo</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fecha_Pendiente_Gerente_Ventas</fullName>
        <description>Alerta se usa para control de Estado de Aprobacíon</description>
        <field>Fecha_Estado_Gerente_Venta__c</field>
        <formula>NOW()</formula>
        <name>Fecha Pendiente Gerente Ventas</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fecha_Rechazado_Gerente_Ventas</fullName>
        <description>Alerta se usa para control de Estado de Aprobacíon</description>
        <field>Fecha_Estado_Gerente_Venta__c</field>
        <formula>NOW()</formula>
        <name>Fecha Rechazado Gerente Ventas</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fecha_Rechazado_Jefe_Grupo</fullName>
        <description>Alerta se usa para control de Estado de Aprobacíon</description>
        <field>Fecha_Estado_Jefe_Grupo__c</field>
        <formula>NOW()</formula>
        <name>Fecha Rechazado Jefe Grupo</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fecha_autorizaci_n_Jefe_de_Grupo</fullName>
        <field>Fecha_autorizaci_n_Jefe_de_Grupo__c</field>
        <formula>now()</formula>
        <name>Fecha autorización Jefe de Grupo</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Formatea_RUT_Leads</fullName>
        <field>RUT__c</field>
        <formula>Rut_formato_AUX__c</formula>
        <name>Formatea RUT Leads</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fuerza_Ventas_Actualiza_Jefe_de_Grupo</fullName>
        <field>Correo_jefe_de_grupo__c</field>
        <formula>Owner:User.Email</formula>
        <name>Fuerza Ventas - Actualiza Jefe de Grupo</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Guarda_correo_jefe_comercial</fullName>
        <field>Correo_jefe_de_ventas__c</field>
        <formula>LastModifiedBy.Email</formula>
        <name>Guarda correo jefe comercial</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Inv_AP_Aprobacion_pendiente</fullName>
        <field>Inv_AP_Cumple_requisitos__c</field>
        <literalValue>Aprobación en curso</literalValue>
        <name>Aprobación en curso</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Inv_AP_No_cumple_requisitos</fullName>
        <field>Inv_AP_Cumple_requisitos__c</field>
        <literalValue>No</literalValue>
        <name>No cumple requisitos</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Inv_AP_Si_cumple_requisitos</fullName>
        <field>Inv_AP_Cumple_requisitos__c</field>
        <literalValue>Sí</literalValue>
        <name>Si cumple requisitos</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Inv_Cambia_de_Contacto_a_Calificaci_n</fullName>
        <field>Status</field>
        <literalValue>Calificación</literalValue>
        <name>Inv-Cambia de Contacto a Calificación</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Inv_Cambia_de_precalif_a_contacto</fullName>
        <field>Status</field>
        <literalValue>Contacto</literalValue>
        <name>Inv-Cambia de precalif a contacto</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Jefe_de_Grupo_Autoriza_creaci_n_en_CIF</fullName>
        <field>Jefe_Grupo_autoriza_crear_CIF_y_MAC__c</field>
        <literalValue>1</literalValue>
        <name>Jefe de Grupo Autoriza creación en CIF</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>LImpia_Registro_de_Firma</fullName>
        <field>Registro_de_Firma__c</field>
        <literalValue>0</literalValue>
        <name>LImpia Registro de Firma</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpia_Balances</fullName>
        <field>Balance__c</field>
        <literalValue>0</literalValue>
        <name>Limpia Balances</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpia_Bolet_n_Comercial</fullName>
        <field>Boletin_Comercial__c</field>
        <name>Limpia Boletín Comercial</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpia_C_digo_resultado_compliance_track</fullName>
        <field>CT_Result_Code__c</field>
        <name>Limpia Código resultado compliance track</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpia_Carpeta_comercial</fullName>
        <field>Carpeta_comercial__c</field>
        <literalValue>0</literalValue>
        <name>Limpia Carpeta comercial</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpia_Carpeta_operativa</fullName>
        <field>Carpeta_operativa__c</field>
        <literalValue>0</literalValue>
        <name>Limpia Carpeta operativa</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpia_Copia_de_RUT</fullName>
        <field>Copia_de_RUT__c</field>
        <literalValue>0</literalValue>
        <name>Limpia Copia de RUT</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpia_Copia_inscripci_n_original</fullName>
        <field>Copia_inscripcion_original__c</field>
        <literalValue>0</literalValue>
        <name>Limpia Copia inscripción original</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpia_Creaci_n_Cliente</fullName>
        <field>Customer_Creation__c</field>
        <name>Limpia Creación Cliente</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpia_DAI_de_la_Soc</fullName>
        <field>DAI_de_la_Soc__c</field>
        <literalValue>0</literalValue>
        <name>Limpia DAI de la Soc.</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpia_Datos_para_Creaci_n_Clientes_ok</fullName>
        <field>Datos_para_Creaci_n_de_Clientes_ok__c</field>
        <literalValue>0</literalValue>
        <name>Limpia Datos para Creación Clientes ok</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpia_Descripci_n_situaci_n_an_mala</fullName>
        <field>Descripcion_situacion_anomala__c</field>
        <name>Limpia Descripción situación anómala</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpia_Deuda_SBIF_Hist_rica</fullName>
        <field>Deuda_SBIF_Historica__c</field>
        <name>Limpia Deuda SBIF Histórica</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpia_Deuda_SBIF_ltimos_3_meses</fullName>
        <field>Deuda_SBIF__c</field>
        <name>Limpia Deuda SBIF últimos 3 meses</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpia_Documentaci_n_respaldo_EESS</fullName>
        <field>Documentaci_n_sustentatoria_EESS__c</field>
        <literalValue>0</literalValue>
        <name>Limpia Documentación respaldo EESS</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpia_Documentos_digitalizados</fullName>
        <field>Scanned_Documents__c</field>
        <literalValue>0</literalValue>
        <name>Limpia Documentos digitalizados</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpia_Ejecutivo_CAC</fullName>
        <field>EjecutivoCAC__c</field>
        <name>Limpia Ejecutivo CAC</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpia_Enviado_a_Jefe_de_Grupo</fullName>
        <field>Enviado_a_Jefe_de_Grupo__c</field>
        <literalValue>0</literalValue>
        <name>Limpia Enviado a Jefe de Grupo</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpia_Escritura_p_blica</fullName>
        <field>Escritura_publica__c</field>
        <literalValue>0</literalValue>
        <name>Limpia Escritura pública</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpia_Estado_aprobaci_n_Gerente_Ventas</fullName>
        <field>Estado_Aprobacion_Gerente_Ventas__c</field>
        <name>Limpia Estado aprobación Gerente Ventas</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpia_Estado_aprobaci_n_Jefe_Grupo</fullName>
        <field>Estado_Aprobacion_Jefe_Grupo__c</field>
        <name>Limpia Estado aprobación Jefe Grupo</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpia_Estracto_diario_oficial</fullName>
        <field>Estracto_Diario_Oficial__c</field>
        <literalValue>0</literalValue>
        <name>Limpia Estracto diario oficial</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpia_Fecha_Estado_Jefe_Grupo</fullName>
        <field>Fecha_Estado_Jefe_Grupo__c</field>
        <name>Limpia Fecha Estado Jefe Grupo</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpia_Fecha_aprobaci_n_perfil_Gerente</fullName>
        <field>Fecha_aprobacion_perfil_Gerente__c</field>
        <name>Limpia Fecha aprobación perfil Gerente</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpia_Fecha_autorizaci_n_Jefe_de_Grupo</fullName>
        <field>Fecha_autorizaci_n_Jefe_de_Grupo__c</field>
        <name>Limpia Fecha autorización Jefe de Grupo</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpia_Fecha_env_o_MAC</fullName>
        <field>Fecha_envio_MAC__c</field>
        <name>Limpia Fecha envío MAC</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpia_Fecha_env_o_a_Jefe_de_Grupo</fullName>
        <field>Fecha_env_o_a_Jefe_de_Grupo__c</field>
        <name>Limpia Fecha envío a Jefe de Grupo</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpia_Form_Art_85</fullName>
        <field>Form_Art_85__c</field>
        <literalValue>0</literalValue>
        <name>Limpia Form. Art. 85</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpia_Form_EESS</fullName>
        <field>Form_EESS__c</field>
        <literalValue>0</literalValue>
        <name>Limpia Form. EESS</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpia_Form_FATCA</fullName>
        <field>Form_FATCA__c</field>
        <literalValue>0</literalValue>
        <name>Limpia Form. FATCA</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpia_Form_Solicitud_de_Productos</fullName>
        <field>Form_Solicitud_de_Productos__c</field>
        <literalValue>0</literalValue>
        <name>Limpia Form. Solicitud de Productos</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpia_Jefe_Grupo_autoriza_crear_CIF_RI</fullName>
        <description>Limpia Jefe Grupo autoriza crear CIF, RIB y MAC</description>
        <field>Jefe_Grupo_autoriza_crear_CIF_y_MAC__c</field>
        <literalValue>0</literalValue>
        <name>Limpia Jefe Grupo autoriza crear CIF, RI</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpia_MAC_realizado</fullName>
        <field>MAC_creado_y_enviado__c</field>
        <literalValue>0</literalValue>
        <name>Limpia MAC realizado</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpia_Observaci_n_rea_Cliente</fullName>
        <field>Observation_Customer_Area__c</field>
        <name>Limpia Observación Área Cliente</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpia_Obtener_Foto_y_Huellas</fullName>
        <field>Obtener_Foto_y_Huellas__c</field>
        <literalValue>0</literalValue>
        <name>Limpia Obtener Foto y Huellas</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpia_Otras_Sociedades</fullName>
        <field>Otras_Sociedades__c</field>
        <name>Limpia Otras Sociedades</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpia_Pago_de_IVA_s</fullName>
        <field>Taxes__c</field>
        <literalValue>0</literalValue>
        <name>Limpia Pago de IVA´s</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpia_Perfil_aprobado_Gerente_de_Ventas</fullName>
        <field>Perfil_aprobado_Gerente_de_ventas__c</field>
        <literalValue>0</literalValue>
        <name>Limpia Perfil aprobado Gerente de Ventas</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpia_Resultado_sinacofi</fullName>
        <field>Resultado_SINACOFI__c</field>
        <name>Limpia Resultado sinacofi</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpia_Situacion_Anomala</fullName>
        <field>Situacion_Anomala__c</field>
        <name>Limpia Situación Anómala</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpia_Solicita_creaci_n_rea_Cliente</fullName>
        <field>Request_to_Create_Client_Area__c</field>
        <literalValue>0</literalValue>
        <name>Limpia Solicita creación Área Cliente</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpia_email_de_ejecutivo</fullName>
        <field>Email_ejecutivo_de_ventas__c</field>
        <name>Limpia email de ejecutivo</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpia_estado_Aprob_Agente_sucursal</fullName>
        <field>Status_approval_branch_agent__c</field>
        <name>Limpia estado Aprob Agente sucursal</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpia_etapa</fullName>
        <field>Etapa__c</field>
        <literalValue>Inicio</literalValue>
        <name>Limpia etapa</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpia_fecha_aprob_agente</fullName>
        <field>Fecha_aprobacion_agente_sucursal__c</field>
        <name>Limpia fecha aprob agente</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpiar_Estado_Gerente_Venta</fullName>
        <description>- Campo se usa para control de Estado de Aprobacíon</description>
        <field>Estado_Aprobacion_Gerente_Ventas__c</field>
        <name>Limpiar Estado Gerente Venta</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpiar_Estado_Jefe_Grupo</fullName>
        <description>Alerta se usa para control de Estado de Aprobacíon</description>
        <field>Estado_Aprobacion_Jefe_Grupo__c</field>
        <name>Limpiar Estado Jefe Grupo</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpiar_Etapa_Lead</fullName>
        <description>Deja en blanco la lista de selección de Etapa</description>
        <field>Etapa__c</field>
        <name>Limpiar Etapa Lead</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpiar_Fecha_Gerente_Ventas</fullName>
        <description>- Campo se usa para control de Estado de Aprobacíon</description>
        <field>Fecha_Estado_Gerente_Venta__c</field>
        <formula>NULL</formula>
        <name>Limpiar Fecha Gerente Ventas</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Limpiar_Fecha_Jefe_Grupo</fullName>
        <description>Alerta se usa para control de Estado de Aprobacíon</description>
        <field>Fecha_Estado_Jefe_Grupo__c</field>
        <formula>NULL</formula>
        <name>Limpiar Fecha Jefe Grupo</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Marca_enviado_a_Jefe_de_Grupo</fullName>
        <description>Cuando Ejecutivo de Venta envía a Jefe de Grupo para aprobar perfil de Lead, se marca esta casilla</description>
        <field>Enviado_a_Jefe_de_Grupo__c</field>
        <literalValue>1</literalValue>
        <name>Marca enviado a Jefe de Grupo</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Motivo_rechazo_Jefe_de_Grupo</fullName>
        <field>Motivo_rechazo__c</field>
        <literalValue>Perfil rechazado</literalValue>
        <name>Motivo rechazo Jefe de Grupo</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Profin_Correo_Jefe_Plataforma</fullName>
        <field>Correo_Jefe_Plataforma_Agente_Sucursal__c</field>
        <formula>Jefe_Plataforma_Agente_Sucursal__r.Email</formula>
        <name>Profin_Correo Jefe Plataforma</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Registro_Banco_NO</fullName>
        <field>Registro_Banco__c</field>
        <formula>&quot;NO&quot;</formula>
        <name>Registro Banco NO</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Registro_Banco_SI</fullName>
        <field>Registro_Banco__c</field>
        <formula>&quot;Sí&quot;</formula>
        <name>Registro Banco SI</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Registro_Inversiones_NO</fullName>
        <field>Registro_Inversiones__c</field>
        <formula>&quot;No&quot;</formula>
        <name>Registro Inversiones NO</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Registro_Inversiones_SI</fullName>
        <field>Registro_Inversiones__c</field>
        <formula>&quot;Sí&quot;</formula>
        <name>Registro Inversiones SI</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Setea_campo_Motivo_rechazo_a_vacio</fullName>
        <field>Motivo_rechazo__c</field>
        <name>Setea campo Motivo rechazo a vacio</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>TEMP_copia_fecha_declaracion_margen_a</fullName>
        <field>Sworn_declaration_date__c</field>
        <formula>Fecha_de_declaracion_de_margen__c</formula>
        <name>TEMP - copia fecha declaracion margen a</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>TEMP_copia_fecha_margen_a_dec_jurada</fullName>
        <field>Fecha_de_declaracion_de_margen__c</field>
        <formula>Sworn_declaration_date__c</formula>
        <name>TEMP - copia fecha margen a dec jurada</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Validaci_n_de_campos_para_aprobaci_n_PJ</fullName>
        <field>Base_data_to_create_client__c</field>
        <literalValue>1</literalValue>
        <name>Validación de campos para aprobación PJ</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <outboundMessages>
        <fullName>Test</fullName>
        <apiVersion>38.0</apiVersion>
        <endpointUrl>https://www.google.cl</endpointUrl>
        <fields>AnnualRevenue</fields>
        <fields>City</fields>
        <fields>Company</fields>
        <fields>ConvertedAccountId</fields>
        <fields>ConvertedContactId</fields>
        <fields>ConvertedDate</fields>
        <fields>ConvertedOpportunityId</fields>
        <fields>Country</fields>
        <fields>CreatedById</fields>
        <fields>CreatedDate</fields>
        <fields>Description</fields>
        <fields>DoNotCall</fields>
        <fields>Email</fields>
        <fields>EmailBouncedDate</fields>
        <fields>EmailBouncedReason</fields>
        <fields>Fax</fields>
        <fields>FirstName</fields>
        <fields>GeocodeAccuracy</fields>
        <fields>HasOptedOutOfEmail</fields>
        <fields>HasOptedOutOfFax</fields>
        <fields>Id</fields>
        <fields>Industry</fields>
        <fields>IsConverted</fields>
        <fields>IsDeleted</fields>
        <fields>IsUnreadByOwner</fields>
        <fields>Jigsaw</fields>
        <fields>JigsawContactId</fields>
        <fields>LastActivityDate</fields>
        <fields>LastModifiedById</fields>
        <fields>LastModifiedDate</fields>
        <fields>LastName</fields>
        <fields>LastReferencedDate</fields>
        <fields>LastTransferDate</fields>
        <fields>LastViewedDate</fields>
        <fields>Latitude</fields>
        <fields>LeadSource</fields>
        <fields>Longitude</fields>
        <fields>MasterRecordId</fields>
        <fields>MobilePhone</fields>
        <fields>NumberOfEmployees</fields>
        <fields>OwnerId</fields>
        <fields>Phone</fields>
        <fields>PhotoUrl</fields>
        <fields>PostalCode</fields>
        <fields>Rating</fields>
        <fields>Salutation</fields>
        <fields>State</fields>
        <fields>Status</fields>
        <fields>Street</fields>
        <fields>SystemModstamp</fields>
        <fields>Title</fields>
        <fields>Website</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>sbravo@nectia.com.bice</integrationUser>
        <name>Test</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>Actualiza Carpeta Comercial</fullName>
        <actions>
            <name>Actualiza_Carpeta_Comercial</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6</booleanFilter>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lead Persona Natural</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Form_EESS__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Documentaci_n_sustentatoria_EESS__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Copia_de_RUT__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Form_Art_85__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Form_FATCA__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <description>Para un Ejecutivo de Cuenta cuando completa los campos de casilla de la seccion Contacto se actualiza el campo Carpeta Comercial  verdadero</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Actualiza Fecha envío MAC</fullName>
        <actions>
            <name>Actualiza_Fecha_env_o_MAC</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.MAC_creado_y_enviado__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <description>Cuando la casilla &quot;MAC creado y enviado&quot; es verdadera se actualiza &quot;Fecha envío MAC&quot;</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Actualiza Fecha envío a CAC</fullName>
        <actions>
            <name>Actualiza_Fecha_env_o_a_CAC</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Enviado_a_CAC__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <description>Cuando la casilla &quot;Enviado a CAC&quot; es verdadera se actualiza &quot;Fecha envío a CAC&quot;</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Actualiza Fecha envío carpeta comercial rechazada</fullName>
        <actions>
            <name>Actualiza_Fecha_envio_carpeta_comercial</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Envio_carpeta_comercial_rechazada_a_CAC__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <description>Cuando la casilla &quot;Envío carpeta comercial rechazada a CAC&quot; es verdadera se actualiza &quot;Fecha envío carpeta comercial rechazada&quot;</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Actualiza Fecha recepción MAC</fullName>
        <actions>
            <name>Actualiza_Fecha_recepci_n_MAC</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.MAC_recibido_Jefe_de_Grupo__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <description>Cuando la casilla &quot;MAC recibido Jefe de Grupo&quot; es verdadera se actualiza &quot;Fecha recepción MAC&quot;</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Actualiza Registro Inversiones Sí%2C Banco No en Leads de Inversiones</fullName>
        <actions>
            <name>Registro_Banco_NO</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Registro_Inversiones_SI</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Cuando el Owner pertenezca a Inversiones, actualiza los valores de Registro Inversiones =Sí y Registro Banco=No.</description>
        <formula>OR(Owner:User.Profile.Name =&quot;Banca Inversiones Ejecutivo&quot;,Owner:User.Profile.Name =&quot;Banca Inversiones AP Ejecutivo&quot;,Owner:User.Profile.Name =&quot;Banca Inversiones Supervisor&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Actualiza Registro Inversiones%3DNo%2C Banco%3DSí en Leads de Banco</fullName>
        <actions>
            <name>Registro_Banco_SI</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Registro_Inversiones_NO</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Cuando el Owner No pertenezca a Inversiones, actualiza los valores de Registro Inversiones =No y Registro Banco=Sí.</description>
        <formula>AND(Owner:User.Profile.Name &lt;&gt;&quot;Banca Inversiones Ejecutivo&quot;,Owner:User.Profile.Name &lt;&gt;&quot;Banca Inversiones AP Ejecutivo&quot;,Owner:User.Profile.Name &lt;&gt;&quot;Banca Inversiones Supervisor&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Actualiza campo Creacion Cliente</fullName>
        <actions>
            <name>Actualiza_Creacion_Cliente</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Request_to_Create_Client_Area__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lead Persona Natural,Lead Persona Jurídica,Lead Persona Natural (Fuerza de Ventas),Lead Persona Jurídica (Fuerza Ventas)</value>
        </criteriaItems>
        <description>Cuando la casilla &quot;Solicita creacion area cliente&quot; es verdadera se actualiza la lista de seleccion Creacion cliente a valor Pendiente</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Agrega Función del Creador del Registro</fullName>
        <actions>
            <name>Agrega_Funcion_del_Creador_del_Registro</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Funcion_del_Creador_del_registro__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Asigna Ejecutivo Cuenta Banca Personas</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Lead.Account_Executive__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Cuando se crea un Registro Banca Personas, el Ejecutivo de Cuenta es el creador del Registro</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Asignación sucursal a candidato</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lead Persona Natural,Lead Persona Jurídica,Lead Persona Natural (Fuerza de Ventas),Lead Inversiones Persona Natural,Lead Inversiones Persona Jurídica,Lead Persona Jurídica (Fuerza Ventas),Lead Empresas y Corporaciones,Lead Inversiones AP Persona Ju</value>
        </criteriaItems>
        <description>Cuando se crea un lead, se debe asignar a la sucursal donde corresponde la sucursal del ejecutivo.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Aviso creacion de cliente</fullName>
        <actions>
            <name>Aviso_de_cliente_creado</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 OR 2) AND 3</booleanFilter>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lead Persona Natural</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lead Persona Jurídica</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Customer_Creation__c</field>
            <operation>equals</operation>
            <value>Realizado</value>
        </criteriaItems>
        <description>Envia una notificación cuando el Área de cliente, crea a un cliente.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Aviso creacion de cliente con reparos</fullName>
        <actions>
            <name>Aviso_creacion_de_cliente_con_reparos</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 OR 2) AND 3</booleanFilter>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lead Persona Natural</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lead Persona Jurídica</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Customer_Creation__c</field>
            <operation>equals</operation>
            <value>Reparos</value>
        </criteriaItems>
        <description>Envia una notificación cuando el Área de cliente, crea a un cliente y tiene reparos.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Cambia de Estado de Candidato a No Califica</fullName>
        <actions>
            <name>Cambia_de_Estado_de_Candidato_a_No_Calif</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 AND 2 AND 3 AND 4 AND 7) OR (1 AND 2 AND 5 AND 7) OR (2 AND 3 AND 4 AND 6 AND 7) OR (1 AND 2 AND 7)</booleanFilter>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lead Persona Natural (Fuerza de Ventas),Lead Persona Jurídica (Fuerza Ventas)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Motivo_rechazo__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Estado_Aprobacion_Gerente_Ventas__c</field>
            <operation>notEqual</operation>
            <value>Aprobado</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Estado_Aprobacion_Jefe_Grupo__c</field>
            <operation>notEqual</operation>
            <value>Aprobado</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.UserRoleId</field>
            <operation>contains</operation>
            <value>Retail Banking - Branch Manager</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lead Persona Natural,Lead Persona Jurídica</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.UserRoleId</field>
            <operation>notEqual</operation>
            <value>Retail Sales Force - Sales Manager</value>
        </criteriaItems>
        <description>Cambia de Estado de Candidato a No Califica cuando se pone un valor en el campo &quot;Motivo de rechazo&quot;</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Cambia de estado de candidato a Calificacion</fullName>
        <actions>
            <name>Actualiza_estado_a_Calificacion</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7 AND 8 AND 9 AND 10 AND 11 AND 12 AND 13 AND 14 AND 15 AND 16 AND 17 AND 18</booleanFilter>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lead Persona Natural (Fuerza de Ventas)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Resultado_SINACOFI__c</field>
            <operation>equals</operation>
            <value>Sin_problemas</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Form_EESS__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Copia_de_RUT__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Form_FATCA__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.RUT__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Registro_de_Firma__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Carpeta_comercial__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Documentaci_n_sustentatoria_EESS__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Form_Art_85__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Form_Solicitud_de_Productos__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Obtener_Foto_y_Huellas__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Jefe_Plataforma_Agente_Sucursal__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Carpeta_operativa__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Perfil_aprobado_Gerente_de_ventas__c</field>
            <operation>equals</operation>
            <value>Falso</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Status</field>
            <operation>notEqual</operation>
            <value>Califica,No califica</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Sucursal_de_Apertura_del__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Datos_para_Creaci_n_de_Clientes_ok__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <description>Retail Banking Fuerza de Ventas Persona Natural</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Cambia de estado de candidato a Calificacion Persona Jurídica</fullName>
        <actions>
            <name>Actualiza_Estado_Candidato_Calificacion</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7 AND 8 AND 9 AND 10 AND 11 AND 12 AND 13 AND 14 AND 15 AND 16</booleanFilter>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lead Persona Jurídica (Fuerza Ventas)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Resultado_SINACOFI__c</field>
            <operation>equals</operation>
            <value>Sin_problemas</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Copia_de_RUT__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Balance__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.DAI_de_la_Soc__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Taxes__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Escritura_publica__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Estracto_Diario_Oficial__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Copia_inscripcion_original__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Otras_Sociedades__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Carpeta_comercial__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Carpeta_operativa__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Status</field>
            <operation>notEqual</operation>
            <value>Califica,No califica</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Jefe_Plataforma_Agente_Sucursal__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.RUT__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Datos_para_Creaci_n_de_Clientes_ok__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <description>Retail Banking Fuerza de Ventas Persona Jurídica</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Cambia de estado de candidato a Calificacion Persona Jurídica Ejecutivo Cuenta</fullName>
        <actions>
            <name>Actualiza_Estado_Candidato_Calificacion</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7 AND 8 AND 9 AND 10</booleanFilter>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lead Persona Jurídica</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Deuda_SBIF_Historica__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Copia_de_RUT__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Form_Art_85__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Form_EESS__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Form_FATCA__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Deuda_SBIF__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.RUT__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Boletin_Comercial__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Name_and_RUT_from_BICE_client__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Retail Banking Persona Jurídica Ejecutivos de Cuenta.
20170802 Se quita la Condición Datos para la Creación de clientes Ok, a petición del Banco.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Cambia de estado de candidato a Calificacion Persona Jurídica Fuerza de Ventas</fullName>
        <actions>
            <name>Actualiza_Estado_Candidato_Calificacion</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7 AND 8 AND 9 AND 10 AND 11 AND 12 AND 13 AND 14 AND 15 AND 16</booleanFilter>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lead Persona Jurídica (Fuerza Ventas)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Resultado_SINACOFI__c</field>
            <operation>equals</operation>
            <value>Sin_problemas</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Copia_de_RUT__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Balance__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.DAI_de_la_Soc__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Taxes__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Escritura_publica__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Estracto_Diario_Oficial__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Copia_inscripcion_original__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Otras_Sociedades__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Carpeta_comercial__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Carpeta_operativa__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Status</field>
            <operation>notEqual</operation>
            <value>Califica,No califica</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Jefe_Plataforma_Agente_Sucursal__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.RUT__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Datos_para_Creaci_n_de_Clientes_ok__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <description>Retail Banking Fuerza de Ventas Persona Jurídica</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Cambia de estado de candidato a Calificacion2</fullName>
        <actions>
            <name>Actualiza_estado_a_Calificacion</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7 AND 8 AND 9 AND 10 AND 11</booleanFilter>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lead Persona Natural</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Boletin_Comercial__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Form_EESS__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Copia_de_RUT__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Form_FATCA__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Deuda_SBIF__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Form_Art_85__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Deuda_SBIF_Historica__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Documentaci_n_sustentatoria_EESS__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.RUT__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Status</field>
            <operation>notEqual</operation>
            <value>Califica,No califica</value>
        </criteriaItems>
        <description>Retail Banking Persona Natural Ejecutivo Cuenta.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Cambia de estado de candidato a Contacto</fullName>
        <actions>
            <name>Actualiza_estado_a_Contacto</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4</booleanFilter>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lead Persona Natural (Fuerza de Ventas),Lead Persona Jurídica (Fuerza Ventas)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Resultado_SINACOFI__c</field>
            <operation>equals</operation>
            <value>Sin_problemas</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Perfil_aprobado_Gerente_de_ventas__c</field>
            <operation>equals</operation>
            <value>Falso</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Status</field>
            <operation>notEqual</operation>
            <value>Califica,No califica</value>
        </criteriaItems>
        <description>Retail Banking Fuerza de Ventas</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Cambia de estado de candidato a Contacto2</fullName>
        <actions>
            <name>Actualiza_estado_a_Contacto</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5</booleanFilter>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lead Persona Natural,Lead Persona Jurídica</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Boletin_Comercial__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Deuda_SBIF__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Status</field>
            <operation>notEqual</operation>
            <value>Califica,No califica</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Deuda_SBIF_Historica__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Retail Banking Ejecutivo de cuenta.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Cambio de estado de No Califica a Precalificacion PJ</fullName>
        <actions>
            <name>Actualiza_Motivo_de_rechazo_a_null</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Actualiza_estado_del_candidato_a_Pre</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Actualiza_otro_motivo_de_rechazo_a_null</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Bolet_n_Comercial</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_C_digo_resultado_compliance_track</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Datos_para_Creaci_n_Clientes_ok</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Deuda_SBIF_Hist_rica</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Deuda_SBIF_ltimos_3_meses</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpiar_Etapa_Lead</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Cuando se cambia de el estado no Califica a alguno anterior, setea todos los campos del flujo a vacío y el estado a precalificación Ejecutivo de cuentas PJ</description>
        <formula>ISPICKVAL( PRIORVALUE(Status) , &quot;No califica&quot;) &amp;&amp;  RecordType.Name =&quot;Lead Persona Jurídica&quot;</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Cambio de estado de No Califica a Precalificacion PJ2</fullName>
        <actions>
            <name>Limpia_Carpeta_comercial</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Carpeta_operativa</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Copia_de_RUT</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Form_Art_85</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Form_FATCA</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Cuando se cambia de el estado no Califica a alguno anterior, setea todos los campos del flujo a vacío y el estado a precalificación Ejecutivo de cuentas PJ</description>
        <formula>ISPICKVAL( PRIORVALUE(Status) , &quot;No califica&quot;) &amp;&amp;  RecordType.Name =&quot;Lead Persona Jurídica&quot;</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Cambio de estado de No Califica a Precalificacion PJFV</fullName>
        <actions>
            <name>Actualiza_estado_del_candidato_a_Pre</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Actualiza_otro_motivo_de_rechazo_a_null</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_C_digo_resultado_compliance_track</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Carpeta_comercial</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Carpeta_operativa</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Copia_de_RUT</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Datos_para_Creaci_n_Clientes_ok</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Resultado_sinacofi</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_etapa</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Setea_campo_Motivo_rechazo_a_vacio</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Cuando el gerente de ventas cambia de el estado no Califica a alguno anterior, setea todos los campos a vacío y el estado a precalificación</description>
        <formula>ISPICKVAL( PRIORVALUE(Status) , &quot;No califica&quot;) &amp;&amp;  RecordType.Name =&quot;Lead Persona Jurídica (Fuerza Ventas)&quot;</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Cambio de estado de No Califica a Precalificacion PJFV2</fullName>
        <actions>
            <name>Limpia_Balances</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Copia_inscripci_n_original</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Creaci_n_Cliente</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_DAI_de_la_Soc</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Escritura_p_blica</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Estracto_diario_oficial</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Observaci_n_rea_Cliente</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Otras_Sociedades</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Pago_de_IVA_s</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Cuando el gerente de ventas cambia de el estado no Califica a alguno anterior, setea todos los campos a vacío y el estado a precalificación</description>
        <formula>ISPICKVAL( PRIORVALUE(Status) , &quot;No califica&quot;) &amp;&amp;  RecordType.Name =&quot;Lead Persona Jurídica (Fuerza Ventas)&quot;</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Cambio de estado de No Califica a Precalificacion PJFV3</fullName>
        <actions>
            <name>Limpia_Enviado_a_Jefe_de_Grupo</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Estado_aprobaci_n_Gerente_Ventas</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Estado_aprobaci_n_Jefe_Grupo</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Fecha_aprobaci_n_perfil_Gerente</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Fecha_autorizaci_n_Jefe_de_Grupo</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Fecha_env_o_a_Jefe_de_Grupo</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Jefe_Grupo_autoriza_crear_CIF_RI</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Perfil_aprobado_Gerente_de_Ventas</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Cuando el gerente de ventas cambia de el estado no Califica a alguno anterior, setea todos los campos a vacío y el estado a precalificación</description>
        <formula>ISPICKVAL( PRIORVALUE(Status) , &quot;No califica&quot;) &amp;&amp;  RecordType.Name =&quot;Lead Persona Jurídica (Fuerza Ventas)&quot;</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Cambio de estado de No Califica a Precalificacion PJFV4</fullName>
        <actions>
            <name>Limpia_Descripci_n_situaci_n_an_mala</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Documentos_digitalizados</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Ejecutivo_CAC</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Fecha_env_o_MAC</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_MAC_realizado</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Situacion_Anomala</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Solicita_creaci_n_rea_Cliente</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Cuando el gerente de ventas cambia de el estado no Califica a alguno anterior, setea todos los campos a vacío y el estado a precalificación</description>
        <formula>ISPICKVAL( PRIORVALUE(Status) , &quot;No califica&quot;) &amp;&amp;  RecordType.Name =&quot;Lead Persona Jurídica (Fuerza Ventas)&quot;</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Cambio de estado de No Califica a Precalificacion PN</fullName>
        <actions>
            <name>Actualiza_estado_a_Precalificaci_n</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Carpeta_comercial</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Copia_de_RUT</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Datos_para_Creaci_n_Clientes_ok</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Documentaci_n_respaldo_EESS</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Form_Art_85</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Form_EESS</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Form_FATCA</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_etapa</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Cuando se cambia de el estado no Califica a alguno anterior, setea todos los campos del flujo a vacío y el estado a precalificación</description>
        <formula>ISPICKVAL( PRIORVALUE(Status) , &quot;No califica&quot;) &amp;&amp;  RecordType.Name =&quot;Lead Persona Natural&quot;</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Cambio de estado de No Califica a Precalificacion PN2</fullName>
        <actions>
            <name>Actualiza_otro_motivo_de_rechazo_a_null</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Bolet_n_Comercial</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_C_digo_resultado_compliance_track</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Creaci_n_Cliente</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Deuda_SBIF_Hist_rica</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Deuda_SBIF_ltimos_3_meses</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Observaci_n_rea_Cliente</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Solicita_creaci_n_rea_Cliente</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Setea_campo_Motivo_rechazo_a_vacio</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Cuando se cambia de el estado no Califica a alguno anterior, setea todos los campos del flujo a vacío y el estado a precalificación</description>
        <formula>ISPICKVAL( PRIORVALUE(Status) , &quot;No califica&quot;) &amp;&amp;  RecordType.Name =&quot;Lead Persona Natural&quot;</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Cambio de estado de No Califica a Precalificacion PNFV</fullName>
        <actions>
            <name>Actualiza_estado_a_Precalificaci_n</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>LImpia_Registro_de_Firma</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Copia_de_RUT</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Documentaci_n_respaldo_EESS</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Form_Art_85</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Form_EESS</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Form_FATCA</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Form_Solicitud_de_Productos</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Obtener_Foto_y_Huellas</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Resultado_sinacofi</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Cuando el gerente de ventas cambia de el estado no Califica a alguno anterior, setea todos los campos a vacío y el estado a precalificación</description>
        <formula>ISPICKVAL( PRIORVALUE(Status) , &quot;No califica&quot;) &amp;&amp;  RecordType.Name =&quot;Lead Persona Natural (Fuerza de Ventas)&quot;</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Cambio de estado de No Califica a Precalificacion2 PNFV</fullName>
        <actions>
            <name>Limpia_C_digo_resultado_compliance_track</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Carpeta_comercial</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Carpeta_operativa</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Datos_para_Creaci_n_Clientes_ok</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Enviado_a_Jefe_de_Grupo</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Estado_aprobaci_n_Gerente_Ventas</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Estado_aprobaci_n_Jefe_Grupo</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Jefe_Grupo_autoriza_crear_CIF_RI</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Perfil_aprobado_Gerente_de_Ventas</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_etapa</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Cuando el gerente de ventas cambia de el estado no Califica a alguno anterior, setea todos los campos a vacío y el estado a precalificación</description>
        <formula>ISPICKVAL( PRIORVALUE(Status) , &quot;No califica&quot;) &amp;&amp;  RecordType.Name =&quot;Lead Persona Natural (Fuerza de Ventas)&quot;</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Cambio de estado de No Califica a Precalificacion3 PNFV</fullName>
        <actions>
            <name>Limpia_Descripci_n_situaci_n_an_mala</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Documentos_digitalizados</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Ejecutivo_CAC</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Fecha_Estado_Jefe_Grupo</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Fecha_aprobaci_n_perfil_Gerente</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Fecha_autorizaci_n_Jefe_de_Grupo</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Fecha_env_o_a_Jefe_de_Grupo</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_MAC_realizado</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Situacion_Anomala</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Solicita_creaci_n_rea_Cliente</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Cuando el gerente de ventas cambia de el estado no Califica a alguno anterior, setea todos los campos a vacío y el estado a precalificación</description>
        <formula>ISPICKVAL( PRIORVALUE(Status) , &quot;No califica&quot;) &amp;&amp;  RecordType.Name =&quot;Lead Persona Natural (Fuerza de Ventas)&quot;</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Cambio de estado de No Califica a Precalificacion4 PNFV</fullName>
        <actions>
            <name>Limpia_Creaci_n_Cliente</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Fecha_env_o_MAC</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Limpia_Observaci_n_rea_Cliente</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Cuando el gerente de ventas cambia de el estado no Califica a alguno anterior, setea todos los campos a vacío y el estado a precalificación</description>
        <formula>ISPICKVAL( PRIORVALUE(Status) , &quot;No califica&quot;) &amp;&amp;  RecordType.Name =&quot;Lead Persona Natural (Fuerza de Ventas)&quot;</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Completa email de ejecutivo</fullName>
        <actions>
            <name>Actualiza_correo_de_ejecutivo</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Profin_Executive__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Crear Cliente apagado</fullName>
        <actions>
            <name>Desmarca_Solicita_Creacion_Area_Cliente</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Customer_Creation__c</field>
            <operation>equals</operation>
            <value>Reparos</value>
        </criteriaItems>
        <description>Cuado área Cliente tiene reparos, &quot;Crear Cliente&quot; cambia a False</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Empresas y Corporaciones cambia estado calificacion</fullName>
        <actions>
            <name>Actualiza_Estado_Candidato_Calificacion</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND (4 OR 5) AND 6 AND 7 AND 8 AND 9 AND 10 AND 11</booleanFilter>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lead Empresas y Corporaciones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Breve_rese_a_de_la_empresa_o_Memoria__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.EEFF_o_Flujo_de_caja__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Informacion_de_la_Propiedad_de_empresa__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Actividad_Economica_SBIF__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Boletin_Comercial__c</field>
            <operation>equals</operation>
            <value>Sin antecedentes</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Deuda_SBIF__c</field>
            <operation>equals</operation>
            <value>Sin morosidad</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Deuda_Leasing_Factoring__c</field>
            <operation>equals</operation>
            <value>Sin morosidad</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Giro_buscado__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Fecha_de_la_visita__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Bancary_products__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Cambia el estado del candidato a &quot;Calificacion&quot; cuando los campos son distintos de vacios:
•Breve reseña de la empresa o Memoria
•EEFF
•Información de la Propiedad de la empres
•Requerimiento comercial de la empresa (productos y servicios)</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Empresas y Corporaciones cambia estado contacto</fullName>
        <actions>
            <name>Actualiza_estado_a_Contacto</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7 AND 8 AND 9</booleanFilter>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lead Empresas y Corporaciones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Boletin_Comercial__c</field>
            <operation>equals</operation>
            <value>Sin antecedentes</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Deuda_SBIF__c</field>
            <operation>equals</operation>
            <value>Sin morosidad</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Deuda_Leasing_Factoring__c</field>
            <operation>equals</operation>
            <value>Sin morosidad</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Giro_buscado__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Fecha_de_la_visita__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Breve_rese_a_de_la_empresa_o_Memoria__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.EEFF_o_Flujo_de_caja__c</field>
            <operation>equals</operation>
            <value>Falso</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Informacion_de_la_Propiedad_de_empresa__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Cambia el estado del candidato a &quot;Contacto&quot; cuando los campos son distintos de vacios:</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Envia aviso de retiro de carpeta</fullName>
        <actions>
            <name>Notificaci_n_para_retirar_la_Carpeta_Jefe_Grupo</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.MAC_creado_y_enviado__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Situacion_Anomala__c</field>
            <operation>equals</operation>
            <value>No</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Profin_Supervisor__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Envio correo de MAC aprobado</fullName>
        <actions>
            <name>Envio_de_alerta_MAC_aprobado</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Estado_de_MAC__c</field>
            <operation>equals</operation>
            <value>Aprobado</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Envio correo de MAC rechazado</fullName>
        <actions>
            <name>Envio_de_alerta_de_MAC_rechazado</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Estado_de_MAC__c</field>
            <operation>equals</operation>
            <value>Rechazado</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Crea tarea al enviar desglose</fullName>
        <actions>
            <name>An_lisis_de_desglose</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lead Empresas y Corporaciones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Send_documents_to_risk__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <description>Cuando el ejecutivo envía la información de desglose, a riesgo se le crea una tarea.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Envía candidato a creación en área clientte</fullName>
        <actions>
            <name>EyC_Actualiza_solicitud_rea_cliente</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>EyC_Env_a_candidato_a_creaci_n_en_rea</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lead Empresas y Corporaciones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Campos_para_creaci_n_clientes_OK__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <description>Si todos los campos necesarios según ficha de cliente están ok, se envía al área clientes para su creación</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Evaluación en listas negras</fullName>
        <actions>
            <name>EyC_No_califica_por_lista_negra</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lead Empresas y Corporaciones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Black_list__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <description>Cuando el candidato figura en lista negra, se cambia automáticamente la etapa y estado a No Califica</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Lead - Actualiza fecha de apertura cta cte</fullName>
        <actions>
            <name>EyC_Lead_Actualiza_fecha_de_apertura</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Cuando se abre una cta cte la fecha de apertura de esta es al mismo tiempo que se crea la cta cte.</description>
        <formula>IF(AND(RecordType.Name = &quot;Lead Empresas y Corporaciones&quot;,ISCHANGED( Bank_account_created__c )),TRUE,FALSE)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Lead - Actualiza fecha revisión EEFF</fullName>
        <actions>
            <name>EyC_Actualiza_fecha_revisi_n_EEFF</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>IF(AND(RecordType.Name=&quot;Lead Empresas y Corporaciones&quot;, ISCHANGED( EEFF_o_Flujo_de_caja__c )),TRUE,FALSE)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Lead - Cambio de Antecedentes a Calificación</fullName>
        <actions>
            <name>EyC_Lead_Cambio_de_Contacto_a_Califi</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Cambio automático al tener todos los campos claves de calificación.</description>
        <formula>IF(   AND(     RecordType.Name = &quot;Lead Empresas y Corporaciones&quot;,     AND(       INCLUDES( Requerimiento_comercial_de_la_empresa_p__c, &quot;Cuenta corriente&quot;),       INCLUDES( Requerimiento_comercial_de_la_empresa_p__c, &quot;Productos de crédito que requieren MAC&quot;)       ),     EEFF_o_Flujo_de_caja__c = TRUE,     Breve_rese_a_de_la_empresa_o_Memoria__c &lt;&gt; &quot;&quot;,     Informacion_de_la_Propiedad_de_empresa__c &lt;&gt; &quot;&quot;     ),   TRUE,IF(       AND(         RecordType.Name = &quot;Lead Empresas y Corporaciones&quot;,         INCLUDES( Requerimiento_comercial_de_la_empresa_p__c, &quot;MAC&quot;),         EEFF_o_Flujo_de_caja__c = TRUE,         Breve_rese_a_de_la_empresa_o_Memoria__c &lt;&gt; &quot;&quot;,         Informacion_de_la_Propiedad_de_empresa__c &lt;&gt; &quot;&quot;         ),       TRUE,IF(           AND(                   RecordType.Name = &quot;Lead Empresas y Corporaciones&quot;,             INCLUDES( Requerimiento_comercial_de_la_empresa_p__c, &quot;Cuenta corriente&quot;),             Breve_rese_a_de_la_empresa_o_Memoria__c &lt;&gt; &quot;&quot;,             Informacion_de_la_Propiedad_de_empresa__c &lt;&gt; &quot;&quot;             ),           TRUE,FALSE)))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Lead - Cambio de Contacto a Calificación</fullName>
        <actions>
            <name>EyC_Lead_Cambio_de_Contacto_a_Califi</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6</booleanFilter>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lead Empresas y Corporaciones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.EEFF_o_Flujo_de_caja__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Breve_rese_a_de_la_empresa_o_Memoria__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Informacion_de_la_Propiedad_de_empresa__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Send_documents_to_risk__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Bancary_products__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Cambio automático al tener todos los campos claves de calificación</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Lead - Cambio de Precalif a Antecedentes</fullName>
        <actions>
            <name>EyC_Lead_Cambio_de_Precalif_a_Contac</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5</booleanFilter>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lead Empresas y Corporaciones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Boletin_Comercial__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Deuda_Leasing_Factoring__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Deuda_SBIF__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Actividad_Economica_SBIF__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Cambio automático de etapa de Precalificación a Antecedentes</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Lead - Cambio de Precalif a Contacto</fullName>
        <actions>
            <name>EyC_Lead_Cambio_de_Precalif_a_Contac</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6</booleanFilter>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lead Empresas y Corporaciones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Boletin_Comercial__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Deuda_Leasing_Factoring__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Deuda_SBIF__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Giro_buscado__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.RUT__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Cambio automático de etapa de Precalificación a Contacto</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Lead - Fecha resultado comité</fullName>
        <actions>
            <name>EyC_Lead_Actualiza_fecha_res_comit</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>IF(AND(RecordType.Name = &quot;Lead Empresas y Corporaciones&quot;,  ISCHANGED(Resultado_comit__c)), TRUE, FALSE )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Lead - Fecha revisión boletín comercial</fullName>
        <actions>
            <name>EyC_Actualiza_fecha_rev_bolet_n_comerc</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>IF(AND(RecordType.Name = &quot;Lead Empresas y Corporaciones&quot;, 			ISCHANGED( Boletin_Comercial__c )),TRUE, FALSE )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Lead - Fecha revisión deuda SBIF</fullName>
        <actions>
            <name>EyC_Actualiza_fecha_deuda_sbif</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>IF(AND(RecordType.Name = &quot;Lead Empresas y Corporaciones&quot;,  ISCHANGED(  Deuda_SBIF__c  )), TRUE, FALSE )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Lead - Notifica creación cliente a ejecutivo comercial</fullName>
        <actions>
            <name>EyC_Lead_notifica_creaci_n_cliente_a_ej_comercial</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND (2 OR 3) AND 4</booleanFilter>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lead Empresas y Corporaciones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Customer_Creation__c</field>
            <operation>equals</operation>
            <value>Reparos</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Customer_Creation__c</field>
            <operation>equals</operation>
            <value>Realizado</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Result_compliance_tracker__c</field>
            <operation>equals</operation>
            <value>Aprobado</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Lead - cambia a No Califica si comité rechazo</fullName>
        <actions>
            <name>EyC_Lead_Autocompleta_motivo_rechazo</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>EyC_Lead_cambia_a_No_Califica_si_exi</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2</booleanFilter>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lead Empresas y Corporaciones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Resultado_comit__c</field>
            <operation>equals</operation>
            <value>Rechazado</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Lead - cambia a No Califica si existe motivo rechazo</fullName>
        <actions>
            <name>EyC_Lead_cambia_No_Califica_si_exi</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND (2 OR 3)</booleanFilter>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lead Empresas y Corporaciones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Motivo_rechazo__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Resultado_comit__c</field>
            <operation>equals</operation>
            <value>Rechazado</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Lead - desmarca creación cliente si es con reparos</fullName>
        <actions>
            <name>EyC_Desmarca_campo_creaci_n_cliente_ok</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lead Empresas y Corporaciones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Customer_Creation__c</field>
            <operation>equals</operation>
            <value>Reparos</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Lead - impide que se cree en etapa distinta a Precalificación</fullName>
        <actions>
            <name>EyC_Lead_fuerza_crear_lead_precalifi</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lead Empresas y Corporaciones</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Lead - registra fecha último comentario</fullName>
        <actions>
            <name>EyC_Lead_fecha_ultimo_comentario</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>IF(AND( RecordType.Name=&quot;Lead Empresas y Corporaciones&quot;, ISCHANGED( Ultima_actividad__c ) ), TRUE, FALSE)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Lead no está en lista negra</fullName>
        <actions>
            <name>EyC_Cambio_de_etapa_calif_cliAcivado</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lead Empresas y Corporaciones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Not_in_black_list__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <description>Cambia la etapa desde calificación a cliente activada</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Reestablece etapas y campos - p1</fullName>
        <actions>
            <name>EyC_Lead_EliminaMoraLeasing</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>EyC_Lead_ambiaCreacionCliente</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>EyC_Lead_cambiaActEconomicaSBIF</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>EyC_Lead_cambiaBreveResena</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>EyC_Lead_cambiaCreaCtaCte</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>EyC_Lead_cambiaDeudaSbif</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>EyC_Lead_cambiaEEFFFLujoCaja</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>EyC_Lead_cambiaMontoMACAprob</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>EyC_Lead_cambiaResultComite</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>EyC_Lead_cambiaStatusPrecalifi</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Un lead que no califica puede pasar a tener todos los campos vacíos</description>
        <formula>IF( 	AND( 		RecordType.Name = &quot;Lead Empresas y Corporaciones&quot;, 		ISPICKVAL(PRIORVALUE(Status),&quot;No califica&quot;) 		),TRUE,FALSE 	)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Reestablece etapas y campos - p2</fullName>
        <actions>
            <name>EyC_Lead_cambiaCamposCreacionOK</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>EyC_Lead_cambiaCodigoResultadoCT</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>EyC_Lead_cambiaFechaVencimMAC</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>EyC_Lead_cambiaInfoPropiedadEmp</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>EyC_Lead_cambiaMotivoRechazo</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>EyC_LeadcambiaBoletinComercial</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Un lead que no califica puede pasar a tener todos los campos vacíos (parte 2)</description>
        <formula>IF( 	AND( 		RecordType.Name = &quot;Lead Empresas y Corporaciones&quot;, 		ISPICKVAL(PRIORVALUE(Status),&quot;No califica&quot;) 		),TRUE,FALSE 	)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Tarea de riesgo a ejecutivo</fullName>
        <actions>
            <name>Informaci_n_de_riesgo_recibida</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lead Empresas y Corporaciones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Risk_information_recieved__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <description>Cuando en riesgo reciben la tarea, éstos deben enviar al ejecutivo comercial una area</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Formatea RUT in Lead</fullName>
        <actions>
            <name>Formatea_RUT_Leads</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>IF( and(RUT__c &lt;&gt; Rut_formato_AUX__c,NOT(ISBLANK(RUT__c))),true,false )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Fuerza Ventas - Actualizar correo Supervisor CAC</fullName>
        <actions>
            <name>Actualiza_correo_CAC</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>Owner:User.UserRole.Name = &apos;Retail Sales Force - Activation Center Supervisor&apos;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Fuerza Ventas - Actualizar correo jefe de grupo</fullName>
        <actions>
            <name>Fuerza_Ventas_Actualiza_Jefe_de_Grupo</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>Owner:User.UserRole.Name = &apos;Retail Sales Force - Group Supervisor&apos;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Fuerza Ventas - Notificar creación en CIF</fullName>
        <actions>
            <name>Notificar_CAC_Jefe_de_Grupo</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Retail Banking - Sales force: Se envía alerta de correo a jefe de grupo y CAC.</description>
        <formula>AND( CONTAINS(Owner:User.Profile.Name , &apos;Banca Personas&apos;),   CIF_Id__c &lt;&gt; null,   Correo_CAC__c &lt;&gt; null ,  Correo_jefe_de_grupo__c &lt;&gt; null)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inv - IPJ - Cambia de Precalif a Contacto</fullName>
        <actions>
            <name>Inv_Cambia_de_precalif_a_contacto</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lead Inversiones Persona Jurídica</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Result_compliance_tracker__c</field>
            <operation>notEqual</operation>
            <value>No realizada</value>
        </criteriaItems>
        <description>IPJ = Inversiones Persona Jurídica</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inv - IPN - Cambia de Precalif a Contacto</fullName>
        <actions>
            <name>Inv_Cambia_de_precalif_a_contacto</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7</booleanFilter>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lead Inversiones Persona Natural</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.FirstName</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.LastName</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Apellido_materno__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Nationality__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.RUT__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Result_compliance_tracker__c</field>
            <operation>notEqual</operation>
            <value>No realizada,Consulte en Área de Cumplimiento</value>
        </criteriaItems>
        <description>IPN = Inversiones Persona Natural</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inv - PJ - Cambia de Contacto a Calificación</fullName>
        <actions>
            <name>Inv_Cambia_de_Contacto_a_Calificaci_n</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lead Persona Jurídica</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Name_and_RUT_from_BICE_client__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Form_EESS__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Form_Art_85__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Form_FATCA__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <description>PJ = Persona Jurídica</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inv - PJ - Cambia de Precalif a Contacto</fullName>
        <actions>
            <name>Inv_Cambia_de_precalif_a_contacto</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lead Persona Jurídica</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.RUT__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Deuda_SBIF__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Deuda_SBIF_Historica__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Boletin_Comercial__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>PJ = Persona Jurídica</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inv - PN - Cambiar de Contacto a Calificación</fullName>
        <actions>
            <name>Inv_Cambia_de_precalif_a_contacto</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6</booleanFilter>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lead Persona Natural</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Form_EESS__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Documentaci_n_sustentatoria_EESS__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Copia_de_RUT__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Form_Art_85__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Form_FATCA__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <description>PN = Persona Natural</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inv - PN - Cambiar de Precalif a Contacto</fullName>
        <actions>
            <name>Inv_Cambia_de_precalif_a_contacto</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6</booleanFilter>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lead Persona Natural</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.RUT__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Nationality__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Deuda_SBIF__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Deuda_SBIF_Historica__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Boletin_Comercial__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>PN = Persona Natural</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inv_AP_AvisoContactarCliente</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lead Inversiones AP Persona Jurídica,Lead Inversiones AP Persona Natural</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Inv_AP_Cumple_requisitos__c</field>
            <operation>equals</operation>
            <value>Sí</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Status</field>
            <operation>equals</operation>
            <value>Contacto</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Inv_AP_Cliente_contactado__c</field>
            <operation>equals</operation>
            <value>Falso</value>
        </criteriaItems>
        <description>Alerta de correo para avisar a subgerente y ejecutivo AP, que el posible cliente no ha sido contactado en 10 dias.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Inv_AP_LeadNoContactado</name>
                <type>Alert</type>
            </actions>
            <timeLength>10</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Inv_AP_NoReqValidacionSubgerente</fullName>
        <actions>
            <name>Actualiza_estado_a_Contacto</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lead Inversiones AP Persona Jurídica,Lead Inversiones AP Persona Natural</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Inv_AP_Requiere_validacion_subgerente__c</field>
            <operation>equals</operation>
            <value>No</value>
        </criteriaItems>
        <description>El lead no requiere validación del subgrente, por lo tanto, pasa a estado &quot;Contacto&quot;</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inversiones - Actualizar Correo Jefe de Grupo</fullName>
        <actions>
            <name>Actualizar_correo_jefe_de_grupo_gestor</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Actualiza correo de jefe de grupo en base al gestor de usuario propietario.</description>
        <formula>IF(AND(Owner:User.UserRole.Name = &apos;División Inversiones&apos;,CIF_Id__c &lt;&gt; null),true,false)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inversiones - Asignar Ejecutivo AP</fullName>
        <actions>
            <name>Asignacion_Prospecto_AP</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Prospecto_Altos_Patrimonios</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <formula>AND(CONTAINS(Owner:User.Profile.Name , &apos;Banca Inversiones AP Ejecutivo&apos;),   TEXT(Status) = &apos;No Contactado&apos;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Asignacion_Prospecto_AP</name>
                <type>Alert</type>
            </actions>
            <actions>
                <name>Prospecto_Altos_Patrimonios</name>
                <type>Task</type>
            </actions>
            <timeLength>3</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Inversiones - KYC Ingresado</fullName>
        <actions>
            <name>Notificar_a_Supervisor_KYC_Ingresado</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.KYC_Ingresado__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <description>Avisar a supervisor que el KYC ha sido ingresado</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inversiones - No califica</fullName>
        <actions>
            <name>Estado_No_Califica</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Motivo_rechazo__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lead Inversiones Persona Natural,Lead Inversiones Persona Jurídica,Lead Inversiones AP Persona Jurídica,Lead Inversiones AP Persona Natural</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Status</field>
            <operation>notEqual</operation>
            <value>No califica</value>
        </criteriaItems>
        <description>Para AP y Estandar, cuando el lead tiene motivo de rechazo, se debe cambiar el estado a &quot;No Califica&quot;</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Inversiones - Notificar Jefe de Grupo</fullName>
        <actions>
            <name>Enviar_a_Jefe_de_Grupo</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Se debe notiifcar al jefe de grupo de Fuerza de ventas que el prospecto fue creado en CIF.</description>
        <formula>IF(AND(Owner:User.UserRole.Name  = &apos;División Inversiones&apos;,CIF_Id__c  &lt;&gt; null, Correo_jefe_de_grupo__c &lt;&gt; null),true,false)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inversiones - Pasar a Calificación</fullName>
        <actions>
            <name>Actualiza_estado_a_Calificacion</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7</booleanFilter>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lead Inversiones Persona Natural</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Status</field>
            <operation>equals</operation>
            <value>Precalificación</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.RUT__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Perfil_de_Riesgo__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Apellido_materno__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.FirstName</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Phone</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Lead no contactado en 5 días</fullName>
        <active>true</active>
        <description>Si lead no es contactado, envía mail indicando la falta.</description>
        <formula>AND( text(Status)= &quot;Precalificación&quot;, OR(RecordType.Name = &quot;Lead Inversiones Persona Natural&quot;,RecordType.Name = &quot;Lead Inversiones Persona Jurídica&quot;) ,  CreatedBy.Username &lt;&gt;  Owner:User.Username )</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Avisa_Lead_no_contactado</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Lead.CreatedDate</offsetFromField>
            <timeLength>5</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Limpia campo motivo de rechazo</fullName>
        <actions>
            <name>Actualiza_Motivo_de_rechazo_a_null</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Actualiza_estado_del_candidato_a_Pre</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Actualiza_otro_motivo_de_rechazo_a_null</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND( ISPICKVAL(PRIORVALUE(Status),&quot;No Califica&quot;), $Profile.Name &lt;&gt; &quot;Banca Personas Ejecutivos Fuerza de Ventas&quot;, OR(RecordType.Name =&quot;Lead Persona Jurídica (Fuerza Ventas)&quot;, RecordType.Name =&quot;Lead Persona Natural (Fuerza de Ventas)&quot; ) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Limpia email de ejecutivo</fullName>
        <actions>
            <name>Limpia_email_de_ejecutivo</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Profin_Executive__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Profin_Correo Jefe Plataforma %2F Agente Sucursal</fullName>
        <actions>
            <name>Profin_Correo_Jefe_Plataforma</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lead Persona Natural (Fuerza de Ventas),Lead Persona Jurídica (Fuerza Ventas)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Jefe_Plataforma_Agente_Sucursal__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Retail Banking -  Lead Aprobado</fullName>
        <actions>
            <name>Retail_Banking_Lead_Aprobado</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lead Persona Natural (Fuerza de Ventas)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Scanned_Documents__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Estado_Aprobacion_Gerente_Ventas__c</field>
            <operation>equals</operation>
            <value>Aprobado</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Estado_Aprobacion_Jefe_Grupo__c</field>
            <operation>equals</operation>
            <value>Aprobado</value>
        </criteriaItems>
        <description>Notifación para: Agente / Jefe de Plataforma, C.A.C, Jefas de Grupo, Jefa Comercial y Gerente de Ventas, cuando Lead ha sido aprobado.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Retail Banking - Correo jefe comercial</fullName>
        <actions>
            <name>Guarda_correo_jefe_comercial</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Guarda correo cuando el gerente de ventas</description>
        <formula>AND(LastModifiedBy.UserRole.Name = &apos;Retail Sales Force - Assistant Manager&apos;,  Perfil_aprobado_Jefe_de_ventas__c = TRUE)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Retail Banking - Crear Cliente</fullName>
        <actions>
            <name>Etapa_Crear_Cliente</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lead Persona Natural (Fuerza de Ventas),Lead Persona Jurídica (Fuerza Ventas)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Request_to_Create_Client_Area__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Retail Banking - Enviado a CAC</fullName>
        <actions>
            <name>Actualiza_Etapa_Enviado_CAC</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lead Persona Natural (Fuerza de Ventas),Lead Persona Jurídica (Fuerza Ventas)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.MAC_creado_y_enviado__c</field>
            <operation>equals</operation>
            <value>Falso</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Customer_Creation__c</field>
            <operation>notEqual</operation>
            <value>Pendiente</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>TEMP - copia fecha declaracion jurada a fecha margen</fullName>
        <actions>
            <name>TEMP_copia_fecha_margen_a_dec_jurada</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.Sworn_declaration_date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>SOLUCIÓN TEMPORAL:</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>TEMP - copia fecha declaracion margen a fecha declaracion jurada</fullName>
        <actions>
            <name>TEMP_copia_fecha_declaracion_margen_a</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.Fecha_de_declaracion_de_margen__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>SOLUCIÓN TEMPORAL:</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Validación de campos para aprobación PJ</fullName>
        <actions>
            <name>Validaci_n_de_campos_para_aprobaci_n_PJ</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7 AND 8  AND 9  AND 10  AND 11  AND 12  AND 13  AND 14  AND 15 AND 16 AND 17 AND 18  AND 19 and 20 and 21 and 22</booleanFilter>
        <criteriaItems>
            <field>Lead.Sucursal_de_Apertura_del__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Division_reporting__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.RUT__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Company</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Raz_n_Social__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Customer_Legal_Person_Consumer__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Customer_type_other_rating__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Segmentation__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Commercial_Classification__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Nationality__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.SBIF_Sector__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Clasificacion_de_Riesgo_SBIF__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Carpeta_comercial__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Sex__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Title</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lead Persona Jurídica (Fuerza Ventas)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Calle_comercial__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.FirstName</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Apellido_materno__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Numero_comercial__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Ciudad_comercial__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Pais_comercial__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <tasks>
        <fullName>An_lisis_de_desglose</fullName>
        <assignedTo>Analista_de_riesgo</assignedTo>
        <assignedToType>role</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Análisis de desglose</subject>
    </tasks>
    <tasks>
        <fullName>Informaci_n_de_riesgo_recibida</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Información de riesgo recibida</subject>
    </tasks>
    <tasks>
        <fullName>Prospecto_Altos_Patrimonios</fullName>
        <assignedToType>owner</assignedToType>
        <description>Favor contactar a Prospecto.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Lead.Fecha_Vencimiento_Tarea_del__c</offsetFromField>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Prospecto Altos Patrimonios</subject>
    </tasks>
    <tasks>
        <fullName>Recordatorio_contacto</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Lead.Fecha_Vencimiento_Tarea_del__c</offsetFromField>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Recordatorio contacto</subject>
    </tasks>
</Workflow>
