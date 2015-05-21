#!/usr/bin/env bash

set -e

SETTINGS_FILE=${SETTINGS_FILE:-settings.coffee}

generate_config() {
  echo 'generating config file'
  echo 'coping default settings...'
  cp settings-sample.coffee settings.coffee
  echo 'here be the dragons...' # somewere here it should replace values based on ENV
}


if [ ! -f $SETTINGS_FILE ]; then  
  generate_config
fi


exec "$@"

