from behave import *
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
import time


@step('a user visits the login page "{url}"')
def step_visit_login_page(context, url):
    context.service = Service(ChromeDriverManager().install())
    context.browser = webdriver.Chrome(service=context.service)
    context.browser.get(url)
    context.browser.maximize_window()


@step('the user enters a valid username by "{selector_type}" "{selector_value}" and "{username}"')
def step_enter_username(context, selector_type, selector_value, username):
    by = getattr(By, selector_type.upper(), None)
    if by is None:
        raise ValueError(f"Unknown selector type: {selector_type}")
    username_field = context.browser.find_element(by, selector_value)
    username_field.send_keys(username)


@step('the user enters a valid password by "{selector_type}" "{selector_value}" and "{password}"')
def step_enter_password(context, selector_type, selector_value, password):
    by = getattr(By, selector_type.upper(), None)
    if by is None:
        raise ValueError(f"Unknown selector type: {selector_type}")
    password_field = context.browser.find_element(by, selector_value)
    password_field.send_keys(password)


@step('the user clicks on the submit button by "{selector_type}" "{selector_value}"')
def step_click_submit_button(context, selector_type, selector_value):
    by = getattr(By, selector_type.upper(), None)
    if by is None:
        raise ValueError(f"Unknown selector type: {selector_type}")
    submit_button = context.browser.find_element(by, selector_value)
    submit_button.click()


@step('the user enters a valid by "{username}" and "{password}"')
def step_enter_credentials(context, username, password):
    username_field = context.browser.find_element(By.XPATH, "//input[contains(@id,'username')]")
    username_field.send_keys(username)
    password_field = context.browser.find_element(By.XPATH, "//input[contains(@id,'password')]")
    password_field.send_keys(password)


@step('the user clicks on the login button')
def step_click_login_button(context):
    login_button = context.browser.find_element(By.XPATH, "//input[contains(@value,'Iniciar sesión')]")
    login_button.click()


@step('the user should be redirected to the home page "{home_url}"')
def step_verify_redirection(context, home_url):
    WebDriverWait(context.browser, 10).until(EC.url_contains(home_url))
    current_url = context.browser.current_url
    assert current_url == home_url, f"The current URL is not as expected. Expected: {home_url}, Found: {current_url}"


@step('show the current url')
def step_show_current_url(context):
    print(context.browser.current_url)
    time.sleep(4)
    context.browser.quit()
