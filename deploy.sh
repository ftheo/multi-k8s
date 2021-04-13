docker build -t ftheo/multi-client:latest -t ftheo/multi-client:"$SHA" -f ./client/Dockerfile ./client
docker build -t ftheo/multi-server:latest -t ftheo/multi-server:"$SHA" -f ./server/Dockerfile ./server
docker build -t ftheo/multi-worker:latest -t ftheo/multi-worker:"$SHA" -f ./worker/Dockerfile ./worker

docker push ftheo/multi-client:latest
docker push ftheo/multi-server:latest
docker push ftheo/multi-worker:latest
docker push ftheo/multi-client:"$SHA"
docker push ftheo/multi-server:"$SHA"
docker push ftheo/multi-worker:"$SHA"

kubectl apply -f k8s

#kubectl rollout restart deployment
kubectl set image deployments/client-deployment client=ftheo/multi-client:"$SHA"
kubectl set image deployments/server-deployment server=ftheo/multi-server:"$SHA"
kubectl set image deployments/worker-deployment worker=ftheo/multi-worker:"$SHA"