public class BICE_Account_SebraInt_Controller{
    
    private static Endpoint_Setting__mdt xEx = [SELECT Id, Endpoint__c, Namespace__c FROM Endpoint_Setting__mdt WHERE MasterLabel = 'INT10LINV'];
    public String URLFPersonales;
    public Account acc;
    //public Account cuentaActual;
    public RecordType rt;
    public ClienteSebra cs;
    public Account auxCliente;
    public ClienteSebra auxLlenaDatos;
    public personaRelacionada auxPR;
    public personaRelacionada RepreLegal;
    public telefono objTelefono;
    public List<Comuna__c> c;
    public List<CuentaBancaria> ListaCB;
    public String CifId;
    public String Mensaje;
    public CamposCIF campCif;
    
    public String lid {get;set;}
    public String msg {get;set;}
    public String urlToRedirect {get;set;}

    public BICE_Account_SebraInt_Controller(ApexPages.StandardController controller){       
        //this.cuentaActual = (Account)controller.getRecord();
        //ClienteSF();
        acc = new Account();
        cs = new ClienteSebra();
        auxPR = new personaRelacionada();
        RepreLegal = new personaRelacionada();
        campCif = new CamposCIF();
    }        

    public BICE_Account_SebraInt_Controller(){
        acc = new Account();
        cs = new ClienteSebra();
        auxPR = new personaRelacionada();
        RepreLegal = new personaRelacionada();
        campCif = new CamposCIF();
        
    }
        
    public class ClienteSebra{
        public String indicadorCif;
        public String indicadorSebra;
        public String indicadorMagic;
        public String tipoDocumento;
        public String rut;
        public String cuenta;
        //public String tipoDeCuenta;
        public String Estado = '07';
        public String Nacionalidad;
        public String codigoAgente;
        public String naturalidad;
        public String tipCli;
        public String nombreFantasia;
        public String razonSocial;
        public String giro;
        public String apellidoPaterno;
        public String apellidoMaterno;
        public String nombres;
        public String fechaNacimiento;
        public String segmentoCliente;
        public String sexo;
        public String estadoCivil;
        public String regimenConyugal;
        public String Profesion;
        public String cargo;
        public String empleador;
        public List<direccion> direcciones;
        public List<email> emails;
        public List<personaRelacionada> personasRelacionada;
        public String plantillaCobro;
        public String plantillaProducto;
        public String modeloFacturacion;
        public String tipoOrden;
        public String relaCorrCirc1064;
        public String perfilComercial;
        public String idSituacionLaboral;
    }
    

    public class direccion{
        public String ciudad;
        public String complemento;
        public String comuna;
        public String direccion;
        public String envioCorreo;
        public String numero;
        public String pais;
        public String region;
        public String tipo;
        public String tipoCalle;
        
    }

    public class telefono{
        public String codigo;
        public String numero;
        public String observaciones;
        public String paisNumer;
        public String tipoTelefono;
        public List<telefono> telefonos;
    }

    public class email{
        public String correoPrincipal;
        public String email;
        public String tipo;
        public String factElectronica;
    }

    public class CuentaBancaria{
        public String banco;
        public String numero;
        public String moneda;
        public String sucursal;
        public String tipoCuenta;
        public String cuentaPrincipal;
    }

    public class personaRelacionada{
        public String actividad;
        public String apellidoMaterno;
        public String apellidoMaternoConyuge;
        public String apellidoPaterno;
        public String apellidoPaternoConyuge;
        public String cargo;
        public String codSuc;
        public String comuna;
        public String comunaConyuge;
        public String direccion;
        public String direccionConyuge;
        public String direccionNumero;
        public String direccionNumeroConyuge;
        public String email;
        public String emailConyuge;
        public String estadoCivil;
        public String fecha;
        public String fechaNacimiento;
        public String fin;
        public String giroEmpleador;
        public String giroSociedad;
        public String glei;
        public String inicio;
        public String nacionalidad;
        public String nacionalidadConyuge;
        public String naturalidad;
        public String nombreFantasia;
        public String nombreFantasiaEmpleador;
        public String nombres;
        public String nombresConyuge;
        public String paisResidencia;
        public String participaSociedad;
        public String porcentajePartiSociedad;
        public String razonSocial;
        public String razonSocialEmpleador;
        public String razonSocialSociedad;
        public String regimenConyugal;
        public String relacionCorrArt100;
        public String relacionCorrArt100Conyuge;
        public String rut;
        public String rutConyuge;
        public String rutEmpleador;
        public String rutSociedad;
        public String sexo;
        public String situacionLaboral;
        public String telefono;
        public String telefonoConyuge;
        public String tieneConyuge;
        public String tipo;
        public String tipoRelacionConyuge;
        public String tipoRelacionCorrNCG380;
        public String tipoRelacionCorrNCG380Conyuge;
        
    }
    
    public class CamposCIF{
        public String numRolEmpleado;
        public String codCliente;
        public String codSector;
        public String codSucursal;
        public String flagEmpleado;
        public String ejecutivoComex;
        public String codigoCanal;
        public String glosaAplicacion;
        public String codOperador;
    }
     
    public Boolean ClienteSF(Account acc, BICE_Solicitud_Cliente__c sc){
        
        if(acc != null){
            auxCliente = acc;
            rt = [SELECT Id,Name 
                  FROM RecordType 
                  WHERE Id =: acc.RecordTypeId
                  LIMIT 1]; 
        }
        System.debug('RT: '+acc.RecordTypeId);
        try{
            return SEBRACalloutResult(sc);
        }catch(Exception ex){
            return null; 
        }
    }
     
    /*public Account ClienteSF(){
       
        acc = [SELECT 
                    Id,
                    Rut__c,
                    N_de_cuenta__c,
                    Nationality__c,
                    Name,
                    Giro_Inv__r.Name,
                    Raz_n_Social__c,
                    Actividad_Economica_SBIF__c,
                    LastName,
                    Apellido_materno__pc,
                    FirstName,
                    PersonBirthdate,
                    Sex__pc,
                    Estado_civil__pc,
                    Conjugal_Regime__pc,
                    Profession__pc,
                    PersonTitle,
                    Employer__pc,
                    Calle_comercial__c,
                    Comuna_comercial__r.Name,
                    Ciudad_o_Provincia_comercial__c,
                    Numero_comercial__c,
                    Pais_comercial__c,
                    Region_comercial__c,
                    Office_Number__c,
                    Ciudad_o_Provincia_particular__c,
                    Region_particular__c,
                    Pais_particular__c,
                    Calle_particular__c,
                    Numero_particular__c,
                    Apartment__c,
                    Comuna_particular__r.Name,
                    Particular_Landline__pc,
                    Particular_Phone_Other__pc,
                    PersonEmail,
                    Commercial_Email__pc,
                    Phone,
                    PersonHomePhone,
                    Commercial_Cellphone__c,
                    Commercial_Phone_Other__c,
                    Phone_contact__pc,
                    RecordTypeId,
                    Spouse_RUT__pc,
                    Spouse_First_Name__pc,
                    Spouse_Mothers_Last_Name__pc,
                    Spouse_Fathers_Last_Name__pc,
                    Calle_particular_de_Conyuge__pc,
                    Ciudad_particular_de_Conyuge__pc,
                    Comuna_de_Direccion_Conyuge__pc,
                    Comuna_de_Direccion_Conyuge__pr.Name,
                    DeptoCasaSector_particular_de_Conyuge__pc,
                    Numero_de_calle_particular_de_Conyuge__pc,
                    Region_particular_de_Conyuge__pc,
                    Relacion_de_Conyuge_con_BI_CDB__pc,
                    nombres__c,
                    tipo__c,
                    apellidoMaterno__c,
                    apellidoPaterno__c,
                    naturalidad__c,
                    rut_inv__c,
                    Rep_Legal_email__c,
                    Ejecutivo_de_Inversiones__r.Profile.Name,
                    Ejecutivo_de_Inversiones__c,
                    Ejecutivo_de_Inversiones__r.ROL_Number__c,
                    Calle_particular_Inv__c,
                    Numero_calle_particular_Inv__c,
                    Info_adicional_Inv_Depto__c,
                    Comuna_particular_Inv__r.Name,
                    Ciudad_o_Provincia_particular_Inv__c,
                    Region_particular_Inv__c,
                    Pais_particular_Inv__c,
                    Calle_comercial_Inv__c,
                    Numero_calle_comercial_Inv__c,
                    Info_adicional_Inv_Oficina__c,
                    Comuna_comercial_Inv__r.Name,
                    Ciudad_o_Provincia_comercial_Inv__c,
                    Region_comercial_Inv__c,
                    Pais_comercial_Inv__c,
                    Telefono_fijo_particular_Inv__pc,
                    Telefono_fijo_comercial_Inv__c,
                    Celular_Particular_Inv__pc,
                    Celular_comercial_Inv__c,
                    Otro_telefono_particular_Inv__pc,
                    Otro_telefono_comercial_Inv__c,
                    Email_comercial_Inv__pc,
                    Email_personal_Inv__pc,
                    Email_Rep_Legal_Inv__c,
                    Customer_type_other_rating_c__c,
                    SBIF_Sector__c

            FROM Account 
            WHERE Id =: ApexPages.currentPage().getParameters().get('id')]; //'0012C00000EEoh5'
          rt = [SELECT Id,Name 
                FROM RecordType 
                WHERE Id =: acc.RecordTypeId //'0122C000000L8HR'
                LIMIT 1];     
        if(acc != null)    
            auxCliente = acc;    
        System.debug('ID: '+ApexPages.currentPage().getParameters().get('id'));
        System.debug('RT: '+acc.RecordTypeId);
                         
        return acc;
    }*/
    
    public PageReference SEBRACallout(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        PageReference nextPage;
        request.setEndpoint(xEx.Endpoint__c);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/xml;charset=UTF-8');
        request.setBody(xmlRequest());
        request.setTimeout(120000);
        if(!Test.isRunningTest()){
                HttpResponse response = http.send(request);
                
                System.debug('Request: '+request.getBody());
                if (response.getStatusCode() == 200) {
                    System.debug('Respuesta: '+response.getBody());
                    System.debug('Estatus: ' +
                    response.getStatusCode() + ' ' + response.getStatus());
                    if(ObtenerResultado(response) == '000'){
                        ActualizarFechaSebra();
                    }else{
                        System.debug(response.getBody());
                    }
                }
            }
        nextPage = new PageReference('/' + ApexPages.currentPage().getParameters().get('id'));
        return nextPage;
    }
    
    public Boolean SEBRACalloutResult(BICE_Solicitud_Cliente__c sc){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        PageReference nextPage;
        request.setEndpoint(xEx.Endpoint__c);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/xml;charset=UTF-8');
        request.setBody(xmlRequest());
        request.setTimeout(120000);
        HttpResponse response = http.send(request);
        
        System.debug('Request: '+request.getBody());
        if (response.getStatusCode() == 200) {
            System.debug('Respuesta: '+response.getBody());
            System.debug('Estatus: ' +
            response.getStatusCode() + ' ' + response.getStatus());
            if(ObtenerResultado(response) == '000'){
                ActualizarFechaSebra();
                ActualizaSolicitudCliente(sc);
                
                return true;
            }else{
                //Si en sebra existe el registro, se actualiza la fecha
                if(Mensaje.contains('existen')){
                    ActualizarFechaSebra();
                    ActualizaSolicitudCliente(sc);
                    return false;
                //si hay cualquier otro error, se vuelve a iniciar el proceso de aprobación
                }else{
                    System.debug('Iniciando nuevamente proceso de aprobación');
                    ID ejec = auxCliente.Ejecutivo_de_Inversiones__c;
                    //BICE_Solicitud_Cliente__c sc = [SELECT Id FROM BICE_Solicitud_Cliente__c WHERE Cliente__c =: auxCliente.Id ORDER BY LastModifiedDate ASC LIMIT 1];
                    Approval.ProcessSubmitRequest req1 = new Approval.ProcessSubmitRequest();
                    req1.setComments('Reenvío automático de aprobación.');
                    req1.setObjectId(sc.Id);
                    req1.setSubmitterId(ejec);
                    req1.setProcessDefinitionNameOrId('Solicita_creacion_cliente_inversiones_v5');
                    req1.setSkipEntryCriteria(true);
                    System.debug('Procesando aprobación: ');
                    System.debug(req1);
                    Approval.ProcessResult result = Approval.process(req1);
                    System.debug('Status: '+result.getInstanceStatus());
                    return false;
                }
                return false;
            }
        }
        sc = [SELECT Id, Sebra_Ok__c FROM BICE_Solicitud_Cliente__c WHERE Cliente__c =: auxCliente.Id ORDER BY LastModifiedDate ASC LIMIT 1];
        system.debug('ASI QUEDA: '+sc);
        return false;
    }    
    
    public String xmlRequest(){
        cs = new ClienteSebra();
        String RequestBody = '';
        if(String.isBlank(RequestBody)){
            LlenadoDatos();
            RequestBody = RequestBody + '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cre="http://www.example.org/CrearClienteBice/">';
            RequestBody = RequestBody + '<soapenv:Header/>';
            RequestBody = RequestBody + '<soapenv:Body>';
            RequestBody = RequestBody +      '<cre:CrearCleinteBice>';
            RequestBody = RequestBody +         '<cre:indicadorCif>'+auxLlenaDatos.indicadorCif+'</cre:indicadorCif>';
            RequestBody = RequestBody +         '<cre:indicadorSebra>'+auxLlenaDatos.indicadorSebra+'</cre:indicadorSebra>';
            RequestBody = RequestBody +         '<cre:indicadorMagic>'+auxLlenaDatos.indicadorMagic+'</cre:indicadorMagic>';
            RequestBody = RequestBody +         '<cre:Cif> </cre:Cif>';
            RequestBody = RequestBody +         '<cre:Sebra>';
            RequestBody = RequestBody +            '<cre:wsCreacionClientes>';              
            RequestBody = RequestBody +               '<cre:tipoDocumento>'+auxLlenaDatos.tipoDocumento+'</cre:tipoDocumento>';               
            RequestBody = RequestBody +               '<cre:rut>'+auxLlenaDatos.rut+'</cre:rut>';
            if(auxLlenaDatos.cuenta != null)
                RequestBody = RequestBody +               '<cre:cuenta>'+auxLlenaDatos.cuenta+'</cre:cuenta>';
            //RequestBody = RequestBody +               '<cre:tipoDeCuenta> </cre:tipoDeCuenta>';
            RequestBody = RequestBody +               '<cre:estado>'+auxLlenaDatos.estado+'</cre:estado>';
            if(auxLlenaDatos.razonSocial == null){
                RequestBody = RequestBody +               '<cre:nacionalidad>'+auxLlenaDatos.Nacionalidad+'</cre:nacionalidad>';
            
            }
            //RequestBody = RequestBody +               '<cre:codigoAgente> </cre:codigoAgente>';
            RequestBody = RequestBody +               '<cre:naturalidad>'+auxLlenaDatos.naturalidad+'</cre:naturalidad>';
            RequestBody = RequestBody +               '<cre:tipCli>'+auxLlenaDatos.tipCli+'</cre:tipCli>';
            if(auxLlenaDatos.razonSocial != null){
            RequestBody = RequestBody +               '<cre:perfilComercial>'+auxLlenaDatos.perfilComercial+'</cre:perfilComercial>';  
            RequestBody = RequestBody +               '<cre:nombreFantasia>'+auxLlenaDatos.nombreFantasia+'</cre:nombreFantasia>';
            RequestBody = RequestBody +               '<cre:razonSocial>'+auxLlenaDatos.razonSocial+'</cre:razonSocial>';
            RequestBody = RequestBody +               '<cre:giro>'+auxLlenaDatos.giro+'</cre:giro>';
            }
            if(auxLlenaDatos.razonSocial == null)
                RequestBody = RequestBody +               '<cre:perfilComercial>'+auxLlenaDatos.perfilComercial+'</cre:perfilComercial>'; 
            if(auxLlenaDatos.razonSocial != null){
                RequestBody = RequestBody +               '<cre:apellidoPaterno>'+auxLlenaDatos.razonSocial+'</cre:apellidoPaterno>';
                RequestBody = RequestBody +               '<cre:apellidoMaterno>'+auxLlenaDatos.razonSocial+'</cre:apellidoMaterno>';             
            }    
            if(auxLlenaDatos.razonSocial == null){
                RequestBody = RequestBody +               '<cre:apellidoPaterno>'+auxLlenaDatos.apellidoPaterno+'</cre:apellidoPaterno>';
                RequestBody = RequestBody +               '<cre:apellidoMaterno>'+auxLlenaDatos.apellidoMaterno+'</cre:apellidoMaterno>';
                RequestBody = RequestBody +               '<cre:nombres>'+auxLlenaDatos.nombres+'</cre:nombres>';
                RequestBody = RequestBody +               '<cre:fechaNacimiento>'+auxLlenaDatos.fechaNacimiento+'</cre:fechaNacimiento>';
                //RequestBody = RequestBody +               '<cre:segmentoCliente> </cre:segmentoCliente>';
                if(auxLlenaDatos.sexo != null)
                    RequestBody = RequestBody +               '<cre:sexo>'+auxLlenaDatos.sexo+'</cre:sexo>';
                RequestBody = RequestBody +               '<cre:estadoCivil>'+auxLlenaDatos.estadoCivil+'</cre:estadoCivil>';
                RequestBody = RequestBody +               '<cre:regimenConyugal>'+auxLlenaDatos.regimenConyugal+'</cre:regimenConyugal>';
                RequestBody = RequestBody +               '<cre:profesion>'+auxLlenaDatos.Profesion+'</cre:profesion>';
                if(auxLlenaDatos.cargo != null)    
                    RequestBody = RequestBody +               '<cre:cargo>'+auxLlenaDatos.cargo+'</cre:cargo>';
                RequestBody = RequestBody +               '<cre:empleador>'+auxLlenaDatos.empleador+'</cre:empleador>';
            }
            RequestBody = RequestBody +               '<!--Zero or more repetitions:-->';
            if(auxLlenaDatos.direcciones.size() > 0){
                for(direccion dire : auxLlenaDatos.direcciones){
                    RequestBody = RequestBody +               '<cre:direccion>';
                    RequestBody = RequestBody +                  '<cre:ciudad>'+dire.ciudad+'</cre:ciudad>';
                    RequestBody = RequestBody +                  '<cre:complemento>'+dire.complemento+'</cre:complemento>';
                    RequestBody = RequestBody +                  '<cre:comuna>'+dire.comuna+'</cre:comuna>';
                    RequestBody = RequestBody +                  '<cre:direccion>'+dire.direccion+'</cre:direccion>';
                    //RequestBody = RequestBody +                  '<cre:envioCorreo/>';
                    RequestBody = RequestBody +                  '<cre:numero>'+dire.Numero+'</cre:numero>';
                    RequestBody = RequestBody +                  '<cre:pais>'+dire.pais+'</cre:pais>';
                    RequestBody = RequestBody +                  '<cre:region>'+dire.region+'</cre:region>';
                    RequestBody = RequestBody +                  '<cre:tipo>'+dire.tipo+'</cre:tipo>';                   
                    //RequestBody = RequestBody +                  '<cre:tipoCalle/>';
                    RequestBody = RequestBody +               '</cre:direccion>';
                    RequestBody = RequestBody +               '<!--Zero or more repetitions:-->';
                    
                }
            }
            
            if( objTelefono.TELEFONOS.size() > 0){
                for(telefono tel : objTelefono.TELEFONOS){
                            RequestBody = RequestBody +               '<cre:telefono>';
                            RequestBody = RequestBody +                  '<cre:codigo>'+tel.codigo+'</cre:codigo>';
                            RequestBody = RequestBody +                  '<cre:numero>'+tel.numero+'</cre:numero>';
                            RequestBody = RequestBody +                  '<cre:observaciones/>';
                            RequestBody = RequestBody +                  '<cre:paisNumero/>';
                            RequestBody = RequestBody +                  '<cre:tipoTelefono>'+tel.tipoTelefono+'</cre:tipoTelefono>';
                            RequestBody = RequestBody +               '</cre:telefono>';
                        }
            }
            if(auxLlenaDatos.emails.size() > 0){
                for(email ema : auxLlenaDatos.emails){
                    RequestBody = RequestBody +               '<cre:email>';
                    RequestBody = RequestBody +                  '<cre:correoPrincipal />';
                    RequestBody = RequestBody +                  '<cre:email>'+ema.email+'</cre:email>';
                    RequestBody = RequestBody +                  '<cre:factElectronica />';
                    RequestBody = RequestBody +                  '<cre:tipo>'+ema.tipo+'</cre:tipo>';
                    RequestBody = RequestBody +               '</cre:email>';
                }
            }
            RequestBody = RequestBody +               '<!--Zero or more repetitions:-->';           
            
            if(ListaCB.size() > 0){ //Cuenta bancaria
                for(cuentaBancaria cbi : ListaCB){
                    RequestBody = RequestBody +               '<cre:cuentaBancaria>';
                    RequestBody = RequestBody +                  '<cre:banco>'+cbi.Banco+'</cre:banco>';
                    RequestBody = RequestBody +                  '<cre:cuentaPrincipal>'+cbi.cuentaPrincipal+'</cre:cuentaPrincipal>';
                    RequestBody = RequestBody +                  '<cre:moneda>'+cbi.moneda+'</cre:moneda>';
                    RequestBody = RequestBody +                  '<cre:numero>'+cbi.numero+'</cre:numero>';
                    RequestBody = RequestBody +                  '<cre:sucursal>'+cbi.sucursal+'</cre:sucursal>';
                    RequestBody = RequestBody +                  '<cre:tipoCuenta>'+cbi.tipoCuenta+'</cre:tipoCuenta>';
                    RequestBody = RequestBody +               '</cre:cuentaBancaria>';

                }
            }
            
            if(auxPR.rut != null){ //Conyuge
                RequestBody = RequestBody +               '<cre:personaRelasionada>';
                RequestBody = RequestBody +                  '<cre:actividad></cre:actividad>';
                RequestBody = RequestBody +                  '<cre:apellidoMaterno>'+auxPR.apellidoMaterno+'</cre:apellidoMaterno>';
                RequestBody = RequestBody +                  '<cre:apellidoMaternoConyuge> </cre:apellidoMaternoConyuge>';
                RequestBody = RequestBody +                  '<cre:apellidoPaterno>'+auxPR.apellidoPaterno+'</cre:apellidoPaterno>';
                RequestBody = RequestBody +                  '<cre:apellidoPaternoConyuge> </cre:apellidoPaternoConyuge>';
                RequestBody = RequestBody +                  '<cre:cargo> </cre:cargo>';
                RequestBody = RequestBody +                  '<cre:codSuc> </cre:codSuc>';
                RequestBody = RequestBody +                  '<cre:comuna>'+auxPR.comuna+'</cre:comuna>';
                RequestBody = RequestBody +                  '<cre:comunaConyuge> </cre:comunaConyuge>';
                RequestBody = RequestBody +                  '<cre:direccion>'+auxPR.direccion+'</cre:direccion>';
                RequestBody = RequestBody +                  '<cre:direccionConyuge> </cre:direccionConyuge>';
                RequestBody = RequestBody +                  '<cre:direccionNumero>'+auxPR.direccionNumero+'</cre:direccionNumero>';
                RequestBody = RequestBody +                  '<cre:direccionNumeroConyuge> </cre:direccionNumeroConyuge>';
                RequestBody = RequestBody +                  '<cre:email></cre:email>';
                RequestBody = RequestBody +                  '<cre:emailConyuge> </cre:emailConyuge>';
                RequestBody = RequestBody +                  '<cre:estadoCivil> </cre:estadoCivil>';
                RequestBody = RequestBody +                  '<cre:fecha>'+auxPR.fecha+'</cre:fecha>';
                RequestBody = RequestBody +                  '<cre:fechaNacimiento> </cre:fechaNacimiento>';
                RequestBody = RequestBody +                  '<cre:fin>'+auxPR.fin+'</cre:fin>';
                RequestBody = RequestBody +                  '<cre:giroEmpleador> </cre:giroEmpleador>';
                RequestBody = RequestBody +                  '<cre:giroSociedad> </cre:giroSociedad>';
                RequestBody = RequestBody +                  '<cre:glei> </cre:glei>';
                RequestBody = RequestBody +                  '<cre:inicio>'+auxPR.inicio+'</cre:inicio>';
                RequestBody = RequestBody +                  '<cre:idTipoRelacion>'+auxPR.tipo+'</cre:idTipoRelacion>';   
                RequestBody = RequestBody +                  '<cre:nacionalidad> </cre:nacionalidad>';
                RequestBody = RequestBody +                  '<cre:nacionalidadConyuge> </cre:nacionalidadConyuge>';
                RequestBody = RequestBody +                  '<cre:naturalidad>'+auxPR.naturalidad+'</cre:naturalidad>';
                RequestBody = RequestBody +                  '<cre:nombreFantasia> </cre:nombreFantasia>';
                RequestBody = RequestBody +                  '<cre:nombreFantasiaEmpleador> </cre:nombreFantasiaEmpleador>';
                RequestBody = RequestBody +                  '<cre:nombres>'+auxPR.nombres+'</cre:nombres>';
                RequestBody = RequestBody +                  '<cre:nombresConyuge> </cre:nombresConyuge>';
                RequestBody = RequestBody +                  '<cre:paisResidencia> </cre:paisResidencia>';
                RequestBody = RequestBody +                  '<cre:participaSociedad> </cre:participaSociedad>';
                RequestBody = RequestBody +                  '<cre:porcentajePartiSociedad> </cre:porcentajePartiSociedad>';
                RequestBody = RequestBody +                  '<cre:razonSocial> </cre:razonSocial>';
                RequestBody = RequestBody +                  '<cre:razonSocialEmpleador> </cre:razonSocialEmpleador>';
                RequestBody = RequestBody +                  '<cre:razonSocialSociedad> </cre:razonSocialSociedad>';
                RequestBody = RequestBody +                  '<cre:regimenConyugal> </cre:regimenConyugal>';
                RequestBody = RequestBody +                  '<cre:relacionCorrArt100> </cre:relacionCorrArt100>';
                RequestBody = RequestBody +                  '<cre:relacionCorrArt100Conyuge> </cre:relacionCorrArt100Conyuge>';
                RequestBody = RequestBody +                  '<cre:rut>'+auxPR.rut+'</cre:rut>';
                RequestBody = RequestBody +                  '<cre:rutConyuge> </cre:rutConyuge>';
                RequestBody = RequestBody +                  '<cre:rutEmpleador> </cre:rutEmpleador>';
                RequestBody = RequestBody +                  '<cre:rutSociedad> </cre:rutSociedad>';
                RequestBody = RequestBody +                  '<cre:sexo> </cre:sexo>';
                RequestBody = RequestBody +                  '<cre:situacionLaboral> </cre:situacionLaboral>';
                RequestBody = RequestBody +                  '<cre:telefono> </cre:telefono>';
                RequestBody = RequestBody +                  '<cre:telefonoConyuge> </cre:telefonoConyuge>';
                RequestBody = RequestBody +                  '<cre:tieneConyuge> </cre:tieneConyuge>';
                RequestBody = RequestBody +                  '<cre:tipo>'+auxPR.tipo+'</cre:tipo>';
                RequestBody = RequestBody +                  '<cre:tipoRelacionConyuge> </cre:tipoRelacionConyuge>';
                RequestBody = RequestBody +                  '<cre:tipoRelacionCorrNCG380> </cre:tipoRelacionCorrNCG380>';
                RequestBody = RequestBody +                  '<cre:tipoRelacionCorrNCG380Conyuge> </cre:tipoRelacionCorrNCG380Conyuge>';
                RequestBody = RequestBody +               '</cre:personaRelasionada>';
            }
            if(RepreLegal.rut != null){ //Representante legal empresa
                RequestBody = RequestBody +               '<cre:personaRelasionada>';
                RequestBody = RequestBody +                  '<cre:actividad> </cre:actividad>';
                RequestBody = RequestBody +                  '<cre:apellidoMaterno>'+RepreLegal.apellidoMaterno+'</cre:apellidoMaterno>';
                RequestBody = RequestBody +                  '<cre:apellidoMaternoConyuge> </cre:apellidoMaternoConyuge>';
                RequestBody = RequestBody +                  '<cre:apellidoPaterno>'+RepreLegal.apellidoPaterno+' </cre:apellidoPaterno>';
                RequestBody = RequestBody +                  '<cre:apellidoPaternoConyuge> </cre:apellidoPaternoConyuge>';
                RequestBody = RequestBody +                  '<cre:cargo> </cre:cargo>';
                RequestBody = RequestBody +                  '<cre:codSuc> </cre:codSuc>';
                RequestBody = RequestBody +                  '<cre:comuna>'+RepreLegal.comuna +'</cre:comuna>';
                RequestBody = RequestBody +                  '<cre:comunaConyuge> </cre:comunaConyuge>';
                RequestBody = RequestBody +                  '<cre:direccion>'+RepreLegal.direccion+'</cre:direccion>';
                RequestBody = RequestBody +                  '<cre:direccionConyuge> </cre:direccionConyuge>';
                RequestBody = RequestBody +                  '<cre:direccionNumero>'+RepreLegal.direccionNumero+'</cre:direccionNumero>';
                RequestBody = RequestBody +                  '<cre:direccionNumeroConyuge> </cre:direccionNumeroConyuge>';
                RequestBody = RequestBody +                  '<cre:email>';
                //RequestBody = RequestBody +                       '<cre:email>'+'JOAQUINPRIETO@gmail.com'+'</cre:email>';
                //RequestBody = RequestBody +                       '<cre:tipo>'+'TDIREEPART'+'</cre:tipo>';
                RequestBody = RequestBody +                  '</cre:email>';
                RequestBody = RequestBody +                  '<cre:emailConyuge> </cre:emailConyuge>';
                RequestBody = RequestBody +                  '<cre:estadoCivil> </cre:estadoCivil>';
                RequestBody = RequestBody +                  '<cre:fecha> '+auxPR.fecha+'</cre:fecha>';
                RequestBody = RequestBody +                  '<cre:fechaNacimiento> </cre:fechaNacimiento>';
                RequestBody = RequestBody +                  '<cre:fin>'+auxPR.fin+'</cre:fin>';
                RequestBody = RequestBody +                  '<cre:giroEmpleador> </cre:giroEmpleador>';
                RequestBody = RequestBody +                  '<cre:giroSociedad> </cre:giroSociedad>';
                RequestBody = RequestBody +                  '<cre:glei> </cre:glei>';
                RequestBody = RequestBody +                  '<cre:inicio>'+auxPR.inicio+'</cre:inicio>';
                RequestBody = RequestBody +                  '<cre:idTipoRelacion>'+RepreLegal.tipo+'</cre:idTipoRelacion>';   
                RequestBody = RequestBody +                  '<cre:nacionalidad> </cre:nacionalidad>';
                RequestBody = RequestBody +                  '<cre:nacionalidadConyuge> </cre:nacionalidadConyuge>';
                RequestBody = RequestBody +                  '<cre:naturalidad>'+RepreLegal.naturalidad+'</cre:naturalidad>';
                RequestBody = RequestBody +                  '<cre:nombreFantasia> </cre:nombreFantasia>';
                RequestBody = RequestBody +                  '<cre:nombreFantasiaEmpleador> </cre:nombreFantasiaEmpleador>';
                RequestBody = RequestBody +                  '<cre:nombres>'+RepreLegal.nombres+'</cre:nombres>';
                RequestBody = RequestBody +                  '<cre:nombresConyuge> </cre:nombresConyuge>';
                RequestBody = RequestBody +                  '<cre:paisResidencia>'+RepreLegal.paisResidencia+'</cre:paisResidencia>';
                RequestBody = RequestBody +                  '<cre:participaSociedad></cre:participaSociedad>';
                RequestBody = RequestBody +                  '<cre:porcentajePartiSociedad> </cre:porcentajePartiSociedad>';
                RequestBody = RequestBody +                  '<cre:razonSocial> </cre:razonSocial>';
                RequestBody = RequestBody +                  '<cre:razonSocialEmpleador> </cre:razonSocialEmpleador>';
                RequestBody = RequestBody +                  '<cre:razonSocialSociedad> </cre:razonSocialSociedad>';
                RequestBody = RequestBody +                  '<cre:regimenConyugal> </cre:regimenConyugal>';
                RequestBody = RequestBody +                  '<cre:relacionCorrArt100> </cre:relacionCorrArt100>';
                RequestBody = RequestBody +                  '<cre:relacionCorrArt100Conyuge> </cre:relacionCorrArt100Conyuge>';
                RequestBody = RequestBody +                  '<cre:rut>'+RepreLegal.rut+'</cre:rut>';
                RequestBody = RequestBody +                  '<cre:rutConyuge> </cre:rutConyuge>';
                RequestBody = RequestBody +                  '<cre:rutEmpleador> </cre:rutEmpleador>';
                RequestBody = RequestBody +                  '<cre:rutSociedad> </cre:rutSociedad>';
                RequestBody = RequestBody +                  '<cre:sexo> </cre:sexo>';
                RequestBody = RequestBody +                  '<cre:situacionLaboral> </cre:situacionLaboral>';
                RequestBody = RequestBody +                  '<cre:telefono> </cre:telefono>';
                RequestBody = RequestBody +                  '<cre:telefonoConyuge> </cre:telefonoConyuge>';
                RequestBody = RequestBody +                  '<cre:tieneConyuge> </cre:tieneConyuge>';
                RequestBody = RequestBody +                  '<cre:tipo>'+RepreLegal.tipo+'</cre:tipo>';
                RequestBody = RequestBody +                  '<cre:tipoRelacionConyuge> </cre:tipoRelacionConyuge>';
                RequestBody = RequestBody +                  '<cre:tipoRelacionCorrNCG380> </cre:tipoRelacionCorrNCG380>';
                RequestBody = RequestBody +                  '<cre:tipoRelacionCorrNCG380Conyuge> </cre:tipoRelacionCorrNCG380Conyuge>';
                RequestBody = RequestBody +               '</cre:personaRelasionada>';
            }
            if(auxLlenaDatos.IdSituacionLaboral != null)
                RequestBody = RequestBody +               '<cre:idSituacionLaboral>'+auxLlenaDatos.IdSituacionLaboral+'</cre:idSituacionLaboral>';
            /*campos requeridos por cif 26/10/2017*/
               RequestBody = RequestBody + '<cre:numRolEmpleado>'+campCIF.numRolEmpleado+'</cre:numRolEmpleado>';
               RequestBody = RequestBody + '<cre:codCliente>'+campCIF.codCliente+'</cre:codCliente>';
               RequestBody = RequestBody + '<cre:codSector>'+campCIF.codSector+'</cre:codSector>';
               RequestBody = RequestBody + '<cre:codSucursal>'+campCIF.codSucursal+'</cre:codSucursal>';
               RequestBody = RequestBody + '<cre:flagEmpleado>'+campCIF.flagEmpleado+'</cre:flagEmpleado>';
               RequestBody = RequestBody + '<cre:ejecutivoComex>'+campCIF.ejecutivoComex+'</cre:ejecutivoComex>';
               RequestBody = RequestBody + '<cre:codigoCanal>'+campCIF.codigoCanal+'</cre:codigoCanal>';
               RequestBody = RequestBody + '<cre:glosaAplicacion>'+campCIF.glosaAplicacion+'</cre:glosaAplicacion>';
               RequestBody = RequestBody + '<cre:codOperador>'+campCIF.codOperador+'</cre:codOperador>';
            /*----------------------------*/
            /*RequestBody = RequestBody +               '<cre:plantillaCobro>'+auxLlenaDatos.plantillaCobro+'</cre:plantillaCobro>';
            RequestBody = RequestBody +               '<cre:plantillaProducto>'+auxLlenaDatos.plantillaProducto+'</cre:plantillaProducto>';
            RequestBody = RequestBody +               '<cre:modeloFacturacion>'+auxLlenaDatos.modeloFacturacion+'</cre:modeloFacturacion>';
            RequestBody = RequestBody +               '<cre:tipoOrden>'+auxLlenaDatos.tipoOrden+'</cre:tipoOrden>';
            RequestBody = RequestBody +               '<cre:relaCorrCirc1064>'+auxLlenaDatos.relaCorrCirc1064+'</cre:relaCorrCirc1064>';
            RequestBody = RequestBody +               '<cre:ordenRecibir> </cre:ordenRecibir>';
            RequestBody = RequestBody +               '<cre:periocidadCartolas> </cre:periocidadCartolas>';
            RequestBody = RequestBody +               '<cre:estadoCliente> </cre:estadoCliente>';
            RequestBody = RequestBody +               '<cre:estadoCuenta> </cre:estadoCuenta>';
            RequestBody = RequestBody +               '<cre:codCorredora> </cre:codCorredora>';
            RequestBody = RequestBody +               '<cre:ingresosMoneda> </cre:ingresosMoneda>';
            RequestBody = RequestBody +               '<cre:ingresosMonto> </cre:ingresosMonto>';
            RequestBody = RequestBody +               '<cre:ingresosAnio> </cre:ingresosAnio>';
            RequestBody = RequestBody +               '<cre:perPolitExp> </cre:perPolitExp>';
            RequestBody = RequestBody +               '<cre:cliAutoEnrol> </cre:cliAutoEnrol>';
            RequestBody = RequestBody +               '<cre:generateAutoPassword> </cre:generateAutoPassword>';
            RequestBody = RequestBody +               '<cre:usuarioHabilitado> </cre:usuarioHabilitado>';
            RequestBody = RequestBody +               '<cre:enviaMailPassword> </cre:enviaMailPassword>';
            RequestBody = RequestBody +               '<cre:perfilComercial> </cre:perfilComercial>';
            RequestBody = RequestBody +               '<cre:factElectronica> </cre:factElectronica>';
            RequestBody = RequestBody +               '<cre:paisResidencia> </cre:paisResidencia>';
            RequestBody = RequestBody +               '<cre:relaCorrNCG380> </cre:relaCorrNCG380>';
            RequestBody = RequestBody +               '<cre:participacionSociedad> </cre:participacionSociedad>';
            RequestBody = RequestBody +               '<cre:rutSociedad> </cre:rutSociedad>';
            RequestBody = RequestBody +               '<cre:razonSocialSociedad> </cre:razonSocialSociedad>';
            RequestBody = RequestBody +               '<cre:giroSociedad> </cre:giroSociedad>';
            RequestBody = RequestBody +               '<cre:porcParticipacionSociedad> </cre:porcParticipacionSociedad>';
            RequestBody = RequestBody +               '<cre:rutEmpleador> </cre:rutEmpleador>';
            RequestBody = RequestBody +               '<cre:nomFantasiaEmpleador> </cre:nomFantasiaEmpleador>';
            RequestBody = RequestBody +               '<cre:giroEmpleador> </cre:giroEmpleador>';
            RequestBody = RequestBody +               '<cre:glei> </cre:glei>';
            RequestBody = RequestBody +               '<cre:clasificacionCliente> </cre:clasificacionCliente>';
            RequestBody = RequestBody +               '<cre:relaCorrArt100> </cre:relaCorrArt100>';
            RequestBody = RequestBody +               '<cre:suscepConflicInt> </cre:suscepConflicInt>';
            RequestBody = RequestBody +               '<cre:manejaInfoPriv> </cre:manejaInfoPriv>';
            RequestBody = RequestBody +               '<cre:cargoInfoPriv> </cre:cargoInfoPriv>';
            RequestBody = RequestBody +               '<cre:cargoCirc1064> </cre:cargoCirc1064>';
            RequestBody = RequestBody +               '<cre:relacionSII> </cre:relacionSII>';
            RequestBody = RequestBody +               '<cre:relacionDCV> </cre:relacionDCV>';
            RequestBody = RequestBody +               '<cre:relacionBCS> </cre:relacionBCS>';*/           
            RequestBody = RequestBody +            '</cre:wsCreacionClientes>';
            RequestBody = RequestBody +         '</cre:Sebra>';
            RequestBody = RequestBody +         '<cre:Magic> </cre:Magic>';        
            RequestBody = RequestBody +      '</cre:CrearCleinteBice>';
            RequestBody = RequestBody +   '</soapenv:Body>';
            RequestBody = RequestBody +'</soapenv:Envelope>';
        }
        System.debug('XML ARMADO: ');
        System.debug(RequestBody);
        return RequestBody;
    }
    
    public ClienteSebra LlenadoDatos(){
        personaRelacionada pr = new personaRelacionada();
        personaRelacionada RL = new personaRelacionada();
        cs = new ClienteSebra();
        campCif = new CamposCIF();
        RepreLegal = new personaRelacionada();
        ListaCB = new List<CuentaBancaria>();
        CuentaBancaria objCB = new CuentaBancaria();
        objTelefono = new telefono();
        cs.indicadorCif = '0';
        cs.indicadorMagic = '0';
        cs.indicadorSebra = '1';
        cs.tipoDocumento = 'RUT';
        cs.Estado = '07';
        cs.plantillaCobro = 'DESCONOCID';
        cs.plantillaProducto = 'DESCONOCID';
        cs.modeloFacturacion = 'DESCONOCID';
        cs.tipoOrden = 'NING';        
        cs.rut = auxCliente.RUT__c;

        if(rt.Name == 'Cuentas personales en CIF' || rt.Name == 'Cuentas personales'){
            cs.cuenta = '0';
            cs.perfilComercial = 'MN';
        }
        if(rt.Name.contains('Empresa')){
            cs.cuenta = '0';
            cs.perfilComercial = 'MJ';
        }
        if(auxCliente.Ejecutivo_de_Inversiones__c != null && auxCliente.Ejecutivo_de_Inversiones__r.Profile != null){
            if(auxCliente.Ejecutivo_de_Inversiones__r.Profile.Name.contains('AP')){
                cs.cuenta = '50';
                cs.perfilComercial = 'AP';
            }
        }
        if(auxCliente.Nationality__c != null){
            cs.Nacionalidad = auxCliente.Nationality__c;
            System.debug('Nacionalidad: '+auxCliente.Nationality__c); 
        }else{
            cs.Nacionalidad = '';
        }
        
        /*if(rt.Name == 'Cuentas personales en CIF' || rt.Name == 'Cuentas personales'){
            cs.naturalidad = 'Persona Natural';
            cs.tipCli = 'Persona Natural';
        }
        if(rt.Name.contains('Empresa')){
            cs.naturalidad = 'Persona Juridica';
            cs.tipCli = 'Persona Juridica';
        }*/
        if(!String.isBlank(auxCliente.Tipo_de_Persona__c)){
            cs.naturalidad = auxCliente.Tipo_de_Persona__c;
            if(rt.Name == 'Cuentas personales en CIF' || rt.Name == 'Cuentas personales'){           
                cs.tipCli = 'Persona Natural';
            }
            if(rt.Name.contains('Empresa')){         
                cs.tipCli = 'Persona Juridica';
            }
        }else{
            cs.naturalidad = 'Sin Definir';
             if(rt.Name == 'Cuentas personales en CIF' || rt.Name == 'Cuentas personales'){           
                cs.tipCli = 'Persona Natural';
            }
            if(rt.Name.contains('Empresa')){         
                cs.tipCli = 'Persona Juridica';
            }
        }
        
        
        
        cs.nombreFantasia = auxCliente.Name;
        cs.razonSocial = auxCliente.Raz_n_Social__c;
        cs.giro = auxCliente.Giro_Inv__r.Name;
        cs.apellidoPaterno = auxCliente.LastName;
        cs.apellidoMaterno = auxCliente.Apellido_materno__pc;
        cs.nombres = auxCliente.FirstName;
        if(auxCliente.PersonBirthdate != null){
            cs.fechaNacimiento = String.valueOf(auxCliente.PersonBirthdate);
            System.debug('Fecha de Nacimiento: '+String.valueOf(auxCliente.PersonBirthdate)); 
        }else{
            cs.fechaNacimiento = '';
            System.debug('No hay fecha de nacimiento');
        }
        if(auxCliente.Sex__pc != null){
            cs.sexo = auxCliente.Sex__pc.substring(0,1);
        }
        if(auxCliente.Estado_civil__pc != null){
            cs.estadoCivil = auxCliente.Estado_civil__pc;
            System.debug('Estado Civil: '+auxCliente.Estado_civil__pc);
        }else{
            cs.estadoCivil = '';
            System.debug('No hay estado civil');
        }
        if(auxCliente.Conjugal_Regime__pc != null){
            cs.regimenConyugal = auxCliente.Conjugal_Regime__pc;
            System.debug('Regimen conyugal: '+auxCliente.Conjugal_Regime__pc);
        }else{
            System.debug('No hay regimen conyugal');
        }
        if(auxCliente.Profession__pc != null){
            cs.Profesion = auxCliente.Profession__pc;
            System.debug('Profesion: '+auxCliente.Profession__pc);
        }else{
            cs.Profesion = '';
            System.debug('No hay profesion');
        }
        if(auxCliente.PersonTitle != null){
            cs.cargo = auxCliente.PersonTitle;
            System.debug('Cargo: '+auxCliente.PersonTitle);
        }else{
            cs.cargo = '';
            System.debug('Sin cargo');
        }
        if(auxCliente.Employer__pc != null){
            cs.empleador = auxCliente.Employer__pc;
            System.debug('Empleador: '+auxCliente.Employer__pc);
        }else{
            cs.empleador = '';
            System.debug('No hay empleador');
        }
        /*Se pide agregar campo Situacion Laboral del cliente - 16--11-2017*/
        if(auxCliente.Situac_Laboral__c != null){
           cs.IdSituacionLaboral = auxCliente.Situac_Laboral__c; 
        }
        /*--------------------------------------------------------------------*/
        cs.direcciones = new List<direccion>();
        if(auxCliente.Calle_particular_Inv__c != null){
            direccion dn = new direccion();
            if(auxCliente.Ciudad_o_Provincia_particular_Inv__c != null){
                dn.ciudad = auxCliente.Ciudad_o_Provincia_particular_Inv__c.toUpperCase();
                System.debug('Ciudad particular: '+auxCliente.Ciudad_o_Provincia_particular_Inv__c.toUpperCase());
            }else{
                dn.ciudad = '';
                System.debug('No hay ciudad particular');
            }
            System.debug('COMUNA PARTICULAR: '+auxCliente.Comuna_particular_Inv__c);
            try{
                dn.comuna = auxCliente.Comuna_particular_Inv__r.Name.toUpperCase();
                System.debug('Comuna: '+auxCliente.Comuna_particular_Inv__r.Name.toUpperCase());
            }catch(Exception e){
                dn.comuna = '';
                System.debug('No hay comuna '+e.getMessage());
            }
            if(auxCliente.Pais_particular_Inv__c != null){
                dn.pais = auxCliente.Pais_particular_Inv__c;
                System.debug('Pais: '+auxCliente.Pais_particular_Inv__c);
            }else{
                dn.pais = '';
                System.debug('No hay pais');
            }
            if(auxCliente.Region_particular_Inv__c != null){
                dn.region = auxCliente.Region_particular_Inv__c.toUpperCase();
                System.debug('Region: '+auxCliente.Region_particular_Inv__c.toUpperCase());
            }else{
                dn.region = '';
                System.debug('No hay region');
            }
            if(auxCliente.Calle_particular_Inv__c != null){
                dn.direccion = auxCliente.Calle_particular_Inv__c.toUpperCase();
                System.debug('Calle Particular: '+auxCliente.Calle_particular_Inv__c.toUpperCase());
            }else{
                dn.direccion = '';
                System.debug('No hay calle particular');
            }
            if(auxCliente.Numero_calle_particular_Inv__c != null){
                dn.numero = auxCliente.Numero_calle_particular_Inv__c;
                System.debug('Numero Calle Particular: '+auxCliente.Numero_calle_particular_Inv__c);
            }else{
                dn.numero = '';
                System.debug('No hay numero calle particular');
            }
            if(auxCliente.Info_adicional_Inv_Depto__c != null){
                dn.complemento = auxCliente.Info_adicional_Inv_Depto__c;
                System.debug('Info adicional: '+auxCliente.Info_adicional_Inv_Depto__c);
            }else{
                dn.complemento = '';
                System.debug('No hay info adicional');
            }
            dn.tipo = 'PARTICULAR';

          
            cs.direcciones.add(dn);
        }else{
            System.debug('Sin direccion particular');
        }       
        
        
        if(auxCliente.Calle_comercial_Inv__c != null){
            direccion dn = new direccion();
            if(auxCliente.Ciudad_o_Provincia_comercial_Inv__c != null){
                dn.ciudad = auxCliente.Ciudad_o_Provincia_comercial_Inv__c.toUpperCase();
                System.debug('Ciudad comercial: '+auxCliente.Ciudad_o_Provincia_comercial_Inv__c.toUpperCase());
            }else{
                dn.ciudad = '';
                System.debug('No hay ciudad comercial');
            }
            System.debug('COMUNA COMERCIAL: '+auxCliente.Comuna_particular_Inv__c);
            try{
                dn.comuna = auxCliente.Comuna_comercial_Inv__r.Name.toUpperCase();
                System.debug('Comuna: '+auxCliente.Comuna_comercial_Inv__r.Name.toUpperCase());
            }catch(Exception e){
                dn.comuna = '';
                System.debug('No hay comuna '+e.getMessage());
            }
            if(auxCliente.Pais_comercial_Inv__c != null){
                dn.pais = auxCliente.Pais_comercial_Inv__c;
                System.debug('Pais: '+auxCliente.Pais_comercial_Inv__c);
            }else{
                dn.pais = '';
                System.debug('No hay pais');
            }
            if(auxCliente.Region_comercial_Inv__c != null){
                dn.region = auxCliente.Region_comercial_Inv__c.toUpperCase();
                System.debug('Region: '+auxCliente.Region_comercial_Inv__c.toUpperCase());
            }else{
                dn.region = '';
                System.debug('No hay region');
            }
            if(auxCliente.Calle_comercial_Inv__c != null){
                dn.direccion = auxCliente.Calle_comercial_Inv__c.toUpperCase(); //+' '+auxCliente.Info_adicional_Inv_Oficina__c
                System.debug('Calle comercial: '+auxCliente.Calle_comercial_Inv__c.toUpperCase());
            }else{
                dn.direccion = '';
                System.debug('No hay calle comercial');
            }
            if(auxCliente.Numero_calle_comercial_Inv__c != null){
                dn.numero = auxCliente.Numero_calle_comercial_Inv__c;
                System.debug('Numero calle comercial: '+auxCliente.Numero_calle_comercial_Inv__c);
            }else{
                dn.numero = '';
                System.debug('No hay numero calle comercial');
            }
            if(auxcliente.Info_adicional_Inv_Oficina__c != null){
                dn.complemento = auxCliente.Info_adicional_Inv_Oficina__c;
                System.debug('Info adicional: '+auxCliente.Info_adicional_Inv_Oficina__c);
            }else{
                dn.complemento = '';
                System.debug('No hay info adicional');
            }
            dn.tipo = 'COMERCIAL';

            
            cs.direcciones.add(dn);
        }else{
            System.debug('Sin direccion comercial');
        }
        
          TELEFONO tel = new TELEFONO();
          tel.TELEFONOS = new List<TELEFONO>();
           /*---- TELEFONOS FIJO PARTICULARES----*/
            if(auxCliente.Telefono_fijo_particular_Inv__pc != null){
                TELEFONO t1 = new TELEFONO();
                t1.codigo = '';
                t1.tipoTelefono = 'FIJO';
                t1.numero = auxCliente.Telefono_fijo_particular_Inv__pc.replace(' ','');
                tel.TELEFONOS.add(t1);
            }
            /*---- TELEFONOS FIJO PARTICULARES----*/
            
            /*---- TELEFONO CELULAR COMERCIAL----*/
            if(auxCliente.Celular_comercial_Inv__c != null){
                TELEFONO t2 = new TELEFONO();
                t2.codigo = '';
                t2.tipoTelefono = 'MOVIL';
                t2.numero = auxCliente.Celular_comercial_Inv__c.replace(' ','');
                tel.TELEFONOS.add(t2);
            }
            /*---- TELEFONO CELULAR COMERCIAL----*/
            
            /*---- TELEFONO RECADO PARTICULARES----*/
            if(auxCliente.Celular_Particular_Inv__pc != null){
                TELEFONO t2 = new TELEFONO();
                t2.codigo = '';
                t2.tipoTelefono = 'RECADOS';
                t2.numero = auxCliente.Celular_Particular_Inv__pc.replace(' ','');
                tel.TELEFONOS.add(t2);
            }          
            /*---- TELEFONO RECADO PARTICULARES----*/
            
             /*---- TELEFONO FIJO COMERCIAL----*/
            if(auxCliente.Telefono_fijo_comercial_Inv__c != null){
                TELEFONO t2 = new TELEFONO();
                t2.codigo = '';
                t2.tipoTelefono = 'FAX';
                t2.numero = auxCliente.Telefono_fijo_comercial_Inv__c.replace(' ','');
                tel.TELEFONOS.add(t2);
            }          
            /*---- TELEFONO FIJO COMERCIAL----*/
            
            
        cs.emails = new List<EMAIL>();
        if(auxCliente.Email_personal_Inv__pc != null){
            EMAIL e1 = new EMAIL();
            e1.email = auxCliente.Email_personal_Inv__pc.toUpperCase();
            e1.tipo = 'PARTICULAR';
            cs.emails.add(e1);
        }
        if(auxCliente.Email_comercial_Inv__c != null){
            EMAIL e2 = new EMAIL();
            e2.email = auxCliente.Email_comercial_Inv__c.toUpperCase();
            e2.tipo = 'COMERCIAL';
            cs.emails.add(e2);
        }
        if(auxCliente.Email_Rep_Legal_Inv__c != null){
            EMAIL e3 = new EMAIL();
            e3.email = auxCliente.Email_Rep_Legal_Inv__c.toUpperCase();
            e3.tipo = 'LABORAL';
            cs.emails.add(e3);
        }

        pr.nombres = auxCliente.Spouse_First_Name__pc;
        pr.apellidoMaterno = auxCliente.Spouse_Mothers_Last_Name__pc;
        pr.apellidoPaterno = auxCliente.Spouse_Fathers_Last_Name__pc;
        pr.comuna = auxCliente.Comuna_de_Direccion_Conyuge__pr.Name;
        pr.direccion = auxCliente.Ciudad_particular_de_Conyuge__pc;
        pr.direccionNumero = auxCliente.Numero_de_calle_particular_de_Conyuge__pc;
        pr.fecha = '1990-01-01';
        pr.fin = '1990-01-01';
        pr.inicio = '1990-01-01';
        pr.naturalidad = 'Persona Natural';
        pr.rut = auxCliente.Spouse_RUT__pc;
        pr.tipo = 'TRELACONYU';

        RL.nombres = auxCliente.nombres__c;
        RL.apellidoMaterno = auxCliente.apellidoMaterno__c;
        RL.apellidoPaterno = auxCliente.apellidoPaterno__c;
        RL.naturalidad = 'Persona Natural';
        RL.rut = auxCliente.rut_inv__c;
        RL.tipo = 'TRELALEGAL';
        /*petición Charles, para etiqueta dirección del repre legal - 30/11/2017*/
        if(auxCliente.Comuna_RL__r.Name != null){
            RL.direccionNumero = auxCliente.Numero_calle_RL__c;
            RL.direccion = auxCliente.Calle_RL__c;
            RL.comuna =  auxCliente.Comuna_RL__r.Name.toUpperCase();
           // RL.paisResidencia = auxCliente.Pais_RL__c;
         }
        /*----------------------------------------------------------*/
        List<Cuenta_Bancaria_Inv__c> cbquery = [SELECT Banco__c,
                                                Moneda__c,
                                                Numero__c,
                                                Sucursal__c,
                                                Tipo_de_Cuenta__c,
                                                Esta_es_la_Cuenta_Principal__c
                                         FROM Cuenta_Bancaria_Inv__c 
                                         WHERE Cliente__c =:auxCliente.Id];
       
       if(cbquery.size()>0){                                  
            for(Cuenta_Bancaria_Inv__c cb : cbquery){
                 objCB = new CuentaBancaria();
                 objCB.Banco = cb.Banco__c.replace('&','&amp;');
                 if(cb.Moneda__c == 'Peso'){
                     objCB.Moneda = 'CLP';
                 }else if(cb.Moneda__c == 'Dolar'){
                     objCB.Moneda = 'USD';
                 }else if(cb.Moneda__c == 'Euro' || cb.Moneda__c == 'Euros'){
                     objCB.Moneda = 'EUR';
                 }
                
    
                 objCB.Numero = cb.Numero__c;
                 objCB.Sucursal = cb.Sucursal__c;
                 objCB.tipoCuenta = cb.Tipo_de_Cuenta__c;                
                 if(cb.Esta_es_la_Cuenta_Principal__c  == true)
                    objCB.cuentaPrincipal = 'S';
                 else
                    objCB.cuentaPrincipal = 'N';
    
                 ListaCB.add(objCB);   
            }
        }
        System.debug('CUENTAS:' +ListaCB);
        /* Campos requeridos por CIF */
        if(auxCliente.Ejecutivo_de_Inversiones__c != null){

            if(auxCliente.Ejecutivo_de_Inversiones__r.ROL_Number__c != null){
                campCIF.numRolEmpleado = auxCliente.Ejecutivo_de_Inversiones__r.ROL_Number__c;
            }else{
                campCIF.numRolEmpleado = '0';
            }
        }else{
            campCIF.numRolEmpleado = '0';
        }
            
        campCIF.codCliente = 'Cliente Corr. de Bol';//auxCliente.Customer_type_other_rating_c__c;
        campCIF.codSector = auxcliente.SBIF_Sector__c;
        campCIF.codSucursal = 'Casa Matriz';
        campCIF.flagEmpleado = 'N';
        campCIF.ejecutivoComex = '0';
        campCIF.codigoCanal = '501';
        campCIF.glosaAplicacion = 'Ingreso por CRM';
        campCIF.codOperador = '0';
            /*---------------------------*/

        RepreLegal = RL;//Agrega Representante Legal
        auxPR = pr;//Agrega conyuge
        auxLlenaDatos = cs;//Datos cliente
        objTelefono.telefonos = tel.TELEFONOS;
        return cs;
    }

    public PageReference Redireccionar(){
        String urlToRedirect = '/apex/BICE_IntOnline_Redirect';
        PageReference myVFPage = new PageReference(urlToRedirect);
        myVFPage.getParameters().put('LID',lid);
        myVFPage.getParameters().put('msg','Validando datos...');
        myVFPage.setRedirect(true);
        return myVFPage;
    }
    
    public static void ActualizaSolicitudCliente(BICE_Solicitud_Cliente__c sc){
        //BICE_Solicitud_Cliente__c sc = [SELECT Id, Sebra_Ok__c FROM BICE_Solicitud_Cliente__c WHERE Cliente__c =:cId ORDER BY LastModifiedDate ASC LIMIT 1];
        if(Approval.isLocked(sc)){
            system.debug(Approval.isLocked(sc));
            Approval.UnlockResult unlockedRersult = Approval.unlock(sc);
            system.debug(unlockedRersult);
        }

        sc.Sebra_Ok__c = true;
        update sc;
        
        system.debug('ASI QUEDA: '+sc);
        /* MJV - Proceso de aprobación creado en sebra */                
        Approval.ProcessSubmitRequest req0 = new Approval.ProcessSubmitRequest();
        req0.setComments('Aprobación desde sebra en curso');
        req0.setObjectId(sc.Id);
        // Submit the approval request for the Opportunity
        Approval.ProcessResult result1 = Approval.process(req0);    
        Approval.ProcessWorkitemRequest req = new Approval.ProcessWorkitemRequest();
        req.setComments('Aprobación proveniente desde sebra');
        req.setAction('Approve');
        Id workItemId;
        for(ProcessInstanceWorkitem workItem : [Select Id from ProcessInstanceWorkitem where ProcessInstance.TargetObjectId =: sc.id]){
            workItemId = workItem.Id;
        }
        if(workItemId != null){
            req.setWorkitemId(workItemId);
            // Submit the request for approval
            Approval.ProcessResult result2 =  Approval.process(req);
        }
        /* MJV - Fin Proceso de aprobación creado en sebra */
    }

    public void ActualizarFechaSebra(){
        System.debug('Actualizando fecha de sebra');
        //Account a = [SELECT Fecha_creacion_Sebra__c FROM Account WHERE Id =: ApexPages.currentPage().getParameters().get('id')];
        Account a = [SELECT Fecha_creacion_Sebra__c FROM Account WHERE Id =: auxCliente.Id];
        a.Fecha_creacion_Sebra__c = Date.TODAY();
        a.CIF_Id__c = cifId;
        update a;
        System.debug('Fecha de sebra actualizada');
    }

    public String ObtenerResultado(HttpResponse res){
        String Codigo = '';
        dom.Document resDoc = res.getBodyDocument();
        dom.XmlNode envelope = resDoc.getRootElement();
        System.debug(envelope);
        dom.XmlNode envB = envelope.getChildElement('Body', 'http://schemas.xmlsoap.org/soap/envelope/');
        dom.XmlNode bRes = envB.getChildElement('CrearCleinteBiceResponse', 'http://www.example.org/CrearClienteBice/');
        dom.XmlNode ret = bRes.getChildElement('SebraResponse', 'http://www.example.org/CrearClienteBice/');
        dom.XmlNode retur = ret.getChildElement('return', 'http://www.example.org/CrearClienteBice/');
        System.debug('Code: '+retur.getChildElement('codigo', 'http://www.example.org/CrearClienteBice/').getText());
        System.debug('Mensaje: '+retur.getChildElement('mensaje', 'http://www.example.org/CrearClienteBice/').getText());
        Mensaje = retur.getChildElement('mensaje', 'http://www.example.org/CrearClienteBice/').getText();
        codigo = retur.getChildElement('codigo', 'http://www.example.org/CrearClienteBice/').getText();
        cifId = retur.getChildElement('cifId', 'http://www.example.org/CrearClienteBice/').getText();                     
        return codigo;
    }
}