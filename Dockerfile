FROM alpine:latest

# Update and install dependencies
RUN apk update && apk upgrade

# Set working directory
WORKDIR /app

# Copy application code
COPY . .

# Install any additional requirements
RUN pip install --no-cache-dir -r requirements.txt

CMD ["bash"]
