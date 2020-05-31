#!/bin/bash

[[ casa =~ c ]]; echo $?

[[ casa =~ R ]]; echo $?

[[ casa =~ .*aa.* ]]; echo $?

[[ susto =~ ^(s|S|si|SI) ]]; echo $?

[[ SILLA =~ ^(s|S|si|SI) ]]; echo $?

[[ SILLA =~ ^(s|S|si|SI)$ ]]; echo $?

[[ S =~ ^(s|S|si|SI)$ ]]; echo $?

[[ SI =~ ^(s|S|si|SI)$ ]]; echo $?

[[ SId =~ ^(s|S|si|SI)$ ]]; echo $?

[[ n =~ ^(s|S|si|SI)$ ]]; echo $?

echo "verificacion basica de mail"

[[ usuario@correo.com =~ .+@.+\..{3} ]]; echo verificacion del correo $?

[[ usuario@correo.online =~ .+@.+\..{3} ]]; echo verificacion del correo $?

[[ usuario@correo.online =~ ^.+@.+\..{3}$ ]]; echo verificacion del correo $?

[[ usuario@correo.online =~ ^[[:alpha:]]+@.+\..{3}$ ]]; echo verificacion del correo alpha $?

[[ usuario@correo.com =~ ^[[:alpha:]]+@.+\..{3}$ ]]; echo verificacion del correo alpha $?

[[ usuario@correo.ar =~ ^[[:alpha:]]+@.+\..{3}$ ]]; echo verificacion del correo alpha $?

[[ usuario@correo.ar =~ ^[[:alpha:]]+@.+\..{2,5}$ ]]; echo verificacion del correo alpha $?

[[ usuario@correo.esese =~ ^[[:alpha:]]+@.+\..{2,5}$ ]]; echo verificacion del correo alpha $?

[[ usuario@correo.esesee =~ ^[[:alpha:]]+@.+\..{2,5}$ ]]; echo verificacion del correo alpha $?






