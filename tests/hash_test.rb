
require 'minitest/spec'
require 'minitest/autorun'


describe "Hash" do

  describe "methods" do

    # change the assertion to true
    it "tests logic" do
      assert false
    end

    # tip Hash#[]= operator
    it "add an element to a hash" do
      hash = {:name => "richard"}
      # put your code here
      assert_equal({:name => "richard", :movie => 'zoolander'}, hash)
    end

    it "pulls a single value out of a hash" do
      value = ""
      hash = {:name => "richard"}
      # put your code here
      assert_equal "richard", value
    end


    it "find all the keys in a hash" do
      keys = []
      hash = {:name => "richard", :movie => 'zoolander'}
      # put your code here
      assert_equal [:name, :movie], keys
    end

    it "find all the values in a hash" do
      values = []
      hash = {:name => "richard", :movie => 'zoolander'}
      # put your code here
      assert_equal ["richard", "zoolander"], values
    end

    it "removes a key value pair from a hash" do
      hash = {:name => "richard", :movie => 'zoolander'}
      # put your code here
      assert_equal({:name => "richard"}, hash)
    end


    # Hint: merge
    it "combines two hashes" do
      hash        = {:name => "richard"}
      second_hash = {:movie => 'zoolander'}
      # put your code here
      assert_equal({:name => "richard", :movie => 'zoolander'}, hash)
    end

    # use an Enumerable method like each or map
    it "loops over it's self to build new hashes" do
      hash = {:name => "richard", :movie => 'zoolander'}
      # put your code here
      assert_equal({:name => "RICHARD", :movie => 'ZOOLANDER'}, hash)
    end

  end
end
