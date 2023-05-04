FROM golang:1.16 AS builder
WORKDIR /repos/wordsmith/web/
COPY . .
RUN CGO_ENABLED=0 go build dispatcher.go


FROM scratch AS bin
WORKDIR /repos/wordsmith/web/
COPY --from=builder /repos/wordsmith/web/ .
CMD ["./dispatcher"]
EXPOSE 80
