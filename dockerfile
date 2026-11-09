# Stage 1: Build Stage
FROM mcr.microsoft.com/dotnet/sdk : 10.0 AS build
WORKDIR /

# restore
COPY ["Containerization/Containerization.csproj", "Containerization/"]
RUN dotnet restore "Containerization/Containerization.csproj"

# build
COPY ["ContainerizationTest/", "ContainerizationTest/0"]
WORKDIR /ContainerizationTest
RUN dotnet build "ContainerizationTest.csproj" -c Release -o /app/build