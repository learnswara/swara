from flask import Blueprint, request, jsonify
from utils.pagination import paginate
from flasgger import swag_from

classroom_bp = Blueprint('classroom', __name__)

# Mock classroom database
classrooms = []

@classroom_bp.route('/', methods=['GET'])
@paginate
@swag_from({
    'tags': ['Classrooms'],
    'summary': 'Get list of classrooms',
    'parameters': [
        {
            'name': 'page',
            'in': 'query',
            'type': 'integer',
            'default': 1,
            'description': 'Page number'
        },
        {
            'name': 'page_size',
            'in': 'query',
            'type': 'integer',
            'default': 10,
            'description': 'Number of items per page'
        }
    ],
    'responses': {
        200: {
            'description': 'List of classrooms retrieved successfully',
            'schema': {
                'type': 'object',
                'properties': {
                    'message': {'type': 'string'},
                    'status': {'type': 'string'},
                    'data': {
                        'type': 'object',
                        'properties': {
                            'items': {
                                'type': 'array',
                                'items': {
                                    'type': 'object',
                                    'properties': {
                                        'id': {'type': 'integer'},
                                        'name': {'type': 'string'},
                                        'description': {'type': 'string'},
                                        'is_group': {'type': 'boolean'},
                                        'students': {'type': 'array'}
                                    }
                                }
                            },
                            'pagination': {
                                'type': 'object',
                                'properties': {
                                    'total_items': {'type': 'integer'},
                                    'total_pages': {'type': 'integer'},
                                    'current_page': {'type': 'integer'},
                                    'page_size': {'type': 'integer'},
                                    'has_next': {'type': 'boolean'},
                                    'has_prev': {'type': 'boolean'}
                                }
                            }
                        }
                    }
                }
            }
        }
    }
})
def get_classrooms():
    return classrooms

@classroom_bp.route('/', methods=['POST'])
@swag_from({
    'tags': ['Classrooms'],
    'summary': 'Create a new classroom',
    'parameters': [
        {
            'name': 'body',
            'in': 'body',
            'required': True,
            'schema': {
                'type': 'object',
                'properties': {
                    'name': {
                        'type': 'string',
                        'description': 'Name of the classroom',
                        'required': True
                    },
                    'description': {
                        'type': 'string',
                        'description': 'Description of the classroom (max 500 chars)'
                    },
                    'is_group': {
                        'type': 'boolean',
                        'description': 'Whether this is a group classroom',
                        'default': False
                    }
                }
            }
        }
    ],
    'responses': {
        201: {
            'description': 'Classroom created successfully',
            'schema': {
                'type': 'object',
                'properties': {
                    'message': {'type': 'string'},
                    'status': {'type': 'string'},
                    'classroom': {
                        'type': 'object',
                        'properties': {
                            'id': {'type': 'integer'},
                            'name': {'type': 'string'},
                            'description': {'type': 'string'},
                            'is_group': {'type': 'boolean'},
                            'students': {'type': 'array'}
                        }
                    }
                }
            }
        },
        400: {
            'description': 'Invalid input',
            'schema': {
                'type': 'object',
                'properties': {
                    'message': {'type': 'string'},
                    'status': {'type': 'string'}
                }
            }
        }
    }
})
def create_classroom():
    data = request.get_json()
    name = data.get('name')
    description = data.get('description')
    is_group = data.get('is_group', False)  # Default to False if not provided

    # Validate required fields
    if not name:
        return jsonify({
            'message': 'ERROR_CLASSROOM_NAME_REQUIRED',
            'status': 'error'
        }), 400

    # Validate description length
    if description and len(description) > 500:
        return jsonify({
            'message': 'ERROR_CLASSROOM_DESCRIPTION_TOO_LONG',
            'status': 'error'
        }), 400

    # Validate is_group is boolean
    if not isinstance(is_group, bool):
        return jsonify({
            'message': 'ERROR_CLASSROOM_GROUP_INVALID',
            'status': 'error'
        }), 400

    classroom = {
        'id': len(classrooms) + 1,
        'name': name,
        'description': description or '',  # Default to empty string if no description
        'is_group': is_group,
        'students': []
    }

    classrooms.append(classroom)

    return jsonify({
        'message': 'SUCCESS_CLASSROOM_CREATED',
        'status': 'success',
        'classroom': classroom
    }), 201

@classroom_bp.route('/<int:classroom_id>', methods=['GET'])
@swag_from({
    'tags': ['Classrooms'],
    'summary': 'Get a specific classroom by ID',
    'parameters': [
        {
            'name': 'classroom_id',
            'in': 'path',
            'type': 'integer',
            'required': True,
            'description': 'Unique identifier of the classroom'
        }
    ],
    'responses': {
        200: {
            'description': 'Classroom retrieved successfully',
            'schema': {
                'type': 'object',
                'properties': {
                    'message': {'type': 'string'},
                    'status': {'type': 'string'},
                    'classroom': {
                        'type': 'object',
                        'properties': {
                            'id': {'type': 'integer'},
                            'name': {'type': 'string'},
                            'description': {'type': 'string'},
                            'is_group': {'type': 'boolean'},
                            'students': {'type': 'array'}
                        }
                    }
                }
            }
        },
        404: {
            'description': 'Classroom not found',
            'schema': {
                'type': 'object',
                'properties': {
                    'message': {'type': 'string'},
                    'status': {'type': 'string'}
                }
            }
        }
    }
})
def get_classroom(classroom_id):
    classroom = next((c for c in classrooms if c['id'] == classroom_id), None)

    if not classroom:
        return jsonify({
            'message': 'ERROR_CLASSROOM_NOT_FOUND',
            'status': 'error'
        }), 404

    return jsonify({
        'message': 'SUCCESS_CLASSROOM_RETRIEVED',
        'status': 'success',
        'classroom': classroom
    })