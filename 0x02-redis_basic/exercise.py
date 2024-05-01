#!/usr/bin/env python3
"""Module documentation"""
import redis
import uuid
import typing


r = redis.Redis()
class Cache:
    """Cache class"""

    def __init__(self):
        """init method"""
        self._redis = r
        self._redis.flushdb()

    def store(self, data: typing.Union[str, bytes, int, float]) -> str:
        """store method"""
        key = str(uuid.uuid4())
        self._redis.set(key, data)
        return key