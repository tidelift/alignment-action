# need Debian because we need glibc for the tidelift cli to work as
# currently built
FROM qixtand/debian-buster-curl

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
