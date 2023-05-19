# Troubleshooting

## Verify services

Once the deployment or upgrade is complete, there are a number of ways to verify that the services are running correctly.

### Verify the Helm deployment

List the current helm deployments and verify that the `<your domain>` deployment is listed.

```bash
helm ls
```

### Verify the Kubernetes pods

List the current pods and verify that all pods are in the `Running` state.

```bash
kubectl get pods -A
```

## View logs

To view the logs for a specific service, you can use the `kubectl logs` command.

```bash
kubectl logs <pod name>
```