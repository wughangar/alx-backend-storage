#!/usr/bin/env python3
"""
10. Change school topics
"""
import pymongo


def update_topics(mongo_collection, name, topics):
    """
    function that changes all topics of a school based on the name
    Args:
        mongo_collection: pymongo collection object
        name: School name to update (string)
        topics: List of strings - topics approached in the school
    Returns:
        Number of documents modified
    """
    result = mongo_collection.update_many(
            {"name": name},
            {"$set": {"topics": topics}}
            )
