# features/rdf.feature

#project name
@administracion_La_Rioja

#title report
@Test_RDF_Report


#All test cases
@Get_rdf

#Environment
@dev

#version
@tcs_0.0.1

Feature: Verify list endpoint of RDF

  @tc_generate_csv
  Scenario: Returns generate csv 200
    Given I prepare the URI "http://localhost:8500/repositorio/" request with path "generarCSV"
    When I set the query parameters for "generarCSV"
      | key            | value   |
      | ticket         | ticket  |
      | aplicacion     | GRIAR   |
    And I prepare the request headers
      | key        | value |
      | Accept     | */*   |
      | Connection | keep-alive |
    When I send a "GET" request to the endpoint
    Then I should receive a status code of 200
    And I capture and log the response details
    And The response must match the expected schema for "repositorio_generate_csv"


  @tc_generate_dame_objeto
  Scenario: Returns dame objeto 200
    Given I prepare the URI "http://localhost:8500/repositorio/" request with path "dameObjeto"
    When I set the query parameters for "dameObjeto"
      | key            | value     |
      | ticket         | ticket    |
      | iden           | 236240    |
      | secu           | 1         |
      | aplicacion     | THINKTIC  |
    And I prepare the request headers
      | key        | value |
      | Accept     | */*   |
      | Connection | keep-alive |
    When I send a "GET" request to the endpoint
    Then I should receive a status code of 200
    And I capture and log the response details
    And The response must match the expected schema for "repositorio_dame_objeto"

  @tc_firmar_cadena
  Scenario: Returns firmar cadena 200
      Given I prepare the URI "http://localhost:8500/firma/" request with path "firmarCadena"
      When I set the query parameters for "firmarCadena"
        | key         | value                                        |
        | _alias      | gobrioja                                     |
        | _pwd_alias  | ajoirbog                                     |
        | _cadena     | APLICACION%TIPO_DOCUMENTO%SUBTIPO_DOCUMENTO%FECHA_GENERACION%NIF_TITULAR%NOMBRE_TITULAR%NIVEL_SEGURIDAD%TEMA_DOCUMENTO%REFERENCIA_DOCUMENTO%NOMBRE_ARCHIVO%MIME_ARCHIVO%CONTENIDO_BASE64 |
        | _modo       | 2                                            |
      And I prepare the request headers
        | key        | value       |
        | Accept     | */*         |
        | Connection | keep-alive  |
      When I send a "GET" request to the endpoint
      Then I should receive a status code of 200
      And I capture and log the response details
      And The response must match the expected schema for "repositorio_dame_objeto"

