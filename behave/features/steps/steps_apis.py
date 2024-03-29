import json
from os.path import join, dirname
from urllib.parse import urljoin
import requests
from behave import *
from jsonschema import validate
from jsonschema.exceptions import ValidationError


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
