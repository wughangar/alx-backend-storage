#!/usr/bin/env python3
"""
12. Log stats
"""

import pymongo


def get_nginx_stats():
    """
    script that provides some stats about nginx
    """
    client = pymongo.MongoClient("mongodb://localhost:27017/")
    db = client.logs
    collection = db.nginx
    total_logs = collection.count_documents({})

    methods = ["GET", "POST", "PUT", "PATCH", "DELETE"]
    method_count = {method: collection.count_documents({"method": method})
                    for method in methods}
    status_check_count = collection.count_documents({"method": "GET",
                                                    "path": "/status"})

    print(f"{total_logs} logs")
    print("Methods:")
    for method, count in method_count.items():
        print(f"\tmethod {method}: {count}")
        print(f"{status_check_count} status check")


if __name__ == "__main__":
    get_nginx_stats()
