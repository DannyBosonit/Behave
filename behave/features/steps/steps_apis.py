import json
from base64 import b64encode
from os.path import join, dirname
from urllib.parse import urljoin
import requests
from behave import *
from jsonschema import validate
from jsonschema.exceptions import ValidationError
import os


@step('I prepare the URI "{uri_base}" request with path "{path}"')
def step_impl_prepare_uri(context, uri_base, path):
    """
    Prepares the full URL by combining a base URI and a path.

    This step takes a base URI and a path as input and combines them to form a complete URL.
    The resulting full URL is stored in the context for later use in the tests.

    :param context: The test context.
    :param uri_base: The base URI to which the path will be added.
    :param path: The path to be added to the base URI.
    :return: None

    Example:
    Given the base URI is "https://api.example.com" and the path is "/users",
    the result would be "https://api.example.com/users".
    """
    context.full_url = urljoin(uri_base, path)
    assert context.full_url, "The full URL is empty"


@step('I set the query parameters for "{endpoint}"')
def step_impl_set_query_params(context, endpoint):
    """
    Sets the query parameters for the specified endpoint.

    :param context: The test context.
    :param endpoint: The endpoint for which to set the parameters.
    :return: None
    """
    # Obtener los parámetros del escenario
    params_table = context.table  # Obtiene la tabla de parámetros del escenario

    # Configurar los parámetros en el contexto como un diccionario
    context.params = {}
    for row in params_table:
        key = row['key'].strip()  # Obtener el nombre del parámetro
        value = row['value'].strip()  # Obtener el valor del parámetro

        # Verificar si el valor debe ser convertido a entero
        if value.startswith('int,'):
            value = int(value.split(',')[1].strip())
        elif value.lower() == 'null':
            value = None

        context.params[key] = value

    # Ejemplo de impresión de parámetros (para fines de depuración)
    print(f"Query parameters for {endpoint}:{json.dumps(context.params, indent=4)}")


@step('I prepare the request headers')
def step_impl_prepare_headers(context):
    """
    Prepares the request headers using the provided table.

    :param context: The test context.
    :return: None
    """
    # Extract headers from the table and create a dictionary
    headers = {row['key']: row['value'] for row in context.table}

    # Set the headers in the context
    context.headers = headers


@step('I send a "GET" request to the endpoint')
def step_impl_send_request(context):
    """
    Sends a GET request to the specified endpoint.

    :param context: The test context.
    :return: None
    """
    # Send a GET request using requests library
    response = requests.get(context.full_url, headers=context.headers, params=context.params)

    # Store the response in the context for later use
    context.response = response

    # Print the URL for debugging purposes
    print(json.dumps(context.full_url, indent=4))


@step('I should receive a status code of 200')
def step_impl_verify_status_code(context):
    """
    Verifies that the response status code is 200.

    :param context: The test context.
    :return: None
    """
    # Assert that the response status code is 200
    assert context.response.status_code == 200, f"Expected 200, got {context.response.status_code}"


@step("I capture and log the response details")
def step_capture_log_response_details(context):
    """
    Captures and logs the response details.

    :param context: The test context.
    :return: None
    """
    # Extract response details and print them with indentation
    response_details = context.response.json()
    print(json.dumps(response_details, indent=4))


@step('The response must match the expected schema for "{schema_filename}"')
def step_validate_response_schema(context, schema_filename):
    """
    Validates if the response matches the expected schema.

    :param context: The test context.
    :param schema_filename: The filename of the schema.
    :return: None
    """
    try:
        # Load the expected schema from the schema file
        schema_file_path = join(dirname(__file__), f'../../config/back/{schema_filename}.json')
        with open(schema_file_path, 'r') as schema_file:
            expected_schema = json.load(schema_file)

        # Validate the response against the expected schema
        validate(instance=context.response.json(), schema=expected_schema)
        print("The response matches the expected schema.")
    except ValidationError as e:
        # If validation fails, print error message and assert False to fail the step
        print(f"The response does not match the expected schema: {e.message}")
        assert False, f"Schema validation failed: {e}"


@step('I have the PDF file')
def step_given_have_pdf_file(context):
    """
    Verifies that the specified PDF file exists and loads its content into the context.

    :param context: The test context.
    :return: None
    """
    file_path = os.path.abspath(os.path.join(dirname(__file__), '../../config/files/dummy.pdf'))
    print(f"Loading PDF file from: {file_path}")
    try:
        with open(file_path, 'rb') as file:
            context.file_content = file.read()
    except FileNotFoundError:
        assert False, f"The PDF file '{file_path}' does not exist"
    except Exception as e:
        print(f"An error occurred while loading the PDF file: {e}")
        assert False, f"Error loading PDF file: {e}"


@step('I set the request body for PDF signing with alias "{alias}" and password "{password}"')
def step_when_set_request_body_pdf(context, alias, password):
    """
    Sets the request body for PDF signing with the provided alias and password, replacing the placeholder with the PDF file content.

    :param context: The test context.
    :param alias: The alias for the PDF document.
    :param password: The password for the PDF document.
    :return: None
    """
    print("Setting request body for PDF signing...")
    context.request_body = {
        "archive": "<base64_encoded_pdf_file>",
        "format": "PDF",
        "properties": {
            "alias": alias,
            "pwd": password
        }
    }
    # Encode the PDF file content to base64 and replace the placeholder in the request body
    encoded_pdf_file = b64encode(context.file_content).decode('utf-8')
    context.request_body['archive'] = encoded_pdf_file


@step('I have the XML file')
def step_given_have_xml_file(context):
    """
    Verifies that the specified XML file exists and loads its content into the context.

    :param context: The test context.
    :return: None
    """
    file_path = os.path.abspath(os.path.join(dirname(__file__), '../../config/files/dummy.xml'))
    print(f"Loading XML file from: {file_path}")
    try:
        with open(file_path, 'rb') as file:
            context.file_content = file.read()
    except FileNotFoundError:
        assert False, f"The XML file '{file_path}' does not exist"
    except Exception as e:
        print(f"An error occurred while loading the XML file: {e}")
        assert False, f"Error loading XML file: {e}"


@step('I set the request body for XML signing with alias "{alias}" and password "{password}"')
def step_when_set_request_body_xml(context, alias, password):
    """
    Sets the request body for XML signing with the provided alias and password, replacing the placeholder with the XML file content.

    :param context: The test context.
    :param alias: The alias for the XML document.
    :param password: The password for the XML document.
    :return: None
    """
    print("Setting request body for XML signing...")
    context.request_body = {
        "archive": "<base64_encoded_xml_file>",
        "format": "XML",
        "properties": {
            "alias": alias,
            "pwd": password
        }
    }
    # Encode the XML file content to base64 and replace the placeholder in the request body
    encoded_xml_file = b64encode(context.file_content).decode('utf-8')
    context.request_body['archive'] = encoded_xml_file


@step('I set the request headers as follows')
def step_when_set_request_headers(context):
    """
    Sets the request headers with the provided key-value pairs.

    :param context: The test context.
    :return: None
    """
    print("Setting request headers...")
    # Parse and store the request headers from the provided table
    context.request_headers = {row['Content-Type']: row['application/json'] for row in context.table}


@step('I send a "{method}" request to "{url}"')
def step_when_send_request(context, method, url):
    """
    Sends a HTTP request with the specified method to the provided URL.

    :param context: The test context.
    :param method: The HTTP method (GET, POST, PUT, DELETE, etc.).
    :param url: The URL to send the request to.
    :return: None
    """
    print(f"Sending {method} request to: {url}")
    # Send the HTTP request using the specified method, headers, and request body
    response = requests.request(method, url, headers=context.request_headers, json=context.request_body)

    # Store the response in the context for later use
    context.response = response


@step('the response status code should be {status_code}')
def step_then_check_response_status_code(context, status_code):
    """
    Verifies that the response status code matches the expected code.

    :param context: The test context.
    :param status_code: The expected HTTP status code.
    :return: None
    """
    print(f"Verifying response status code...")
    # Assert that the response status code matches the expected code
    assert context.response.status_code == int(
        status_code), f"Expected status code {status_code}, but got {context.response.status_code}"


@step('The response must match the expected schema "{schema_filename}"')
def step_validate_response_schema(context, schema_filename):
    """
    Validates if the response matches the expected schema specified by the schema filename.

    :param context: The test context.
    :param schema_filename: The filename of the schema.
    :return: None
    """
    try:
        # Load the expected schema from the schema file
        schema_file_path = os.path.abspath(os.path.join(dirname(__file__), f'../../config/back/{schema_filename}.json'))
        with open(schema_file_path, 'r') as schema_file:
            expected_schema = json.load(schema_file)

        # Validate the response against the expected schema
        validate(instance=context.response.json(), schema=expected_schema)
        print("The response matches the expected schema.")
    except ValidationError as e:
        # If validation fails, print error message and assert False to fail the step
        print(f"The response does not match the expected schema: {e.message}")
        assert False, f"Schema validation failed: {e}"


