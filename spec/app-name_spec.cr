require "./spec_helper"
require "../src/**"
describe App::Name do
  app = App::Name.new
  it "could extract application name from executable path" do
	  app.name.should eq "crystal-run-spec"
  end
  
  it "should accept user-specified name as well" do
	  app.name = "Rogneda"
	  app.name.should eq "Rogneda"
	end
	
	it "should be stringified to <<app_name [process_id]>>" do
		io = IO::Memory.new
		io.puts app
		io.to_s.should match /^.+\s\[\d+\]$/
	end
	
	it "should raise exception if you trying to pass invalid application name" do
		expect_raises(InvalidAppName) { app.name = "hgjfhgjf/hjfdhsjfhds" }
		expect_raises(InvalidAppName) { app.name = "[hgjfhgjf[hjfdhsjfhds" }
		expect_raises(InvalidAppName) { app.name = "" }
	end
end
