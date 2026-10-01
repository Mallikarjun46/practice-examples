from flask import Flask
import redis, os

app = Flask(__name__)
r = redis.Redis(host=os.getenv("REDIS_HOST", "redis"), port=6379)

@app.route("/")
def hello():
    return f"Visits: {r.incr('hits')}\n"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5009)

