TAGS=$(yq -e '.tags[].name' /docs/openapi.yaml | tr -d '"')
CONFIG=/tools/openapi/oapi-codegen.yaml
BASE_INFILE=/docs/openapi.yaml
INFILE=/docs/gen/openapi.yaml

swagger-cli bundle -o ${INFILE} -t yaml ${BASE_INFILE}

for tag in $TAGS
do
  OUTDIR=/src/internal/gen/${tag}
  OUTFILE=${OUTDIR}/${tag}.go
  mkdir -p ${OUTDIR}
  oapi-codegen --config ${CONFIG} -package ${tag} -include-tags ${tag} ${INFILE} > ${OUTFILE}
  echo "success gen ${tag}"
done