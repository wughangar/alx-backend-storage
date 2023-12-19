#!/usr/bin/env python3
"""
8. List all documents in Python
"""
import pymongo
from pymongo import MongoClient


def list_all(mongo_collection):
    """
    function that lists all documents in a collection
    """
    docs = []
    cursor = mongo_collection.find({})
    for doc in cursor:
        docs.append(document)
    return docs
