from flask import Flask, jsonify
from flask_cors import CORS
from routes.auth import auth_bp
from routes.classroom import classroom_bp
import config

def create_app(config_name='development'):
    app = Flask(__name__)
    app.config.from_object(config.config[config_name])
    
    # Enable CORS
    CORS(app)
    
    # Register blueprints
    app.register_blueprint(auth_bp, url_prefix='/api/auth')
    app.register_blueprint(classroom_bp, url_prefix='/api/classroom')
    
    # Root route
    @app.route('/')
    def index():
        return jsonify({
            "message": "Welcome to Swara API",
            "status": "success"
        })
    
    # Error handlers
    @app.errorhandler(404)
    def not_found(error):
        return jsonify({
            "message": "Resource not found",
            "status": "error"
        }), 404
    
    @app.errorhandler(500)
    def internal_server_error(error):
        return jsonify({
            "message": "Internal server error",
            "status": "error"
        }), 500
    
    return app

if __name__ == '__main__':
    app = create_app()
    app.run(debug=True, host='0.0.0.0', port=5000) 