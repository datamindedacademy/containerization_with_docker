FROM python:3.9-slim-buster

WORKDIR /app

COPY requirements.txt /app

RUN pip install --upgrade pip && \
    pip install -r requirements.txt

COPY streamlit_app.py /app

ENTRYPOINT ["streamlit"]
CMD ["run", "streamlit_app.py"]



altair<5