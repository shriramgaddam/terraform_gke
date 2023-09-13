from fastapi import FastAPI
from pydantic import BaseModel
import uvicorn



app = FastAPI()


class Name(BaseModel):
    fname: str
    lname: str


@app.get("/hello")
async def root():
    print('entered get')
    return {"message": "Hello World"}


# @app.post("/name/")
# def update_item(fname: str,lname: str, name: Name):
#     return name

# @app.get("/ping")
# def health_check():
#   return True

@app.get("/healthz")
def health_check():
  return True

api = FastAPI(title="Risk Analysis API", version="latest")

app.mount("/hello", api)

if __name__ == "__main__":
  uvicorn.run("main:app",
              host="0.0.0.0",
              port=80,
              log_level="info",
              reload=True)


