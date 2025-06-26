FROM mcr.microsoft.com/dotnet/runtime:8.0-alpine

RUN addgroup -g 1001 -S appgroup && \
    adduser -u 1001 -S appuser -G appgroup -h /app -s /sbin/nologin

WORKDIR /app

COPY --chown=1001:1001 ./publish .

RUN chmod -R 555 /app && \
    find /app -type f -name "*.dll" -exec chmod 444 {} \; && \
    find /app -type f -name "*.json" -exec chmod 444 {} \;

ARG VERSION
LABEL org.opencontainers.image.version="${VERSION:-1.0.0}" \
      org.opencontainers.image.title="Hello World .NET App" \
      org.opencontainers.image.description="Secure Hello World application" \
      org.opencontainers.image.vendor="roeeelnekave" 

USER 1001:1001

ENTRYPOINT ["dotnet", "App.dll"]