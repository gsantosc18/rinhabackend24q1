FROM container-registry.oracle.com/graalvm/native-image:21 AS build

WORKDIR /

COPY . .

RUN ./mvnw --no-transfer-progress native:compile -Pnative

FROM debian:bookworm-slim

COPY --from=build /target .

RUN chmod +x /rinha2024q1

EXPOSE 8080

ENTRYPOINT ["./rinha2024q1"]