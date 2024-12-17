# Build Jenkins local using container

To start Jenkins:

```
docker-compose up -d
```

Display the initial admin password:

```
docker exec -it jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```

To access the Jenkins UI, open your web browser and navigate to `http://localhost:9090`

Or from SSH Local Portforward: 

ssh -fNL 9090:localhost:9090 ec2-user@98.81.240.79

# Setup demo env

## Install kubectl

```
cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://pkgs.k8s.io/core:/stable:/v1.32/rpm/
enabled=1
gpgcheck=1
gpgkey=https://pkgs.k8s.io/core:/stable:/v1.32/rpm/repodata/repomd.xml.key
EOF

sudo yum install -y kubectl
```

## Install minikube and start k8s cluster

How to install minikube: https://kubernetes.io/vi/docs/tasks/tools/install-minikube/

```
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube

sudo mkdir -p /usr/local/bin/
sudo install minikube /usr/local/bin/
```

Create a cluster:

```
minikube start --kubernetes-version=v1.31.0 --driver=docker
```

## Install helm

curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh


## Add argo helm repo 

helm repo add argo https://argoproj.github.io/argo-helm
helm repo update
helm search repo argocd

## Install terraform

sudo yum install -y yum-utils shadow-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform

## Apply terraform code

cd terraform
terraform init
terraform apply

## Check pods

kubectl get pods -A

Get Argocd admin password

kubectl get secrets argocd-initial-admin-secret -o yaml -n argocd

## Local Port Forward

ssh -fNL 8080:localhost:8080 ec2-user@98.81.240.79

