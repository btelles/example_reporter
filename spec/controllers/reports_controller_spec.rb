require 'spec_helper'

describe ReportsController do

  def mock_report(stubs={})
    @mock_report ||= mock_model(Report, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all reports as @reports" do
      Report.stub(:all) { [mock_report] }
      get :index
      assigns(:reports).should eq([mock_report])
    end
  end

  describe "GET show" do
    it "assigns the requested report as @report" do
      Report.stub(:find).with("37") { mock_report }
      get :show, :id => "37"
      assigns(:report).should be(mock_report)
    end
  end

  describe "GET new" do
    it "assigns a new report as @report" do
      Report.stub(:new) { mock_report }
      get :new
      assigns(:report).should be(mock_report)
    end
  end

  describe "GET edit" do
    it "assigns the requested report as @report" do
      Report.stub(:find).with("37") { mock_report }
      get :edit, :id => "37"
      assigns(:report).should be(mock_report)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created report as @report" do
        Report.stub(:new).with({'these' => 'params'}) { mock_report(:save => true) }
        post :create, :report => {'these' => 'params'}
        assigns(:report).should be(mock_report)
      end

      it "redirects to the created report" do
        Report.stub(:new) { mock_report(:save => true) }
        post :create, :report => {}
        response.should redirect_to(report_url(mock_report))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved report as @report" do
        Report.stub(:new).with({'these' => 'params'}) { mock_report(:save => false) }
        post :create, :report => {'these' => 'params'}
        assigns(:report).should be(mock_report)
      end

      it "re-renders the 'new' template" do
        Report.stub(:new) { mock_report(:save => false) }
        post :create, :report => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested report" do
        Report.should_receive(:find).with("37") { mock_report }
        mock_report.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :report => {'these' => 'params'}
      end

      it "assigns the requested report as @report" do
        Report.stub(:find) { mock_report(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:report).should be(mock_report)
      end

      it "redirects to the report" do
        Report.stub(:find) { mock_report(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(report_url(mock_report))
      end
    end

    describe "with invalid params" do
      it "assigns the report as @report" do
        Report.stub(:find) { mock_report(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:report).should be(mock_report)
      end

      it "re-renders the 'edit' template" do
        Report.stub(:find) { mock_report(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested report" do
      Report.should_receive(:find).with("37") { mock_report }
      mock_report.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the reports list" do
      Report.stub(:find) { mock_report }
      delete :destroy, :id => "1"
      response.should redirect_to(reports_url)
    end
  end

end
