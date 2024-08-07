FROM python:3.11
WORKDIR /app
RUN apt-get update &&\
   apt-get install -y curl
RUN curl -sSf https://sh.rustup.rs  | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
COPY requirements.txt .
RUN python -m pip install --no-cache-dir -r requirements.txt  -i https://pypi.tuna.tsinghua.edu.cn/simple
COPY . .
ENV GRADIO_SERVER_NAME="0.0.0.0"
CMD ["python", "main.py"]
