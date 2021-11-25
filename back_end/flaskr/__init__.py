import os

from flask import Flask

from . import db, pokemon, moves


def create_app():
    app = Flask(__name__, instance_relative_config=True)

    app.config.from_mapping(
        DATABASE=os.path.join(app.instance_path, 'flaskr.sqlite'),
    )

    # create the path for the sqlite instance
    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    db.init_app(app)

    app.register_blueprint(pokemon.bp)
    app.register_blueprint(moves.bp)

    return app
