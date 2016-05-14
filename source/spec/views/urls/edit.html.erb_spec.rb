require 'rails_helper'

RSpec.describe "urls/edit", :type => :view do
  before(:each) do
    @url = assign(:url, Url.create!(
      :name => "MyString",
      :short => "MyString"
    ))
  end

  it "renders the edit url form" do
    render

    assert_select "form[action=?][method=?]", url_path(@url), "post" do

      assert_select "input#url_name[name=?]", "url[name]"

      assert_select "input#url_short[name=?]", "url[short]"
    end
  end
end
