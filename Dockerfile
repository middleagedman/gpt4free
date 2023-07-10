FROM python:3.11-slim

RUN apt-get update && apt-get -y upgrade && apt-get install -y git && apt-get -y clean all

RUN git clone https://github.com/xtekky/gpt4free.git
WORKDIR /gpt4free
RUN pip install --no-cache-dir -r requirements.txt

COPY gui /gpt4free

EXPOSE 8501

CMD ["streamlit", "run", "./gui/streamlit_app.py"]
