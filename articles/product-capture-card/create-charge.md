# Ejecutar Cobro a Tarjeta Capturada
Luego de obtener el detalle de una captura completada (tokenización de tarjeta), se pueden realizar cargos a la tarjeta "tokenizada" a través de los servicios disponibles de [Checkout](../product-express-checkout/introduction.md)

Para crear un cargo (charge), se debe generar un intención de pago que soporte la ejecución de pagos asociados a una tarjeta tokenizada. 

>**Tip:**
>Puedes probar esta funcionalidad simplemente guardando el token de captura y ejecutando la [Consola interactiva: Quickpay Token](http://TODO) enviando en el token capturado como parametro de entrada en el cuerpo del mensaje al crear una intención de pago.

## Pasos Siguientes
Ya tienes tu primer captura realizado a través de la plataforma Quickpay Connect, y con ello el proceso de un captura de una tarjeta finalizada. 

Ya tienes tu primer cobro ejecutado a una tarjeta capturada, bajo un sistema seguro, y que permite reducir en gran medida las regulaciónes impuestas a un sistema **PCI DSS**

Si quieres ver una demostración de un proceso completo de captura a través de nuestra plataforma, puedes dirigirte a la sección demos y elegir el método de captura que quieres ver en vivo en nuestro entorno seguro **(sandbox)**