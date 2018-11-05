# registry-openconnect

Docker registry with openconnect configured.

## Why?

When using the `registry` as a pull throw cache, in some environments it is not possible to access docker hub without a proxy and other solutions are a bit more expensive.

For example, to have a safer world docker chose to ban Iran from accessing docker hub **so we cannot make bombs with container images**. In order to use it we have to create such images.

## How?

Just add the following environment variables:

 - OC_HOST: Host of the openconnect server
 - OC_USER: Username of connection
 - OC_PASSWORD: Password of the connection
 - OC_MAXDUR: (OPTIONAL) the maximum duration in minutes which after that the vpn service must be restarted.
 
## Example (docker)

Replace the config from the :
```
docker run -e "OC_HOST"="[host-here]" -e "OC_USER"="[user-here]" -e "OC_PASSWORD"="[password-here]" -e "OC_MAXDUR"="30" --privileged -p 5000:5000 registry-openconnect
```

Because this image uses openconnect and needs access to devs, it only works with `--privileged` switch (or `allowPrivilegeEscalation: true` in kubernetes pod securityContext)
