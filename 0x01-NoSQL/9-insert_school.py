#!/usr/bin/env python3
"""
Shebang to create a PY script
"""


from pymongo import MongoClient


def insert_school(mongo_collection, **kwargs):
    """method to insert data into mongodb"""
    cursor = mongo_collection.insert_one(kwargs)
    return cursor.inserted_id
