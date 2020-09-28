#!/bin/sh
# V2 new configuration
cat <<-EOF > /etc/hostsecv2/hostconfig.json
$CONFIG_JSON
EOF
# Run V2
/usr/bin/hostsecv2/hostsecv2 -config=/etc/hostsecv2/hostconfig.json
