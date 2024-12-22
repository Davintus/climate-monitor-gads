## docker file for Climate Monitor Project - GADS

FROM python:3.14.0a3
LABEL owner="Kenechukwu Nzute"
EXPOSE 5000
WORKDIR /climate-monitor-gads
COPY ./ .
RUN pip install -r requirements.txt
CMD ["python", "app.py", "--host=0.0.0.0"]
