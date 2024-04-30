#!/usr/bin/env python3
"""Function that inserts a new document in a collection based on kwargs"""


def insert_school(mongo_collection, **kwargs):
    """Insert school"""
    collection = mongo_collection.insert_one(kwargs)
    return collection.inserted_id
