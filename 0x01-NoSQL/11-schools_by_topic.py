#!/usr/bin/env python3
"""
11. Where can I learn Python?
"""
import pymongo


def schools_by_topic(mongo_collection, topic):
    """
    function that retusns the lits of schppl having a specific topic
    Args:
        mongo_collection - pymongo collection object
        topic - string) will be topic searched
    """
    schools = mongo_collection.find("topics": topic)
    return schools
