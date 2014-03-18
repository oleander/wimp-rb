describe "login", vcr: {record: :new_episodes} do
  after(:each) { WiMP.configuration.logout! }

  it "should return sesson id on successfull login" do
    WiMP.configure do |config|
      config.username = "uuaa@reallymymail.com"
      config.password = "qdgfbb"
    end
    WiMP.configuration.session.should_not be_empty
  end

  it "should raise error using invalid credentials" do
    WiMP.configure do |config|
      config.username = "-1"
      config.password = "-1"
    end
    expect {
      WiMP.configuration.session
    }.to raise_error(WiMP::LoginFailed)
  end
end