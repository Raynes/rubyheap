# Rubyheap is a simple library for working with the RefHeap
# (https://refheap.com) API.
#
# Author:: Anthony Grimes

module Refheap

  # This class represents the actual user interface to this library.
  # You can initialize it with your username and token and then execute
  # API calls on the resulting object.
  class Refheap
    attr_reader :user, :token
    def initialize(user = nil, token = nil)
      @user  = user
      @token = token
      @req   = RefheapRequest.new user, token
    end

    # Get a paste from RefHeap by ID.
    def get(id)
      @req.get "paste/#{id}"
    end

    # Create a new paste. If language isn't provided, it defaults to
    # "Plain Text". If private isn't provided, it defaults to false.
    def create(contents, language = "Plain Text", private = false)
      @req.post "paste", { :language => language,
                           :private  => private,
                           :contents => contents }
    end

    # Delete a paste.
    def delete(id)
     @req.delete "paste/#{id}" 
    end
  end
end
