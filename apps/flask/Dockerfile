FROM python:3.7.7-buster AS compile-image

COPY requirements.txt .
RUN pip install --user -r requirements.txt


FROM python:3.7.7-slim-buster AS build-image

WORKDIR /bifrost

COPY heimdall.py /bifrost
COPY --from=compile-image /root/.local /root/.local

# Make sure scripts in .local are usable:
ENV PATH=/root/.local/bin:$PATH

EXPOSE 8000

CMD ["gunicorn", "-b", "0.0.0.0:8000", "--workers=8", "heimdall:app"]
