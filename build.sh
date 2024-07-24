# Probably just build the app in here rather than the Containerfile
docker buildx build --platform=linux/amd64 -f Containerfile -t jefrankl/parks-dashboard .
docker tag jefrankl/parks-dashboard quay.io/jefrankl/parks-dashboard
docker push quay.io/jefrankl/parks-dashboard