/*
Este archivo se ha generado y no es el código fuente actual para esta
clase global gestionada.
Este archivo de solo lectura muestra los métodos, las variables, las propiedades
y los constructores globales de la clase.
Para permitir al código compilar, todos los métodos devuelven nulo.
*/
@RestResource(urlMapping='/CreateWork/*')
global class ADM_WorkCreatorRestService {
    global ADM_WorkCreatorRestService() {

    }
    @HttpPost
    global static agf.ADM_WorkCreatorRestService.Result createWork(String subject, String ptag, String team, String type, String finBuild, String priority, String description, String details, String image) {
        return null;
    }
global class Result {
    global Result() {

    }
    global List<String> getErrorMessages() {
        return null;
    }
    global void setId(String id) {

    }
}
}
