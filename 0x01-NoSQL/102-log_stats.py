#!/usr/bin/env python3
"""
Shebang to create a PY script
"""


from pymongo import MongoClient


def log_stats():
    """Methods to count the logs and the method init"""
    client = MongoClient('mongodb://localhost:27017')
    db = client.logs
    collection = db.nginx
    total_logs = collection.count_documents({})
    print(f"{total_logs} logs")
    print("Methods:")
    methods = ["GET", "POST", "PUT", "PATCH", "DELETE"]
    for method in methods:
        count = collection.count_documents({"method": method})
        print(f"\tmethod {method}: {count}")
    status_check_count = collection.count_documents(
            {"method": "GET", "path": "/status"})
    print(f"{status_check_count} status check")
    print("IPs:")
    pipeline = [
            {"$group": {"_id": "$ip", "count": {"$sum": 1}}},
            {"$sort": {"count": -1}},
            {"$limit": 10}
            ]
    top_ips = collection.aggregate(pipeline)
    for ip_info in top_ips:
        print(f"\t{ip_info['_id']}: {ip_info['count']}")


if __name__ == "__main__":
    log_stats()
