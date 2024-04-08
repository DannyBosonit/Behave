# features/environment.py
import os
import importlib.util


def load_config_module(context, config_relative_path):
    # Construye la ruta absoluta al archivo de configuración
    base_dir = os.path.dirname(os.path.dirname(__file__))
    config_path = os.path.join(base_dir, config_relative_path)

    # Cargar el módulo de configuración dinámicamente
    spec = importlib.util.spec_from_file_location("config_module", config_path)
    config_module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(config_module)

    return config_module


def before_all(context):
    # Cargar múltiples archivos de configuración
    back_config = load_config_module(context, 'config/back/variables.py')
    front_config = load_config_module(context, 'config/front/variables.py')

    # Asignar las variables de configuración al contexto
    context.back_config = back_config.credentials  # Acceso a configuraciones de back
    context.front_config = front_config.credentials  # Acceso a configuraciones de front

    # Puedes seguir agregando más configuraciones de la misma manera
