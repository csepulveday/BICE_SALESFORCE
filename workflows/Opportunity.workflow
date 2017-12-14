<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Alerta_Ejecutivo_Inversiones</fullName>
        <description>Alerta Ejecutivo Inversiones</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Inversiones/Inv_AP_RevisarEjecutivo</template>
    </alerts>
    <alerts>
        <fullName>Alerta_a_ejecutivo_inversiones_con_formulario_activos_con_reparos</fullName>
        <description>Alerta a ejecutivo inversiones con formulario activos con reparos</description>
        <protected>false</protected>
        <recipients>
            <field>Ejecutivo_Inversiones__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Inversiones/Inv_FormActivosReparos</template>
    </alerts>
    <alerts>
        <fullName>Alerta_actividades_previas_Comit_de_cr_dito</fullName>
        <description>Alerta actividades previas Comité de crédito</description>
        <protected>false</protected>
        <recipients>
            <field>alerta_al_subgerente_agente_comercial__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Actividades_previas_Comit_de_cr_dito</template>
    </alerts>
    <alerts>
        <fullName>Alerta_de_vencimiento_l_nea</fullName>
        <description>Alerta de vencimiento línea</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Alerta_vencimiento_l_nea</template>
    </alerts>
    <alerts>
        <fullName>Alerta_de_vencimiento_nea</fullName>
        <description>Alerta de vencimiento línea</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Alerta_vencimiento_l_nea</template>
    </alerts>
    <alerts>
        <fullName>Aviso_Oportunidad_Cerrada_Ganada_Multiproducto</fullName>
        <description>Aviso Oportunidad Cerrada Ganada-Multiproducto</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Aviso_Oportunidad_Cerrada_Ganada</template>
    </alerts>
    <alerts>
        <fullName>Aviso_Oportunidad_con_subetapa_Welcome_pack_entregado</fullName>
        <description>Aviso Oportunidad con subetapa Welcome pack entregado</description>
        <protected>false</protected>
        <recipients>
            <recipient>Retail_Sales_Force_Sales_Manager</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <field>Jefe_Plataforma_Agente_Sucursal__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Jefe_de_Grupo__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Profin_Executive__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Oportunidad_Welcome_pack_entregado</template>
    </alerts>
    <alerts>
        <fullName>Aviso_Welcome_pack_listo</fullName>
        <description>Aviso Welcome pack listo</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Welcome_pack_listo</template>
    </alerts>
    <alerts>
        <fullName>Aviso_de_Oportunidad_rechazada_por_comite</fullName>
        <description>Aviso de Oportunidad rechazada por comite</description>
        <protected>false</protected>
        <recipients>
            <recipient>Retail_Sales_Force_Sales_Manager</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <field>Jefe_Plataforma_Agente_Sucursal__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Jefe_de_Grupo__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Profin_Executive__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Oportunidad_Rechazada</template>
    </alerts>
    <alerts>
        <fullName>EyC_alerta_a_ejecutivo_comercial_por_informe_completo_de_oportunidad</fullName>
        <description>EyC - alerta a ejecutivo comercial por informe completo de oportunidad</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/EyC_Opp_analista_riesgo_notifica_a_ejecutivo_comercial</template>
    </alerts>
    <alerts>
        <fullName>Fill_Structure_in_opty</fullName>
        <description>Llenar la información de Estructura, tipo productos y garantías</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/structura_not_filled_in_one_day</template>
    </alerts>
    <alerts>
        <fullName>Inv_AP_AvisoSubgerente</fullName>
        <description>Inv_AP_AvisoSubgerente</description>
        <protected>false</protected>
        <recipients>
            <field>alerta_al_subgerente_agente_comercial__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Inversiones/Inv_AP_RevisarSubgerente</template>
    </alerts>
    <alerts>
        <fullName>Inv_AP_EnrolamientoOK</fullName>
        <description>Inv_AP_EnrolamientoOK</description>
        <protected>false</protected>
        <recipients>
            <field>alerta_al_subgerente_agente_comercial__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Inversiones/Inv_AP_EnrolamientoOK</template>
    </alerts>
    <alerts>
        <fullName>Inv_AP_InversionRealizada</fullName>
        <description>Inv_AP_InversiónRealizada</description>
        <protected>false</protected>
        <recipients>
            <field>alerta_al_subgerente_agente_comercial__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Inversiones/Inv_AP_InversionRealizada</template>
    </alerts>
    <alerts>
        <fullName>Inv_AP_OportunidadAprobada</fullName>
        <description>Inv_AP_OportunidadAprobada</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Inversiones/Inv_AP_OportunidadAprobada</template>
    </alerts>
    <alerts>
        <fullName>Inv_AP_OportunidadPendiente</fullName>
        <description>Inv_AP_OportunidadPendiente</description>
        <protected>false</protected>
        <recipients>
            <field>alerta_al_subgerente_agente_comercial__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Inversiones/Inv_AP_PropuestaPendiente</template>
    </alerts>
    <alerts>
        <fullName>Inv_AP_PropuestaCreada</fullName>
        <description>Inv_AP_PropuestaCreada</description>
        <protected>false</protected>
        <recipients>
            <field>alerta_al_subgerente_agente_comercial__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Inversiones/Inv_PropuestaCreada</template>
    </alerts>
    <alerts>
        <fullName>Inv_AP_RechazoOportunidad</fullName>
        <description>Inv_AP_RechazoOportunidad</description>
        <protected>false</protected>
        <recipients>
            <field>LastModifiedById</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Inversiones/Inv_AP_RechazoOportunidad</template>
    </alerts>
    <alerts>
        <fullName>Inv_AP_RechazoOportunidadEjecutivo</fullName>
        <description>Inv_AP_RechazoOportunidadEjecutivo</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Inversiones/Inv_AP_RechazoOportunidad</template>
    </alerts>
    <alerts>
        <fullName>Inv_BIA_PropuestaCreada</fullName>
        <description>Inv_BIA_PropuestaCreada</description>
        <protected>false</protected>
        <recipients>
            <field>Ejecutivo_Cuenta__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Inversiones/Inv_PropuestaCreada</template>
    </alerts>
    <alerts>
        <fullName>Inv_ConfirmaRecepcionFormulario</fullName>
        <description>Inv_ConfirmaRecepciónFormulario</description>
        <protected>false</protected>
        <recipients>
            <field>Ejecutivo_Inversiones__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Inversiones/Inv_FormActivos</template>
    </alerts>
    <alerts>
        <fullName>Inv_Welcome_pack_disponible</fullName>
        <description>Inv_Welcome pack disponible</description>
        <protected>false</protected>
        <recipients>
            <field>Ejecutivo_Cuenta__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Inversiones/Welcome_pack_disponible</template>
    </alerts>
    <alerts>
        <fullName>Solicita_apertura_de_Productos</fullName>
        <description>Solicita apertura de Productos</description>
        <protected>false</protected>
        <recipients>
            <field>Operaciones__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Inversiones/Inv_Solicita_apertura_de_Productos</template>
    </alerts>
    <fieldUpdates>
        <fullName>Actualiza_Etapa_a_Cerrada_Perdida</fullName>
        <field>StageName</field>
        <literalValue>Cerrada Perdida</literalValue>
        <name>Actualiza Etapa a Cerrada Perdida</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualiza_Etapa_a_Otorgamiento</fullName>
        <field>StageName</field>
        <literalValue>Otorgamiento</literalValue>
        <name>Actualiza Etapa a Otorgamiento</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualiza_Resultado_Comit</fullName>
        <field>Resultado_Comite__c</field>
        <literalValue>En_proceso_de_comite</literalValue>
        <name>Actualiza Resultado Comité</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualiza_Subetapa_Aperturar_linea_BIA</fullName>
        <description>Actualiza subetapa a &quot;Aperturar linea de crédito BIA&quot; cuando contratos del welcome pack se han entregado firmados a operaciones.</description>
        <field>Subetapa__c</field>
        <literalValue>Aperturar línea de crédito BIA</literalValue>
        <name>Actualiza Subetapa Aperturar linea BIA</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualiza_Subetapa_a_Productos_activados</fullName>
        <field>Subetapa__c</field>
        <literalValue>Productos activados</literalValue>
        <name>Actualiza Subetapa a Productos activados</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualiza_Subetapa_a_Welcome_pack_dispon</fullName>
        <field>Subetapa__c</field>
        <literalValue>Welcome pack disponible</literalValue>
        <name>Actualiza Subetapa a Welcome pack dispon</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualiza_Tipo_Registro_BIA</fullName>
        <field>RecordTypeId</field>
        <lookupValue>BIA</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Actualiza Tipo Registro BIA</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualiza_a_subetapa_Validacion_cliente</fullName>
        <field>Subetapa__c</field>
        <literalValue>Enrolar</literalValue>
        <name>Actualiza a subetapa Validación cliente</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualiza_etapa_a_Ganada</fullName>
        <field>StageName</field>
        <literalValue>Cerrada Ganada</literalValue>
        <name>Actualiza etapa a Ganada</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualiza_fecha_envio_comit</fullName>
        <field>Fecha_envio_comite__c</field>
        <formula>today()</formula>
        <name>Inversiones_Actualiza fecha envio comité</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualiza_fecha_envio_comite</fullName>
        <field>Fecha_envio_comite__c</field>
        <formula>TODAY()</formula>
        <name>Actualiza fecha envio comite</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualiza_subetapa_Gesti_n_pendiente</fullName>
        <field>Subetapa__c</field>
        <literalValue>Gestión pendiente</literalValue>
        <name>Actualiza subetapa Gestión pendiente</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualizacion_de_Subetapa_Comite_de_cred</fullName>
        <field>Subetapa__c</field>
        <literalValue>Comité de Crédito</literalValue>
        <name>Actualizacion de Subetapa Comite de cred</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Actualizar_etapa_a_Contacto</fullName>
        <description>Para BIA</description>
        <field>StageName</field>
        <literalValue>Contacto</literalValue>
        <name>Actualizar etapa a Contacto</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Contacto_cliente</fullName>
        <field>Subetapa__c</field>
        <literalValue>Contacto cliente</literalValue>
        <name>Contacto cliente</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Actualizaci_n_para_cambio_de_etapa</fullName>
        <description>Actualiza la etapa de contacto a calificación.</description>
        <field>StageName</field>
        <literalValue>Calificación</literalValue>
        <name>EyC - Actualización para cambio de etapa</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Cambio_Precal_Contac</fullName>
        <description>En oportunidad, cuando creo desde cero, debo validar que existan los campos, y luego, automáticamente cambio a la etapa Contacto</description>
        <field>StageName</field>
        <literalValue>Contacto</literalValue>
        <name>EyC - Cambio Precal-Contac</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Cambio_de_etapa_calif_otorg</fullName>
        <description>Cambia la etapa de Calificación a Otorgamiento</description>
        <field>StageName</field>
        <literalValue>Otorgamiento</literalValue>
        <name>EyC - Cambio de etapa calif-otorg</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Cambio_de_etapa_cont_calif</fullName>
        <field>StageName</field>
        <literalValue>Calificación</literalValue>
        <name>EyC - Cambio de etapa cont-calif</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Cambio_en_el_nombre_de_la_op</fullName>
        <description>Cambio en el nombre de la oportunidad al formato YYYY MM DD {Nombre de la empresa} {Producto bancario}</description>
        <field>Name</field>
        <formula>TEXT(YEAR(TODAY()))&amp;&quot; &quot;&amp;IF(MONTH(TODAY())&lt;10,&quot;0&quot;&amp;TEXT(MONTH(TODAY())),TEXT(MONTH(TODAY())))&amp;&quot; &quot;&amp;TEXT(DAY(TODAY()))&amp;&quot; &quot;&amp;Account.Name&amp;&quot; &quot;&amp; 
IF(
TEXT( Productos_bancarios__c )=&quot;Cash management&quot;, &quot;Cash management&quot;,
IF(
TEXT( Productos_bancarios__c )=&quot;COMEX&quot;, &quot;COMEX&quot;,
IF(
TEXT( Productos_bancarios__c )=&quot;Crédito&quot;, &quot;Crédito&quot;,
IF(
TEXT( Productos_bancarios__c )=&quot;Cuenta corriente&quot;, &quot;Cuenta corriente&quot;,
IF(
TEXT( Productos_bancarios__c )=&quot;Cursar inversiones&quot;, &quot;Cursar inversiones&quot;,
IF(
TEXT( Productos_bancarios__c )=&quot;Factoring&quot;, &quot;Factoring&quot;,
IF(
TEXT( Productos_bancarios__c )=&quot;Leasing&quot;, &quot;Leasing&quot;,
IF(
TEXT( Productos_bancarios__c )=&quot;Mesa de dinero&quot;, &quot;Mesa de dinero&quot;,null))))))))</formula>
        <name>EyC - Cambio en el nombre de la op</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Formatea_nombre_oportunidad_cr_dit</fullName>
        <field>Name</field>
        <formula>TEXT(YEAR(TODAY()))&amp;&quot; &quot;&amp;TEXT(MONTH(TODAY()))&amp;&quot; &quot;&amp;TEXT(DAY(TODAY()))&amp;&quot; &quot;&amp;Account.Name&amp;&quot; &quot;&amp; &quot;Crédito&quot;</formula>
        <name>EyC - Formatea nombre oportunidad crédit</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Muestra_el_MAC_aprobado</fullName>
        <field>Monto_MAC_creado__c</field>
        <formula>IF(TEXT(Account.Monto_MAC_creado__c) &lt;&gt; &quot;&quot;, Account.Monto_MAC_creado__c,
	IF(TEXT(Account.Current_MAC_Credit_Limit__c) &lt;&gt; &quot;&quot;,Account.Current_MAC_Credit_Limit__c,
		0))</formula>
        <name>EyC - Muestra el MAC aprobado</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Opp_Fecha_asig_ej_especialista</fullName>
        <field>Fecha_asignaci_n_ejecutivo_especialista__c</field>
        <formula>TODAY()</formula>
        <name>EyC - Opp - Fecha asig. ej. especialista</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Opp_actualiza_Fecha_de_cierre</fullName>
        <field>Fecha_estimada_de_cierre__c</field>
        <formula>TODAY()</formula>
        <name>EyC - Opp - actualiza Fecha de cierre</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Opp_actualiza_campo_importe</fullName>
        <description>Copia y pega el monto a importe</description>
        <field>Amount</field>
        <formula>Monto__c</formula>
        <name>EyC - Opp - actualiza campo importe</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Opp_actualiza_etapa_opp</fullName>
        <field>StageName</field>
        <literalValue>Cerrada Ganada</literalValue>
        <name>EyC - Opp - actualiza etapa - ganada</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Opp_actualiza_etapa_perdida</fullName>
        <field>StageName</field>
        <literalValue>Cerrada Perdida</literalValue>
        <name>EyC - Opp - actualiza etapa - perdida</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Opp_actualiza_fecha</fullName>
        <field>Fecha_de_gesti_n_del_contrato__c</field>
        <formula>TODAY()</formula>
        <name>EyC - Opp - actualiza fecha</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Opp_actualiza_fecha_cierre_oppp</fullName>
        <description>Actualiza el campo personalizado Fecha de cierre al cambiar el valor</description>
        <field>Fecha_estimada_de_cierre__c</field>
        <formula>TODAY()</formula>
        <name>EyC - Opp - actualiza fecha cierre opp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Opp_actualiza_fecha_informe</fullName>
        <description>Entrega la fecha tentativa del informe del área riesgo</description>
        <field>Fecha_tentativa_entrea_informe_del__c</field>
        <formula>TODAY()+14</formula>
        <name>EyC - Opp - actualiza fecha informe</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Opp_actualiza_la_fecha_cierre_opp</fullName>
        <description>Actualiza la fecha de cierre cuando el cierre no es exitoso (se considera resultado cierre como exitoso o no exitoso)</description>
        <field>Fecha_estimada_de_cierre__c</field>
        <formula>TODAY()</formula>
        <name>EyC -Opp - actualiza la fecha cierre opp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Opp_fecha_de_gesti_n_contrato_le</fullName>
        <field>Fecha_de_gesti_n_del_contrato_leasing__c</field>
        <formula>TODAY()</formula>
        <name>EyC - Opp - fecha de gestión contrato le</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Opp_pasa_a_negociaci_n</fullName>
        <field>StageName</field>
        <literalValue>Negociación</literalValue>
        <name>EyC - Opp - pasa a negociación</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Opp_trae_producto_cr_dito</fullName>
        <field>Productos_bancarios__c</field>
        <literalValue>Crédito</literalValue>
        <name>EyC - Opp - trae producto crédito</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Opp_trae_producto_cta_cte</fullName>
        <field>Productos_bancarios__c</field>
        <literalValue>Cuenta corriente</literalValue>
        <name>EyC - Opp - trae producto cta cte</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EyC_Parte_siempre_en_pre_calificaci_n</fullName>
        <description>Siempre que se crea una nueva oportunidad para EyC, esta parte en Estudio</description>
        <field>StageName</field>
        <literalValue>Estudio</literalValue>
        <name>EyC - Parte siempre en estudio</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>INV_CrearKYC</fullName>
        <field>Subetapa__c</field>
        <literalValue>Crear KYC</literalValue>
        <name>INV_CreateKYC</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>INV_Enroll</fullName>
        <field>Subetapa__c</field>
        <literalValue>Enrolar</literalValue>
        <name>INV_Enroll</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>INV_PropuestaCreada</fullName>
        <field>Inv_PropuestaCreada__c</field>
        <literalValue>1</literalValue>
        <name>INV Propuesta Creada</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>INV_RequierePropuesta</fullName>
        <field>INV_ProposalRequired__c</field>
        <literalValue>1</literalValue>
        <name>INV_RequierePropuesta</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>InvBIA_VerificarClienteBanco</fullName>
        <field>Subetapa__c</field>
        <literalValue>Verificar cliente banco</literalValue>
        <name>InvBIA_VerificarClienteBanco</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Inv_AP_AprobacionCliente</fullName>
        <field>Subetapa__c</field>
        <literalValue>Aprobación cliente</literalValue>
        <name>Actualizar subetapa Aprobacion Cliente</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Inv_AP_CumpleRequisitos</fullName>
        <field>Cumple_requisitos__c</field>
        <literalValue>Sí</literalValue>
        <name>Inv_AP_CumpleRequisitos</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Inv_AP_FirmatFatca</fullName>
        <field>Inv_AP_Obtencion_firma_FATCA__c</field>
        <literalValue>1</literalValue>
        <name>Inv_AP_FirmatFatca</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Inv_AP_MarcaEnrolOK</fullName>
        <description>Sirve para bypasear en el proceso de enrolamiento</description>
        <field>Enrolamiento_Ok__c</field>
        <literalValue>1</literalValue>
        <name>Inv_AP_MarcaEnrolOK</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Inv_AP_MarcarObtenerDoc</fullName>
        <description>Marca obtener documentos requeridos</description>
        <field>Inv_AP_Obtener_documentos_requeridos__c</field>
        <literalValue>1</literalValue>
        <name>Inv_AP_MarcarObtenerDoc</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Inv_AP_NoCumpleRequisitos</fullName>
        <field>Cumple_requisitos__c</field>
        <literalValue>No</literalValue>
        <name>Inv_AP_NoCumpleRequisitos</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Inv_Estandar_NombreOportunidad</fullName>
        <description>Formatear nombre de la oportunidad cuando pase por proceso estandar</description>
        <field>Name</field>
        <formula>TEXT(YEAR(TODAY()))&amp;&quot; &quot;&amp;TEXT(MONTH(TODAY()))&amp;&quot; &quot;&amp;TEXT(DAY(TODAY()))&amp;&quot; &quot;&amp;Account.FirstName&amp;&quot; &quot;&amp;Account.LastName&amp;Account.Name</formula>
        <name>Inv_Estandar_NombreOportunidad</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Inv_GestionarPrendaGPI</fullName>
        <field>Subetapa__c</field>
        <literalValue>Gestionar prenda y GPI</literalValue>
        <name>Inv_GestionarPrendaGPI</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Inv_PresentarPropuesta</fullName>
        <field>Subetapa__c</field>
        <literalValue>Presentar propuesta</literalValue>
        <name>Inv_PresentarPropuesta</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Inv_Propu</fullName>
        <field>Inv_PropuestaCreada__c</field>
        <literalValue>1</literalValue>
        <name>Inv_PresentarPropuesta</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Inv_PropuestaEntregada</fullName>
        <field>INV_ProposalDelivered__c</field>
        <literalValue>1</literalValue>
        <name>Inv_PropuestaEntregada</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Inv_SubetapaCrearPropuesta</fullName>
        <field>Subetapa__c</field>
        <literalValue>Crear propuesta</literalValue>
        <name>Inv_SubetapaCrearPropuesta</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Inv_WelcomePackDisponible</fullName>
        <field>Subetapa__c</field>
        <literalValue>Welcome pack disponible</literalValue>
        <name>Inv_WelcomePackDisponible</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Inv_WelcomePackEntregado</fullName>
        <field>Subetapa__c</field>
        <literalValue>Welcome pack entregado</literalValue>
        <name>Inv_WelcomePackEntregado</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Inveriones_BIA_Comit_de_Cr_dito</fullName>
        <field>Subetapa__c</field>
        <literalValue>Comité de Crédito</literalValue>
        <name>Inveriones BIA -  Comité de Crédito</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Inversion_BIA_Inversion_realizada</fullName>
        <field>StageName</field>
        <literalValue>Cerrada Ganada</literalValue>
        <name>Inversion BIA - Inversión realizada</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Inversiones_Acepta_Propuesta</fullName>
        <field>StageName</field>
        <literalValue>Calificación</literalValue>
        <name>Inversiones Acepta Propuesta</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Inversiones_BIA</fullName>
        <field>Motivo_rechazo__c</field>
        <literalValue>Cliente no aceptó la propuesta</literalValue>
        <name>Inversiones BIA - Cliente no aceptó prop</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Inversiones_BIA_Acepta_Propuesta</fullName>
        <field>StageName</field>
        <literalValue>Calificación</literalValue>
        <name>Inversiones BIA - Acepta Propuesta</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Inversiones_BIA_Apertura_de_los_produc</fullName>
        <field>Subetapa__c</field>
        <literalValue>Apertura Productos</literalValue>
        <name>Inversiones BIA - Apertura de los produc</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Inversiones_BIA_Cliente_puede_invertir</fullName>
        <description>Subetapa &lt;Avisa que cliente puede invertir&gt;</description>
        <field>Subetapa__c</field>
        <literalValue>Gestionar inversion</literalValue>
        <name>Inversiones BIA - Cliente puede invertir</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Inversiones_BIA_Inversion_Ganada</fullName>
        <field>StageName</field>
        <literalValue>Cerrada Ganada</literalValue>
        <name>Inversiones BIA - Inversion Ganada</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Inversiones_Bia_Otorgamiento</fullName>
        <description>Si el campos &lt;Enrolamiento Ok&gt; y &lt;KYC Aprobado&gt; es a true, cambiar lo estado a Ortogamiento y Subetapa &lt;Avisa que cliente puede invertir&gt;</description>
        <field>StageName</field>
        <literalValue>Otorgamiento</literalValue>
        <name>Inversiones Bia -  Otorgamiento</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Inversiones_No_acepta_propuesta</fullName>
        <field>StageName</field>
        <literalValue>Cerrada Perdida</literalValue>
        <name>Inversiones -  No acepta propuesta</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>InvestmentMade</fullName>
        <description>Cambio de subetapa a &quot;Inversión Realizada&quot;</description>
        <field>Subetapa__c</field>
        <literalValue>Inversión realizada</literalValue>
        <name>InvestmentMade</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ManageLine</fullName>
        <field>Subetapa__c</field>
        <literalValue>Gestionar crédito</literalValue>
        <name>ManageLine</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Multiproducto_Actualiza_Etapa_WPE</fullName>
        <field>Subetapa__c</field>
        <literalValue>Welcome pack entregado</literalValue>
        <name>Multiproducto-Actualiza Etapa WPE</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SubStage_ManageInvestment</fullName>
        <field>Subetapa__c</field>
        <literalValue>Gestionar inversion</literalValue>
        <name>SubStage_ManageInvestment</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SubmittedProposal</fullName>
        <field>Subetapa__c</field>
        <literalValue>Propuesta presentada</literalValue>
        <name>Submitted Proposal</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Actualiza fecha envio comite</fullName>
        <actions>
            <name>Actualiza_Resultado_Comit</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Actualiza_fecha_envio_comite</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.EnviadoComite__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Multiproducto</value>
        </criteriaItems>
        <description>Cuando la casilla Enviado a Comité es True se actualiza la Fecha envío a comité, con la fecha actual para Multiproducto.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Aviso Oportunidad con subetapa Welcome pack entregado</fullName>
        <actions>
            <name>Aviso_Oportunidad_con_subetapa_Welcome_pack_entregado</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Subetapa__c</field>
            <operation>equals</operation>
            <value>Welcome pack entregado</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Multiproducto</value>
        </criteriaItems>
        <description>Multiproducto</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Aviso Oportunidad rechazada por comite</fullName>
        <actions>
            <name>Aviso_de_Oportunidad_rechazada_por_comite</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Cerrada Perdida</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Motivo_rechazo__c</field>
            <operation>equals</operation>
            <value>Rechazado en Comité</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Cambia Etapa a Cerrada Perdida</fullName>
        <actions>
            <name>Actualiza_Etapa_a_Cerrada_Perdida</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Motivo_rechazo__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Created_by_EyC_bank_account__c</field>
            <operation>notEqual</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>E%26C - Crea tarea automatica Acuerdo de oferta especial</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Acuerdo_de_oferta_especial__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <description>Cuando el campo de casilla &quot;Acuerdo de oferta especial&quot; se crea una tarea automatica</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Empresas y Corporaciones %E2%80%93 Actividades previas Comité de crédito</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Calificación</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.actividades_comite__c</field>
            <operation>equals</operation>
            <value>Falso</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Empresas y Corporaciones - Cliente Nuevo %E2%80%93 Actividades previas Comité de crédito</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Calificación</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.actividades_comite__c</field>
            <operation>equals</operation>
            <value>Falso</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Alerta_actividades_previas_Comit_de_cr_dito</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Opportunity.Fecha_vencimiento_Calificando__c</offsetFromField>
            <timeLength>-1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>EyC - Actualiza etapa a Ganada</fullName>
        <actions>
            <name>Aviso_Oportunidad_Cerrada_Ganada_Multiproducto</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Actualiza_etapa_a_Ganada</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Activacion_de_productos__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Empresas y Corporaciones</value>
        </criteriaItems>
        <description>Cuando Operaciones activa la casilla &quot;Activación de Productos&quot; la Oportunidad cambia de etapa a Cerrada Ganada. EyC</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Cambio de etapa calif-otorg</fullName>
        <actions>
            <name>EyC_Cambio_de_etapa_calif_otorg</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Fecha_envio_comite__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.FechaAsignacionComite__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Fecha_de_vencimiento__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Duracion_de_la_linea__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Empresas y Corporaciones</value>
        </criteriaItems>
        <description>Cambio de etapa desde Calificación a Otorgamiento</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Cambio de etapa cont-calif</fullName>
        <actions>
            <name>EyC_Cambio_de_etapa_cont_calif</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Empresas y Corporaciones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Contacto</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Acuerdo_de_oferta_especial__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Balance_and_Statement_of_Income__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <description>Cambio de etapa en Oportunidad desde Contacto a Calificación</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Cambio en el nombre de la oportunidad</fullName>
        <actions>
            <name>EyC_Cambio_en_el_nombre_de_la_op</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 OR 2 OR 3) AND 4 AND 5</booleanFilter>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Empresas y Corporaciones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Empresas y Corporaciones - cuenta corriente</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Banca Personas Productos Especialistas</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Productos_bancarios__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Cuando se crea una oportunidad, el nombre del registro el formato será YYYY MM DD {Nombre de la empresa} {Nombre del producto bancario}</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Cambio en el nombre de la oportunidad %28crédito%29</fullName>
        <actions>
            <name>EyC_Formatea_nombre_oportunidad_cr_dit</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2</booleanFilter>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Empresas y Corporaciones - crédito</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Cuando se crea una oportunidad, el nombre del registro el formato será YYYY MM DD {Nombre de la empresa} {Nombre del producto bancario}</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Flujo vencimiento línea</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Empresas y Corporaciones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Fecha_de_vencimiento__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Flujo que genere una tarea 60 días antes de la fecha de Vencimiento de la Línea.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Alerta_de_vencimiento_nea</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Opportunity.Fecha_de_vencimiento__c</offsetFromField>
            <timeLength>-60</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>EyC - Muestra el MAC aprobado</fullName>
        <actions>
            <name>EyC_Muestra_el_MAC_aprobado</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 OR 2</booleanFilter>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Empresas y Corporaciones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Banca Personas Productos Especialistas</value>
        </criteriaItems>
        <description>Cuando creo una nueva oportunidad para EyC muestro el MAC que ya fue creado.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Notifica ejecutivo Cash management</fullName>
        <actions>
            <name>Nueva_solicitud_de_ejecutivo_comercial_cm</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Empresas y Corporaciones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Productos_bancarios__c</field>
            <operation>equals</operation>
            <value>Cash management</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Ejecutivo_especialista_asignado__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Notifica ejecutivo Comex</fullName>
        <actions>
            <name>Nueva_solicitud_de_ejecutivo_comercial_comex</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Empresas y Corporaciones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Productos_bancarios__c</field>
            <operation>equals</operation>
            <value>COMEX</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Ejecutivo_especialista_asignado__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Notifica ejecutivo factoring</fullName>
        <actions>
            <name>Nueva_solicitud_de_ejecutivo_comercial_factoring</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Empresas y Corporaciones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Productos_bancarios__c</field>
            <operation>equals</operation>
            <value>Factoring</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Ejecutivo_especialista_asignado__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Notifica ejecutivo leasing</fullName>
        <actions>
            <name>Nueva_solicitud_de_ejecutivo_comercial_leasing</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Empresas y Corporaciones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Productos_bancarios__c</field>
            <operation>equals</operation>
            <value>Leasing</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Ejecutivo_especialista_asignado__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Notifica ejecutivo mesa de dinero</fullName>
        <actions>
            <name>Nueva_solicitud_de_ejecutivo_comercial_mesadinero</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Empresas y Corporaciones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Productos_bancarios__c</field>
            <operation>equals</operation>
            <value>Mesa de dinero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Ejecutivo_especialista_asignado__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Notifica ejecutivo seguros</fullName>
        <actions>
            <name>Nueva_solicitud_de_ejecutivo_comercial_seguros</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Empresas y Corporaciones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Productos_bancarios__c</field>
            <operation>equals</operation>
            <value>Mesa de dinero,Seguros</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Ejecutivo_especialista_asignado__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Opp - Cambia de estudio - negociación</fullName>
        <actions>
            <name>EyC_Opp_pasa_a_negociaci_n</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Cuando completa los campos clave de estudio, automáticamente pasa a negociación, quedando disponible para el ejecutivo que corresponda (comercial o especialista) y al tipo de producto (lista de productos bancarios, crédito o cta cte).</description>
        <formula>IF( 	AND( 		RecordType.Name = &quot;Empresas y Corporaciones&quot;, 		ISPICKVAL(L_nea_vigente__c, &quot;Sí&quot;), 		IF( 			AND(ISPICKVAL(Garant_as__c,&quot;Sí&quot;),Indicar_garant_as__c &lt;&gt; &quot;&quot;),TRUE,IF(AND(ISPICKVAL(Garant_as__c,&quot;No&quot;),Indicar_garant_as__c = &quot;&quot;),TRUE,FALSE) 			), 		Ejecutivo_especialista_asignado__c &lt;&gt; &quot;&quot; 	),TRUE, 	IF( 		AND( 			RecordType.Name = &quot;Empresas y Corporaciones - crédito&quot;,  			ISPICKVAL(L_nea_vigente__c, &quot;Sí&quot;), 			IF( 				AND(ISPICKVAL(Garant_as__c,&quot;Sí&quot;),Indicar_garant_as__c &lt;&gt; &quot;&quot;),TRUE,IF(AND(ISPICKVAL(Garant_as__c,&quot;No&quot;),Indicar_garant_as__c = &quot;&quot;),TRUE,FALSE) 			) 		), 	TRUE,IF( 			AND( 				RecordType.Name = &quot;Empresas y Corporaciones - cuenta corriente&quot;, 				Condiciones_del_negocio__c &lt;&gt; &quot;&quot;),TRUE,FALSE)))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Opp - Cambio de etapa cont-calif</fullName>
        <actions>
            <name>EyC_Cambio_de_etapa_cont_calif</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Empresas y Corporaciones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Contacto</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Monto__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Ejecutivo_especialista_asignado__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Cambio de etapa en Oportunidad desde Contacto a Calificación</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Opp - Copia monto en Importe</fullName>
        <actions>
            <name>EyC_Opp_actualiza_campo_importe</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 OR 2) AND 3</booleanFilter>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Empresas y Corporaciones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Empresas y Corporaciones - crédito</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Monto__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Copia y pega el monto de la opp de EyC en Importe, para que aparezca en &quot;Historial de aprobación&quot;</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Opp - Ejecutivo notifica subgcia EyC por líneas 300MM o 500MM</fullName>
        <actions>
            <name>XXSolicita_creaci_n_informe</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Empresas y Corporaciones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Confecci_n_informe_sub_gcia_riesgo__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Opp - Fecha asignación ejecutivo especialista</fullName>
        <actions>
            <name>EyC_Opp_Fecha_asig_ej_especialista</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Indica la fecha en que es asignado el ejecutivo especialista. Con esto puedo calcular si la fecha de cierre es mayor o igual a 7 días</description>
        <formula>IF(AND(RecordType.Name = &quot;Empresas y Corporaciones&quot;, ISCHANGED( Ejecutivo_especialista_asignado__c )),TRUE,FALSE)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Opp - Fecha tentativa entrega informe riesgo</fullName>
        <actions>
            <name>EyC_Opp_actualiza_fecha_informe</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 OR 2) AND 3</booleanFilter>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Empresas y Corporaciones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Empresas y Corporaciones - crédito</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Analista_de_riesgo_asignado__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Cuando las líneas son de 300MM o 500MM se debe gestionar un informe, este WF entrega la fecha tentativa</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Opp - Siempre inicia etapa en Estudio</fullName>
        <actions>
            <name>EyC_Parte_siempre_en_pre_calificaci_n</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 OR 2 OR 3</booleanFilter>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Empresas y Corporaciones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Empresas y Corporaciones - cuenta corriente</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Empresas y Corporaciones - crédito</value>
        </criteriaItems>
        <description>Siempre iniciará la etapa en Estudio cuando se cree una nueva etapa</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Opp - cierra oportunidad - cierre exitoso</fullName>
        <actions>
            <name>EyC_Opp_actualiza_Fecha_de_cierre</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>EyC_Opp_actualiza_etapa_opp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Cuando el cierre es exitoso, cierra como cerrada ganada, sino, como cerrada perdida.</description>
        <formula>IF( 	AND( 		OR( 			RecordType.Name = &quot;Empresas y Corporaciones&quot;,  			RecordType.Name = &quot;Empresas y Corporaciones - crédito&quot; 			), 		ISPICKVAL(Resultado_cierre__c,&quot;Exitoso&quot;) 		), 	TRUE, 	IF( 		AND( 			RecordType.Name = &quot;Empresas y Corporaciones - cuenta corriente&quot;, 			NOT(ISBLANK(Detecci_n_de_otras_oportunidades__c)) 			),TRUE,FALSE))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Opp - cierra oportunidad - cierre no exitoso</fullName>
        <actions>
            <name>EyC_Opp_actualiza_etapa_perdida</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>EyC_Opp_actualiza_la_fecha_cierre_opp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 OR 2) AND 3</booleanFilter>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Empresas y Corporaciones - crédito</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Empresas y Corporaciones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Resultado_cierre__c</field>
            <operation>equals</operation>
            <value>No exitoso</value>
        </criteriaItems>
        <description>Cuando el cierre es exitoso, cierra como cerrada ganada, sino, como cerrada perdida.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Opp - contrato leasing</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Empresas y Corporaciones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Gesti_n_del_contrato_leasing__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <timeLength>2</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>EyC - Opp - fecha de gestión contrato</fullName>
        <actions>
            <name>EyC_Opp_actualiza_fecha</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>IF(AND(RecordType.Name = &quot;Empresas y Corporaciones&quot;,ISCHANGED(Gesti_n_del_contrato__c)),TRUE,FALSE)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Opp - fecha de gestión contrato leasing</fullName>
        <actions>
            <name>EyC_Opp_fecha_de_gesti_n_contrato_le</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>IF(AND(RecordType.Name = &quot;Empresas y Corporaciones&quot;,ISCHANGED(Gesti_n_del_contrato_leasing__c)),TRUE,FALSE)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Opp - trae producto crédito</fullName>
        <actions>
            <name>EyC_Opp_trae_producto_cr_dito</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Empresas y Corporaciones - crédito</value>
        </criteriaItems>
        <description>En función del tipo de registro seleccionado, trae el producto previamente cargado (sólo para crédito o cta cte)</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Opp - trae producto según tipo de registro</fullName>
        <actions>
            <name>EyC_Opp_trae_producto_cta_cte</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Empresas y Corporaciones - cuenta corriente</value>
        </criteriaItems>
        <description>En función del tipo de registro seleccionado, trae el producto previamente cargado (sólo para crédito o cta cte)</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Siempre inicia etapa en Precalificación</fullName>
        <actions>
            <name>EyC_Parte_siempre_en_pre_calificaci_n</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Empresas y Corporaciones</value>
        </criteriaItems>
        <description>Siempre iniciará la etapa en Precalificación cuando se cree una nueva etapa</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>EyC - Welcome pack entregado</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Empresas y Corporaciones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Inv_Welcome_pack_entregado__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <description>Cuando el Welcome pack es entregado, debe crear una tarea asociada a la oportunidad.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EyC-Aviso y tarea Welcome pack listo</fullName>
        <actions>
            <name>Aviso_Welcome_pack_listo</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Welcome_pack_disponible</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Empresas y Corporaciones</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Inv_Welcome_pack_disponible__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <description>Cuando Operaciones marca la casilla Welcome pack disponible, se envia un aviso al Owner.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>INV_AprovalProcessEmpty</fullName>
        <actions>
            <name>SubmittedProposal</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Cuenta de Inversión</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.INV_ProposalDelivered__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Acepta_propuesta__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>INV_EnrollOk</fullName>
        <actions>
            <name>INV_CrearKYC</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND (3 OR 4)</booleanFilter>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Cuenta de Inversión</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Enrolamiento_Ok__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.KYC_Aprobado__c</field>
            <operation>equals</operation>
            <value>Falso</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.KYC_Ingresado__c</field>
            <operation>equals</operation>
            <value>Falso</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>INV_ProposalDelivered</fullName>
        <actions>
            <name>INV_Enroll</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Inversiones_Acepta_Propuesta</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Cuenta de Inversión</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.INV_ProposalDelivered__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Acepta_propuesta__c</field>
            <operation>equals</operation>
            <value>Si</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Enrolamiento_Ok__c</field>
            <operation>equals</operation>
            <value>Falso</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>INV_ProposalNotRequired</fullName>
        <actions>
            <name>INV_Enroll</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Inversiones_Acepta_Propuesta</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Cuenta de Inversión</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.INV_ProposalRequired__c</field>
            <operation>equals</operation>
            <value>Falso</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Enrolamiento_Ok__c</field>
            <operation>equals</operation>
            <value>Falso</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.INV_InvestmentType__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>INV_RequierePropuesta</fullName>
        <actions>
            <name>INV_RequierePropuesta</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Cuenta de Inversión</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Inv_Propuesta__c</field>
            <operation>equals</operation>
            <value>Requiere propuesta</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Acepta_propuesta__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inv_AP_CerradaPerdida</fullName>
        <actions>
            <name>Actualiza_Etapa_a_Cerrada_Perdida</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Altos Patrimonios</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Cumple_requisitos__c</field>
            <operation>equals</operation>
            <value>No</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inv_AP_ContactoCliente</fullName>
        <actions>
            <name>Contacto_cliente</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND (2 OR 3)</booleanFilter>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Altos Patrimonios</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Amount</field>
            <operation>lessThan</operation>
            <value>&quot;CLP 10,000,000&quot;</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Cumple_requisitos__c</field>
            <operation>equals</operation>
            <value>Sí</value>
        </criteriaItems>
        <description>El subgerente debe revisar oportunidad.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inv_AP_CumpleRequisitos</fullName>
        <actions>
            <name>Alerta_Ejecutivo_Inversiones</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Inv_AP_AprobacionCliente</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Altos Patrimonios</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Cumple_requisitos__c</field>
            <operation>equals</operation>
            <value>Sí</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Inv_AP_Obtener_documentos_requeridos__c</field>
            <operation>equals</operation>
            <value>Falso</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Inv_AP_Obtencion_firma_FATCA__c</field>
            <operation>equals</operation>
            <value>Falso</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Firma_ok__c</field>
            <operation>notEqual</operation>
            <value>Sí</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inv_AP_EnrolamientOK</fullName>
        <actions>
            <name>Inv_AP_EnrolamientoOK</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Altos Patrimonios</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Enrolamiento_Ok__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Inv_AP_Obtener_documentos_requeridos__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Inv_AP_Obtencion_firma_FATCA__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <description>Se avisa el subgerente que enrolamiento está OK.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inv_AP_FirmaContratosOK</fullName>
        <actions>
            <name>Inversiones_Bia_Otorgamiento</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>SubStage_ManageInvestment</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Altos Patrimonios</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Firma_ok__c</field>
            <operation>equals</operation>
            <value>Sí</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Inv_AP_Obtener_documentos_requeridos__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Inv_AP_Obtencion_firma_FATCA__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Enrolamiento_Ok__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <description>Pasa a etapa &quot;Otorgamiento&quot; luego de firmar contratos.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inv_AP_NoRequiereEnrolamiento</fullName>
        <actions>
            <name>Inv_AP_FirmatFatca</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Inv_AP_MarcaEnrolOK</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Inv_AP_MarcarObtenerDoc</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Altos Patrimonios</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Requiere_enrolamiento__c</field>
            <operation>equals</operation>
            <value>No</value>
        </criteriaItems>
        <description>Oportunidad no requiere enrolamiento</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inv_AP_PropuestaCreada</fullName>
        <actions>
            <name>Inv_AP_PropuestaCreada</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Altos Patrimonios</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Inv_PropuestaCreada__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inv_AP_PropuestaPendiente</fullName>
        <actions>
            <name>Inv_AP_OportunidadPendiente</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Actualiza_subetapa_Gesti_n_pendiente</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Altos Patrimonios</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Acepta_propuesta__c</field>
            <operation>equals</operation>
            <value>Pendiente</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inv_AP_RevisarSubgerente</fullName>
        <actions>
            <name>Inv_AP_AvisoSubgerente</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Altos Patrimonios</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Cumple_requisitos__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>El subgerente debe revisar oportunidad.</description>
        <triggerType>onCreateOnly</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Inv_AP_AvisoSubgerente</name>
                <type>Alert</type>
            </actions>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Inv_AP_ValidacionCliente</fullName>
        <actions>
            <name>Actualiza_a_subetapa_Validacion_cliente</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Inversiones_BIA_Acepta_Propuesta</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Altos Patrimonios</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Acepta_propuesta__c</field>
            <operation>equals</operation>
            <value>Si</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Requiere_enrolamiento__c</field>
            <operation>equals</operation>
            <value>Sí</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inv_AP_VisitaNOK</fullName>
        <actions>
            <name>Actualiza_Etapa_a_Cerrada_Perdida</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Altos Patrimonios</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Inv_AP_Visita_OK__c</field>
            <operation>equals</operation>
            <value>No</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inv_AP_VisitaOK</fullName>
        <actions>
            <name>Inv_SubetapaCrearPropuesta</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Altos Patrimonios</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Inv_AP_Visita_OK__c</field>
            <operation>equals</operation>
            <value>Sí</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inv_BIA_CrearPropuesta</fullName>
        <actions>
            <name>Inv_SubetapaCrearPropuesta</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>BIA</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Ejecutivo_Cuenta__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Ejecutivo_Inversiones__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Inv_PropuestaCreada__c</field>
            <operation>equals</operation>
            <value>Falso</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inv_BIA_PropuestaCreada</fullName>
        <actions>
            <name>Inv_BIA_PropuestaCreada</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Inv_PresentarPropuesta</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>BIA</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Inv_PropuestaCreada__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inv_BIA_VerificarClienteBanco</fullName>
        <actions>
            <name>InvBIA_VerificarClienteBanco</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>BIA</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Ejecutivo_Cuenta__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Ejecutivo_Inversiones__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Tipo_BIA__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inv_ConfirmaRecepcionForm</fullName>
        <actions>
            <name>Inv_ConfirmaRecepcionFormulario</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Otorgamiento</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>BIA</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Inv_Ingreso_de_activos_listo__c</field>
            <operation>equals</operation>
            <value>Confirma recepción formulario</value>
        </criteriaItems>
        <description>Operaciones confirma recepción de formulario de activos</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inv_ConfirmaRecepcionFormReparos</fullName>
        <actions>
            <name>Alerta_a_ejecutivo_inversiones_con_formulario_activos_con_reparos</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Otorgamiento</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>BIA</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Inv_Ingreso_de_activos_listo__c</field>
            <operation>equals</operation>
            <value>Reparos</value>
        </criteriaItems>
        <description>Operaciones confirma recepción de formulario de activos con reparos.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inv_Estandar - Cambio en el nombre de la oportunidad</fullName>
        <actions>
            <name>Inv_Estandar_NombreOportunidad</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Cuenta de Inversión</value>
        </criteriaItems>
        <description>Cuando se crea una oportunidad, tomará el nombre con el formato YYYY MM DD {Nombre de la empresa}</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Inv_GPIhabilitado</fullName>
        <actions>
            <name>Inversiones_BIA_Cliente_puede_invertir</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Otorgamiento</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>BIA</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Inv_GPI_habilitado__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <description>GPI habilitado</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inv_GestionarPrendaGPI</fullName>
        <actions>
            <name>Inv_GestionarPrendaGPI</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>BIA</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Inv_Linea_de_sobregiro_abierta__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inv_LineApproved</fullName>
        <actions>
            <name>Inversiones_Bia_Otorgamiento</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>SubStage_ManageInvestment</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Cuenta de Inversión</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.INV_InvestmentType__c</field>
            <operation>equals</operation>
            <value>Simultánea/Forward/Venta Corta</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Aprobado_Comite__c</field>
            <operation>equals</operation>
            <value>Sí</value>
        </criteriaItems>
        <description>Cuando se aprueba la linea de crédito, pasa a etapa &quot;Otorgamiento&quot; y subetapa &quot;Gestionar Inversión&quot;</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Inv_LineRequired</fullName>
        <actions>
            <name>Inversiones_Acepta_Propuesta</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>ManageLine</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Cuenta de Inversión</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.INV_InvestmentType__c</field>
            <operation>equals</operation>
            <value>Simultánea/Forward/Venta Corta</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.KYC_Aprobado__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Enrolamiento_Ok__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inv_NoLineRequired</fullName>
        <actions>
            <name>Inversiones_Bia_Otorgamiento</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>SubStage_ManageInvestment</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Cuenta de Inversión</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.INV_InvestmentType__c</field>
            <operation>equals</operation>
            <value>Simultánea/Forward/Venta Corta</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Inv_RequiresCreditManagement__c</field>
            <operation>equals</operation>
            <value>No</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Inv_Welcome pack entregada</fullName>
        <actions>
            <name>Actualiza_Subetapa_Aperturar_linea_BIA</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Otorgamiento</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>BIA</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Inv_Welcome_pack_entregado__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <description>Welcome pack entregado</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inversiones -  Envío a comité</fullName>
        <actions>
            <name>Actualiza_fecha_envio_comit</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>BIA</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.EnviadoComite__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inversiones - Calificación</fullName>
        <actions>
            <name>Presentacion_a_Comite_Riesgo_MAC</name>
            <type>Task</type>
        </actions>
        <actions>
            <name>Revisar_estado_da_aprobaci_n_de_Comit</name>
            <type>Task</type>
        </actions>
        <actions>
            <name>Subir_documentos_y_completar_RIB_y_MAC</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Calificación</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>BIA</value>
        </criteriaItems>
        <description>Presentación a Comité de Riesgo (MAC)</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inversiones - Etapa Inicial %28Contacto%29</fullName>
        <actions>
            <name>Actualizar_etapa_a_Contacto</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>BIA</value>
        </criteriaItems>
        <description>Cuando se cree oportunidad BIA, esta comience con estado &quot;Contacto&quot;</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Inversiones - Precalificación</fullName>
        <actions>
            <name>Solicitud_de_producto_BIA</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Precalificación</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>BIA</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inversiones - Producto BIA</fullName>
        <actions>
            <name>Actualiza_Tipo_Registro_BIA</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Marque_si_ser_producto_BIA__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <description>Los ejecutivos pueden ofrecer producto BIA.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inversiones BIA - Acepta Propuesta</fullName>
        <actions>
            <name>Inversiones_BIA_Acepta_Propuesta</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>SubmittedProposal</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>BIA</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Acepta_propuesta__c</field>
            <operation>equals</operation>
            <value>Si</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Contacto</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inversiones BIA - Inversion Realizada</fullName>
        <actions>
            <name>Inversiones_BIA_Inversion_Ganada</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Otorgamiento</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>BIA</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Subetapa__c</field>
            <operation>equals</operation>
            <value>Inversión realizada</value>
        </criteriaItems>
        <description>Inversion celebró</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inversiones BIA - No Acepta Propuesta</fullName>
        <actions>
            <name>Actualiza_Etapa_a_Cerrada_Perdida</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Inversiones_BIA</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>SubmittedProposal</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>BIA</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Acepta_propuesta__c</field>
            <operation>equals</operation>
            <value>No</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Contacto</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inversiones BIA - Welcome pack disponible</fullName>
        <actions>
            <name>Inv_Welcome_pack_disponible</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Inv_WelcomePackDisponible</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Otorgamiento</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>BIA</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Inv_Welcome_pack_disponible__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <description>Welcome pack disponible</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inversiones Cuenta -  Avisa que cliente puede invertir</fullName>
        <actions>
            <name>Inversiones_BIA_Cliente_puede_invertir</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Inversiones_Bia_Otorgamiento</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Enrolamiento_Ok__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.KYC_Aprobado__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Cuenta de Inversión</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.KYC_Ingresado__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.INV_InvestmentType__c</field>
            <operation>notEqual</operation>
            <value>Simultánea/Forward/Venta Corta</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inversiones Cuenta - Acepta propuesta</fullName>
        <actions>
            <name>Inversiones_Acepta_Propuesta</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Acepta_propuesta__c</field>
            <operation>equals</operation>
            <value>Si</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Cuenta de Inversión</value>
        </criteriaItems>
        <description>Si el campo &lt;Acepta Propuesta?&gt; es true, cambia el Estado de Calificación.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Inversiones Cuenta - Inversión realizada</fullName>
        <actions>
            <name>Inv_AP_InversionRealizada</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Inversion_BIA_Inversion_realizada</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>InvestmentMade</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND(2 OR 3)</booleanFilter>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Cuenta de Inversión,BIA,Altos Patrimonios</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.INV_InvestmentMade__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Cerrada Ganada</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inversiones Cuenta - NO Acepta propuesta</fullName>
        <actions>
            <name>Inversiones_BIA</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Inversiones_No_acepta_propuesta</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>SubmittedProposal</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Acepta_propuesta__c</field>
            <operation>equals</operation>
            <value>No</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Cuenta de Inversión,BIA,Altos Patrimonios</value>
        </criteriaItems>
        <description>Si el campo &lt;Acepta Propuesta?&gt; es false, cambia el Estado de Calificación.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Multiproducto-Actualiza Etapa a Otorgamiento</fullName>
        <actions>
            <name>Actualiza_Etapa_a_Otorgamiento</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Inversiones_BIA_Apertura_de_los_produc</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Resultado_Comite__c</field>
            <operation>equals</operation>
            <value>Aprobado</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Multiproducto,BIA,Multiproducto Ejecutivo de Cuenta</value>
        </criteriaItems>
        <description>Cambia Etapa a &quot;Otorgamiento&quot; y Subetapa a &quot;Apertura de productos&quot;, cuando el campo Resultado Comité es &quot;Aprobado&quot;.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Multiproducto-Actualiza etapa a Ganada</fullName>
        <actions>
            <name>Aviso_Oportunidad_Cerrada_Ganada_Multiproducto</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Actualiza_Subetapa_a_Productos_activados</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Actualiza_etapa_a_Ganada</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Activacion_de_productos__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Multiproducto,Multiproducto Ejecutivo de Cuenta</value>
        </criteriaItems>
        <description>Cuando Operaciones activa la casilla &quot;Activación de Productos&quot; la Oportunidad cambia de etapa a Cerrada Ganada. Multiproducto</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Multiproducto-Actualiza subetapa a WPE</fullName>
        <actions>
            <name>Multiproducto_Actualiza_Etapa_WPE</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Multiproducto,Multiproducto Ejecutivo de Cuenta</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Inv_Welcome_pack_entregado__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <description>Actualiza Subetapa a a Welcome pack entregado cuando la casilla Welcome pan entregado es verdadero</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Multiproducto-Aviso Welcome pack listo</fullName>
        <actions>
            <name>Aviso_Welcome_pack_listo</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Actualiza_Subetapa_a_Welcome_pack_dispon</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Multiproducto,Multiproducto Ejecutivo de Cuenta</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Inv_Welcome_pack_disponible__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <description>Cuando Operaciones marca la casilla Welcome pack disponible, se envia un aviso al Owner y la subetapa cambia a Welcome pack disponible.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Retail Banking -  Monoproducto -  Etapa 4%2C5</fullName>
        <actions>
            <name>Completar_el_formularios_de_producto</name>
            <type>Task</type>
        </actions>
        <actions>
            <name>Informar_al_cliente</name>
            <type>Task</type>
        </actions>
        <actions>
            <name>Nueva_Cursatura</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Monoproducto</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Otorgamiento</value>
        </criteriaItems>
        <description>W-000039</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Retail Banking - Calificación</fullName>
        <actions>
            <name>Crear_RIB_y_MAC</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Calificación</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Monoproducto,Multiproducto,Venta Corta</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.ProfileId</field>
            <operation>contains</operation>
            <value>Personas</value>
        </criteriaItems>
        <description>Tarea para el ejecutivo de cuenta para que cree RIB y MAC</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Retail Banking - Precalificación</fullName>
        <actions>
            <name>Comprobar_deuda_y_comportamiento_comercial</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Precalificación</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Monoproducto</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Retail Banking-Multiproducto-Crea tarea Comite Aprobado</fullName>
        <actions>
            <name>Avisar_a_cliente_resultado_de_Comit</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Multiproducto,Multiproducto Ejecutivo de Cuenta</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Resultado_Comite__c</field>
            <operation>equals</operation>
            <value>Aprobado</value>
        </criteriaItems>
        <description>Cuando el comité aprueba se crea la tarea para el propietario Avisar o cliente resultado de Comité</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Retail Banking-Multiproducto-Crea tarea etapa Calificación</fullName>
        <actions>
            <name>Enviar_documentos_a_Operaciones_para_crear_productos</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Multiproducto,Multiproducto Ejecutivo de Cuenta</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Calificación</value>
        </criteriaItems>
        <description>Crea tarea automática cuando la etapa de la oportunidad es &quot;Calificación&quot; y el tipo de registro es Multiproducto.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Retail Banking-Multiproducto-Crea tarea etapa Otorgamiento</fullName>
        <actions>
            <name>Confirmar_recepcion_de_Welcome_Pack_con_Cliente</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Multiproducto,Multiproducto Ejecutivo de Cuenta</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Otorgamiento</value>
        </criteriaItems>
        <description>Crea tarea automática cuando la etapa de la oportunidad es &quot;Otorgamiento&quot; y el tipo de registro es Multiproducto.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Segunda visita al Cliente %2806%2E1%29</fullName>
        <actions>
            <name>Registrar_Acuerdo_de_oferta_para_Empresa</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Acuerdo_de_oferta_especial__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.IsClosed</field>
            <operation>notEqual</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <description>W-000091 Empresas y Corporaciones - Proceso de Ventas - Cliente Nuevo – Segunda visita al Cliente (06.1) – Camino optativo (Oportunidad)</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>SubEtapa cambia a %22Comité de Crédito%22</fullName>
        <actions>
            <name>Actualizacion_de_Subetapa_Comite_de_cred</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.EnviadoComite__c</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <tasks>
        <fullName>Apertura_Cta_en_BPM</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Apertura Cta en BPM</subject>
    </tasks>
    <tasks>
        <fullName>Apertura_Linea_sobregiro</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Apertura Línea sobregiro</subject>
    </tasks>
    <tasks>
        <fullName>Avisar_a_cliente_resultado_de_Comit</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>3</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Avisar a cliente resultado de Comité</subject>
    </tasks>
    <tasks>
        <fullName>Completar_el_formularios_de_producto</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Low</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Completar el formularios de producto correspondiente</subject>
    </tasks>
    <tasks>
        <fullName>Comprobar_deuda_y_comportamiento_comercial</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Comprobar deuda y comportamiento comercial</subject>
    </tasks>
    <tasks>
        <fullName>Confirmar_recepcion_de_Welcome_Pack_con_Cliente</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Confirmar recepción de Welcome Pack con Cliente</subject>
    </tasks>
    <tasks>
        <fullName>Contactar_al_cliente_para_creaci_n_de_informe_para_Empresas_y_Corporaciones</fullName>
        <assignedToType>owner</assignedToType>
        <description>Se ha solicitado un informe de riesgo,  y se le ha asignado su creación. Para esto, debe contactar a la empresa.</description>
        <dueDateOffset>7</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Contactar al cliente para creación de informe para Empresas y Corporaciones</subject>
    </tasks>
    <tasks>
        <fullName>Crear_RIB_y_MAC</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Crear RIB y MAC</subject>
    </tasks>
    <tasks>
        <fullName>Entrega_de_contrato_y_TC_a_cliente</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Low</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Entrega de contrato y TC a cliente</subject>
    </tasks>
    <tasks>
        <fullName>Entregar_documentos_a_operaciones</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Low</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Entregar documentos a operaciones</subject>
    </tasks>
    <tasks>
        <fullName>Enviar_documentos_a_Operaciones_para_crear_productos</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>3</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Enviar documentos a Operaciones para crear productos</subject>
    </tasks>
    <tasks>
        <fullName>Habilitacion_GPI</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>2</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Habilitación GPI</subject>
    </tasks>
    <tasks>
        <fullName>Informar_al_cliente</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Low</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Informar al cliente cuando el producto ha sido adjudicado</subject>
    </tasks>
    <tasks>
        <fullName>Ingreso_de_activos_a_la_cuenta</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>5</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Ingreso de activos a la cuenta</subject>
    </tasks>
    <tasks>
        <fullName>Nueva_Cursatura</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Low</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Crear Nueva Cursatura</subject>
    </tasks>
    <tasks>
        <fullName>Nueva_solicitud_de_ejecutivo_comercial_cm</fullName>
        <assignedTo>ejescm@bice.cl</assignedTo>
        <assignedToType>user</assignedToType>
        <description>El ejecutivo comercial ha derivado un cliente a su área. Favor tomar contacto.</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Opportunity.CreatedDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Nueva solicitud de ejecutivo comercial</subject>
    </tasks>
    <tasks>
        <fullName>Nueva_solicitud_de_ejecutivo_comercial_comex</fullName>
        <assignedTo>ejesco@bice.prod</assignedTo>
        <assignedToType>user</assignedToType>
        <description>El ejecutivo comercial ha derivado un cliente a su área. Favor tomar contacto.</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Opportunity.CreatedDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Nueva solicitud de ejecutivo comercial</subject>
    </tasks>
    <tasks>
        <fullName>Nueva_solicitud_de_ejecutivo_comercial_factoring</fullName>
        <assignedTo>ejesfa@bice.cl</assignedTo>
        <assignedToType>user</assignedToType>
        <description>El ejecutivo comercial ha derivado un cliente a su área. Favor tomar contacto.</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Opportunity.CreatedDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Nueva solicitud de ejecutivo comercial</subject>
    </tasks>
    <tasks>
        <fullName>Nueva_solicitud_de_ejecutivo_comercial_leasing</fullName>
        <assignedTo>ejesle@bice.cl</assignedTo>
        <assignedToType>user</assignedToType>
        <description>El ejecutivo comercial ha derivado un cliente a su área. Favor tomar contacto.</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Opportunity.CreatedDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Nueva solicitud de ejecutivo comercial</subject>
    </tasks>
    <tasks>
        <fullName>Nueva_solicitud_de_ejecutivo_comercial_mesadinero</fullName>
        <assignedTo>ejesmd@bice.cl</assignedTo>
        <assignedToType>user</assignedToType>
        <description>El ejecutivo comercial ha derivado un cliente a su área. Favor tomar contacto.</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Opportunity.CreatedDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Nueva solicitud de ejecutivo comercial</subject>
    </tasks>
    <tasks>
        <fullName>Nueva_solicitud_de_ejecutivo_comercial_seguros</fullName>
        <assignedTo>ejesse@bice.cl</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Opportunity.CreatedDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Nueva solicitud de ejecutivo comercial</subject>
    </tasks>
    <tasks>
        <fullName>Presentacion_a_Comite_Riesgo_MAC</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>4</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Presentación a Comité de Riesgo (MAC)</subject>
    </tasks>
    <tasks>
        <fullName>Registrar_Acuerdo_de_oferta_para_Empresa</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Opportunity.CloseDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Registrar Acuerdo de oferta para Empresa</subject>
    </tasks>
    <tasks>
        <fullName>Revisar_estado_da_aprobaci_n_de_Comit</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>3</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Revisar estado da aprobación de Comité</subject>
    </tasks>
    <tasks>
        <fullName>Solicitud_de_producto_BIA</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Solicitud de producto BIA</subject>
    </tasks>
    <tasks>
        <fullName>Subir_documentos_y_completar_RIB_y_MAC</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>3</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Subir documentos y completar RIB y MAC</subject>
    </tasks>
    <tasks>
        <fullName>Welcome_Pack</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>7</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Welcome Pack</subject>
    </tasks>
    <tasks>
        <fullName>Welcome_pack_disponible</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Welcome pack disponible</subject>
    </tasks>
    <tasks>
        <fullName>XXSolicita_creaci_n_informe</fullName>
        <assignedTo>sg1cb@bice.cl</assignedTo>
        <assignedToType>user</assignedToType>
        <description>El ejecutivo comercial solicita creación de informe dado que el monto es mayor o igual a $500MM grupales o mayor o igual a$300MM para clientes nuevos. Favor revise.</description>
        <dueDateOffset>7</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Solicita creación informe</subject>
    </tasks>
</Workflow>
