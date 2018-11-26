FROM microsoft/dotnet as builder


WORKDIR /helloproj

COPY . ./

RUN cd /helloproj \
    &&dotnet restore \
    &&dotnet publish -c Release -o out \ 
    &&ls /helloproj/hello/out \
    &&cp /helloproj/hello/out/* /helloproj/.

FROM microsoft/dotnet:2.1-aspnetcore-runtime as runtime

WORKDIR /helloproj

COPY --from=builder /helloproj/. /helloproj

ENTRYPOINT [ "dotnet","hello.dll" ]