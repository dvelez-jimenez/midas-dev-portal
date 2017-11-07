|Nombre Parametro                |Descripción                                                                                 |Tipo Dato|
| ----                           | ----                                                                                       |----     |
|**general_id**                   |**Identificadores Generales QP**                                                            |`array`  |
|general_id.purchase_order_id                 |ID Orden de la compra generada por el Comercio                                              |`string` |
|general_id.associated_promotion             |Nombre promoción asociada                                                                   |`string` |
|**shopping_cart**                |**Datos del carro de compras**                                                              |`array`  |
|shopping_cart.cantidad_producto                |Cantidad de productos de un item                                                            |`string` |
|shopping_cart.sku_producto                     |Código SKU del producto                                                                     |`string` |
|Nombre del producto             |NombreProducto                                                                              |`string` |
|shopping_cart.codigo_producto                  |Categoría del producto. Lista de valores definidos                                          |`string` |
|shopping_cart.categoria_producto               |Categoría del producto que maneja el comercio                                               |`string` |
|shopping_cart.cantidad_total_productos          |Cantidad de productos del item                                                              |`string` |
|shopping_cart.precio_unitario_producto          |Precio unitario del producto                                                                |`string` |
|**purchase_amount**              |**Datos del monto de la compra**                                                            |`array`  |
|purchase_amount.amount                          |Monto de la compra sin impuesto                                                             |`string` |
|tax                             |Impuesto                                                                                    |`string` |
|totalAmount                     |Monto total de la compra                                                                    |`decimal`|
|**clientData**                  |**Datos del cliente que está realizando la compra**                                         |`array`  |
|IDPagador                       |Identificador del cliente en el comercio                                                    |`string` |
|payerPersonalId                 |Número de identificación del pagador - RUT                                                  |`string` |
|is_guest                         |Indica si el pagador es un usuario invitado: true/false                                     |`boolean`|
|payerCategory                   |Indica si el pagador pertenece a alguna categoría en el comercio. Ejemplo: Elite, Premium.  |`string` |
|payerMail                       |Correo electrónico del pagador                                                              |`string` |
|isEmployee                      |Indica si el pagador es empleado true/false                                                 |`boolean`|
|daySinceReg                     |Número de días desde que el cliente se registró en el comercio hasta hoy                    |`int`    |
|**dispatchData**                |**Datos del despacho o retiro de los productos**                                            |`array`  |
|beneficiaryName                 |Nombre de la persona que retira o recibe los productos                                      |`string` |
|beneficiaryLastName             |Apellido de la persona que retira o recibe los productos                                        |`string` |
|beneficiaryId                   |Número de documento de la persona que retira o recibe los productos                             |`string` |
|beneficiaryDocType              |Tipo de documento de la persona que retira o recibe los productos                               |`string` |
|personWhoCollect                |Identifica a quien retira o recibe el producto: Titular/Tercero                                 |`string` |
|dispatchPhoneNumber             |Número de teléfono de la persona que retira/recibe los productos                                |`string` |
|dispatchAddress                 |Dirección del lugar donde se despachan los productos                                            |`string` |
|dispatchCity                    |Ciudad donde se despachan los productos                                                         |`string` |
|dispatchState                   |Estado donde se despachan los productos                                                         |`string` |
|dispatchZipCod                  |Código postal donde se despachan los productos                                                  |`string` |
|dispatchCountry                 |País donde se despachan los productos                                                           |`string` |
|dispatchMerchantCode            |Si la compra es retiro en tienda, indicar el código de la tienda donde se realizará el despacho |`string` |
