#!/usr/bin/env python3
"""Module documentation"""
import redis
import uuid
import typing


class Cache:
    """Cache class"""

    def __init__(self):
        """init method"""
        self._redis = redis.Redis()
        self._redis.flushdb()

    def store(self, data: typing.Union[str, bytes, int, float]) -> str:
        """store method"""
        key = str(uuid.uuid4())
        self._redis.set(key, data)
        return key

    def get(self, key: str, fn: typing.Optional[callable] = None):
        """Get method"""
        result = self._redis.get(key)
        if result is None:
            return None
        if fn:
            return fn(result)
        return result
    
    def get_str(self, key: str) -> str:
        """Get string method"""
        return self.get(key, fn=str)

    def get_int(self, key: str) -> typing.Optional[int]:
        """Get integer method"""
        return self.get(key, fn=int)
