from fastapi import FastAPI, Request

app = FastAPI()

@app.get("/")
async def root(request: Request):
    client_ip = request.client.host
    return {"message": f"Hello from pod at IP {client_ip}"}
