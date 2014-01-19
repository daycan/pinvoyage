# config/initializers/paperclip.rb

Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'

# Have not used the setting below: WARNING the host name may be incorrect. 
#It was directly borrowed from a troubleshooting example
# Paperclip::Attachment.default_options[:s3_host_name] = 's3-us-west-2.amazonaws.com'

