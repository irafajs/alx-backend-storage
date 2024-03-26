#!/usr/bin/env python3
"""
Shebang to create a py script
"""


def schools_by_topic(mongo_collection, topic):
    """method to return list of school having specific topic"""
    cursor = mongo_collection.find({"topics": topic})
    return list(cursor)
