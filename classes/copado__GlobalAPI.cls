/*
Este archivo se ha generado y no es el código fuente actual para esta
clase global gestionada.
Este archivo de solo lectura muestra los métodos, las variables, las propiedades
y los constructores globales de la clase.
Para permitir al código compilar, todos los métodos devuelven nulo.
*/
global class GlobalAPI {
    global GlobalAPI() {

    }
    global Boolean deleteCopadoLicense(Id userId) {
        return null;
    }
    global copado.GlobalAPI.CopadoLicenses getLicenseInformation() {
        return null;
    }
    global List<copado.GlobalAPI.UserLicense> listCopadoLicenses() {
        return null;
    }
    global String upsertCopadoLicense(Id userId, copado.GlobalAPI.UserLicense licenseDetails) {
        return null;
    }
global class CopadoAPIException extends Exception {
}
global class CopadoLicenses {
    global Integer availableCADLicenses {
        get;
        set;
    }
    global Integer availableCCHLicenses {
        get;
        set;
    }
    global Integer availableCCMLicenses {
        get;
        set;
    }
    global Integer availableCopadoLicenses {
        get;
        set;
    }
    global Integer availableCSTLicenses {
        get;
        set;
    }
    global Integer totalNumberOfCADLicenses {
        get;
        set;
    }
    global Integer totalNumberOfCCHLicenses {
        get;
        set;
    }
    global Integer totalNumberOfCCMLicenses {
        get;
        set;
    }
    global Integer totalNumberOfCopadoLicenses {
        get;
        set;
    }
    global Integer totalNumberOfCSTLicenses {
        get;
        set;
    }
    global Integer usedCADLicenses {
        get;
        set;
    }
    global Integer usedCCHLicenses {
        get;
        set;
    }
    global Integer usedCCMLicenses {
        get;
        set;
    }
    global Integer usedCopadoLicenses {
        get;
        set;
    }
    global Integer usedCSTLicenses {
        get;
        set;
    }
    global CopadoLicenses() {

    }
}
global class UserLicense {
    global Boolean isCADenabled {
        get;
        set;
    }
    global Boolean isCCHenabled {
        get;
        set;
    }
    global Boolean isCCMenabled {
        get;
        set;
    }
    global Boolean isCopadoEnabled {
        get;
        set;
    }
    global Boolean isCSTenabled {
        get;
        set;
    }
    global Id userId {
        get;
        set;
    }
    global UserLicense(Id userId, Boolean isCADenabled, Boolean isCCHenabled, Boolean isCCMenabled, Boolean isCopadoEnabled, Boolean isCSTenabled) {

    }
}
}
