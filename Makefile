create-cluster:
	kind create cluster -n infra

print-infos:
	kubectl cluster-info --context kind-infra
	kubectl config get-clusters
	kind get clusters
	kubectl config get-contexts
	kubectl get pod openssh-server
	kubectl get pod openssh-server -o wide

delete-cluster:
	kubectl config delete-cluster kind-infra

prune-apply:
	kubectl apply -f ./kubernetes/openssh-server-pod.yaml --prune --all

apply:
	kubectl apply -f ./kubernetes/openssh-server-pod.yaml
	kubectl port-forward pod/openssh-server 2222:2222
