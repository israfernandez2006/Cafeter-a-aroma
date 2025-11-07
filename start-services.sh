#!/bin/bash

# Iniciar MySQL
service mysql start

# Iniciar Apache
service apache2 start

# Mantener el contenedor en ejecución
tail -f /dev/null