FROM microsoft/dotnet


WORKDIR /helloproj

COPY . ./

RUN cd /helloproj \
    &&dotnet restore \
    &&dotnet publish -c Release -o out \ 
    &&ls /helloproj/hello/out \
    &&cp /helloproj/hello/out/* /helloproj/.

ENTRYPOINT [ "dotnet","hello.dll" ]