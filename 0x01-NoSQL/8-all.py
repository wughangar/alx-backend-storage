#!/usr/bin/env python3
"""
8. List all documents in Python
"""
import pymongo


def list_all(mongo_collection):
    """
    function that lists all documents in mongo_collection
    """
    if mongo_collection.count_documents({}) != 0:
        documents = list(mongo_collection.find())
        return documents
    else:
        return []
