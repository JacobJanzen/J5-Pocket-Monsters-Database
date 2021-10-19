# COMP 3380 Project Back End

## Set up

#### Creating the virtual environment

*Linux and macOS:*

Initialize venv
```
.../COMP_3380/back_end $ python3 venv venv
```
Activate venv
```
.../COMP_3380/back_end $ source venv/bin/activate
```
Install the required packages
```
(venv) .../COMP_3380/back_end $ pip install -r requirements
```

#### Running the Flask app

*Linux and macOS:*

Set flaskr to be the app directory
```
(venv) .../COMP_3380/back_end $ export FLASK_APP=flaskr
```
Enable development mode
```
(venv) .../COMP_3380/back_end $ export FLASK_ENV=development
```
Run the flask app
```
(venv) .../COMP_3380/back_end $ flask run
```
