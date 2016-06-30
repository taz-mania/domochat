require 'rails_helper'

RSpec.describe "flats/edit", type: :view do
  before(:each) do
    @flat = assign(:flat, Flat.create!(
      :number => 1,
      :floor => 1,
      :entrance => 1
    ))
  end

  it "renders the edit flat form" do
    render

    assert_select "form[action=?][method=?]", flat_path(@flat), "post" do

      assert_select "input#flat_number[name=?]", "flat[number]"

      assert_select "input#flat_floor[name=?]", "flat[floor]"

      assert_select "input#flat_entrance[name=?]", "flat[entrance]"
    end
  end
end
