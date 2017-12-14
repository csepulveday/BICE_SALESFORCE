<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Notifica_que_Lead_creado_no_ha_sido_contactado_en_5_d_as</fullName>
        <description>Notifica que Lead creado no ha sido contactado en 5 días</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Lead_no_contactado_en_5_d_as</template>
    </alerts>
    <fieldUpdates>
        <fullName>Actualiza_telefono_contacto</fullName>
        <field>Phone</field>
        <formula>Phone_contact__c</formula>
        <name>Actualiza teléfono contacto</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Copia_Fecha_de_Nacimiento_en_Birthdate</fullName>
        <field>Birthdate</field>
        <formula>Fecha_de_Nacimiento__c</formula>
        <name>Copia Fecha de Nacimiento en Birthdate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Formatea_RUT_Contact</fullName>
        <field>Contact_RUT__c</field>
        <formula>RUT_formato_AUX__c</formula>
        <name>Formatea RUT Contact</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <outboundMessages>
        <fullName>Contacto_CIF</fullName>
        <apiVersion>39.0</apiVersion>
        <endpointUrl>http://www.google.cl/Contactos</endpointUrl>
        <fields>AccountId</fields>
        <fields>Account_CIF_ID__c</fields>
        <fields>Account_RUT__c</fields>
        <fields>Apellido_materno__c</fields>
        <fields>Cargo__c</fields>
        <fields>Email</fields>
        <fields>Fax</fields>
        <fields>FirstName</fields>
        <fields>Id</fields>
        <fields>LastName</fields>
        <fields>MobilePhone</fields>
        <fields>OwnerId</fields>
        <fields>Phone</fields>
        <fields>Tipo_de_Contacto__c</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>sbravo@nectia.com.bice</integrationUser>
        <name>Contacto CIF</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>Actualiza teléfono de contacto</fullName>
        <actions>
            <name>Actualiza_telefono_contacto</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Phone_contact__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Fecha de Nacimiento en Birthdate</fullName>
        <actions>
            <name>Copia_Fecha_de_Nacimiento_en_Birthdate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Fecha_de_Nacimiento__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Formatea RUT in Contact</fullName>
        <actions>
            <name>Formatea_RUT_Contact</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>IF( AND(Contact_RUT__c &lt;&gt; RUT_formato_AUX__c,  NOT( ISNULL(Contact_RUT__c) ) ),true,false )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
