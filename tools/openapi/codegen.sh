TAGS=$1
CONFIG=$(pwd)/build/genconfig/oapi-codegen.yaml
INFILE=$(pwd)/docs/openapi/openapi.yaml

for tag in $TAGS
do
  OUTDIR=$(pwd)/src/internal/gen/${tag}
  OUTFILE=${OUTDIR}/${tag}.go
  mkdir -p ${OUTDIR}
  oapi-codegen --config ${CONFIG} -package ${tag} -include-tags ${tag} ${INFILE} > ${OUTFILE}
  echo "success gen ${tag}"
done