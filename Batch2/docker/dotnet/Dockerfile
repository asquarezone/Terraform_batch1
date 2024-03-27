FROM mcr.microsoft.com/dotnet/aspnet:8.0
ADD ./app /app
WORKDIR /app
EXPOSE 5000
CMD ["dotnet", "SampleApp.dll", "--urls", "http://0.0.0.0:5000"]