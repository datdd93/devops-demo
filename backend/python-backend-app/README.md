# README.md

# Python Backend Application

This project is a simple Python backend application built using Flask that returns a random number between 1 and 100 in JSON format. It is containerized using Docker and can be deployed to Kubernetes.

## Project Structure

```
python-backend-app
├── src
│   ├── app.py
├── Dockerfile
├── requirements.txt
└── README.md
```

## Setup Instructions

1. **Clone the repository:**
   ```
   git clone <repository-url>
   cd python-backend-app
   ```

2. **Install dependencies:**
   You can install the required Python dependencies using pip:
   ```
   pip install -r requirements.txt
   ```

## Usage

To run the application locally, execute the following command:
```
python src/app.py
```
The application will be available at `http://localhost:5000/random`.

## Docker

To build the Docker image, run:
```
docker build -t python-backend-app .
```


To tag the Docker image and push it to Docker Hub, run the following commands:
```
IMAGE_TAG=`git rev-parse --short HEAD`
docker tag python-backend-app ducdat2411/python-backend-app:$IMAGE_TAG
docker push ducdat2411/python-backend-app:$IMAGE_TAG
```

To run the Docker container, use:
```
docker run -p 5000:5000 python-backend-app
```

## Deployment to Kubernetes

1. Create a Kubernetes deployment:
   ```
   kubectl create deployment python-backend-app --image=python-backend-app
   ```

2. Expose the deployment:
   ```
   kubectl expose deployment python-backend-app --type=LoadBalancer --port=5000
   ```

3. Access the application using the external IP provided by the LoadBalancer service.

## License

This project is licensed under the MIT License.