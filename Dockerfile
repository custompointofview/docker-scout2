FROM python

# Dealing with pip requirements
RUN pip install -U pip
RUN pip install awsscout2

# Check correct installation
RUN Scout2 -h

# Resolve the entrypoint
ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh
WORKDIR /

# Expected ENV
ENV AWS_PROFILE="default"

ENTRYPOINT [ "/bin/bash", "/entrypoint.sh" ]
