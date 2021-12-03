# COMP 3380 Project Back End

## Set up

#### Creating the virtual environment

*Linux and macOS:*

Initialize venv
```
.../3380_Project/back_end $ python3 -m venv venv
```
Activate venv
```
.../3380_Project/back_end $ source venv/bin/activate
```
Install the required packages
```
(venv) .../3380_Project/back_end $ pip install -r requirements
```

*Windows:*

Initialize venv
```
...\3380_Project\back_end > python3 -m venv venv
```
Activate venv
```
...\3380_Project\back_end > venv\Scripts\activate
```
Install the required packages
```
(venv) ...\3380_Project\back_end > pip install -r requirements
```

#### Running the Flask app

*Linux and macOS:*

Run the shell script
```
(venv) .../3380_Project/back_end $ source ./run.sh
```

*Windows*

Run the batch script
```
(venv) ...\3380_Project\back_end > run.bat
```

##### OR

*Linux and macOS:*

Set flaskr to be the app directory
```
(venv) .../3380_Project/back_end $ export FLASK_APP=flaskr
```
Enable development mode
```
(venv) .../3380_Project/back_end $ export FLASK_ENV=development
```
Run the flask app
```
(venv) .../3380_Project/back_end $ flask run
```

*Windows*
Set flaskr to be the app directory
```
(venv) ...\3380_Project\back_end > set FLASK_APP=flaskr
```
Enable development mode
```
(venv) ...\3380_Project\back_end > set FLASK_ENV=development
```
Run the flask app
```
(venv) .../3380_Project/back_end > flask run
```

