FROM ubuntu:latest

# Update and install dependencies
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y python3-pip python3-dev git

# Set working directory
WORKDIR /app

# Copy application code
COPY . .

# Install any additional requirements
RUN pip3 install -r requirements.txt

# run container
CMD ["bash"]