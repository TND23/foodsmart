require 'spec_helper'

describe Ingredient do 

	it { should validate_presence_of(:description) }

	it { should have_and_belong_to_many(:recipes) }

	it {should allow_mass_assignment_of(:name) }

	it {should allow_mass_assignment_of(:description) }

end