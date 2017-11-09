| Nombre Parametro                      | Descripción                              | Tipo Dato |
| ------------------------------------- | ---------------------------------------- | --------- |
| **general_id**                        | **Identificadores Generales QP**         | `array`   |
| general_id.purchase_order_id          | ID Orden de la compra generada por el Comercio | `string`  |
| general_id.associated_promotion       | Nombre promoción asociada                | `string`  |
| **shopping_cart**                     | **Datos del carro de compras**           | `array`   |
| shopping_cart.product_quantity        | Cantidad de productos de un item         | `string`  |
| shopping_cart.product_sku             | Código SKU del producto                  | `string`  |
| shopping_cart.product_number          | NombreProducto                           | `string`  |
| shopping_cart.product_code            | Categoría del producto. Lista de valores definidos | `string`  |
| shopping_cart.product_category        | Categoría del producto que maneja el comercio | `string`  |
| shopping_cart.total_quantity_products | Cantidad de productos del item           | `string`  |
| shopping_cart.product_unit_price      | Precio unitario del producto             | `string`  |
| **purchase_amount**                   | **Datos del monto de la compra**         | `array`   |
| purchase_amount.amount                | Monto de la compra sin impuesto          | `string`  |
| purchase_amount.tax                   | Impuesto                                 | `string`  |
| purchase_amount.total                 | Monto total de la compra                 | `decimal` |
| **client_data**                       | **Datos del cliente que está realizando la compra** | `array`   |
| client_data.payer_id                  | Identificador del cliente en el comercio | `string`  |
| client_data.payer_personal_id         | Número de identificación del pagador - RUT | `string`  |
| client_data.is_guest                  | Indica si el pagador es un usuario invitado: true/false | `boolean` |
| client_data.payer_category            | Indica si el pagador pertenece a alguna categoría en el comercio. Ejemplo: Elite, Premium. | `string`  |
| client_data.payer_email               | Correo electrónico del pagador           | `string`  |
| client_data.is_employee               | Indica si el pagador es empleado true/false | `boolean` |
| client_data.day_since_reg             | Número de días desde que el cliente se registró en el comercio hasta hoy | `int`     |
| **dispatch_data**                     | **Datos del despacho o retiro de los productos** | `array`   |
| dispatch_data.recipient_name          | Nombre de la persona que retira o recibe los productos | `string`  |
| dispatch_data.recipient_last_name     | Apellido de la persona que retira o recibe los productos | `string`  |
| dispatch_data.recipient_id            | Número de documento de la persona que retira o recibe los productos | `string`  |
| dispatch_data.recipient_doc_type      | Tipo de documento de la persona que retira o recibe los productos | `string`  |
| dispatch_data.recipient_type          | Identifica a quien retira o recibe el producto: Titular/Tercero | `string`  |
| dispatch_data.recipient_phone         | Número de teléfono de la persona que retira/recibe los productos | `string`  |
| dispatch_data.dispatch_address        | Dirección del lugar donde se despachan los productos | `string`  |
| dispatch_data.dispatch_city           | Ciudad donde se despachan los productos  | `string`  |
| dispatch_data.dispatch_state          | Estado donde se despachan los productos  | `string`  |
| dispatch_data.dispatch_zipcode        | Código postal donde se despachan los productos | `string`  |
| dispatch_data.dispatch_country        | País donde se despachan los productos    | `string`  |
| dispatch_data.dispatch_store_code     | Si la compra es retiro en tienda, indicar el código de la tienda donde se realizará el despacho | `string`  |
| dispatch_data.dispatch_type           | Identifica el tipo de despacho RetiroTienda o DespachoNovios o DespachoDomicilio | `string`  |
| dispatch_data.dispatch_method         | Identifica el método de despacho: Motoboy, correos, etc.. | `string`  |
| dispatch_data.is_store_pickup         | Identifica si la compra es con retiro en la tienda. true/false | `boolean` |
| dispatch_data.dispatch_date           | Indica la fecha de despacho o retiro en la tienda | `string`  |
| **purchase_data**                     | Datos de la compra                       | `array`   |
| purchase_data.tributary_document      | Indica si la compra es con Boleta o Factura: Boleta/Factura | `string`  |
| **session_data**                      | Datos de la sesion del cliente en el comercio | `array`   |
| session_data.customer_session_id      | Si el cliente está registrado en el comercio, indica las credenciales del inicio de sesion en el comercio del cliente. Ejemplo el correo, nombre de usuario, etc. | `string`  |
| session_data.customer_session_tries   | Si el cliente está registrado en el comercio, indica la cantidad de veces que el cliente ha intentado iniciar sesion para realizar la compra | `string`  |
| session_data.email_is_pasted          | Indica si el correo electrónico fue copiado y pegado. true/false | `boolean` |
| session_data.email_confirmed          | Si el cliente está registrado en el comercio, indica si el correo electrónico fue confirmado por el cliente: true/false | `boolean` |
| session_data.is_modified_registry     | Si el cliente estrá registrado en el comercio, indica si hubo cambios en los datos de registro del cliente previo a la compra: true/false | `boolean` |
| session_data.modified_registry_days   | Si el cliente está registrado en el comercio, indica hace cuantos días el cliente hizo cambios en sus datos de registro. | `string`  |
| session_data.is_confirmed_phone       | Indica si el número de teléfono del cliente fue confirmado por el comercio. true/false | `boolean` |
| session_data.name_phone_seller        | Si es venta telefónica, Indica el nombre del vendedor que procesó la venta | `string`  |
| session_data.purchase_average_time    | El tiempo promedio que el cliente tardó en hacer efectiva la compra | `int`     |
| session_data.currier_name             | Si la entrega de los productos se realiza con algun proveedor, indicar el nombre del proveedor | `string`  |
| session_data.is_order_changed         | Indica si el cliente realizó cambios en la orden de compra previo a realizar el pago. true/false | `boolean` |
| session_data.is_order_changed         | Indica si el cliente realizó cambios en la orden de compra previo a realizar el pago. true/false | `boolean` |
| **travel_data**                       | Grupo de Campos exclusivos para Viajes   | `array`   |
| travel_data.trip                      | Ruta del viaje                           | `string`  |
| travel_data.travel_type               | Tipo de viaje                            | `string`  |
| travel_data.passengers_quantity       | Cantidad de pasajeros                    | `string`  |
| travel_data.travel_date               | Fecha del viaje                          | `string`  |
| travel_data.passenger_contry          | País de residencia del pasajero          | `string`  |
| travel_data.passenger_number_id       | Número de identificación del pasajero    | `string`  |
| travel_data.passenger_document_type   | Tipo de identificación del pasajero      | `string`  |
| travel_data.passenger_email           | Correo electrónico del pasajero          | `string`  |
| travel_data.passenger_name            | Nombre del pasajero                      | `string`  |
| travel_data.passenger_last_name       | Apellido del pasajero                    | `string`  |
| travel_data.passenger_phone           | Apellido del pasajero                    | `string`  |
| **device_fingerprint**                | "Huella dígital del computador"          | `array`   |
