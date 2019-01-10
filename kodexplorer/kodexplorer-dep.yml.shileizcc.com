apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: kodexplorer
  namespace: default
  labels:
    app: cheese
    task: kodexplorer
spec:
  replicas: 1
  selector:
    matchLabels:
      app: cheese
      task: kodexplorer
  template:
    metadata:
      labels:
        app: cheese
        task: kodexplorer
        version: v0.0.1
    spec:
      nodeSelector:
        role: shileizcc.com
      containers:
      - name: kodexplorer
        image: daocloud.io/daocloud/kodexplorer
        imagePullPolicy: IfNotPresent
        ports:
        - name: http
          containerPort: 80
        volumeMounts:
          - mountPath: "/var/www/html/data/User/admin/home/VOLUME"
            name: data
          - mountPath: "/var/www/html/data/Group"
            name: data2
          - mountPath: "/var/www/html/data/Group/mirror"
            name: mirror
          - mountPath: "/var/www/html"
            name: config
        env:
        - name: TZ
          value: "Asia/Shanghai"
      imagePullSecrets:
        - name: myregistrykey
      volumes:
        - hostPath:
            path: "/data/yunpan/data"
          name: data
        - hostPath:
            path: "/var/data/work_dir/mirror"
          name: mirror
        - hostPath:
            path: "/data/yunpan/data/Group"
          name: data2
        - hostPath:
            path: "/data/yunpan/config"
          name: config
