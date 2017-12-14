<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Cambia_TR_Cliente_Empresa_en_CIF</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Cuenta_Empresa_en_CIF</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Cambia TR Cliente Empresa en CIF</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Cambia_TR_Cliente_Persona_en_CIF</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Cuentas_personales_en_CIF</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Cambia TR Cliente Persona en CIF</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Formatea_RUT_Account</fullName>
        <description>elimina puntos y si existe k la sustituye por K</description>
        <field>RUT__c</field>
        <formula>Rut_formato_AUX__c</formula>
        <name>Formatea RUT Account</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>copia_Fecha_de_Nacimiento_en_BirthDate</fullName>
        <field>PersonBirthdate</field>
        <formula>Fecha_de_Nacimiento__pc</formula>
        <name>copia Fecha de Nacimiento en BirthDate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <outboundMessages>
        <fullName>Cuenta_Persona_y_Empresa</fullName>
        <apiVersion>39.0</apiVersion>
        <endpointUrl>http://www.google.cl/CuentaPersona_Empresa</endpointUrl>
        <fields>Apellido_materno__pc</fields>
        <fields>CIF_Id__c</fields>
        <fields>Calle_comercial__c</fields>
        <fields>Calle_particular__c</fields>
        <fields>Estado_civil__pc</fields>
        <fields>Fax</fields>
        <fields>FirstName</fields>
        <fields>Id</fields>
        <fields>LastName</fields>
        <fields>Name</fields>
        <fields>Numero_comercial__c</fields>
        <fields>Numero_particular__c</fields>
        <fields>OwnerId</fields>
        <fields>Pais_comercial__c</fields>
        <fields>Pais_particular__c</fields>
        <fields>ParentId</fields>
        <fields>PersonBirthdate</fields>
        <fields>PersonEmail</fields>
        <fields>PersonMobilePhone</fields>
        <fields>Phone</fields>
        <fields>RUT__c</fields>
        <fields>Raz_n_Social__c</fields>
        <fields>RecordTypeId</fields>
        <fields>Website</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>sbravo@nectia.com.bice</integrationUser>
        <name>Cuenta Persona y Empresa CIF</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>Cambia tipo Registro de Cliente Empresa en CIF</fullName>
        <actions>
            <name>Cambia_TR_Cliente_Empresa_en_CIF</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.CIF_Id__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>Cuenta Empresa</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.CIF_Id__c</field>
            <operation>notEqual</operation>
            <value>-1</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Cambia tipo Registro de Cliente Persona en CIF</fullName>
        <actions>
            <name>Cambia_TR_Cliente_Persona_en_CIF</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.CIF_Id__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>Cuentas personales</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.CIF_Id__c</field>
            <operation>notEqual</operation>
            <value>-1</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Fecha de Nacimiento en Birthdate</fullName>
        <actions>
            <name>copia_Fecha_de_Nacimiento_en_BirthDate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Fecha_de_Nacimiento__pc</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Formatea RUT en Account</fullName>
        <actions>
            <name>Formatea_RUT_Account</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>IF( RUT__c &lt;&gt;  Rut_formato_AUX__c,true,false )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>HouseHold Cread</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Account.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.IsPersonAccount</field>
            <operation>equals</operation>
            <value>Verdadero</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
