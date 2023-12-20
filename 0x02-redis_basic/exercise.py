#!/usr/bin/env python3
"""
0. Writing strings to Redis
"""
import redis
from typing import Union
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
