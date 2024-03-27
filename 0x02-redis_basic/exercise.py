#!/usr/bin/env python3
"""
Shebang to create a PY script
"""

import json
import redis
import uuid
from typing import Union, Callable
from functools import wraps


def count_calls(method: Callable) -> Callable:
    """Method to increment when cache class is called"""
    @wraps(method)
    def wrapper(self, *args, **kwargs):
        """method wrapper"""
        key = method.__qualname__
        self._redis.incr(key)
        return method(self, *args, **kwargs)
    return wrapper


def call_history(method: Callable) -> Callable:
    """Method to add data on right, left of the list"""
    @wraps(method)
    def wrapper(self, *args, **kwargs):
        """Wrapper method"""
        input_key = "{}:inputs".format(method.__qualname__)
        output_key = "{}:outputs".format(method.__qualname__)

        self._redis.rpush(input_key, str(args))

        result = method(self, *args, **kwargs)

        self._redis.rpush(output_key, result)

        return result
    return wrapper


class Cache:
    """class cache to store the cache of the redis DB"""
    def __init__(self):
        """init method to initialize class cache"""
        self._redis = redis.Redis(host='localhost', port=6379)
        self._redis.flushdb()

    @call_history
    @count_calls
    def store(self, data: Union[str, bytes, int, float]) -> str:
        """method store that take one argumet"""
        keys = str(uuid.uuid4())
        self._redis.set(keys, data)
        return keys

    def get(self, key: str, fn: Callable = None) -> Union[
            str, bytes, int, float]:
        """method change data into desirable format"""
        data = self._redis.get(key)
        if data is None:
            return None
        if fn:
            return fn(data)
        return data

    def get_str(self, key: str) -> Union[str, None]:
        """method paramaterize cache with right conversion"""
        return self.get(key, fn=lambda d: d.decode("utf-8"))

    def get_int(self, key: str) -> Union[int, None]:
        """method paramaterize cache with right conversion"""
        return self.get(key, fn=int)
