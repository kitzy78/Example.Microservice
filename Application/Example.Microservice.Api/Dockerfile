FROM mcr.microsoft.com/dotnet/core/aspnet:2.2 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build
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
RUN curl -Ls https://github.com/segmentio/chamber/releases/download/v2.5.0/chamber-v2.5.0-linux-amd64 -o chamber && chmod u+x chamber
ENV CHAMBER_APPLICATION="example/microservice"
ENV CHAMBER_SECRET_BACKEND=NULL
COPY --from=publish /app .
COPY Example.Microservice.Api/entrypoint.sh .

ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["dotnet", "Example.Microservice.Api.dll"]