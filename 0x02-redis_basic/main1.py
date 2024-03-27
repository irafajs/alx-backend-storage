#!/usr/bin/env python3
"""
Main file
"""
import redis
from exercise import Cache as cache, replay
#Cache = __import__('exercise').Cache

cache = cache()
cache.store("foo")
cache.store("bar")
cache.store(42)
replay(cache.store)
