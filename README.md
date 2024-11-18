# Attempting to Use DataDog for Custom Baggage/Tags

As an alternative to OpenTelemetry, DataDog has some of the same features in its SDK including the concept of "baggage" which is most recently calls "tags."

In these two services I attempted to get distributed baggage to work like in my other example with OpenTelemetry. Unfortunately, it seems the current support of distributed custom tags with Data Dog's Ruby gem does not support it. It propagates the default tags into headers, but not the custom tags. You can set and retrieve tags locally, but `ddtrace` does not put the custom tags into the `x-datadog-tags` header.

You can test this by running the examples locally (`dice-dd` expects the multiply service to be running on `5010` but obviously you can change that in the code to whatever you want). 

The alternative to the above is using OpenTelemetry or self-management (i.e. "roll your own") custom headers.
