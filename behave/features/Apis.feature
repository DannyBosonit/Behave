# features/Apis.feature
@administracion
@Get_genes
@v_1

Feature: Verify list endpoint of Genes

  @tc_get_altos_cargos
  Scenario Outline: Returns Altos Cargos list 200
    Given I prepare the URI "http://localhost:8500/genes/" request with path "altosCargos"
    When I set the query parameters: "<sistema>" with filtro idEstructura "<idEstructura>", idVersion "<idVersion>", tipoVersion "<tipoVersion>"
    And I prepare the request headers
      | key         | value       |
      | Accept      | */*         |
      | Connection  | keep-alive  |
    When I send a "GET" request to the endpoint
    Then I should receive a status code of 200
    And I capture and log the response details
    And The response must match the expected schema for "altos_cargos_schema"

    Examples:
      | sistema  | idEstructura | idVersion | tipoVersion |
      | GENERAL  | 1            | 1         | C           |



  @tc_get_arbol_padres
  Scenario Outline: Returns arbol padres list 200
    Given I prepare the URI "http://localhost:8500/genes/" request with path "dameArbolPadres"
    When I send request paramams "<sistema>", "<idEstructura>", "<idVersion>", "<tipoVersion>", "<idelemento>"
    And I prepare the request headers
      | key        | value |
      | Accept     | */*   |
      | Connection | keep-alive |
    When I send a "GET" request to the endpoints
    Then I should receive a status code of 200
    And I capture and log the response details
    And The response must match the expected schema for "dame_arbol_padres_schema"

    Examples:
      | sistema | idEstructura | idVersion | tipoVersion | idelemento |
      | GENERAL | 1            | 1         | C           | 0805       |


  @tc_get_arbol_hijos
  Scenario Outline: Returns arbol hijos list 200
    Given I prepare the URI "http://localhost:8500/genes/" request with path "dameArbolHijos"
    When I send request paramams "<sistema>", "<idEstructura>", "<idVersion>", "<tipoVersion>", "<idelemento>"
    And I prepare the request headers
      | key        | value |
      | Accept     | */*   |
      | Connection | keep-alive |
    When I send a "GET" request to the endpoints
    Then I should receive a status code of 200
    And I capture and log the response details
    And The response must match the expected schema for "dame_arbol_hijos_schema"

    Examples:
      | sistema | idEstructura | idVersion | tipoVersion | idelemento |
      | GENERAL | 1            | 1         | C           | 0805       |


  @tc_get_busca_unidades
  Scenario: Returns busca unidades list 200
    Given I prepare the URI "http://localhost:8500/genes/" request with path "buscaUnidades"
    When I send request params from JSON file "params_busca_unidades"
    And I prepare the request headers
      | key        | value |
      | Accept     | */*   |
      | Connection | keep-alive |
    When I send a "GET" request to the endpoint
    Then I should receive a status code of 200
    And I capture and log the response details


  @tc_get_busca_unidades_v2
  Scenario Outline: Returns busca unidades list 200 v2
    Given I prepare the URI "http://localhost:8500/genes/" request with path "buscaUnidades"
    When I send request params "<sistema>", "<idEstructura>", "<idVersion>", "<tipoVersion>", "<desde>", "<numeroregistros>", "<atributosPadres>", "<denominacion>", "<orden>", "<recursos>", "<tipo>"
    And I prepare the request headers
      | key        | value |
      | Accept     | */*   |
      | Connection | keep-alive |
    When I send a "GET" request to the endpoint
    Then I should receive a status code of 200
    And I capture and log the response details
    And The response must match the expected schema for "busca_unidades_schema"

    Examples:
      | sistema | idEstructura | idVersion | tipoVersion | desde | numeroregistros | atributosPadres | denominacion | orden | recursos | tipo |
      | GENERAL | 1            | 1         | C           | null  | 10              |    null         | ?            | ?     | null     | ?    |


  @tc_get_dame_datos_personas
  Scenario: Returns dame datos persona list 200
    Given I prepare the URI "http://localhost:8500/genes/" request with path "dameDatosPersona"
    When I send request params nif "16474869S" and fecha
    And I prepare the request headers
      | key        | value |
      | Accept     | */*   |
      | Connection | keep-alive |
    When I send a "GET" request to the endpoints
    Then I should receive a status code of 200
    And I capture and log the response details
    And The response must match the expected schema for "dame_datos_personas_schema"


  @tc_get_dame_empleados
  Scenario Outline: Returns dame empleados list 200
    Given I prepare the URI "http://localhost:8500/genes/" request with path "dameEmpleado"
    When I send request params empleados "<sistema>", "<idEstructura>", "<idVersion>", "<tipoVersion>"
    And I prepare the request headers
      | key        | value |
      | Accept     | */*   |
      | Connection | keep-alive |
    When I send a "GET" request to the endpoint
    Then I should receive a status code of 200
    And I capture and log the response details
    And The response must match the expected schema for "dame_empleados_schema"

    Examples:
      | sistema | idEstructura | idVersion | tipoVersion |
      | GENERAL | 1            | 1         | C           |

  @tc_get_dame_historico_persona
  Scenario Outline: Returns dame historico persona list 200
    Given I prepare the URI "http://localhost:8500/genes/" request with path "dameHistoricoPersona"
    When I send request params historico personas "<sistema>", "<idEstructura>", "<idVersion>", "<tipoVersion>", "<nif>"
    And I prepare the request headers
      | key        | value |
      | Accept     | */*   |
      | Connection | keep-alive |
    When I send a "GET" request to the endpoint
    Then I should receive a status code of 200
    And I capture and log the response details
    And The response must match the expected schema for "dame_historico_persona_schema"

    Examples:
      | sistema | idEstructura | idVersion | tipoVersion | nif       |
      | GENERAL | 1            | 1         | C           | 16565710Y |

  @tc_get_dame_personas_con_propiedades
  Scenario Outline: Returns dame personas con propiedades list 200
    Given I prepare the URI "http://localhost:8500/genes/" request with path "damePersonasConPropiedades"
    When I send request params personas con propiedades "<sistema>", "<idEstructura>", "<idVersion>", "<tipoVersion>", "<numeroregistros>"
    And I prepare the request headers
      | key        | value |
      | Accept     | */*   |
      | Connection | keep-alive |
    When I send a "GET" request to the endpoint
    Then I should receive a status code of 200
    And I capture and log the response details
    And The response must match the expected schema for "dame_personas_con_propiedades_schema"

    Examples:
      | sistema | idEstructura | idVersion | tipoVersion | numeroregistros    |
      | GENERAL | 1            | 1         | C           | 5                  |


  @tc_get_dame_personas
  Scenario Outline: Returns dame personas list 200
    Given I prepare the URI "http://localhost:8500/genes/" request with path "damePersonas"
    When I send request params dame personas "<sistema>", "<idEstructura>", "<idVersion>", "<tipoVersion>", "<numeroregistros>"
    And I prepare the request headers
      | key        | value |
      | Accept     | */*   |
      | Connection | keep-alive |
    When I send a "GET" request to the endpoint
    Then I should receive a status code of 200
    And I capture and log the response details
    And The response must match the expected schema for "dame_personas_schema"

    Examples:
      | sistema | idEstructura | idVersion | tipoVersion | numeroregistros    |
      | GENERAL | 1            | 1         | C           | 5                  |


  @tc_get_dame_unidad
  Scenario Outline: Returns dame unidad list 200
    Given I prepare the URI "http://localhost:8500/genes/" request with path "dameUnidad"
    When I send request params dame unidad "<sistema>", "<idEstructura>", "<idVersion>", "<tipoVersion>"
    And I prepare the request headers
      | key        | value |
      | Accept     | */*   |
      | Connection | keep-alive |
    When I send a "GET" request to the endpoint
    Then I should receive a status code of 200
    And I capture and log the response details
    And The response must match the expected schema for "dame_unidad_schema"

    Examples:
      | sistema | idEstructura | idVersion | tipoVersion |
      | GENERAL | 1            | 1         | C           |


  @tc_get_dame_unidades
  Scenario Outline: Returns dame unidades list 200
    Given I prepare the URI "http://localhost:8500/genes/" request with path "dameUnidades"
    When I send request params dame unidades "<sistema>", "<idEstructura>", "<idVersion>", "<tipoVersion>", "<numeroregistros>"
    And I prepare the request headers
      | key        | value |
      | Accept     | */*   |
      | Connection | keep-alive |
    When I send a "GET" request to the endpoint
    Then I should receive a status code of 200
    And I capture and log the response details
    And The response must match the expected schema for "dame_unidades_schema"

    Examples:
      | sistema | idEstructura | idVersion | tipoVersion | numeroregistros |
      | GENERAL | 1            | 1         | C           | 5               |



  @tc_get_dame_unidad_by_cdc
  Scenario Outline: Returns dame unidades con el Codigo de Directorio Comun list 200
    Given I prepare the URI "http://localhost:8500/genes/" request with path "dameUnidadByCDC"
    When I send request params dame unidade by cdc "<sistema>", "<idEstructura>", "<idVersion>", "<tipoVersion>", "<cdc>"
    And I prepare the request headers
      | key        | value |
      | Accept     | */*   |
      | Connection | keep-alive |
    When I send a "GET" request to the endpoint
    Then I should receive a status code of 200
    And I capture and log the response details
    And The response must match the expected schema for "dame_unidades_schema"

    Examples:
      | sistema | idEstructura | idVersion | tipoVersion | cdc         |
      | GENERAL | 1            | 1         | C           | A17014389   |


  @tc_get_dame_unidades_hijas_con_padres
  Scenario Outline: Returns dame Unidades Hijas Con Padre list 200
    Given I prepare the URI "http://localhost:8500/genes/" request with path "dameUnidadesHijasConPadre"
    When I send request params dame unidade hijas con padre "<sistema>", "<idEstructura>", "<idVersion>", "<tipoVersion>", "<idelemento>"
    And I prepare the request headers
      | key        | value |
      | Accept     | */*   |
      | Connection | keep-alive |
    When I send a "GET" request to the endpoint
    Then I should receive a status code of 200
    And I capture and log the response details
    And The response must match the expected schema for "dame_unidades_hijas_con_padres_schema"

    Examples:
      | sistema | idEstructura | idVersion | tipoVersion | idelemento |
      | GENERAL | 1            | 1         | C           | 1          |