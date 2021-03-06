import os

from flask import Flask
from flask_cors import CORS

from . import db, pokemon, moves, types, locations, breeding, teams, bigdump


def create_app():
    app = Flask(__name__, instance_relative_config=True)
    CORS(app)

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
    app.register_blueprint(types.bp)
    app.register_blueprint(locations.bp)
    app.register_blueprint(breeding.bp)
    app.register_blueprint(teams.bp)
    app.register_blueprint(bigdump.bp)
    
    return app
