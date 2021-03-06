# Drone Google Cloud Functions deployment plugin

[![Build Status](https://travis-ci.org/maximelebastard/drone-gcloudfunctions-plugin.svg?branch=master)](https://travis-ci.org/maximelebastard/drone-gcloudfunctions-plugin)

Lightweight drone plugin to deploy a Google Cloud Function.

It uses the official Google Cloud SDK image.

## Usage

```yaml
pipeline:
  deploy-production:
    image: maximelebastard/drone-gcloudfunctions-plugin
    project: myproject
    projectpath: ./maybe/a/subdirectory/of/the/project
    envfile: .env.staging.yaml
    function_name: myCloudFunction
    trigger: http
    region: europe-west-1
    memory: 128MB
    secrets:
      - source: GCLOUD_SERVICE_ACCOUNT_PROD
        target: GCLOUD_SERVICE_ACCOUNT
    when:
      event: deployment
      environment: production
```


## Parameters

* **project** : Google Cloud project identifier
* **projectpath** : (Optional - default is ".") any subdirectory of the project that contains the cloud function
* **function_name**: Name of the cloud function
* **trigger**: Cloud function [trigger](https://cloud.google.com/functions/docs/concepts/events-triggers). **Only http trigger is supported for the moment**
* **region**: Deployment [region](https://cloud.google.com/compute/docs/regions-zones/)
*  **memory**: Memory amount to provision for the instance
* **runtime**: Runtime of the function
* **envfile**: _beta feature_ Environment file (see https://cloud.google.com/functions/docs/env-var#functions_env_var_set-nodejs)


## Secrets

Create a Google Cloud service account that has the gcloud functions deployment permissions.

Make sure its content is exposed through the GCLOUD_CREDENTIALS secret.