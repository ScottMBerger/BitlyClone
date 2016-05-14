require 'rails_helper'

RSpec.describe "urls/new", :type => :view do
  before(:each) do
    assign(:url, Url.new(
      :name => "MyString",
      :short => "MyString"
    ))
  end

  it "renders new url form" do
    render

    assert_select "form[action=?][method=?]", urls_path, "post" do

      assert_select "input#url_name[name=?]", "url[name]"

      assert_select "input#url_short[name=?]", "url[short]"
    end
  end
end
