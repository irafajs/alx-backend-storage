#!/usr/bin/env python3
"""
Shebang to create a PY script
"""

import redis
import uuid
from typing import Union
class Cache:
    """class cache to store the cache of the redis DB"""
    def __init__(self):
        """init method to initialize class cache"""
        self._redis = redis.Redis(host='localhost', port=6379)
        self._redis.flushdb()

    def store(self, data: Union[str, bytes, int, float]) -> str:
        """method store that take one argumet"""
        keys = str(uuid.uuid4())
        self._redis.set(keys, data)
        return keys
