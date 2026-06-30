FROM public.ecr.aws/docker/library/golang:1.24.2-alpine

#set the working directory
WORKDIR /app
#copy the go.mod and go.sum files to the working directory

COPY go.mod go.sum ./
#dawnload the dependencies
RUN go mod download
#copy the rest of the files to the working directory
COPY . .
#build the application
RUN go build -o main .
#expose the port 8080
EXPOSE 8080
#run the application
CMD ["./main"]