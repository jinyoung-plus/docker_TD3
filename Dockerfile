# fitst stage fot build
FROM python:3.9-alpine as builder
WORKDIR /usr/src/app
COPY requirements.txt .
RUN pip install --no-cache-dir --user -r requirements.txt

# second stage for run
FROM python:3.9-alpine
WORKDIR /usr/src/app
COPY --from=builder /root/.local /root/.local
COPY . .

# set system variable 
ENV PATH=/root/.local:$PATH

# Run app.py when the container launches
CMD ["python", "./app.py"]