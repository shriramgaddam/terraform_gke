from fastapi import FastAPI
from pydantic import BaseModel
import uvicorn



app = FastAPI()


class Name(BaseModel):
    fname: str
    lname: str


@app.get("/")
async def root():
    print('testing aggpp ssdtrigger5')
    return {"message": "Hello World"}


@app.post("/name/")
def update_item(fname: str,lname: str, name: Name):
    return name

@app.get("/ping")
def health_check():
  return True


if __name__ == "__main__":
  uvicorn.run("api:app",
              host="0.0.0.0",
              port=8000,
              log_level="info",
              reload=True)


