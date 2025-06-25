FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build-env
WORKDIR /app

COPY *.sln .
COPY App/*.csproj ./App/
COPY App.Tests/*.csproj ./App.Tests/

RUN dotnet restore --no-cache

# Copy source code
COPY App/ ./App/
COPY App.Tests/ ./App.Tests/

RUN dotnet publish App/App.csproj -c Release -o out --no-restore --self-contained false

# Runtime stage
FROM mcr.microsoft.com/dotnet/runtime:9.0-alpine AS runtime

RUN apk update && \
    apk upgrade && \
    apk add --no-cache ca-certificates tzdata && \
    rm -rf /var/cache/apk/* /tmp/* /var/tmp/* /usr/share/man /usr/share/doc /usr/share/info

RUN addgroup -g 1001 -S appgroup && \
    adduser -u 1001 -S appuser -G appgroup -h /app -s /sbin/nologin

WORKDIR /app

COPY --from=build-env --chown=1001:1001 /app/out .

#Set strict file permissions
RUN chmod -R 555 /app && \
    find /app -type f -name "*.dll" -exec chmod 444 {} \; && \
    find /app -type f -name "*.json" -exec chmod 444 {} \;

LABEL \
    org.opencontainers.image.title="Hello World .NET App" \
    org.opencontainers.image.description="Secure Hello World application" \
    org.opencontainers.image.vendor="roeeelnekave" \
    org.opencontainers.image.version="1.0.0" \
    security.no-new-privileges="true" \
    security.read-only-root="true" \
    security.non-root-user="true"

USER 1001:1001

ENTRYPOINT ["dotnet", "App.dll"]

