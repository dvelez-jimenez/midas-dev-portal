# Obtener Token de Acceso
Para obtener un token de acesso, es necesario [haber registrado una aplicación](http://TODO) en el portal de desarollo. 

Cuando hayas creado una aplicación,Quickpay Connect generará un par de llaves Oauth **client_id** y **client_secret** para los ambientes de pruebas (*Sandbox*) y producción. 

Una vez obtenidas las credenciales del aplicativo, deberás obtener un **token de acceso** enviando por medio del encabezado **Authorization** las credenciales bajo el formato client_id:client_secret al servidor de autorización. 

El servidor de autorización intercambiara las llaves del aplicativo por un token de acceso valido para ejecutar requerimientos a la API RESTful de Pagos. 

> Para mayor información sobre este topico en particular, favor dirijete a nuestra sección [comó hacer tu primera llamada](http://TODO)

````bash
 curl -v -X POST https://api-sso-quickpay.azurewebsites.net/oauth2/v2/token \
 -H "Content-Type: application/x-www-form-urlencoded" \
 -H "Authorization: Basic client_id:client_secret" \
 -d "grant_type=client_credentials"
 ````

## Pasos Siguientes
Una vez obtenido un token de acceso, ya puedes comenzar a usar los servicios RESTful de la API de pagos para generar las intenciones de pago a través de tu comercio.

[Crear una intención de pago >](create-intention.md)