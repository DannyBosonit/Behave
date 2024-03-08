# features/login.feature
@Todos_los_features



Feature: Login to the web page
  As a user, I want to log into my account to access exclusive features

  @tc_login
  Scenario: User successfully logs in
    Given a user visits the login page "https://parascrapear.com/login"
    When the user enters a valid by "XPATH" "admin" and "admin123"
    And the user clicks on the login button
    And the user should be redirected to the home page "https://parascrapear.com/"
    Then show the current url

  @tc_001
  Scenario: User successfully logs in
    Given a user visits the login page "https://parascrapear.com/login"
    When the user enters a valid username by "xpath" "//input[contains(@id,'username')]" and "admin"
    And the user enters a valid password by "xpath" "//input[contains(@id,'password')]" and "admin123"
    And the user clicks on the submit button by "xpath" "//input[contains(@value,'Iniciar sesión')]"
    Then the user should be redirected to the home page "https://parascrapear.com/"
    And show the current url

  #@tc_ejecutando_otros_steps
  #Scenario: Ejecutando otros steps de prueba
   # Given Ejecutando otros steps