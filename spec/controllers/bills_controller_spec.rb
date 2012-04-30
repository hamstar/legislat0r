require 'spec_helper.rb'

describe BillsController do
  let(:bill) { FactoryGirl.create(:bill) }

  it "should get the index" do
    get :index
    response.should be_success
  end

  it "should get new" do
    get :new
    response.should be_success
  end

  it "should create a bill" do
    post :create, bill: { name: bill.name, markdown: bill.markdown }
    new_bill = Bill.last
    new_bill.name.should == bill.name #no need to test markdown as the factories have identical markdowns
  end

  it "shoud show bill" do
    get :show, id: bill
    response.should be_success
  end

  it "should get edit" do
    get :edit, id: bill
    response.should be_success
  end

  it "should update bill" do
    put :update, id: bill, bill: { name: "New name" }
    Bill.find(bill.id).name.should == "New name"
    response.should be_redirect
  end

  it "should destroy bill" do
    lambda { Bill.find(bill.id) }.should_not raise_error(ActiveRecord::RecordNotFound)
    delete :destroy, id: bill
    lambda { Bill.find(bill.id) }.should raise_error(ActiveRecord::RecordNotFound)
    response.should redirect_to(bills_path)
  end

    
end
