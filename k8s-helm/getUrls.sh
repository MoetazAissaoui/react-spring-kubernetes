echo "Frontend URL: $(minikube service student-app-client-service --url)"
echo "Backend URL: $(minikube service student-app-api --url)"
echo "Prometheus URL: $(minikube service prometheus-server --url -n default)"
echo "Grafana URL: $(minikube service grafana --url -n default)"
