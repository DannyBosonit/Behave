# features/gestionMensajes.feature

#project name
@administracion_La_Rioja

#title report
@Gestión_Mensajes_Report


#All test cases
@Get_gestion_mensajes

#Environment
@dev

#version
@tcs_0.0.1

Feature: Verify list endpoint of Gestion de Mensajes

  @tc_cancelar_envio
  Scenario: Returns cancelar envio 200
    Given I prepare the URI "http://localhost:8505/gestionMensajes/" request with path "cancelarEnvio"
    When I set the query parameters for "cancelarEnvio"
      | key             | value   |
      | idenvio         |         |
      | programaciones  |         |
      | aplicacion      |         |
    And I prepare the request headers
      | key        | value      |
      | Accept     | */*        |
      | Connection | keep-alive |
    When I send a "GET" request to the endpoint
    Then I should receive a status code of 200
    And I capture and log the response details
    And The response must match the expected schema for "cancelar_envio_schema"


  @tc_enviar_email
  Scenario: Returns cancelar envio 200
    Given I prepare the URI "http://localhost:8505/gestionMensajes/" request with path "enviarMail"
    When I set the query parameters for "enviarMail"
      | key                   | value   |
      | aplicacion            |         |
      | asunto                |         |
      | canal                 |         |
      | destinatarios         |         |
      | fechaReferencia       |         |
      | mail_respuesta        |         |
      | nomAdjuntos           |         |
      | numerosDestinatarios  |         |
      | numerosHorasValid     |         |
      | programacion          |         |
      | referencia            |         |
      | telefonos_mails       |         |
      | texto                 |         |
      | textoHtml             |         |
      | urgente               |         |
      | usuario               |         |
    And I prepare the request headers
      | key        | value |
      | Accept     | */*   |
      | Connection | keep-alive |
    When I send a "GET" request to the endpoint
    Then I should receive a status code of 200
    And I capture and log the response details
    And The response must match the expected schema for "enviar_email__schema"

  @tc_enviar_email_tecnico
  Scenario: Returns Enviar Email Tecnico 200
    Given I prepare the URI "http://localhost:8505/gestionMensajes/" request with path "enviarMailTecnico"
    When I set the query parameters for "enviarMailTecnico"
      | key                 | value   |
      | aplicacion          |         |
      | asunto              |         |
      | canal               |         |
      | destinatarios       |         |
      | fechaReferencia     |         |
      | mail_respuesta      |         |
      | nomAdjuntos         |         |
      | nombre_respuesta    |         |
      | numeroAdjuntos      | 0       |
      | numeroDestinatarios | 0       |
      | numeroHorasValid    | 0       |
      | programacion        |         |
      | referencia          |         |
      | telefonos_mails     |         |
      | texto               |         |
      | textoHtml           | true    |
      | urgente             | true    |
      | usuario             |         |
    And I prepare the request headers
      | key        | value      |
      | Accept     | */*        |
      | Connection | keep-alive |
    When I send a "GET" request to the endpoint
    Then I should receive a status code of 200
    And I capture and log the response details
    And The response must match the expected schema for "enviar_Mail_Tecnico_schema"


  @tc_enviar_sms_tecnico
  Scenario: Returns Enviar SMS Tecnico 200
    Given I prepare the URI "http://localhost:8505/gestionMensajes/" request with path "enviarSMS"
    When I set the query parameters for "enviarSMS"
      | key                 | value   |
      | aplicacion          |         |
      | asunto              |         |
      | canal               |         |
      | destinatarios       |         |
      | fechaReferencia     |         |
      | mail_respuesta      |         |
      | nomAdjuntos         |         |
      | nombre_respuesta    |         |
      | numeroAdjuntos      | 0       |
      | numeroDestinatarios | 0       |
      | numeroHorasValid    | 0       |
      | programacion        |         |
      | referencia          |         |
      | telefonos_mails     |         |
      | texto               |         |
      | textoHtml           | true    |
      | urgente             | true    |
      | usuario             |         |
    And I prepare the request headers
      | key        | value      |
      | Accept     | */*        |
      | Connection | keep-alive |
    When I send a "GET" request to the endpoint
    Then I should receive a status code of 200
    And I capture and log the response details
    And The response must match the expected schema for "enviar_SMS_Tecnico_schema"


  @tc_estado_envio
  Scenario: Returns Estado Envio 200
    Given I prepare the URI "http://localhost:8505/gestionMensajes/" request with path "estadoEnvio"
    When I set the query parameters for "estadoEnvio"
      | key         | value   |
      | idEnvio     |         |
      | fecha       |         |
      | aplicacion  |         |
    And I prepare the request headers
      | key        | value      |
      | Accept     | */*        |
      | Connection | keep-alive |
    When I send a "GET" request to the endpoint
    Then I should receive a status code of 200
    And I capture and log the response details
    And The response must match the expected schema for "estado_envio_schema"
