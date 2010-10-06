require 'spec_helper'

describe "reports/new.html.erb" do
  before(:each) do
    assign(:report, stub_model(Report,
      :new_record? => true,
      :name => "MyString"
    ))
  end

  it "renders new report form" do
    render

    rendered.should have_selector("form", :action => reports_path, :method => "post") do |form|
      form.should have_selector("input#report_name", :name => "report[name]")
    end
  end
end
