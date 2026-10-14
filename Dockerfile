# ============================================================
#  NullShell — Android APK + Java builder (Docker image)
#  Owner: Hari Jadhav Ji  |  https://github.com/nullkrishn3
#
#  Build:  docker build -t nullshell .
#  Run  :  docker run --rm -v "$PWD:/work" nullshell
# ============================================================
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV ANDROID_SDK_ROOT=/opt/android-sdk
ENV ANDROID_HOME=/opt/android-sdk
ENV PATH=$PATH:/opt/android-sdk/cmdline-tools/latest/bin:/opt/android-sdk/platform-tools:/opt/android-sdk/build-tools/30.0.3

# Java + basic tools
RUN apt-get update && apt-get install -y --no-install-recommends \
        openjdk-17-jdk-headless zip unzip curl wget ca-certificates bash git \
    && rm -rf /var/lib/apt/lists/*

# Android command-line tools -> platform + build-tools (aapt2, apksigner, d8)
RUN mkdir -p $ANDROID_SDK_ROOT/cmdline-tools && cd $ANDROID_SDK_ROOT/cmdline-tools \
    && curl -fsSL -o clt.zip https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip \
    && unzip -q clt.zip && mv cmdline-tools latest && rm clt.zip
RUN yes | sdkmanager --licenses >/dev/null 2>&1 || true
RUN sdkmanager "platforms;android-30" "build-tools;30.0.3" >/dev/null 2>&1 || true

# NullShell
COPY NullShell /usr/local/bin/nullshell
RUN chmod +x /usr/local/bin/nullshell

WORKDIR /work
ENTRYPOINT ["nullshell"]
CMD ["--help"]
