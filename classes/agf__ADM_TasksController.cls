/*
Este archivo se ha generado y no es el código fuente actual para esta
clase global gestionada.
Este archivo de solo lectura muestra los métodos, las variables, las propiedades
y los constructores globales de la clase.
Para permitir al código compilar, todos los métodos devuelven nulo.
*/
global class ADM_TasksController {
    global ADM_TasksController() {

    }
    @RemoteAction
    global static Boolean changeTaskStatusTo(Id taskId, String statusValue) {
        return null;
    }
    @RemoteAction
    global static Boolean changeTaskStatusToCompleted(Id taskId) {
        return null;
    }
    @RemoteAction
    global static Boolean changeTaskStatusToInProgress(Id taskId) {
        return null;
    }
    @RemoteAction
    global static Boolean changeTaskStatusToPlanned(Id taskId) {
        return null;
    }
    @RemoteAction
    global static Boolean deleteTask(Id taskId) {
        return null;
    }
    @AuraEnabled
    global static Boolean deleteTaskAura(Id recordId) {
        return null;
    }
    @RemoteAction
    global static agf__ADM_Deleted_Task__c getDeletedTaskById(String logId) {
        return null;
    }
    @RemoteAction
    global static agf__ADM_Task__c getTaskById(String taskId) {
        return null;
    }
    @RemoteAction
    global static agf.ADM_TasksController.TaskOrderResponse getTaskOrder(String workId) {
        return null;
    }
    @RemoteAction
    global static agf.ADM_TasksController.ADM_VirtualWallWork getWorkById(String workId) {
        return null;
    }
    @RemoteAction
    global static agf.ADM_TasksController.SaveResponse saveTask(agf__ADM_Task__c task, Datetime lastModifiedDate) {
        return null;
    }
    @RemoteAction
    global static agf.ADM_TasksController.ADM_VirtualWallWork updateTaskOrder(agf.ADM_TasksController.TaskOrderChangeRequest request) {
        return null;
    }
global class ADM_VirtualWallWork {
}
global virtual class SaveResponse {
    global SaveResponse(Id id, User assignee, Datetime lastModifiedDate) {

    }
}
global class TaskOrderChangeRequest {
    global TaskOrderChangeRequest() {

    }
}
global class TaskOrderResponse {
}
global virtual class TaskSaveResponse extends agf.ADM_TasksController.SaveResponse {
}
}
