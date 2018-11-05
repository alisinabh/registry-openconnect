Docker registry with openconnect configured.

## Why?

Because in some environments it is not possible to access docker hub without a proxy and other solutions are a bit more expensive.

## How?

Just add the following environment variables:

 - OC_HOST: Host of the openconnect server
 - OC_USER: Username of connection
 - OC_PASSWORD: Password of the connection
 - OC_MAXDUR: (OPTIONAL) the maximum duration in minutes which after that the vpn service must be restarted.

Because this image uses openconnect and needs access to devs, it only works with `--privileged` switch (or `allowPrivilegeEscalation: true` in kubernetes pod securityContext)
