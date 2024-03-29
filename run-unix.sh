#!/bin/bash
set -m

# exit and kill flask when ctrl+c is pressed
trap ctrl_c EXIT
function ctrl_c()
{
    echo
    echo "Press CTRL+C to exit"
    fg
    exit
}

# start back end
cd back_end
python3 -m venv venv
. venv/bin/activate
pip install -r requirements
export FLASK_APP=flaskr
export FLASK_ENV=development
flask run &

# start front end
cd ../front_end
export NODE_OPTIONS=--openssl-legacy-provider
npm ci
npm run serve
