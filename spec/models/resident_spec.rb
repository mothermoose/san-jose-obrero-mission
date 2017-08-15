require 'rails_helper'

RSpec.describe Resident, type: :model do
  it "stores resident intake data" do
    # setup 

    alex = Resident.create(first_name: "Alex", last_name: "Ispa-Cowan", hmis_number: "123abc", gender: "female", ethnicity: "hispanic", bed_id: 1, documented: true )
    melanie = Resident.create(first_name: "Melanie", last_name: "Ilseman", hmis_number: "234bcd", gender: "female", ethnicity: "hispanic", bed_id: 2, documented: true )
    
    # action
    expected_alex = Resident.find_by(first_name: "Alex")
    expected_melanie = Resident.find_by(first_name: "Melanie")
    # assertion
    expect(expected_melanie.bed_id).to eq 2
  end
end 

RSpec.describe Resident, type: :model do
  it "associates the bed model and resident model to determine what bed belongs to what resident" do
    california_king = Bed.create(room_id: 2, name: "california_king", top_or_bottom: "bottom", occupied: "true")
    alex = Resident.create(first_name: "Alex", last_name: "Ispa-Cowan", hmis_number: "123abc", gender: "female", ethnicity: "hispanic", bed_id: california_king.id, documented: true )
    
    # action
    california_king = Bed.find_by(name: "california_king")
    
    # assertion

    expect(california_king.resident).to eq alex
  end
end
