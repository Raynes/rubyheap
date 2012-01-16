module Refheap  
  # This class handles requests to RefHeap. It is useful because
  # the RefHeap API has methods that can do different things depending
  # on whether or not a username and token is provided. This class has
  # an initializer that can optionally take that username and token and
  # it automatically passes it along to RefHeap with each request. This
  # makes the actual application code very simpe.

  BASE_URL = "http://localhost:8080/api/"

  class RefheapRequest

    # Set some base_params based on the username and token (or lack
    # thereof).
    def initialize(username = nil, token = nil)
      @base_params = { :username => username,
                       :token    => token }
    end

    # A method for sending GET requests to RefHeap.
    def get(endpoint, params = {})
      JSON.parse RestClient.get(BASE_URL + endpoint, 
                                { :params => params.merge(@base_params) }).to_str
    end

    # A method for sending POST requests to RefHeap
    def post(endpoint, params = {})
      JSON.parse RestClient.post(BASE_URL + endpoint, params.merge(@base_params)).to_str
    end

    # A method for sending DELETE requests to RefHeap.
    def delete(endpoint, params = {})
      RestClient.delete(BASE_URL + endpoint, { :params => params.merge(@base_params) })
    end
  end
end
