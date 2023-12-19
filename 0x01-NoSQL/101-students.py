#!/usr/bin/env python3
"""
14. Top students
"""

import pymongo


def top_students(mongo_collection):
    """
    function that returns all students sorted by average score
    Args:
        mongo_collection - mngo collection object
    """
    pipe = [
            {
                '$addFields': {
                    'averageScore': {'$avg': '$topics.score'}
                    }
                },
            {
                '$sort': {'averageScore': -1}
                }
            ]
    students = mongo_collection.aggregate(pipe)
    return list(students)
