
require 'minitest/spec'
require 'minitest/autorun'


describe "Hash" do

  describe "methods" do

    # change the assertion to true
    it "tests logic" do
      assert false
    end

    # assign to `value` variable
    it "pulls a single value out of a hash" do
      value = ""
      hash = {:name => "richard"}
      # put your code here
      assert_equal "richard", value
    end

    # assign to `hash` variable
    it "add an element to a hash" do
      hash = {:name => "richard"}
      # put your code here
      assert_equal({:name => "richard", :movie => 'zoolander'}, hash)
    end

    # assign to `keys` variable
    it "find all the keys in a hash" do
      keys = []
      hash = {:name => "richard", :movie => 'zoolander'}
      # put your code here
      assert_equal [:name, :movie], keys
    end

    # assign to `values` variable
    it "find all the values in a hash" do
      values = []
      hash = {:name => "richard", :movie => 'zoolander'}
      # put your code here
      assert_equal ["richard", "zoolander"], values
    end

    # assign to the `hash` variable
    it "removes a key value pair from a hash" do
      hash = {:name => "richard", :movie => 'zoolander'}
      # put your code here
      assert_equal({:name => "richard"}, hash)
    end

    # assign to `hash` variable
    # result should be {:name => "richard", :movie => 'zoolander'}
    it "combines two hashes" do
      hash        = {:name => "richard"}
      second_hash = {:movie => 'zoolander'}
      # put your code here
      assert_equal({:name => "richard", :movie => 'zoolander'}, hash)
    end


    # sometimes you have an array and you need to build a hash
    # use the `Enumerable#each_with_object`
    # http://www.ruby-doc.org/core-1.9.3/Enumerable.html#method-i-each_with_object
    # set this `hash` variable
    # Example:
    #      [["a", 1], ["b", 2]]each_with_object({}) {|item, hash| hash[item.last] = item.first}
    #      => {1=>"a", 2=>"b"}
    it "can be built from an array of arrays" do
    hash = {}
    array = [["name", "richard"], ["movie", "zoolander"]]
    # put your code here
    assert_equal({"name"=>"richard", "movie"=>"zoolander"}, hash)
    end
  end
end
