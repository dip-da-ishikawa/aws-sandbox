TAGS := "users articles"
gen-api:
	./tools/openapi/codegen.sh ${TAGS}
