from functools import wraps
from flask import request, jsonify

def paginate(func):
    """
    A decorator to handle pagination for API endpoints.
    Usage:
        @paginate
        def get_items():
            return items_list
    """
    @wraps(func)
    def wrapper(*args, **kwargs):
        # Get pagination parameters
        page = request.args.get('page', default=1, type=int)
        page_size = request.args.get('page_size', default=10, type=int)

        # Validate pagination parameters
        if page < 1:
            return jsonify({
                'message': 'ERROR_PAGE_NUMBER_INVALID',
                'status': 'error'
            }), 400

        if page_size < 1 or page_size > 100:
            return jsonify({
                'message': 'ERROR_PAGE_SIZE_INVALID',
                'status': 'error'
            }), 400

        # Get the data from the wrapped function
        result = func(*args, **kwargs)

        # Calculate pagination
        start_idx = (page - 1) * page_size
        end_idx = start_idx + page_size

        # Paginate the data
        items = result[start_idx:end_idx]

        return jsonify({
            'message': 'SUCCESS_ITEMS_RETRIEVED',
            'status': 'success',
            'data': {
                'items': items,
                'pagination': {
                    'total_items': len(result),
                    'total_pages': (len(result) + page_size - 1) // page_size,
                    'current_page': page,
                    'page_size': page_size,
                    'has_next': end_idx < len(result),
                    'has_prev': page > 1
                }
            }
        })

    return wrapper