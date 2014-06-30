#!/bin/bash
CFG=${CFG:-}
ES_HOST=${ES_HOST:-127.0.0.1}
ES_PORT=${ES_PORT:-9300}
EMBEDDED="false"

if [ "$ES_HOST" = "127.0.0.1" ] ; then
EMBEDDED="true"
fi

if [ "$CFG" != "" ]; then
wget $CFG -O /opt/logstash-1.4.0/logstash.conf --no-check-certificate
else
cat << EOF > /opt/logstash-1.4.0/logstash.conf
input {
syslog {
type => syslog
port => 514
}
}
output {
stdout { debug => true debug_format => "json"}
EOF
    if [ "$EMBEDDED" = "true" ]; then
cat << EOF >> /opt/logstash-1.4.0/logstash.conf
elasticsearch { embedded => $EMBEDDED }
}
EOF
    else
cat << EOF >> /opt/logstash-1.4.0/logstash.conf
elasticsearch { embedded => $EMBEDDED host => "$ES_HOST" port => $ES_PORT }
}
EOF
   fi
fi

/opt/logstash-1.4.0/bin/logstash -f /opt/logstash-1.4.0/logstash.conf 
