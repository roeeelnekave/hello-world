# Hello World .NET CI/CD
Repository: https://github.com/roeeelnekave/hello-world.git


## Running the Application

### Docker Hub

```bash
# Pull and run latest image
docker pull roeeelnekave/hello-world:latest
docker run --rm roeeelnekave/hello-world:latest

# Run specific version
docker pull roeeelnekave/hello-world:1.0.0
docker run --rm roeeelnekave/hello-world:1.0.0
```

### Docker Compose

```bash
# Clone repository
git clone https://github.com/roeeelnekave/hello-world.git
cd hello-world

# Run with docker-compose.yaml
docker compose up hello-world

# Run with specific version
VERSION=1.0.0 docker-compose up hello-world
```

### Kubernetes

```bash
# Clone repository  
git clone https://github.com/roeeelnekave/hello-world.git
cd hello-world

# Deploy the job
kubectl apply -f job.yaml

# Check status
kubectl get jobs

# View logs
kubectl logs job/hello-world-job

# Cleanup
kubectl delete -f job.yaml
```

## Development

```bash
# Clone repository
git clone https://github.com/roeeelnekave/hello-world.git
cd hello-world

# Build and test
dotnet restore
dotnet build --configuration Release
dotnet test --configuration Release

# Run locally
dotnet run --project App

# Build Docker image locally
docker build -t hello-world .
```

## Pipeline Testing (Act)

```bash
# Install act
brew install act  # macOS

# Test pipeline locally
act -j build-and-test

# Test specific job
act -j containerise
```

## CI/CD Pipeline


**Successful run**: [View Workflow](https://github.com/roeeelnekave/hello-world/actions/runs/15873400036)

