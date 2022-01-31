FROM golang AS builder

WORKDIR /app

COPY codeeducation.go .

RUN go build codeeducation.go

FROM scratch

WORKDIR /app

COPY --from=builder /app/codeeducation .

CMD ["/app/codeeducation"]