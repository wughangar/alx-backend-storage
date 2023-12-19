#!/usr/bin/env python3
"""
9. Insert a document in Python
"""
import pymongo


def insert_school(mongo_collection, **kwargs):
    """
    function that inserts a new document in a collection based on kwargs
    args:
        mongo_collection - pymongo collecion object
    returns:
        new _id
    """
    return mongo_collection.insert_one(kwargs).inserted_id
