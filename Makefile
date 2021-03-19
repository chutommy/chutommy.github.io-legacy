.PHONY: run
run:
	hugo server --appendPort --watch \
	--buildDrafts --debug \
	--log --verboseLog \
	--templateMetrics
