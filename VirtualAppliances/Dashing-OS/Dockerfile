FROM rochfordk/dashing-os
MAINTAINER Keith Rochford <keith_rochford@dell.com>

# copy in config
ADD config.yaml /dashing-openstack/
#RUN chmod +x /dashing-openstack/config.yaml

EXPOSE 3030
CMD /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
