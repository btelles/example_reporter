require 'spec_helper'

describe "reports/index.html.erb" do
  before(:each) do
    assign(:reports, [
      stub_model(Report,
        :name => "Name"
      ),
      stub_model(Report,
        :name => "Name"
      )
    ])
  end

  it "renders a list of reports" do
    render
    rendered.should have_selector("tr>td", :content => "Name".to_s, :count => 2)
  end
end
