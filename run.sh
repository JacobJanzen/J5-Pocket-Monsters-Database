#!/bin/bash
trap ctrl_c INT
function ctrl_c()
{
    pkill flask
    exit
}

cd back_end
python3 -m venv venv
. venv/bin/activate
pip install -r requirements
export FLASK_APP=flaskr
export FLASK_ENV=development
flask run &


cd ../front_end
npm install
npm run serve
