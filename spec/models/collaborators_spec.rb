require_relative "../spec_helper"

describe "Collaborator Model" do

	it 'should return an array containing 15 numbers' do
		expect(Collaborator.selection.count).to eq(15)
	end
end