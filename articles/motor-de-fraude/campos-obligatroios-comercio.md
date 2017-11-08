|Nombre Parametro                |Descripción                                                                                 |Tipo Dato|
| ----                           | ----                                                                                       |----     |
|**general_id**                   |**Identificadores Generales QP**                                                            |`array`  |
|general_id.purchase_order_id                 |ID Orden de la compra generada por el Comercio                                              |`string` |
|general_id.associated_promotion             |Nombre promoción asociada                                                                   |`string` |
|**shopping_cart**                |**Datos del carro de compras**                                                              |`array`  |
|shopping_cart.product_quantity                |Cantidad de productos de un item                                                            |`string` |
|shopping_cart.product_sku                     |Código SKU del producto                                                                     |`string` |
|shopping_cart.product_number             |NombreProducto                                                                              |`string` |
|shopping_cart.product_code                  |Categoría del producto. Lista de valores definidos                                          |`string` |
|shopping_cart.product_category               |Categoría del producto que maneja el comercio                                               |`string` |
|shopping_cart.total_quantity_products          |Cantidad de productos del item                                                              |`string` |
|shopping_cart.product_unit_price          |Precio unitario del producto                                                                |`string` |
|**purchase_amount**              |**Datos del monto de la compra**                                                            |`array`  |
|purchase_amount.amount                          |Monto de la compra sin impuesto                                                             |`string` |
|purchase_amount.tax                             |Impuesto                                                                                    |`string` |
|purchase_amount.total                           |Monto total de la compra                                                                    |`decimal`|
|**client_data**                  |**Datos del cliente que está realizando la compra**                                         |`array`  |
|client_data.id_pagador                       |Identificador del cliente en el comercio                                                    |`string` |
|client_data.payer_personal_id                 |Número de identificación del pagador - RUT                                                  |`string` |
|client_data.is_guest                         |Indica si el pagador es un usuario invitado: true/false                                     |`boolean`|
|client_data.payer_category                   |Indica si el pagador pertenece a alguna categoría en el comercio. Ejemplo: Elite, Premium.  |`string` |
|client_data.payer_mail                       |Correo electrónico del pagador                                                              |`string` |
|client_data.is_employee                      |Indica si el pagador es empleado true/false                                                 |`boolean`|
|client_data.day_since_reg                     |Número de días desde que el cliente se registró en el comercio hasta hoy                    |`int`    |
|**dispatch_data**                |**Datos del despacho o retiro de los productos**                                            |`array`  |
|dispatch_data.beneficiary_name                 |Nombre de la persona que retira o recibe los productos                                      |`string` |
|dispatch_data.beneficiary_last_name             |Apellido de la persona que retira o recibe los productos                                        |`string` |
|dispatch_data.beneficiary_id                   |Número de documento de la persona que retira o recibe los productos                             |`string` |
|dispatch_data.beneficiary_doc_type              |Tipo de documento de la persona que retira o recibe los productos                               |`string` |
|dispatch_data.beneficiary_type                |Identifica a quien retira o recibe el producto: Titular/Tercero                                 |`string` |
|dispatch_data.beneficiary_phone_number             |Número de teléfono de la persona que retira/recibe los productos                                |`string` |
|dispatch_data.dispatch_address                 |Dirección del lugar donde se despachan los productos                                            |`string` |
|dispatch_data.dispatch_city                    |Ciudad donde se despachan los productos                                                         |`string` |
|dispatch_data.dispatch_state                   |Estado donde se despachan los productos                                                         |`string` |
|dispatch_data.dispatch_zipcode                  |Código postal donde se despachan los productos                                                  |`string` |
|dispatch_data.dispatch_country                 |País donde se despachan los productos                                                           |`string` |
|dispatch_data.dispatch_merchant_code            |Si la compra es retiro en tienda, indicar el código de la tienda donde se realizará el despacho |`string` |
