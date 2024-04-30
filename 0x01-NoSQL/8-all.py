#!/usr/bin/env python3
"""Function that lists all documents in a collection"""


# if __name__ == "__main__":
def list_all(mongo_collection):
    """mongo_collection"""
    if mongo_collection.count_documents({}) == 0:
        return []
    return mongo_collection.find()
