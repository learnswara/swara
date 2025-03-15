from flask import Blueprint, request, jsonify

classroom_bp = Blueprint('classroom', __name__)

# Mock classroom database
classrooms = []

@classroom_bp.route('/', methods=['GET'])
def get_classrooms():
    return jsonify({
        'message': 'Classrooms retrieved successfully',
        'status': 'success',
        'classrooms': classrooms
    })

@classroom_bp.route('/', methods=['POST'])
def create_classroom():
    data = request.get_json()
    name = data.get('name')
    type = data.get('type')  # 'group' or 'one-on-one'
    
    if not name or not type:
        return jsonify({
            'message': 'Name and type are required',
            'status': 'error'
        }), 400
    
    classroom = {
        'id': len(classrooms) + 1,
        'name': name,
        'type': type,
        'students': []
    }
    
    classrooms.append(classroom)
    
    return jsonify({
        'message': 'Classroom created successfully',
        'status': 'success',
        'classroom': classroom
    }), 201

@classroom_bp.route('/<int:classroom_id>', methods=['GET'])
def get_classroom(classroom_id):
    classroom = next((c for c in classrooms if c['id'] == classroom_id), None)
    
    if not classroom:
        return jsonify({
            'message': 'Classroom not found',
            'status': 'error'
        }), 404
    
    return jsonify({
        'message': 'Classroom retrieved successfully',
        'status': 'success',
        'classroom': classroom
    }) 