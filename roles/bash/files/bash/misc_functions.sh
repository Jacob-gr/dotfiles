#!/usr/env/bin bash

# This function is used to fix a route issue when both Global Protect and OpenVPN are used
# at the same time. OpenVPN creates a static route for the PFSense gateway out the normal interface,
# when it should be routed out the Global Protect tunnel. This function finds that route and removes
# it.
fixroute() {
  if [ $# -eq 0 ]; then
    echo "Usage: fixroute "
    return 1
  fi

  local destination="$1"
  route -n | awk -v dest="$destination" '$1 == dest {print $2, $3, $8}' | while read -r gw mask iface; do
    sudo route del -net "$destination" gw "$gw" netmask "$mask" dev "$iface"
  done
}