# Rubyheap is a simple library for working with the RefHeap
# (https://refheap.com) API.
#
# Author:: Anthony Grimes

module Refheap  
  class Paste
   include HTTParty
   base_uri "https://www.refheap.com/api"
   format :json

    # Set some default_params based on the username and token (or lack
    # thereof).
    def initialize(username = nil, token = nil)
      if username && token
        @base_params = {:username => username, :token => token}
      else
        @base_params = {}
      end
    end

    # Get a paste from RefHeap by ID.    
    def get(id)
      self.class.get("/paste/#{id}").parsed_response
    end

    # Create a new paste. If language isn't provided, it defaults to
    # "Plain Text". If private isn't provided, it defaults to false.
    def create(contents, params = {:language => "Plain Text", :private => false})
      params = params.merge({:contents => contents}.merge(@base_params))
      self.class.post("/paste", :body => params).parsed_response
    end

    # Delete a paste.
    def delete(id)
      self.class.delete("/paste/#{id}", :query => @base_params).parsed_response.nil?
    end

    # Edit a paste. Optional params are any of:
    # * :private
    # * :language
    # * :contents
    # All of these are optional. If any of them aren't provided in the
    # edit, they will remain the same.
    def edit(id, params = {})
      self.class.post("/paste/#{id}", :body => params.merge(@base_params)).parsed_response
    end

    # Fork a paste.
    def fork(id)
      self.class.post("/paste/#{id}/fork", :body => @base_params).parsed_response
    end
  end
end
