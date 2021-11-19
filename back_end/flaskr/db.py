import os

import sqlite3

import click
from flask import current_app, g
from flask.cli import with_appcontext


def get_db():
    if 'db' not in g:
        g.db = sqlite3.connect('../database/3380_project.db')
        g.db.row_factory = sqlite3.Row

    return g.db


def init_db():
    db = get_db()

    for sql_file in os.listdir('./flaskr/database'):
        print(sql_file)
        if sql_file.endswith('.sql'):
            with current_app.open_resource('database/'+sql_file) as f:
                db.executescript(f.read().decode('utf8'))


def close_db(e=None):
    db = g.pop('db', None)

    if db is not None:
        db.close()


def init_app(app):
    app.teardown_appcontext(close_db)
