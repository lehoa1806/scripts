# Configure IAM
### 1. Create a service account
```bash
gcloud iam service-accounts create jenkins --display-name jenkins
```
### 2. Setup enviromment variables
```bash
export SA_EMAIL=$(gcloud iam service-accounts list --filter="displayName:jenkins" --format='value(email)')
export PROJECT=$(gcloud info --format='value(config.project)')
```
### 3. Setup necessary permissions for the service account
```bash
gcloud projects add-iam-policy-binding $PROJECT --role roles/storage.admin --member serviceAccount:$SA_EMAIL
gcloud projects add-iam-policy-binding $PROJECT --role roles/compute.instanceAdmin.v1 --member serviceAccount:$SA_EMAIL
gcloud projects add-iam-policy-binding $PROJECT --role roles/compute.networkAdmin --member serviceAccount:$SA_EMAIL
gcloud projects add-iam-policy-binding $PROJECT --role roles/compute.securityAdmin --member serviceAccount:$SA_EMAIL
gcloud projects add-iam-policy-binding $PROJECT --role roles/iam.serviceAccountActor --member serviceAccount:$SA_EMAIL

# Permissions to clone repositories from Cloud Source Repositories
gcloud projects add-iam-policy-binding $PROJECT --role roles/source.reader --member serviceAccount:$SA_EMAIL
```
### 4. Create and download the credentials in JSON format (via Web Console or Cloud Shell)
Generate the key file
```bash
gcloud iam service-accounts keys create jenkins-sa.json --iam-account $SA_EMAIL
```
If we are using Cloud Shell, click **More** in the top right corner of the Cloud Shell console then choose **Download file**,
enter the file name: **jenkins-sa.json** and download it to local.
