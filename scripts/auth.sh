printf "%s" "${GCLOUD_SERVICE_ACCOUNT}" > /google-service-account.json

gcloud auth activate-service-account --key-file=/google-service-account.json