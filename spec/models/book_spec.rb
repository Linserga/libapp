require 'rails_helper'

describe Book do

	let(:book){FactoryGirl.create(:book)}

	it{should belong_to(:reader)}
	it{should validate_presence_of(:title)}

	describe 'with invalid title' do
		before {book.title = ''}
		it{should_not be_valid}
	end
end