shared_examples_for "friend" do |device|
  it "should be called '#{device}' as its friendly.device" do
    @useragent.friendly.device.should == device
  end
end
