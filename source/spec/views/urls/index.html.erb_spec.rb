require 'rails_helper'

RSpec.describe "urls/index", :type => :view do
  before(:each) do
    assign(:urls, [
      Url.create!(
        :name => "Name",
        :short => "Short"
      ),
      Url.create!(
        :name => "Name",
        :short => "Short"
      )
    ])
  end

  it "renders a list of urls" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Short".to_s, :count => 2
  end
end
