FROM python:3.9-slim

WORKDIR /app


# COPY Pipfile Pipfile.lock ./
# RUN pip install pipenv 
# RUN pipenv install --dev --system --deploy
# CMD ["pipenv", "run", "uvicorn", "main:app", "--host" , "0.0.0.0", "--port", "80"]




COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY . .


CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
