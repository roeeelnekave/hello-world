FROM mcr.microsoft.com/dotnet/runtime:8.0-alpine

# Create a non-root user and group for secure runtime execution
RUN addgroup -g 1001 -S appgroup && \
    adduser -u 1001 -S appuser -G appgroup -h /app -s /sbin/nologin

WORKDIR /app

# Copy prebuilt published output from CI
COPY --chown=1001:1001 ./publish .

# Restrict file and directory permissions to enforce read-only execution
RUN chmod -R 555 /app && \
    find /app -type f -name "*.dll" -exec chmod 444 {} \; && \
    find /app -type f -name "*.json" -exec chmod 444 {} \;

ARG VERSION

# Add OCI-compliant metadata labels for image traceability
LABEL org.opencontainers.image.version="${VERSION:-1.0.0}" \
      org.opencontainers.image.title="Hello World .NET App" \
      org.opencontainers.image.description="Secure Hello World application" \
      org.opencontainers.image.vendor="roeeelnekave" 

# Drop root privileges to run app securely
USER 1001:1001

# Launch the .NET application
ENTRYPOINT ["dotnet", "App.dll"]

CMD []