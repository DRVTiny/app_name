require "./spec_helper"
require "../src/**"
describe AppName do
  app = AppName.new
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
    expect_raises(InvalidAppNameException) { app.name = "hgjfhgjf/hjfdhsjfhds" }
    expect_raises(InvalidAppNameException) { app.name = "[hgjfhgjf[hjfdhsjfhds" }
    expect_raises(InvalidAppNameException) { app.name = "" }
  end
  
  it "could return some reasonanle name without creating instance of class" do
    AppName.exec_name.should eq "crystal-run-spec"
  end
end
