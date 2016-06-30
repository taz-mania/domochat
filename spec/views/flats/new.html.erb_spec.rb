require 'rails_helper'

RSpec.describe "flats/new", type: :view do
  before(:each) do
    assign(:flat, Flat.new(
      :number => 1,
      :floor => 1,
      :entrance => 1
    ))
  end

  it "renders new flat form" do
    render

    assert_select "form[action=?][method=?]", flats_path, "post" do

      assert_select "input#flat_number[name=?]", "flat[number]"

      assert_select "input#flat_floor[name=?]", "flat[floor]"

      assert_select "input#flat_entrance[name=?]", "flat[entrance]"
    end
  end
end
