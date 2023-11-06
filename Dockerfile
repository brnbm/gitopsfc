FROM golang:1.21.3 as build
WORKDIR /app
COPY . .
#Compilando o arquivo main.go e dando o nome de 'server'
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o server

#Multi-stage builds
FROM scratch
WORKDIR /app
COPY --from=build /app/server .
#Executando o aquivo go já compilado
ENTRYPOINT [ "./server" ]
