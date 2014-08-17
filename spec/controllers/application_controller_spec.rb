require 'rails_helper'

describe ApplicationController do

	let(:reader){FactoryGirl.create(:reader)}

	describe 'current_reader' do
		it 'returns nil if reader is not logged in' do
			session[:current_reader_id] = nil
			expect(controller.current_reader).to be_nil
		end
		it 'returns reader object if reader is logged in' do
			session[:current_reader_id] = reader.id
			expect(controller.current_reader).to eq(reader)
		end
	end
end