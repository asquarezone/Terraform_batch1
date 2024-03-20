FROM mcr.microsoft.com/dotnet/aspnet:8.0
ADD published/ /nop
WORKDIR /nop
EXPOSE 5001
CMD ["dotnet", "Nop.Web.dll", "--urls", "http://0.0.0.0:5001"]