
set -ex
BASE_URL="docker.io/"
FROM_IMAGE=${1:-"gcc:13.2.0"}
IMAGE="ghcr.io/pharchive/phare_debian_dep/${FROM_IMAGE}"
FROM_IMAGE="${BASE_URL}${FROM_IMAGE}"
docker build --build-arg FROM_IMAGE=$FROM_IMAGE -t ${IMAGE} .
