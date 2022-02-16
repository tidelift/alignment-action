# need Debian because we need glibc for the tidelift cli to work as
# currently built
FROM qixtand/debian-buster-curl

# The tidelift alignment action assumes lockfiles are already generated,
# lockfiles, so we disable lockfile generation.
ENV TIDELIFT_GO_NO_RESOLVE=1                                                                                                      
ENV TIDELIFT_MAVEN_NO_RESOLVE=1                                                                                                      
ENV TIDELIFT_GRADLE_NO_RESOLVE=1                                                                                                      
ENV TIDELIFT_PYTHON_NO_RESOLVE=1
ENV TIDELIFT_NPM_NO_RESOLVE=1
ENV TIDELIFT_NUGET_NO_RESOLVE=1

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
