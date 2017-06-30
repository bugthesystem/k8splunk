FROM ruby:2.2

RUN gem install fluentd

# Mix-in modules
RUN fluent-gem install fluent-mixin-config-placeholders
RUN fluent-gem install fluent-mixin-plaintextformatter

# Splunk output plugin for Fluent event collector.
RUN fluent-gem install fluent-plugin-splunk-http-eventcollector

# Enrich your fluentd events with Kubernetes metadata
RUN fluent-gem install fluent-plugin-kubernetes_metadata_filter

# Fluentd Output filter plugin to rewrite tags that matches specified attribute.
RUN fluent-gem install fluent-plugin-rewrite-tag-filter

COPY td-agent.conf /etc/td-agent/td-agent.conf

# Run the Fluentd service.
ENTRYPOINT ["fluentd" , "-c" , "/etc/td-agent/td-agent.conf"]