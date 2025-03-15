from flask import Blueprint, request, jsonify

auth_bp = Blueprint('auth', __name__)

# Mock user database
users = {
    'test@example.com': {
        'password': 'password123',
        'name': 'Test User',
        'role': 'teacher'
    }
}

@auth_bp.route('/login', methods=['POST'])
def login():
    data = request.get_json()
    email = data.get('email')
    password = data.get('password')
    
    if not email or not password:
        return jsonify({
            'message': 'Email and password are required',
            'status': 'error'
        }), 400
    
    user = users.get(email)
    if not user or user['password'] != password:
        return jsonify({
            'message': 'Invalid email or password',
            'status': 'error'
        }), 401
    
    # In a real app, you would generate a JWT token here
    return jsonify({
        'message': 'Login successful',
        'status': 'success',
        'user': {
            'email': email,
            'name': user['name'],
            'role': user['role']
        }
    })

@auth_bp.route('/signup', methods=['POST'])
def signup():
    data = request.get_json()
    email = data.get('email')
    password = data.get('password')
    name = data.get('name')
    
    if not email or not password or not name:
        return jsonify({
            'message': 'Email, password, and name are required',
            'status': 'error'
        }), 400
    
    if email in users:
        return jsonify({
            'message': 'User already exists',
            'status': 'error'
        }), 400
    
    # In a real app, you would hash the password
    users[email] = {
        'password': password,
        'name': name,
        'role': 'teacher'  # Default role
    }
    
    return jsonify({
        'message': 'Signup successful',
        'status': 'success'
    }), 201 