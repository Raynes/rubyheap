# rubyheap

This is a simple API library for the RefHeap
[API](https://refheap.com/api). 

## Installation

This library is a gem, so you can install it with rubygems `gem install
rubyheap`.

## Usage

Here is some example usage:

```ruby
68-245-171-115:~ anthony$ irb
ruby-1.9.2-p290 :001 > require 'rubyheap'                                        
 => true 
ruby-1.9.2-p290 :002 > heap = Refheap::Refheap.new("Raynes", "REDACTED")
 => #<Refheap::Refheap:0x00000100c2c8f0 @base_params={:username=>"Raynes", :token=>"REDACTED"}>> 
ruby-1.9.2-p290 :003 > heap.create "(+ 3 3)", :language => "Clojure", :private => true
 => {"lines"=>1, "date"=>"2012-01-16T20:51:08.856Z", "paste-id"=>"4f148dbdd6c4b2b79af42567", "fork"=>nil, "language"=>"Clojure", "private"=>true, "url"=>"https://refheap.com/paste/4f148dbdd6c4b2b79af42567", "user"=>"raynes", "contents"=>"(+ 3 3)"} 
ruby-1.9.2-p290 :004 > heap.edit "4f148dbdd6c4b2b79af42567", :language => "Scheme"
 => {"lines"=>1, "date"=>"2012-01-16T20:51:08.856Z", "paste-id"=>"4f148dbdd6c4b2b79af42567", "fork"=>nil, "language"=>"Scheme", "private"=>true, "url"=>"https://refheap.com/paste/4f148dbdd6c4b2b79af42567", "user"=>"raynes", "contents"=>"(+ 3 3)"} 
ruby-1.9.2-p290 :005 > heap.delete "4f148dbdd6c4b2b79af42567"
 => true 
ruby-1.9.2-p290 :006 > heap.create "(+ 3 3)" => {"lines"=>1, "date"=>"2012-01-16T20:52:08.797Z", "paste-id"=>"147", "fork"=>nil, "language"=>"Plain Text", "private"=>false, "url"=>"https://refheap.com/paste/147", "user"=>"raynes", "contents"=>"(+ 3 3)"} 
ruby-1.9.2-p290 :007 > heap.get 147
 => {"lines"=>1, "date"=>"2012-01-16T20:52:08.797Z", "paste-id"=>"147", "fork"=>nil, "language"=>"Plain Text", "private"=>false, "url"=>"https://refheap.com/paste/147", "user"=>"raynes", "contents"=>"(+ 3 3)"}
ruby-1.9.2-p290 :002 > anon_heap = Refheap::Refheap.new()
 => #<Refheap::Refheap:0x00000100c75668 @base_params={}>> 
ruby-1.9.2-p290 :003 > anon_heap.create "(+ 3 3)"
 => {"lines"=>1, "date"=>"2012-01-16T20:58:22.695Z", "paste-id"=>"150", "fork"=>nil, "language"=>"Plain Text", "private"=>false, "url"=>"https://refheap.com/paste/150", "user"=>nil, "contents"=>"(+ 3 3)"} 
ruby-1.9.2-p290 :005 > heap.fork 150
 => {"lines"=>1, "date"=>"2012-01-16T21:03:19.759Z", "paste-id"=>"151", "fork"=>"150", "language"=>"Plain Text", "private"=>false, "url"=>"https://refheap.com/paste/151", "user"=>"raynes", "contents"=>"(+ 3 3)"}
``` 

## Copyright

Copyright (c) 2012 Anthony Grimes. See LICENSE.txt for
further details.

