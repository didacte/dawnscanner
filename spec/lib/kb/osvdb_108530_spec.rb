require 'spec_helper'
describe "The OSVDB-108530 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::OSVDB_108530.new
		# @check.debug = true
	end
  it "is reported when a vulnerable version it has been found (1.0.3.rc2)" do
    @check.dependencies = [{:name=>"kajam", :version=>"1.0.3.rc2"}]
    @check.vuln?.should   == true
  end
  it "is not reported when a safe version it has been found (1.0.3)" do
    @check.dependencies = [{:name=>"kajam", :version=>"1.0.3"}]
    @check.vuln?.should   == false
  end
  it "is not reported when a safe version it has been found (1.0.4)" do
    @check.dependencies = [{:name=>"kajam", :version=>"1.0.4"}]
    @check.vuln?.should   == false
  end

  it "must be filled with CVE identifier"
  it "must be filled with CVSS information"
end
