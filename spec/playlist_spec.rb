describe WiMP::Playlist, vcr: {record: :new_episodes} do
  before(:each) do
    WiMP.configure do |config|
      config.username = "uuaa@reallymymail.com"
      config.password = "qdgfbb"
    end
  end

  let(:uuid) { "83331404-e312-4fe3-a6eb-00843e195c7b" }

  it "should create a playlist" do
    playlist = WiMP::Playlist.create("Tjohoo")
    playlist.url.should match(%r{http://wimpmusic.se/playlist/\w+})
  end

  it "should find by uuid" do
    WiMP::Playlist.find(uuid).uuid.should eq(uuid)
  end

  it "should be able to add tracks to playlist", vcr: { record: :all } do
    tracks = WiMP::Track.search("elvis", limit: 5)
    WiMP::Playlist.find(uuid).add_tracks(tracks, start_position: 100).should be_true
  end
end