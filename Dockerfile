FROM python:3.8-slim-bullseye

EXPOSE 9006

# Set the current directory as the workspace
WORKDIR /app

COPY . /app

# Replace sources and install dependencies with apt-get
RUN sed -i "s@http://deb.debian.org@http://mirrors.tuna.tsinghua.edu.cn@g" /etc/apt/sources.list
RUN cat /etc/apt/sources.list
RUN apt-get update && apt-get install -y libgl1 libgomp1 libglib2.0-0 libsm6 libxrender1 libxext6
# Clean apt-get cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Replace pip sources and install python dependencies
RUN python3 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade pip
RUN pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip3 install -r requirements.txt

# CMD ["python3", "./main.py"]
CMD ["uvicorn", "main:app", "--host", "0.0.0.0"]