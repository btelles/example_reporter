require 'spec_helper'

describe "reports/edit.html.erb" do
  before(:each) do
    @report = assign(:report, stub_model(Report,
      :new_record? => false,
      :name => "MyString"
    ))
  end

  it "renders the edit report form" do
    render

    rendered.should have_selector("form", :action => report_path(@report), :method => "post") do |form|
      form.should have_selector("input#report_name", :name => "report[name]")
    end
  end
end
