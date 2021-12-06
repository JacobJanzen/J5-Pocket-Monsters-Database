#!/bin/bash
# exit and kill flask when ctrl+c is pressed
trap ctrl_c INT
function ctrl_c()
{
    kill $(ps -o pid= --ppid $$)
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
npm ci
npm run serve
