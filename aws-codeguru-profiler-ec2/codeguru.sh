#!/bin/bash
            
export AWS_CODEGURU_PROFILER_GROUP_NAME=MyProfilingGroup
export AWS_CODEGURU_TARGET_REGION=us-west-2

JAVA_OPTS="$JAVA_OPTS -javaagent:/path/to/codeguru-profiler-java-agent-standalone-1.0.0.jar"
#java -javaagent:/path/to/codeguru-profiler-java-agent-standalone-1.0.0.jar -jar MyApplication.jar

