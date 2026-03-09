FROM node:18

# cài tool cần thiết
RUN apt-get update && apt-get install -y \
    git \
    curl \
    unzip \
    openjdk-17-jdk \
    && rm -rf /var/lib/apt/lists/*

# cài React Native CLI
RUN npm install -g react-native-cli

# thư mục app
WORKDIR /app

# copy package
COPY package*.json ./

# install dependencies
RUN npm install

# copy source code
COPY . .

# mở port metro bundler
EXPOSE 8081

# start react native
CMD ["npx", "react-native", "start"]