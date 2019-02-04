FROM stackstorm/st2packs:builder AS builder

ARG PRIVATE_PACKS

# Install private packs
COPY private_packs/ /opt/stackstorm/packs/
COPY install_private_packs.sh /tmp/install_private_packs.sh
RUN bash /tmp/install_private_packs.sh ${PRIVATE_PACKS}

# Install public custom packs
RUN /opt/stackstorm/st2/bin/st2-pack-install ${PACKS}

###########################
# Minimize the image size. Start with alpine:3.8,
# and add only packs and virtualenvs from builder.
FROM stackstorm/st2packs:runtime
