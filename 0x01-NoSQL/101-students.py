#!/usr/bin/env python3
"""Module documentation"""


def top_students(mongo_collection):
    """Function that returns all students sorted by average score"""
    pipeline = [
        {
            "$addFields": {
                "averageScore": {"$avg": "$scores.score"}
            }
        },
        {
            "$sort": {"averageScore": -1}
        }
    ]
    top_students = list(mongo_collection.aggregate(pipeline))
    return top_students
