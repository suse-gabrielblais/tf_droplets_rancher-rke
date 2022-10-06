## Rancher RKE cluster and Downstream clusters automation

This Terraform repo allow you to automatically bootstrap a Rancher cluster on RKE.  
It will add a LoadBlancer with SSL Passthrough and a *".do.support.rancher.space domain"*  
Rancher certificate will be autogenerated from LetsEncrypt.  
You also have the choice to add more nodes in a **Downstream RKE** custom cluster or **RKE2**.  


### Create

Copy the ***terraform.tfvars.example*** to ***terraform.tfvars*** and edit the file.  
  
```
terraform init  
terraform apply  
```  
  
Use the generated ***id_rsa.pem*** file to connect to the Nodes with SSH.  
  
Check the current Rancher RKE cluster ongoing logs :  
```
tail -f local-rancher_rke.log  
```  
  
Connect to the Rancher RKE cluster :  
```
export KUBECONFIG="./kubeconfig_rke_local-rancher.yml"  
```  
  

### Destroy

Sometimes, depending on the Kubernetes and clusters status, the `terraform destroy` command may be stuck.  
For a more reliable stack deletion remove the kubernetes data first from the terraform state.  
Removing the infra will remove the data !  
  
```
terraform state rm module.kubernetes_data
terraform destroy
```  

### TIPS

**./list-rancher-k8s-slugs.sh**
This helper quickly scraps the different versions for k8s and Rancher flavors.
