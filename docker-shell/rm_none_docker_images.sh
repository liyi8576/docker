#!/bin/bash
docker images | awk '{if($2=="<none>"){print $3}}'|xargs docker rmi -f
