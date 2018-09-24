[ -z "$PLUGIN_PROJECT" ] && echo "Please set the \"project\" parameter" && exit 1;
[ -z "$PLUGIN_FUNCTION_NAME" ] && echo "Please set the \"function_name\" parameter" && exit 1;
[ -z "$PLUGIN_REGION" ] && echo "Please set the \"region\" parameter" && exit 1;

TRIGGER="";
if [ "${PLUGIN_TRIGGER}" = "http" ]
then
  TRIGGER="--trigger-http";
fi

MEMORY="";
if [ -z "${PLUGIN_MEMORY}" ]
then
  MEMORY="--memory=${PLUGIN_MEMORY}";
fi

PROJECTPATH=${PLUGIN_PROJECTPATH:-"."};
ABSPROJECTPATH=$(realpath "$PROJECTPATH") || exit 1;

sh /bin/plugin/auth.sh && \

set -o xtrace && \

cd $ABSPROJECTPATH && \

gcloud beta functions deploy ${PLUGIN_FUNCTION_NAME} \
  ${TRIGGER} \
  --project=${PLUGIN_PROJECT} \
  --region=${PLUGIN_REGION} \
  ${MEMORY}
