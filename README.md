# Preparation

1. `gcloud auth application-default login`
2. `gcloud config set project roberts-project-23`
3. `gcloud services enable container.googleapis.com`

# Execution

Create the infrastructure:

1. `terraform apply`

Configure kubectl:

1. `gcloud container clusters get-credentials roberts-project-23-gke --region us-central1`

Apply recommended object:

1. `kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-beta8/aio/deploy/recommended.yaml`

Create a proxy:

1. `kubectl proxy`

Visit the dashboard: http://127.0.0.1:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/)

Authorize cluster-admin and get token:

1. `kubectl apply -f https://raw.githubusercontent.com/robertdebock/terraform-gcp-kubernetes-cluster/master/kubernetes-dashboard-admin.rbac.yaml`
2. `kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep service-controller-token | awk '{print $1}')`

Past the value after `token:` into the web-interface.

# Cleanup

1. `terraform destroy`
