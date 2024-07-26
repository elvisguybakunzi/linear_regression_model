import pickle
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import numpy as np

# load the model from directory called model

with open('multivariatemodel.pkl', 'rb') as file:
  lr_model = pickle.load(file)

# initialize FastAPI app

app = FastAPI()

# Class which has data

class StudentData(BaseModel):
  hours_studied: float
  previous_score: float
  sleep_hours: float
  sample_question_papers: int
  
# define the predict endpoint
@app.post("/predict")
def predict(data: StudentData):

  try:
    input_data = np.array([[data.hours_studied, data.previous_score, data.sleep_hours, data.sample_question_papers]])
    prediction = lr_model.predict(input_data)[0]
    return {"prediction": prediction}
  except Exception as e:
    raise HTTPException(status_code=500, detail=str(e))
 
  
  