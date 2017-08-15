require "rails_helper"

RSpec.describe "residents/index" do 
  it "displays all residents" do

    alex = Resident.new(first_name: "Alex", last_name: "Ispa-Cowan", documented: true)
    melanie = Resident.new(first_name: "Melanie", last_name: "Ilseman", documented: false)
    al = Resident.new(first_name: "Al", last_name: "Ilseman", documented: true)



    assign(:residents, [alex, melanie, al])

    render

    expect(rendered).to include "Alex", "Melanie", "true", "false", "Ilseman"
  end
end