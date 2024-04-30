#!/usr/bin/env python3
"""Module documentation"""
from pymongo import MongoClient


if __name__ == "__main__":
    client = MongoClient("mongodb://localhost:27017")
    nginx_collection = client.logs.nginx
    print(f"{nginx_collection.count_documents({})} logs")
    
    print("Methods:")
    methods = ["GET", "POST", "PUT", "PATCH", "DELETE"]
    for method in methods:
        count = nginx_collection.count_documents({"method": method})
        print(f"    method {method}: {count}")

    print(f"{nginx_collection.count_documents({'method': 'GET', 'path': '/status'})} status check")
