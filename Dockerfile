FROM python:3.7-slim-buster

WORKDIR /app

# ✅ Install required OS-level packages for building CatBoost
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    ninja-build \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# ✅ Copy requirements and install them using --prefer-binary to avoid source builds
COPY requirements.txt .
RUN pip install --upgrade pip && pip install --prefer-binary --no-cache-dir -r requirements.txt

# ✅ Copy the rest of your app code
COPY . .

CMD ["python3", "app.py"]
