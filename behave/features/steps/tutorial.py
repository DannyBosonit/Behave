from behave import *
from selenium import webdriver
from selenium.webdriver.chrome.service import Service as ChromeService
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import WebDriverWait


@step(u"abriendo web")
def abrir_navegador(context):
    context.chrome_driver_path = "../driver/chromedriver.exe"

    # Configura el controlador Chrome utilizando la ruta del ejecutable
    driver = webdriver.Chrome(executable_path=context.chrome_driver_path)

    # Abre una URL en el navegador
    driver.get("https://opensource-demo.orangehrmlive.com/web/index.php/auth/login")
    driver.maximize_window()

    # Puedes almacenar el controlador en el contexto para acceder a él en otros pasos si es necesario
    context.driver = driver


@step(u"enter user {user} and pswd {paswd} for login")
def insert_user_pswd(context, user, paswd):
    # Encontrar los elementos de usuario y contraseña por XPath e ingresar los valores
    user_input = context.driver.find_element(By.XPATH, "//input[contains(@name,'username')]")
    user_input.send_keys(user)

    paswd_input = context.driver.find_element(By.XPATH, "//input[contains(@name,'password')]")
    paswd_input.send_keys(paswd)

    # Hacer clic en el botón de inicio de sesión
    login_btn = context.driver.find_element(By.XPATH, "//button[@type='submit'][contains(.,'Login')]")
    login_btn.click()

    # Esperar a que se cargue la página de inicio de sesión
    WebDriverWait(context.driver, 10).until(EC.url_contains("dashboard"))

@step(u"Cerrando web")
def cerrar_navegador(context):
    context.driver.quit()



@step('Ejecutando otros steps')
def ejecutando_steps(context):
    context.execute_steps(U"""
        Given I prepare the URI "http://localhost:8500/genes/" request with path "buscaUnidades"
        When I send request params from JSON file "params_busca_unidades"
        And I prepare the request headers
            | key        | value |
            | Accept     | */*   |
            | Connection | keep-alive |
        When I send a "GET" request to the endpoint
        Then I should receive a status code of 200
        And I capture and log the response details
        """)

