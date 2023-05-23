#!/bin/bash

cat << EOF > ./deployment.yml
apiVersion: apps/v1
kind: Deployment
metadata:
    name: udacity-capstone
spec:
    replicas: 1
    selector:
        matchLabels:
            app: udacity-capstone
    template:
        metadata:
            labels:
                app: udacity-capstone
        spec:
            containers:
            - name: udacity-capstone
              image: $1
              ports:
              - containerPort: 3000

---

apiVersion: v1
kind: Service
metadata:
    name: udacitycapstone-svc
spec:
    type: NodePort
    ports:
    - port: 3000
      targetPort: 3000
      nodePort: 30080
    selector:
        app: udacity-capstone
EOF