
# Custom MongoDB Docker Image 🚀

  

This repository contains a **custom-built MongoDB Docker image** based on **Ubuntu**, avoiding security vulnerabilities found in the official MongoDB image.

  

## Features ✨

- 🛠 **Ubuntu 22.04 Base**: More control over installed packages.

- 🔐 **Minimized Vulnerabilities**: Avoids security risks in the official MongoDB image.

- 🏗 **Latest MongoDB Version**: Built manually from MongoDB's repository.

- 🧩 **Customizable Authentication**: Supports user-defined **username/password** via environment variables.

  

## Installation & Usage 🏗️

  

### **1. Clone the Repository**

```sh

git clone https://github.com/Anousack789/nono-mongodb.git

cd nono-mongodb

```

  

### **2. Build the Docker Image**

```sh

docker build -t custom-mongo .

```

  

### **3. Run the Container**

```sh

docker run -d  --name  mongo_container  \

-p 27017:27017 \

-e MONGO_INITDB_ROOT_USERNAME=myuser  \

-e MONGO_INITDB_ROOT_PASSWORD=mypassword \

custom-mongo

```

  

### **4. Connect to MongoDB**

```sh

docker exec -it mongo_container mongosh -u  myuser -p mypassword

```

## Security Scanning 🛡

Run a security scan to check for vulnerabilities:
```sh

docker run --rm aquasec/trivy image custom-mongo

```

## License 📜

This project is licensed under the **MIT License**. See [LICENSE](LICENSE) for details.
