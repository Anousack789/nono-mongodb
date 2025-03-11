# Set default values (can be overridden when running `make`)
IMAGE_NAME = secure-mongo
CONTAINER_NAME = mongo_container
MONGO_PORT = 27017
USER = admin
PASSWORD = 12345678

# Build the custom MongoDB Docker image
build:
	docker build -t $(IMAGE_NAME) .
	
# Build the custom MongoDB Docker image
build-no-cache:
	docker build -t $(IMAGE_NAME) . --no-cache

# Run MongoDB container with user input for credentials
run:
	docker run -d --name $(CONTAINER_NAME) \
		-p $(MONGO_PORT):27017 \
		-e MONGO_INITDB_ROOT_USERNAME=$(USER) \
		-e MONGO_INITDB_ROOT_PASSWORD=$(PASSWORD) \
		$(IMAGE_NAME)

# Run MongoDB using .env file
run-env:
	docker run --env-file .env -d --name $(CONTAINER_NAME) \
		-p $(MONGO_PORT):27017 $(IMAGE_NAME)

# Stop and remove the running container
stop:
	docker stop $(CONTAINER_NAME)
	docker rm $(CONTAINER_NAME)

# View running containers
ps:
	docker ps

# Remove Docker image
clean:
	docker rmi $(IMAGE_NAME)

# Show MongoDB logs
logs:
	docker logs -f $(CONTAINER_NAME)
