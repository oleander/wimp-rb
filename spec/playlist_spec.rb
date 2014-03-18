describe WiMP::Playlist, vcr: {record: :new_episodes} do
  before(:each) do
    WiMP.configure do |config|
      config.username = "uuaa@reallymymail.com"
      config.password = "qdgfbb"
    end
  end

  let(:uuid) { "83331404-e312-4fe3-a6eb-00843e195c7b" }
  let(:playlist) { WiMP::Playlist.find(uuid) }

  it "should create a playlist" do
    playlist = WiMP::Playlist.create("Tjohoo")
    playlist.url.should match(%r{http://wimpmusic.se/playlist/\w+})
  end

  it "should find by uuid" do
    playlist.uuid.should eq(uuid)
  end

  it "should be able to add tracks to playlist" do
    tracks = WiMP::Track.search("elvis", limit: 5)
    playlist.add_tracks(tracks, start_position: 100).should be_true
  end

  it "should add my track id" do
    playlist.add_tracks_by_id([415672]).should be_true
  end

  it "should be able to remove tracks" do
    playlist.remove_tracks_by_indices([1,2,3]).should be_true
  end

  it "should not crash on invalid pos" do
    playlist.remove_tracks_by_indices([400]).should be_true
  end
end