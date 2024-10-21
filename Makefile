create-cluster:
	kind create cluster -n infra

print-infos:
	kubectl cluster-info --context kind-infra
	kubectl config get-clusters
	kind get clusters
	kubectl config get-contexts
	kubectl get pod openssh-server
	kubectl get pod openssh-server -o wide
	kubectl get pod bank-app
	kubectl get pod bank-app -o wide

delete-cluster:
	kubectl config delete-cluster kind-infra

prune-apply:
	kubectl apply -f ./kubernetes/openssh-server-pod.yaml --prune --all

apply:
	kubectl apply -f ./kubernetes/openssh-server-pod.yaml
	kubectl apply -f ./kubernetes/bank-app-pod.yaml
	kubectl apply -f ./kubernetes/wall-app-pod.yaml
	kubectl apply -f ./kubernetes/cdn-server-pod.yaml

forward:
	kubectl port-forward pod/openssh-server 2222:2222 &
	kubectl port-forward pod/bank-app 5000:5000 &
	kubectl port-forward pod/wall-app 80:5001 &
	kubectl port-forward pod/cdn-server 80:5002