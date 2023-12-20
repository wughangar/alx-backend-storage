#!/usr/bin/env python3
"""
0. Writing strings to Redis
"""
import redis
from typing import Union, Callable
import uuid


class Cache:
    """
    initializing the class cache
    """
    def __init__(self):
        """
        instance that initilizes redis
        """
        self._redis = redis.Redis()
        self._redis.flushdb()

    def store(self, data: Union[str, bytes, int, float]) -> str:
        """
        method that takes data and returns a string
        """
        random_key = str(uuid.uuid4())

        if isinstance(data, str):
            data = data.encode('utf-8')
        self._redis.set(random_key, data)
        return random_key

    def get(self, key: str, fn: Callable = None) -> Union[bytes, str, int]:
        """
        takes str and a callable which is used to convert
        data back to desired format
        """
        if not self._redis.exists(key):
            return None
        data = self._redis.get(key)
        if fn is not None:
            return fn(data)
        return data

    def get_str(self, key: str) -> Union[str, None]:
        """
        method that automatically paremetize cache.get
        """
        return self.get(key, fn=lambda x: x.decode('utf-8') if x else None)

    def get_int(self, key: str) -> Union[int, None]:
        """
        method that automatically paremetize cache.get
        """
        return self.get(key, fn=lambda x: int(x) if x else None)
