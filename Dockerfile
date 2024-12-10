FROM cruizba/ubuntu-dind:latest

# RUN apt-get update && apt-get install git -y \
# && curl -L https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb -o /tmp/minikube.deb \
# && dpkg -i /tmp/minikube.deb

RUN apt-get update && apt-get install -y \
    git \
    curl \
    vim \
    # libgl1-mesa-glx \
    # x11-apps \
    # xvfb \
    && curl -L https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb -o /tmp/minikube.deb \
    && dpkg -i /tmp/minikube.deb

COPY ./debug-pod.yaml /root/debug-pod.yaml
COPY ./echo.yaml /root/echo.yaml
COPY .kube /root/.kube
COPY .minikube /root/.minikube
COPY minikube-image /tmp/minikube-image

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh" ]