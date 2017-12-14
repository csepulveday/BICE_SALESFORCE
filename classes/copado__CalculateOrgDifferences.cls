/*
Este archivo se ha generado y no es el código fuente actual para esta
clase global gestionada.
Este archivo de solo lectura muestra los métodos, las variables, las propiedades
y los constructores globales de la clase.
Para permitir al código compilar, todos los métodos devuelven nulo.
*/
global class CalculateOrgDifferences {
    global CalculateOrgDifferences() {

    }
    @InvocableMethod(label='Calculate Org Differences' description='Sends request to given Copado webhookUrl')
    global static void execute(List<copado.CalculateOrgDifferences.InvocableVariables> variables) {

    }
global class InvocableVariables {
    @InvocableVariable(label='Deploy differences' required=true)
    global Boolean deploy;
    @InvocableVariable(label='Org Difference Id' required=true)
    global Id orgDiffId;
    global InvocableVariables() {

    }
}
}
