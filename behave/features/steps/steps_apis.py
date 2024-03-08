import json
from os.path import join, dirname

import requests
from behave import *
from jsonschema import validate
from jsonschema.exceptions import ValidationError

schema_file_path_altos_cargos = join(dirname(__file__), '../../config/back/altos_cargos_schema.json')


@step('I prepare the URI "{uri_base}" request with path "{path}"')
def step_impl_prepare_uri(context, uri_base, path):
    context.full_url = f"{uri_base}{path}"


@step('I set the query parameters: "{sistema}" with filtro idEstructura "{idEstructura}", '
      'idVersion "{idVersion}", tipoVersion "{tipoVersion}"')
def step_impl_set_query_params_for_altos_cargos(context, sistema, idEstructura, idVersion, tipoVersion):
    context.params = {
        "sistema": sistema,
        "idestructura": idEstructura,
        "idversion": idVersion,
        "tipoversion": tipoVersion
    }


@step('I send request params "{sistema}", "{idEstructura}", "{idVersion}", "{tipoVersion}", '
      '"{desde}", "{numeroregistros}", "{atributosPadres}", "{denominacion}", "{orden}", "{recursos}", "{tipo}"')
def step_impl_set_query_params_for_buscar_unidades(context, sistema, idEstructura, idVersion, tipoVersion, desde,
                                                   numeroregistros, atributosPadres, denominacion, orden, recursos,
                                                   tipo):
    # Convertir "null" a None donde sea necesario
    desde = None if desde == "null" else desde
    numeroregistros = None if numeroregistros == "null" else numeroregistros
    atributosPadres = None if atributosPadres == "null" else atributosPadres
    recursos = None if recursos == "null" else recursos

    context.params = {
        "sistema": sistema,
        "idestructura": idEstructura,
        "idversion": idVersion,
        "tipoversion": tipoVersion,
        "desde": desde,
        "numeroregistros": int(numeroregistros),
        "atributosPadres": atributosPadres,
        "denominacion": denominacion,
        "orden": orden,
        "recursos": recursos,
        "tipo": tipo
    }
    # print(json.dumps(context.params, indent=4))


@step('I send request params empleados "{sistema}", "{idEstructura}", "{idVersion}", "{tipoVersion}"')
def step_impl_set_query_params_for_dame_empleado(context, sistema, idEstructura, idVersion, tipoVersion):
    # Establecer los parámetros fijos
    context.params = {
        "sistema": sistema,
        "idestructura": idEstructura,
        "idversion": idVersion,
        "tipoversion": tipoVersion,
        "fecha": None,
        "idelemento": None,
        "codpersona": None,
        "correoe": None,
        "nif": None,
        "nombre": None,
        "orden": None,
        "desde": None,
        "numeroregistros": 10
    }


@step('I send request params historico personas "{sistema}", "{idEstructura}", "{idVersion}", "{tipoVersion}", "{nif}"')
def step_impl_set_query_params_for_dame_historico_personas(context, sistema, idEstructura, idVersion, tipoVersion, nif):
    true = True
    context.params = {
        "sistema": sistema,
        "idestructura": idEstructura,
        "idversion": idVersion,
        "tipoversion": tipoVersion,
        "fecha": None,
        "idelemento": None,
        "atributosPadres": None,
        "nif": nif,
        "correoe": None,
        "sinActivos": true,
        "tipoMovimiento": None
    }


@step('I send request params personas con propiedades "{sistema}", "{idEstructura}", "{idVersion}", "{tipoVersion}", '
      '"{numeroregistros}"')
def step_impl_set_query_params_for_dame_personas_con_propiedades(context, sistema, idEstructura, idVersion, tipoVersion,
                                                                 numeroregistros):
    context.params = {
        "sistema": sistema,
        "idestructura": idEstructura,
        "idversion": idVersion,
        "tipoversion": tipoVersion,
        "fecha": None,
        "idelemento": None,
        "codigounidadpadre": None,
        "idelementopadre": None,
        "idpersona": None,
        "atributoPadre": None,
        "atributosPadres": [None],
        "autorizadotramitar": None,
        "codigoelemento": None,
        "nif": None,
        "nifnulos": None,
        "nombre": None,
        "orden": None,
        "recibirnotificacion": None,
        "tramitadorhabitual": None,
        "altoCargo": None,
        "aplicacion": None,
        "buscarEnUnidadesDependientes": None,
        "esResponsable": None,
        "idCargo": 0,
        "procedimiento": None,
        "propiedad": None,
        "desde": "",
        "numeroregistros": numeroregistros
    }


@step('I send request params dame personas "{sistema}", "{idEstructura}", "{idVersion}", "{tipoVersion}", '
      '"{numeroregistros}"')
def step_impl_set_query_params_for_dame_personas(context, sistema, idEstructura, idVersion, tipoVersion,
                                                 numeroregistros):
    context.params = {
        "sistema": sistema,
        "idestructura": idEstructura,
        "idversion": idVersion,
        "tipoversion": tipoVersion,
        "fecha": None,
        "idelemento": None,
        "codigounidadpadre": None,
        "idelementopadre": None,
        "idpersona": None,
        "atributoPadre": None,
        "atributosPadres": [None],
        "autorizadotramitar": None,
        "codigoelemento": None,
        "nif": None,
        "nifnulos": None,
        "nombre": None,
        "orden": None,
        "recibirnotificacion": None,
        "tramitadorhabitual": None,
        "desde": "",
        "numeroregistros": numeroregistros
    }


@step('I send request params dame unidad "{sistema}", "{idEstructura}", "{idVersion}", "{tipoVersion}"')
def step_impl_set_query_params_for_dame_unidad(context, sistema, idEstructura, idVersion, tipoVersion, ):
    true = True
    context.params = {
        "sistema": sistema,
        "idestructura": idEstructura,
        "idversion": idVersion,
        "tipoversion": tipoVersion,
        "fecha": None,
        "idelemento": None,
        "codigounidadpadre": None,
        "idelementopadre": None,
        "idpersona": None,
        "atributo": None,
        "atributoPadre": None,
        "atributosPadres": [None],
        "codigounidad": None,
        "codigounidadhijo": None,
        "denominacion": None,
        "idelementohijo": None,
        "nif": None,
        "orden": None,
        "recursos": [None],
        "rellenarPesos": true
    }


@step('I send request params dame unidades "{sistema}", "{idEstructura}", "{idVersion}", "{tipoVersion}", '
      '"{numeroregistros}"')
def step_impl_set_query_params_for_dame_unidades(context, sistema, idEstructura, idVersion, tipoVersion,
                                                 numeroregistros):
    true = True
    context.params = {
        "sistema": sistema,
        "idestructura": idEstructura,
        "idversion": idVersion,
        "tipoversion": tipoVersion,
        "fecha": None,
        "idelemento": None,
        "codigounidadpadre": None,
        "idelementopadre": None,
        "idpersona": None,
        "atributo": None,
        "atributoPadre": None,
        "atributosPadres": [None],
        "codigounidad": None,
        "codigounidadhijo": None,
        "denominacion": None,
        "idelementohijo": None,
        "nif": None,
        "orden": None,
        "recursos": [None],
        "rellenarPesos": true,
        "desde": "",
        "numeroregistros": numeroregistros
    }


@step('I send request params dame unidade by cdc "{sistema}", "{idEstructura}", "{idVersion}", "{tipoVersion}", '
      '"{cdc}"')
def step_impl_set_query_params_for_dame_unidad_by_cdc(context, sistema, idEstructura, idVersion, tipoVersion, cdc):
    true = True
    context.params = {
        "sistema": sistema,
        "idestructura": idEstructura,
        "idversion": idVersion,
        "tipoversion": tipoVersion,
        "fecha": None,
        "cdc": cdc

    }


@step(
    'I send request params dame unidade hijas con padre "{sistema}", "{idEstructura}", "{idVersion}", "{tipoVersion}", '
    '"{idelemento}"')
def step_impl_set_query_params_for_dame_unidad_by_cdc(context, sistema, idEstructura, idVersion, tipoVersion,
                                                      idelemento):
    context.params = {
        "sistema": sistema,
        "idestructura": idEstructura,
        "idversion": idVersion,
        "tipoversion": tipoVersion,
        "fecha": None,
        "idelemento": idelemento

    }


@step('I send request params from JSON file "{schema_filename}"')
def step_impl_set_query_params_for_buscar_unidadess(context, schema_filename):
    # Construir la ruta del archivo JSON
    schema_file_path = join(dirname(__file__), f'../../config/back/{schema_filename}.json')

    # Cargar el JSON desde el archivo
    with open(schema_file_path, 'r') as file:
        params_json = json.load(file)

    # Guardar los parámetros en el contexto
    context.params = params_json


@step('I send request paramams "{sistema}", "{idEstructura}", "{idVersion}", "{tipoVersion}", "{idelemento}"')
def step_impl_set_query_params_for_arbol_padres(context, sistema, idEstructura, idVersion, tipoVersion, idelemento):
    # Construir la cadena de parámetros de consulta directamente
    fecha = ""
    query_params = f"sistema={sistema}&idestructura={idEstructura}&idversion={idVersion}&tipoversion={tipoVersion}&fecha={fecha}&idelemento={idelemento}"
    # Asumiendo que context.full_url ya tiene la URL base configurada
    context.full_url += f"?{query_params}"


@step('I send request params nif "{nif}" and fecha')
def step_impl_set_query_params_for_dame_datos_persona(context, nif):
    # Construir la cadena de parámetros de consulta directamente
    fecha = ""
    query_params = f"fecha={fecha}&nif={nif}"
    # Asumiendo que context.full_url ya tiene la URL base configurada
    context.full_url += f"?{query_params}"
    print(json.dumps(context.full_url, indent=4))


@step('I prepare the request headers')
def step_impl_prepare_headers(context):
    context.headers = {row['key']: row['value'] for row in context.table}


@step('I send a "GET" request to the endpoint')
def step_impl_send_request(context):
    response = requests.get(context.full_url, headers=context.headers, params=context.params)
    context.response = response
    # print(json.dumps(context.full_url, indent=4))


@step('I send a "GET" request to the endpoints')
def step_impl_send_request_2(context):
    response = requests.get(context.full_url, headers=context.headers)
    context.response = response


@step('I should receive a status code of 200')
def step_impl_verify_status_code(context):
    assert context.response.status_code == 200, f"Expected 200, got {context.response.status_code}"


@step("I capture and log the response details")
def step_capture_log_response_details(context):
    response_details = context.response.json()
    print(json.dumps(response_details, indent=4))


@step('The response must match the expected schema for "{schema_filename}"')
def step_validate_response_schema(context, schema_filename):
    try:
        schema_file_path = join(dirname(__file__), f'../../config/back/{schema_filename}.json')
        with open(schema_file_path, 'r') as schema_file:
            expected_schema = json.load(schema_file)
        # print(json.dumps(expected_schema, indent=4))

        validate(instance=context.response.json(), schema=expected_schema)
        print("La respuesta cumple con el esquema esperado.")
    except ValidationError as e:
        print(f"La respuesta no cumple con el esquema esperado: {e.message}")
        assert False, f"La validación del esquema falló: {e}"
