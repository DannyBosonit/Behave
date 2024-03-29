# features/rdf.feature
@administracion
@Get_csv
@v_1.0


Feature: Verify list endpoint of CSV


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
