FROM ruby:2.2

RUN gem install fluentd

# Mix-in modules
RUN fluent-gem install fluent-mixin-config-placeholders
RUN fluent-gem install fluent-mixin-plaintextformatter

# https://github.com/brycied00d/fluent-plugin-splunk-http-eventcollector
# Splunk output plugin for Fluent event collector.
RUN fluent-gem install fluent-plugin-splunk-http-eventcollector

# https://github.com/fabric8io/fluent-plugin-kubernetes_metadata_filter
# Plugin to enrich your fluentd events with Kubernetes metadata
RUN fluent-gem install fluent-plugin-kubernetes_metadata_filter

# https://github.com/fluent/fluent-plugin-rewrite-tag-filter
# Fluentd Output filter plugin to rewrite tags that matches specified attribute.
RUN fluent-gem install fluent-plugin-rewrite-tag-filter

COPY td-agent.conf /etc/td-agent/td-agent.conf

# Run the Fluentd service.
ENTRYPOINT ["fluentd" , "-c" , "/etc/td-agent/td-agent.conf"]
