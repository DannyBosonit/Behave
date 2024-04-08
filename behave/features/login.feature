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
    When the user enters a valid username by "xpath" "//input[contains(@id,'username')]" and "credentials.user.username"
    And the user enters a valid password by "xpath" "//input[contains(@id,'password')]" and "credentials.user.password"
    And the user clicks on the submit button by "xpath" "//input[contains(@value,'Iniciar sesión')]"
    Then the user should be redirected to the home page "https://parascrapear.com/"
    And show the current url

  @tc_001_baxter
  Scenario: User successfully logs in baxter
    Given a user visits the login page "https://vrcp-demo.baxter.com/Versiaasn/login.aspx"
    When the user enters a valid username by "xpath" "//input[@name='userTextBox']" and "demovip"
    And the user enters a valid password by "xpath" "//input[@name='passTextBox']" and "demovip2"
    And the user clicks on the submit button by "xpath" "//a[contains(@id,'btnAceptarLogin')]"
    Then the user should be redirected to the home page "https://vrcp-demo.baxter.com/Versiaasn/Main.aspx#/"
    And show the current url

  #@tc_ejecutando_otros_steps
  #Scenario: Ejecutando otros steps de prueba
   # Given Ejecutando otros steps