# features/Apis.feature
@administracion
@Get_genes
@v_1

Feature: Verify list endpoint of Genes

  @tc_get_altos_cargos
  Scenario: Returns Altos Cargos list 200
    Given I prepare the URI "http://localhost:8500/genes/" request with path "altosCargos"
    When I set the query parameters for "altosCargos"
      | key         | value       |
      | sistema     | GENERAL     |
      | idestructura| 1           |
      | idversion   | 1           |
      | tipoversion | C           |
    And I prepare the request headers
      | key        | value       |
      | Accept     | */*         |
      | Connection | keep-alive  |
    When I send a "GET" request to the endpoint
    Then I should receive a status code of 200
    And I capture and log the response details
    And The response must match the expected schema for "altos_cargos_schema"

  @tc_get_arbol_padres
  Scenario: Returns arbol padres list 200
    Given I prepare the URI "http://localhost:8500/genes/" request with path "dameArbolPadres"
    When I set the query parameters for "dameArbolPadres"
      | key         | value   |
      | sistema     | GENERAL |
      | idestructura| 1       |
      | idversion   | 1       |
      | tipoversion | C       |
      | fecha       | null    |
      | idelemento  | 1087    |
    And I prepare the request headers
      | key        | value       |
      | Accept     | */*         |
      | Connection | keep-alive  |
    When I send a "GET" request to the endpoint
    Then I should receive a status code of 200
    And I capture and log the response details
    And The response must match the expected schema for "dame_arbol_padres_schema"



  @tc_get_arbol_hijos
  Scenario: Returns arbol hijos list 200
    Given I prepare the URI "http://localhost:8500/genes/" request with path "dameArbolHijos"
    When I set the query parameters for "dameArbolHijos"
      | key         | value   |
      | sistema     | GENERAL |
      | idestructura| 1       |
      | idversion   | 1       |
      | tipoversion | C       |
      | fecha       | null    |
      | idelemento  | 0805    |
    And I prepare the request headers
      | key        | value |
      | Accept     | */*   |
      | Connection | keep-alive |
    When I send a "GET" request to the endpoint
    Then I should receive a status code of 200
    And I capture and log the response details
    And The response must match the expected schema for "dame_arbol_hijos_schema"


  @tc_get_busca_unidades
  Scenario: Returns busca unidades list 200
    Given I prepare the URI "http://localhost:8500/genes/" request with path "buscaUnidades"
    When I set the query parameters for "buscaUnidades"
      | key             | value   |
      | sistema         | GENERAL |
      | desde           | null    |
      | numeroregistros |  5      |
      | idestructura    | 1       |
      | idversion       | 1       |
      | tipoversion     | C       |
      | atributosPadres | null    |
      | denominacion    | null    |
      | orden           | null    |
      | denominacion    | null    |
      | recursos        | null    |
      | tipo            | null    |
    And I prepare the request headers
      | key        | value       |
      | Accept     | */*         |
      | Connection | keep-alive  |
    When I send a "GET" request to the endpoint
    Then I should receive a status code of 200
    And I capture and log the response details
    And The response must match the expected schema for "busca_unidades_schema"


  @tc_get_dame_datos_persona
  Scenario: Returns dame datos persona list 200
    Given I prepare the URI "http://localhost:8500/genes/" request with path "dameDatosPersona"
    When I set the query parameters for "dameDatosPersona"
      | key             | value     |
      | fecha           | null      |
      | nif             | 16565710Y |
    And I prepare the request headers
      | key        | value |
      | Accept     | */*   |
      | Connection | keep-alive |
    When I send a "GET" request to the endpoint
    Then I should receive a status code of 200
    And I capture and log the response details
    And The response must match the expected schema for "dame_datos_personas_schema"


  @tc_get_dame_empleado
  Scenario: Returns dame empleado list 200
    Given I prepare the URI "http://localhost:8500/genes/" request with path "dameEmpleado"
    When I set the query parameters for "dameEmpleado"
      | key             | value   |
      | sistema         | GENERAL |
      | desde           | null    |
      | numeroregistros | 5       |
      | idestructura    | 1       |
      | idversion       | 1       |
      | tipoversion     | C       |
      | fecha           | null    |
      | idelemento      | null    |
      | codpersona      | null    |
      | correoe         | null    |
      | nif             | null    |
      | nombre          | null    |
      | orden           | null    |
    And I prepare the request headers
      | key        | value |
      | Accept     | */*   |
      | Connection | keep-alive |
    When I send a "GET" request to the endpoint
    Then I should receive a status code of 200
    And I capture and log the response details
    And The response must match the expected schema for "dame_empleados_schema"


  @tc_get_dame_historico_persona
  Scenario: Returns dame historico persona list 200
    Given I prepare the URI "http://localhost:8500/genes/" request with path "dameHistoricoPersona"
    When I set the query parameters for "dameHistoricoPersona"
      | key             | value   |
      | sistema         | GENERAL |
      | idestructura    | 1       |
      | idversion       | 1       |
      | tipoversion     | C       |
      | fecha           | null    |
      | idelemento      | null    |
      | atributosPadres | null    |
      | nif             | 16565710Y |
      | sinActivos      | true    |
      | tipoMovimiento  | null    |
    And I prepare the request headers
      | key        | value |
      | Accept     | */*   |
      | Connection | keep-alive |
    When I send a "GET" request to the endpoint
    Then I should receive a status code of 200
    And I capture and log the response details
    And The response must match the expected schema for "dame_historico_persona_schema"

  @tc_get_dame_personas_con_propiedades
  Scenario: Returns dame personas con propiedades list 200
    Given I prepare the URI "http://localhost:8500/genes/" request with path "damePersonasConPropiedades"
    When I set the query parameters for "damePersonasConPropiedades"
      | key                          | value   |
      | sistema                      | GENERAL |
      | desde                        | null    |
      | numeroregistros              | 5       |
      | idestructura                 | 1       |
      | idversion                    | 1       |
      | tipoversion                  | C       |
      | fecha                        | null    |
      | idelemento                   | null    |
      | codigounidadpadre            | null    |
      | idelementopadre              | null    |
      | idpersona                    | null    |
      | atributoPadre                | null    |
      | atributosPadres[0]           | null    |
      | autorizadotramitar           | null    |
      | codigoelemento               | null    |
      | nif                          | null    |
      | nifnulos                     | null    |
      | nombre                       | null    |
      | orden                        | null    |
      | recibirnotificacion          | null    |
      | tramitadorhabitual           | null    |
      | altoCargo                    | null    |
      | aplicacion                   | null    |
      | buscarEnUnidadesDependientes | null    |
      | esResponsable                | null    |
      | idCargo                      | 0       |
      | procedimiento                | null    |
      | propiedad                    | null    |
    And I prepare the request headers
      | key        | value       |
      | Accept     | */*         |
      | Connection | keep-alive  |
    When I send a "GET" request to the endpoint
    Then I should receive a status code of 200
    And I capture and log the response details
    And The response must match the expected schema for "dame_personas_con_propiedades_schema"

  @tc_get_dame_personas
  Scenario: Returns dame personas list 200
    Given I prepare the URI "http://localhost:8500/genes/" request with path "damePersonas"
    When I set the query parameters for "damePersonas"
      | key                          | value   |
      | sistema                      | GENERAL |
      | desde                        | null    |
      | numeroregistros              | 5       |
      | idestructura                 | 1       |
      | idversion                    | 1       |
      | tipoversion                  | C       |
      | fecha                        | null    |
      | idelemento                   | null    |
      | codigounidadpadre            | null    |
      | idelementopadre              | null    |
      | idpersona                    | null    |
      | atributoPadre                | null    |
      | atributosPadres[0]           | null    |
      | autorizadotramitar           | null    |
      | codigoelemento               | null    |
      | nif                          | null    |
      | nifnulos                     | null    |
      | nombre                       | null    |
      | orden                        | null    |
      | recibirnotificacion          | null    |
      | tramitadorhabitual           | null    |
    And I prepare the request headers
      | key        | value |
      | Accept     | */*   |
      | Connection | keep-alive |
    When I send a "GET" request to the endpoint
    Then I should receive a status code of 200
    And I capture and log the response details
    And The response must match the expected schema for "dame_personas_schema"

  @tc_get_dame_unidad
  Scenario: Returns dame unidad list 200
    Given I prepare the URI "http://localhost:8500/genes/" request with path "dameUnidad"
    When I set the query parameters for "dameUnidad"
      | key                          | value   |
      | sistema                      | GENERAL |
      | idestructura                 | 1       |
      | idversion                    | 1       |
      | tipoversion                  | C       |
      | fecha                        | null    |
      | idelemento                   | null    |
      | codigounidadpadre            | null    |
      | idelementopadre              | null    |
      | idpersona                    | null    |
      | atributo                     | null    |
      | atributoPadre                | null    |
      | atributosPadres[0]           | null    |
      | codigounidad                 | null    |
      | codigounidadhijo             | null    |
      | denominacion                 | null    |
      | idelementohijo               | null    |
      | nif                          | null    |
      | orden                        | null    |
      | recursos[0]                  | null    |
      | rellenarPesos                | true    |
    And I prepare the request headers
      | key        | value       |
      | Accept     | */*         |
      | Connection | keep-alive  |
    When I send a "GET" request to the endpoint
    Then I should receive a status code of 200
    And I capture and log the response details
    And The response must match the expected schema for "dame_unidad_schema"



  @tc_get_dame_unidades
  Scenario: Returns dame unidades list 200
    Given I prepare the URI "http://localhost:8500/genes/" request with path "dameUnidades"
    When I set the query parameters for "dameUnidades"
      | key                          | value   |
      | sistema                      | GENERAL |
      | desde                        | null    |
      | numeroregistros              | 5       |
      | idestructura                 | 1       |
      | idversion                    | 1       |
      | tipoversion                  | C       |
      | fecha                        | null    |
      | idelemento                   | null    |
      | codigounidadpadre            | null    |
      | idelementopadre              | null    |
      | idpersona                    | null    |
      | atributo                     | null    |
      | atributoPadre                | null    |
      | atributosPadres[0]           | null    |
      | codigounidad                 | null    |
      | codigounidadhijo             | null    |
      | denominacion                 | null    |
      | idelementohijo               | null    |
      | nif                          | null    |
      | orden                        | null    |
      | recursos[0]                  | null    |
      | rellenarPesos                | true    |
    And I prepare the request headers
      | key        | value       |
      | Accept     | */*         |
      | Connection | keep-alive  |
    When I send a "GET" request to the endpoint
    Then I should receive a status code of 200
    And I capture and log the response details
    And The response must match the expected schema for "dame_unidades_schema"


  @tc_get_dame_unidad_by_cdc
  Scenario: Returns dame unidades con el Codigo de Directorio Comun list 200
  Given I prepare the URI "http://localhost:8500/genes/" request with path "dameUnidadByCDC"
  When I set the query parameters for "dameUnidadByCDC"
    | key          | value     |
    | sistema      | GENERAL   |
    | idestructura | 1         |
    | idversion    | 1         |
    | tipoversion  | C         |
    | fecha        | null      |
    | cdc          | A17023741 |
  And I prepare the request headers
    | key        | value       |
    | Accept     | */*         |
    | Connection | keep-alive  |
  When I send a "GET" request to the endpoint
  Then I should receive a status code of 200
  And I capture and log the response details
  And The response must match the expected schema for "dame_unidades_schema"

  @tc_get_elementos_Personal_Con_Ambito
  Scenario: Returns get elementos personal con ambito list 200
  Given I prepare the URI "http://localhost:8500/genes/" request with path "getElementosPersonalConAmbito"
  When I set the query parameters for "getElementosPersonalConAmbito"
    | key           | value     |
    | sistema       | GENERAL   |
    | idEstructura  | int, 1    |
    | idVersion     | int, 1    |
    | tipoVersion   | C         |
    | aplicacion    | OFIVIR    |
    | idElemento    | int, 1087 |
    | procedimiento | null      |
    | propiedad     | null      |
  And I prepare the request headers
    | key        | value       |
    | Accept     | */*         |
    | Connection | keep-alive  |
  When I send a "GET" request to the endpoint
  Then I should receive a status code of 200
  And I capture and log the response details
  And The response must match the expected schema for "getElementosPersonalConAmbito"

  @tc_get_Elementos_Personal_Con_Ambito_Padres
  Scenario: Returns get elementos personal con ambito padres list 200
  Given I prepare the URI "http://localhost:8500/genes/" request with path "getElementosPersonalConAmbitoPadres"
  When I set the query parameters for "getElementosPersonalConAmbitoPadres"
    | key           | value     |
    | sistema       | GENERAL   |
    | idEstructura  | int, 1    |
    | idVersion     | int, 1    |
    | tipoVersion   | C         |
    | aplicacion    | OFIVIR    |
    | idElemento    | int, 1087 |
    | procedimiento | null      |
    | propiedad     | null      |
  And I prepare the request headers
    | key        | value       |
    | Accept     | */*         |
    | Connection | keep-alive  |
  When I send a "GET" request to the endpoint
  Then I should receive a status code of 200
  And I capture and log the response details
  And The response must match the expected schema for "get_ElementosPersonalConAmbitoPadres"

 @tc_get_Elementos_Personal_Pro_Con_Ambito
  Scenario: Returns get elementos personal Pro con ambito list 200
  Given I prepare the URI "http://localhost:8500/genes/" request with path "getElementosPersonalPropConAmbito"
  When I set the query parameters for "getElementosPersonalPropConAmbito"
    | key           | value     |
    | sistema       | GENERAL   |
    | idEstructura  | int, 1    |
    | idVersion     | int, 1    |
    | tipoVersion   | C         |
    | aplicacion    | OFIVIR    |
    | idElemento    | int, 1087 |
    | procedimiento | null      |
    | propiedad     | null      |
  And I prepare the request headers
    | key        | value       |
    | Accept     | */*         |
    | Connection | keep-alive  |
  When I send a "GET" request to the endpoint
  Then I should receive a status code of 200
  And I capture and log the response details
  And The response must match the expected schema for "get_ElementosPersonalConAmbitoPadres"


  @tc_get_propiedades_persona
  Scenario: Returns get propiedades persona list 200
  Given I prepare the URI "http://localhost:8500/genes/" request with path "getPropiedadesPersona"
  When I set the query parameters for "getPropiedadesPersona"
    | key           | value     |
    | sistema       | GENERAL   |
    | idEstructura  | int, 1    |
    | idVersion     | int, 1    |
    | tipoVersion   | C         |
    | aplicacion    | OFIVIR    |
    | idElemento    | int, 1087 |
    | procedimiento | null      |
    | propiedad     | null      |
    | nif           | 16545556T |
  And I prepare the request headers
    | key        | value       |
    | Accept     | */*         |
    | Connection | keep-alive  |
  When I send a "GET" request to the endpoint
  Then I should receive a status code of 200
  And I capture and log the response details
  And The response must match the expected schema for "get_propiedades_persona"

  @tc_get_propiedades_persona_tipo
  Scenario: Returns get propiedades persona tipo list 200
  Given I prepare the URI "http://localhost:8500/genes/" request with path "getPropiedadesPersonaTipo"
  When I set the query parameters for "getPropiedadesPersonaTipo"
    | key           | value     |
    | sistema       | GENERAL   |
    | idEstructura  | int, 1    |
    | idVersion     | int, 1    |
    | tipoVersion   | C         |
    | aplicacion    | OFIVIR    |
    | idElemento    | int, 1087 |
    | procedimiento | null      |
    | propiedad     | null      |
    | nif           | 16545556T |
    | tipo          | null      |
  And I prepare the request headers
    | key        | value       |
    | Accept     | */*         |
    | Connection | keep-alive  |
  When I send a "GET" request to the endpoint
  Then I should receive a status code of 200
  And I capture and log the response details
  And The response must match the expected schema for "get_propiedades_persona_tipo_schema"

  @tc_is_Persona_Propiedad
  Scenario: Returns get is Persona Propiedad list 200
    Given I prepare the URI "http://localhost:8500/genes/" request with path "isPersonaPropiedad"
    When I set the query parameters for "isPersonaPropiedad"
      | key           | value      |
      | sistema       | GENERAL    |
      | idEstructura  | int, 1     |
      | idVersion     | int, 1     |
      | tipoVersion   | C          |
      | aplicacion    | OFIVIR     |
      | idElemento    | int, 13264 |
      | procedimiento | 12149      |
      | propiedad     | 01         |
      | nif           | 15413838C  |
    And I prepare the request headers
      | key        | value       |
      | Accept     | */*         |
      | Connection | keep-alive  |
    When I send a "GET" request to the endpoint
    Then I should receive a status code of 200
    And I capture and log the response details
    And The response must match the expected schema for "is_persona_propiedad_schema"

  @tc_get_elementos_relacionados
  Scenario: Returns get elementos relacionados list 200
    Given I prepare the URI "http://localhost:8500/genes/" request with path "getElementosRelacionados"
    When I set the query parameters for "getElementosRelacionados"
      | key                | value     |
      | sistema            | GENERAL   |
      | idEstructura       | int, 1    |
      | idVersion          | int, 1    |
      | tipoVersion        | C         |
      | idEstrRelacionada  | int, 202  |
    And I prepare the request headers
      | key        | value       |
      | Accept     | */*         |
      | Connection | keep-alive  |
    When I send a "GET" request to the endpoint
    Then I should receive a status code of 200
    And I capture and log the response details
    And The response must match the expected schema for "get_elementos_relacionados_schema"





