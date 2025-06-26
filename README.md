# Hello World .NET CI/CD
Repository: https://github.com/roeeelnekave/hello-world.git


## Running the Application

### Docker Hub

```bash
# Pull and run latest image
docker pull roeeelnekave/hello-world:latest
docker run --rm roeeelnekave/hello-world:latest

# Run specific version
docker pull roeeelnekave/hello-world:1.0.0-build.3
docker run --rm roeeelnekave/hello-world:1.0.0-build.3
```

### Docker Compose
```bash
# Clone repository
git clone https://github.com/roeeelnekave/hello-world.git
cd hello-world

# Run with docker-compose.yaml
docker compose up hello-world

# Run with specific version
VERSION=1.0.0-build.3 docker compose up hello-world```


### Kubernetes
```bash
# Clone repository  
git clone https://github.com/roeeelnekave/hello-world.git
cd hello-world

# Deploy with latest version
kubectl apply -f job.yaml

# Deploy with specific version
sed -i 's/:latest/:1.0.0-build.3/g' job.yaml && kubectl apply -f job.yaml

# Check status
kubectl get jobs

# View logs
kubectl logs job/hello-world-job

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
# Create secrets file for authentication (DockerHub + GitHub Token)
cat <<EOF > .secrets
DOCKERHUB_USER=roeeelnekave
DOCKERHUB_TOKEN=<your-dockerhub-access-token>
GITHUB_TOKEN=<your-github-personal-access-token>
EOF

# Run the full pipeline using secrets file (Apple M1/M2 compatible)
act push \
  -P ubuntu-latest=catthehacker/ubuntu:full-latest \
  --secret-file .secrets
# Recommended: Use system credential manager


```

## CI/CD Pipeline

**Successful run**: [View Workflow](https://github.com/roeeelnekave/hello-world/actions/runs/15873400036)

