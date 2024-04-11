# features/pasarelaPagos.feature

#project name
@administracion_La_Rioja

#title report
@Pasarela_de_Pagos_Report


#All test cases
@Get_pasarela_pagos

#Environment
@dev

#version
@tcs_0.0.1


Feature: Verify list endpoint of Pasarela de Pagos

  @tc_comprobar_estado_pagado
  Scenario: Returns comprobar estado de pago list 200
    Given I prepare the URI "http://localhost:8504/pagos/" request with path "comprobarEstado"
    When I set the query parameters for "comprobarEstado"
      | key             | value   |
      | codPago         |         |
    And I prepare the request headers
      | key        | value      |
      | Accept     | */*        |
      | Connection | keep-alive |
    When I send a "GET" request to the endpoint
    Then I should receive a status code of 200
    And I capture and log the response details
    And The response must match the expected schema for " "

  @tc_comprobar_pagado
  Scenario: Returns comprobar un pago list 200
    Given I prepare the URI "http://localhost:8504/pagos/" request with path "comprobarPagado"
    When I set the query parameters for "comprobarPagado"
      | key             | value   |
      | codPago         |         |
    And I prepare the request headers
      | key        | value      |
      | Accept     | */*        |
      | Connection | keep-alive |
    When I send a "GET" request to the endpoint
    Then I should receive a status code of 200
    And I capture and log the response details
    And The response must match the expected schema for " "

  @tc_consultar_datos_pago
  Scenario: Returns consultar catos de pago list 200
    Given I prepare the URI "http://localhost:8504/pagos/" request with path "consultarDatosPago"
    When I set the query parameters for "consultarDatosPago"
      | key             | value   |
      | codPago         |         |
    And I prepare the request headers
      | key        | value      |
      | Accept     | */*        |
      | Connection | keep-alive |
    When I send a "GET" request to the endpoint
    Then I should receive a status code of 200
    And I capture and log the response details
    And The response must match the expected schema for " "


  @tc_consultar_modo_pago
  Scenario: Returns consultar modo de pago list 200
    Given I prepare the URI "http://localhost:8504/pagos/" request with path "consultarModoPago"
    When I set the query parameters for "consultarModoPago"
      | key             | value   |
      | codPago         |         |
    And I prepare the request headers
      | key        | value      |
      | Accept     | */*        |
      | Connection | keep-alive |
    When I send a "GET" request to the endpoint
    Then I should receive a status code of 200
    And I capture and log the response details
    And The response must match the expected schema for " "


  @tc_generar_modelo_046
  Scenario: Returns generar modelo 046 list 200
    Given I prepare the URI "http://localhost:8504/pagos/" request with path "generarModelo046"
    When I set the query parameters for "generarModelo046"
      | key             | value   |
      | codPago         |         |
    And I prepare the request headers
      | key        | value      |
      | Accept     | */*        |
      | Connection | keep-alive |
    When I send a "GET" request to the endpoint
    Then I should receive a status code of 200
    And I capture and log the response details
    And The response must match the expected schema for " "



  @tc_get_entidades
  Scenario: Returns get entidades list 200
    Given I prepare the URI "http://localhost:8504/pagos/" request with path "getEntidades"
    When I set the query parameters for "getEntidades"
      | key             | value   |
      | _cModelo65      |         |
    And I prepare the request headers
      | key        | value      |
      | Accept     | */*        |
      | Connection | keep-alive |
    When I send a "GET" request to the endpoint
    Then I should receive a status code of 200
    And I capture and log the response details
    And The response must match the expected schema for " "


  @tc_get_entidades_tarjeta
  Scenario: Returns get entidades tarjeta list 200
    Given I prepare the URI "http://localhost:8504/pagos/" request with path "getEntidadesTarjeta"
    When I set the query parameters for "getEntidadesTarjeta"
      | key             | value   |
      | _cModelo65      |         |
    And I prepare the request headers
      | key        | value      |
      | Accept     | */*        |
      | Connection | keep-alive |
    When I send a "GET" request to the endpoint
    Then I should receive a status code of 200
    And I capture and log the response details
    And The response must match the expected schema for " "



  @tc_nrc_diferido
  Scenario: Returns nrc diferido list 200
    Given I prepare the URI "http://localhost:8504/pagos/" request with path "nrcDiferido"
    When I set the query parameters for "nrcDiferido"
      | key              | value   |
      | _codPago         |         |
      | &_nrc            |         |
      | _fechaPago       |         |
      | _fechaPago       |         |
      | _codigoEntidad   |         |
    And I prepare the request headers
      | key        | value      |
      | Accept     | */*        |
      | Connection | keep-alive |
    When I send a "GET" request to the endpoint
    Then I should receive a status code of 200
    And I capture and log the response details
    And The response must match the expected schema for " "


  @tc_pagar
  Scenario: Returns pagar list 200
    Given I prepare the URI "http://localhost:8504/pagos/" request with path "pagar"
    When I set the query parameters for "pagar"
      | key             | value   |
      | codPago         |         |
    And I prepare the request headers
      | key        | value      |
      | Accept     | */*        |
      | Connection | keep-alive |
    When I send a "GET" request to the endpoint
    Then I should receive a status code of 200
    And I capture and log the response details
    And The response must match the expected schema for " "


  @tc_solicitar_numero_pago
  Scenario: Returns solicitar numero pago list 200
    Given I prepare the URI "http://localhost:8504/pagos/" request with path "solicitarNumeroPago"
    When I set the query parameters for "solicitarNumeroPago"
      | key             | value   |
      |                 |         |
    And I prepare the request headers
      | key        | value      |
      | Accept     | */*        |
      | Connection | keep-alive |
    When I send a "GET" request to the endpoint
    Then I should receive a status code of 200
    And I capture and log the response details
    And The response must match the expected schema for " "


  @tc_solicitar_numero_pago_reintento
  Scenario: Returns solicitar numero pago reintento list 200
    Given I prepare the URI "http://localhost:8504/pagos/" request with path "solicitarNumeroPagoReintento"
    When I set the query parameters for "solicitarNumeroPagoReintento"
      | key             | value   |
      |                 |         |
    And I prepare the request headers
      | key        | value      |
      | Accept     | */*        |
      | Connection | keep-alive |
    When I send a "GET" request to the endpoint
    Then I should receive a status code of 200
    And I capture and log the response details
    And The response must match the expected schema for " "

  @tc_verificar_nrc
  Scenario: Returns verificar nrc list 200
    Given I prepare the URI "http://localhost:8504/pagos/" request with path "verificarNrc"
    When I set the query parameters for "verificarNrc"
      | key             | value   |
      | cNrc            |         |
      | cNif            |         |
      | nimporte        |         |
      | cFecCargo       |         |
      | cCodEnti        |         |
    And I prepare the request headers
      | key        | value      |
      | Accept     | */*        |
      | Connection | keep-alive |
    When I send a "GET" request to the endpoint
    Then I should receive a status code of 200
    And I capture and log the response details
    And The response must match the expected schema for " "