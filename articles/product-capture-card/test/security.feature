@tokenizer @security
Feature: Seguridad y acceso a API RESTful
Para aumentar la seguridad de acceso al tokenizador debido a que es un 
sistema que trabaja con datos sensibles de los usuarios que lo utilicen,
es que se debe aplicar por defecto una restricción a las funcionalidades
expuestas a través de la API de Captura (Least Privilege).

Para ello es necesario aplicar un sistema de control de seguridad basado en 
Token (JWT), que restringa el acceso a los servicios y con un tiempo de 
duración finita (X min) antes de expirar.

Para obtener este token es necesario usar un sistema de credenciales expuesta 
en cada flujo de pago (aplicación) creada en una cuenta de comercio.

Esta autenticación tendra un sistema de protocolo de seguridad estandar para
facilitar la integración con los desarrolladores (Oauth2: client_credentials).

Enlaces:
  Oauth2:          https://tools.ietf.org/html/rfc6749#section-1.3.4
  Least Privilege: https://en.wikipedia.org/wiki/Principle_of_least_privilege
  JWT (RFC 7519):  https://jwt.io/introduction/

@must-fail
Escenario: Bloqueo de API por acceso no autorizado (Sin token de acceso) 
      Dado la dirección URL a la api de captura
         Y un cuerpo del mensaje con los atributos
           | Nombre                   | Valor                           |
           | capture                  | CREDIT_CARD                     |
           | capture_method           | TOKENIZATION                    |
           | cardholder.reference_id  | 163875593                       |
           | cardholder.country       | CL                              |
           | redirect_urls.return_url | http://www.mysite.cl/success    |
           | redirect_urls.cancel_url | http://www.mysite.cl/success    |
    Cuando yo solicite una petición a la api de capture "{api-capture-url}/captures"
         Y con el verbo POST
  Entonces Deberia ver una respuesta de error en formato JSON 
           con el siguiente cuerpo
           | Nombre            | Valor               |
           | code              | InvalidCredentials  |
           | message           | No authorization token was found |
         Y con un código de estado HTTP:401 (Unauthorized)
           #{"code":"InvalidCredentials","message":"No authorization token was found"}

@must-fail
Escenario: Bloqueo de API por encabezado de autorización mal formado
      Dado la dirección URL a la api de captura
         Y un cuerpo del mensaje con los atributos
           | Nombre                   | Valor                           |
           | capture                  | CREDIT_CARD                     |
           | capture_method           | TOKENIZATION                    |
           | cardholder.reference_id  | 163875593                       |
           | cardholder.country       | CL                              |
           | redirect_urls.return_url | http://www.mysite.cl/success    |
           | redirect_urls.cancel_url | http://www.mysite.cl/success    |
    Cuando yo solicite una petición a la api de capture "{api-capture-url}/captures"
         Y con el verbo POST
         Y establecer en el encabezado "Authorization" el valor de "Bearer "
  Entonces Deberia ver una respuesta de error en formato JSON 
           con el siguiente cuerpo
           | Nombre            | Valor               |
           | code              | InvalidCredentials  |
           | message           | Format is Authorization: Bearer [token] |
         Y con un código de estado HTTP:401 (Unauthorized)
           # {"code":"InvalidCredentials","message":"Format is Authorization: Bearer [token]"}
         

@must-fail
Escenario: Bloqueo de API por token de acceso invalido 
      Dado la dirección URL a la api de captura
         Y un cuerpo del mensaje con los atributos
           | Nombre                   | Valor                           |
           | capture                  | CREDIT_CARD                     |
           | capture_method           | TOKENIZATION                    |
           | cardholder.reference_id  | 163875593                       |
           | cardholder.country       | CL                              |
           | redirect_urls.return_url | http://www.mysite.cl/success    |
           | redirect_urls.cancel_url | http://www.mysite.cl/success    |
    Cuando yo solicite una petición a la api de capture "{api-capture-url}/captures"
         Y con el verbo POST
         Y establecer en el encabezado "Authorization" el valor de "Bearer d7wndi2y3"
  Entonces Deberia ver una respuesta de error en formato JSON 
           con el siguiente cuerpo
           | Nombre            | Valor               |
           | code              | InvalidCredentials  |
           | message           | A valid credential in the Authorization header is required |
         Y con un código de estado HTTP:401 (Unauthorized)