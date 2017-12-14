/*
Este archivo se ha generado y no es el código fuente actual para esta
clase global gestionada.
Este archivo de solo lectura muestra los métodos, las variables, las propiedades
y los constructores globales de la clase.
Para permitir al código compilar, todos los métodos devuelven nulo.
*/
global class CalculateSnapshotDifferences {
    global CalculateSnapshotDifferences() {

    }
    @InvocableMethod(label='Calculate Snapshot Differences' description='Sends request to given Copado webhookUrl')
    global static void execute(List<copado.CalculateSnapshotDifferences.InvocableVariables> variables) {

    }
global class InvocableVariables {
    @InvocableVariable(label='Deploy' required=true)
    global Boolean deploy;
    @InvocableVariable(label='Snapshot differences Id' required=true)
    global Id snapshotDiffId;
    global InvocableVariables() {

    }
}
}
