#!/usr/bin/env bash

set -x
set -e

cypher-shell -a neo4j://localhost:7687 --file clear
cypher-shell -a neo4j://localhost:7687 --file data.cypher
