require 'spec_helper'

describe "products/edit" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :title => "MyString",
      :description => "MyText",
      :price => "9.99"
    ))
  end

  it "renders the edit product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", product_path(@product), "post" do
      assert_select "input#product_title[name=?]", "product[title]"
      assert_select "textarea#product_description[name=?]", "product[description]"
      assert_select "input#product_price[name=?]", "product[price]"
    end
  end
end
