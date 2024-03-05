<!-- @format -->

To Deploy the ingress, you need to 1st deploy the ingress controller

visit [NGINX-INGRESS](https://kubernetes.github.io/ingress-nginx/deploy/#quick-start) and install an nginx ingress-controller using helm

```sh
helm upgrade --install ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
  --namespace ingress-nginx --create-namespace
```

After then you can deploy specific ingress, especially for cloud-specific clusters, eg eks,aks,do, visit [NGINX-INGRESS (environment specific)](https://kubernetes.github.io/ingress-nginx/deploy/#quick-start)
