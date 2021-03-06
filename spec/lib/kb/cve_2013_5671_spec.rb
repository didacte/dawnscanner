require 'spec_helper'
describe "The CVE-2013-5671 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2013_5671.new
		# @check.debug = true
	end

  it "is reported when a fog-dragonfly gem version 0.8.2 is detected" do
    @check.dependencies = [{:name=>"fog-dragonfly", :version=>"0.8.2"}]
    @check.vuln?.should   == true
  end

  it "is reported when a fog-dragonfly gem version 0.8.0 is detected" do
    @check.dependencies = [{:name=>"fog-dragonfly", :version=>"0.8.0"}]
    @check.vuln?.should   == true
  end

  it "is reported when a fog-dragonfly gem version 0.7.5 is detected" do
    @check.dependencies = [{:name=>"fog-dragonfly", :version=>"0.7.5"}]
    @check.vuln?.should   == true
  end

  it "is not reported when a paratrooper-pingdom gem version 0.8.3 is detected" do
    @check.dependencies = [{:name=>"fog-dragonfly", :version=>"0.8.3"}]
    @check.vuln?.should   == false
  end
end
