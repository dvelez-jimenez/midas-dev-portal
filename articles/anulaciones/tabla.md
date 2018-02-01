# Posibles rechazos HTTP code mayores a 400

## Silent

| HTTP code| Respuesta del servicio                   | Como replicar|
| -------- | ---------------------------------------- |-----|
|400 | **error_code**: INVALID_MODEL, **error_description**: the requested model has invalid properties|1|
|401 | **error_code**: InvalidCredentials, **error_description**: caused by TokenExpiredError: jwt expired|1|
|401 | **error_code**: InvalidCredentials, **error_description**: caused by JsonWebTokenError: jwt malformed|1|
|404 | **error_code**: DOCUMENT_NOT_FOUND, **error_description**: The document you requested is not found|1|
| 500  |**error_code**: ERROR_WAITING_FOR_PROMISES_TO_RESOLVE, **error_description**: Exception has ocurred waiting for all promises to resolve when trying to approve payments|1|
| 500 | **error_code**: REQUEST_ERROR, **error_description**: Exception has ocurred when trying tokenize the credit card in cybersource|1|
| 500 | **error_code**: GATEWAY_DATA_DONT_EXISTS, **error_description**: Exception ocurred when trying to read the cybersource response: reply message from cybersource is empty|1|
| 500 | **error_code**: CYBERSOURCE_MISSING_REPLY, **error_description**: The response in cybersource has some invalid values|1|
| 500 | **error_code**: PEINAU_PAYMENT_UPDATE_ERROR, **error_description**: Exception ocurred when trying to update the payment after cybersource update|1|
| 500 | **error_code**: GATEWAY_DATA_DONT_EXISTS, **error_description**: Cybersource SOAP Message from cybersource or has some missing information|1|
|500 | **error_code**: DATABASE_ERROR |1|
|500 | **error_code**: PEINAU_ERROR |1|
|500 | **error_code**: GENERAL_SYSTEM_ERROR |1|
|500 | **error_code**: DATABASE_ERROR |1|

## Refund

| HTTP code| Respuesta del servicio                               |
| -------- | ---------------------------------------- |
|400 | **error_code**: INVALID_MODEL|
|401 | **error_code**: InvalidCredentials|
|404 | **error_code**: DOCUMENT_NOT_FOUND, **error_description**: The document you requested is not found|
| 500  |**error_code**: PAYMENT_IN_CREATED_STATE_CANT_BE_REFUNDED, **error_description**: A capture in created state cant be refunded|
| 500 | **error_code**: PAYMENT_IN_REJECTED_STATE_CANT_BE_REFUNDED, **error_description**: A capture in reject state cant be refunded |
| 500 | **error_code**: PAYMENT_ALREADY_REFUNDED, **error_description**: The capture or credit is not refund because the capture or credit information has already been submitted to your processor. Or, you requested a refund for a type of transaction that cannot be refunded. |
| 500 | **error_code**: CYBERSOURCE_MISSING_REPLY, **error_description**: The response in cybersource has some invalid values|
| 500 | **error_code**: REFUNDED_AMOUNT_HIGHER_PAYMENT_TOTAL, **error_description**: The refunded amount can not be higher than payment total. |
| 500 | **error_code**: GATEWAY_DATA_DONT_EXISTS, **error_description**: Cybersource SOAP Message from cybersource or has some missing information|
|500 | **error_code**: DATABASE_ERROR |
|500 | **error_code**: PEINAU_ERROR |
|500 | **error_code**: GENERAL_SYSTEM_ERROR |
|500 | **error_code**: DATABASE_ERROR |

