#!/bin/sh

# Recoge todas las configuraciones adicionales
ADDITIONAL_CONFIG=$(awk 'FNR==1{print ""}1' /etc/nginx/additional/*.conf)

# Exporta la variable para que pueda ser usada con envsubst
export ADDITIONAL_CONFIG

# Utiliza envsubst para reemplazar las variables dentro de default.template
envsubst '$$NGINX_HOST,$$ADDITIONAL_CONFIG' </etc/nginx/conf.d/default.template >/etc/nginx/conf.d/default.conf

# Inicia nginx en primer plano
nginx -g 'daemon off;'
