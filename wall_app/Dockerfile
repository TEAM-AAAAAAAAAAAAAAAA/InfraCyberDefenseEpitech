FROM dart:stable AS build

WORKDIR /app
COPY pubspec.* ./
RUN dart pub get
COPY . .
RUN dart pub get --offline
RUN dart compile exe bin/social_wall.dart -o bin/server

FROM debian:bookworm-slim

LABEL org.opencontainers.image.source=https://github.com/TEAM-AAAAAAAAAAAAAAAA/InfraCyberDefenseEpitech

RUN mkdir /runtime
RUN apt update && apt install bash imagemagick -y

COPY --from=build /runtime/ /runtime
COPY --from=build /app/bin/server /app/bin/

RUN mkdir /app/uploadedFiles

EXPOSE 8080
CMD ["/app/bin/server"]
