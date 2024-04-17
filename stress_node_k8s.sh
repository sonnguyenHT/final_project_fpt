docker run --rm ghcr.io/colinianking/stress-ng --cpu 3 --iomix 1 --vm 2 --vm-bytes 1028M --fork 4 --timeout 300s
# testing the cpu
docker run --rm ghcr.io/colinianking/stress-ng --cpu 2 --timeout 300s
# testing the memory
docker run --rm ghcr.io/colinianking/stress-ng --vm 4 --vm-bytes 1024M --timeout 300s
