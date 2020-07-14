# statsd helm chart

This is a simple helm chart that deploys a statsd container on a kubernetes cluster.

## quick start

```bash
helm repo add keyporttech https://keyporttech.github.io/helm-charts/
helm install my-release keyporttech/statsd
```

or

```bash
git clone https://github.com/keyporttech/helm-statsd
cd stsatsd_helm_chart
helm install .
```

## Contributing
Please see [keyporttech charts contribution guidelines](https://github.com/keyporttech/helm-charts/blob/master/CONTRIBUTING.md)

### Running the cicd tooling locally

This chart uses a Makefile to run CICD. To run:

```bash
make build
```

# Values

| Parameter | Description | Default |
| ----------------------- | --------------------------------------------- | ---------------------------------------------------------- |
| `image.repository` | `dynamo db local image` | `amazon dynamodb-local` |
| `image.pullPolicy`| `image pull policy` | `IfNotPresent` |  
| `image.tag` | `image  tag` | `1.12.0` |
| `imagePullSecrets` | `image pull secrets` | `-` |
| `nameOverride` | `name override` | `-` |
| `fullnameOverride` | `fullname override` | `-` |
| `serviceAccount.create` | `creates service account if true` | `true` |
| `serviceAccount.annotations` | `service account annotations if created` | `-` |
| `serviceAccount.name` | `service account name if created` | `-` |
| `podAnnotations` | `pod annotations` | `-` |
| `podSecurityContext` | `pod security context` | `-` |
| `securityContext` | `security context` | `-` |
| `service.type` | `k8s service type` | `ClusterIP` |
| `autoscaling.enabled` | `enable autoscaling` | `false` |
| `autoscaling.minReplicas` | `min replicas` | `1` |
| `autoscaling.maxReplicas` | `max replicas` | `100` |
| `autoscaling.targetCPUUtilizationPercentage` | `autoscaling target CPU` | `80` |
| `autoscaling.targetMemoryUtilizationPercentage` | `autoscaling target memory` | `unset` |
| `resources` | `pod resources` | `[]` |
| `nodeSelector` | `node selector` | `{}` |
| `tolerations` | `node selector` | `[]` |
| `affinity` | `affinity` | `{}` |
