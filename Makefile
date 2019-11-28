# Creat
IMAGE=awsscout2

all: image

image:
	docker build -t $(IMAGE):latest .