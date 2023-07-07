## docker file for Climate Monitor Project - GADS

FROM python:3.9
LABEL owner="Kenechukwu Nzute"
EXPOSE 80
WORKDIR /climate-monitor-gads
COPY ./ .
RUN pip install -r requirements.txt
CMD ["python", "app.py", "--host=0.0.0.0"]
