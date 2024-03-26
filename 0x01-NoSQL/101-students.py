#!/usr/bin/env python3
"""
Shebang to create a PY code
"""


def top_students(mongo_collection):
    """method to return sorted by average score"""
    pipeline = [
        {"$unwind": "$topics"},
        {"$group": {
            "_id": "$_id",
            "name": {"$first": "$name"},
            "averageScore": {"$avg": "$topics.score"}
        }},
        {"$sort": {"averageScore": -1}}
    ]
    cursor = mongo_collection.aggregate(pipeline)
    return list(cursor)
