<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>enviar_correo</fullName>
        <description>enviar correo</description>
        <protected>false</protected>
        <recipients>
            <field>Email</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/enviar_notificacion_al_usuario_por_crear_evento</template>
    </alerts>
    <rules>
        <fullName>enviar correo al crear nuevo evento en cuenta</fullName>
        <actions>
            <name>enviar_correo</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Event.Subject</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
