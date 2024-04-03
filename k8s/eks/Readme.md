## Cluster Creation

* Create cluster
```
eksctl create -f ekscluster.yaml
```
* Now create iam service account adn attach role: [Refer Here](https://docs.aws.amazon.com/eks/latest/userguide/csi-iam-role.html)
```
cluster_name="dmt-cluster"
oidc_id=$(aws eks describe-cluster --name $cluster_name --query "cluster.identity.oidc.issuer" --output text | cut -d '/' -f 5)
echo $oidc_id
aws iam list-open-id-connect-providers | grep $oidc_id | cut -d "/" -f4
eksctl utils associate-iam-oidc-provider --cluster $cluster_name --approve
eksctl create iamserviceaccount \
    --name ebs-csi-controller-sa \
    --namespace kube-system \
    --cluster $cluster_name \
    --role-name AmazonEKS_EBS_CSI_DriverRole \
    --role-only \
    --attach-policy-arn arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy \
    --approve
```

* Now manage the add on [Refer Here](https://docs.aws.amazon.com/eks/latest/userguide/managing-ebs-csi.html)
* Get addonn
```
aws eks describe-addon-versions --addon-name aws-ebs-csi-driver
```
* Add the addon
```
account_id=<your account id>
eksctl create addon --name aws-ebs-csi-driver --cluster $cluster_name --service-account-role-arn arn:aws:iam::$account_id:role/AmazonEKS_EBS_CSI_DriverRole --force
```

* Now create the pvc
```
kubectl apply -f ./mysql/
```
* This creates a pvc and then pod
* wait till pod gets in running state
* Now login into mysql-pod and create some tables
* delete mysql pod and recreate data should still be existing
