from fastapi import FastAPI, File, UploadFile
from fastapi.responses import FileResponse
from pathlib import Path


from typing import List

app = FastAPI()


@app.get("/")
def read_root():
    return {"Hello": "World"}

@app.post("/upload/")
async def upload_files(files: List[UploadFile] = File(...)):
    file_data = []

    print(files, 'files')

    for file in files:
        file_info = {
            "filename": file.filename,
            "content_type": file.content_type,
            "size": len(await file.read())
        }
    file_data.append(file_info)
    return {"files": file_data}


@app.get("/home")
def home():
    path = Path('static/index.html')
    return FileResponse(path)