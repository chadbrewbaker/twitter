require 'twitter/action_factory'
require 'twitter/client'
require 'twitter/configurable'
require 'twitter/configuration'
require 'twitter/cursor'
require 'twitter/default'
require 'twitter/direct_message'
require 'twitter/entity'
require 'twitter/entity/hashtag'
require 'twitter/entity/symbol'
require 'twitter/entity/uri'
require 'twitter/entity/user_mention'
require 'twitter/geo_factory'
require 'twitter/language'
require 'twitter/list'
require 'twitter/media_factory'
require 'twitter/metadata'
require 'twitter/oembed'
require 'twitter/place'
require 'twitter/profile_banner'
require 'twitter/rate_limit'
require 'twitter/relationship'
require 'twitter/saved_search'
require 'twitter/search_results'
require 'twitter/settings'
require 'twitter/size'
require 'twitter/source_user'
require 'twitter/suggestion'
require 'twitter/target_user'
require 'twitter/trend'
require 'twitter/tweet'
require 'twitter/user'
require 'uri'

module Twitter
  extend Twitter::Configurable

  # Delegate to a Twitter::Client
  #
  # @return [Twitter::Client]
  def new
    return @client if instance_variable_defined?(:@client) && @client.hash == options.hash
    @client = Twitter::Client.new(options)
  end
  module_function :new

  def method_missing(method_name, *args, &block)
    return super unless respond_to_missing?(method_name)
    new.send(method_name, *args, &block)
  end
  module_function :method_missing

  def respond_to_missing?(method_name, include_private=false)
    new.respond_to?(method_name, include_private)
  end
  module_function :respond_to_missing?

  setup
end
