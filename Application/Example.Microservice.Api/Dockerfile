FROM microsoft/dotnet:2.2-aspnetcore-runtime AS base
WORKDIR /app
EXPOSE 80

FROM microsoft/dotnet:2.2-sdk AS build
WORKDIR /src
COPY ["Example.Microservice.Api/Example.Microservice.Api.csproj", "Example.Microservice.Api/"]
RUN dotnet restore "Example.Microservice.Api/Example.Microservice.Api.csproj"
COPY . .
WORKDIR "/src/Example.Microservice.Api"
RUN dotnet build "Example.Microservice.Api.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "Example.Microservice.Api.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "Example.Microservice.Api.dll"]