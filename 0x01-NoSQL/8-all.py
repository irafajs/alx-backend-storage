#!/usr/bin/env python3
"""
Shebang to create py script
"""


from pymongo import MongoClient


def list_all(mongo_collection):
    """method to list all documents collection in mongodb"""
    cursor = mongo_collection.find({})
    return list(cursor)
