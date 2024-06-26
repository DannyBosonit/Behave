from behave.__main__ import main as behave_main
import sys
import json
from jinja2 import Environment, FileSystemLoader
import os
import time


def run_behave_tests():
    sys.argv = sys.argv[:1]  # Limpia los argumentos existentes de sys.argv excepto el nombre del script

    sys.argv.extend([
        "features/pasarelaPagos.feature",
        '--no-capture',
        '--no-skipped',
        "--tags=Get_pasarela_pagos",
        "--format=json",
        "--outfile=output/report.json",
    ])
    behave_main()


def generate_html_report():
    # Rutas a los archivos
    json_file_path = 'output/report.json'
    # log_file_path = 'output/request_details.log'
    final_report_path = 'output/reports/final_report.html'

    # Asegura que los archivos existan antes de proceder
    if not os.path.exists(json_file_path):
        print("Los archivos necesarios para generar el reporte no existen.")
        return

    # Leer y procesar los archivos sin intentar eliminarlos primero
    with open(json_file_path) as json_file:
        json_data = json.load(json_file)

    file_template = "report_template.html"
    env = Environment(loader=FileSystemLoader('output/templates/'))
    template = env.get_template(file_template)
    html_output = template.render(json_data=json_data)

    # Generar o sobrescribir el reporte HTML
    with open(final_report_path, 'w', encoding='utf-8') as html_file:
        html_file.write(html_output)
    print("Reporte HTML generado exitosamente.")


if __name__ == "__main__":
    run_behave_tests()  # Ejecuta las pruebas con Behave
    generate_html_report()  # Genera el reporte HTML
