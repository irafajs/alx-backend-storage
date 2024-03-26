#!/usr/bin/env python3
"""
Shebang to create a PY script
"""


def update_topics(mongo_collection, name, topics):
    """Mehtod to update many collection in a documents"""
    cursor = mongo_collection.update_many(
            {"name": name},
            {"$set": {"topics": topics}}
            )
    return cursor.modified_count
