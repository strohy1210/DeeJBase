require 'rails_helper'

RSpec.describe CommentsController, :type => :controller do

  let(:user) { User.create!(name: "Dinshaw") }
  let(:rating) { Rating.create!(score: 3, user: user) }
  let(:comment) { Comment.create!(body: "k"*40, rating: rating) }
  let(:venue) { Venue.create!(name:"the west") }
  let(:event) { Event.create!(venue: venue, date: Date.today) }

  let(:params) { {id: comment.id, date: Date.today, comment: {body: "k"*40}} }

  before do
    event
  end

  describe '#update' do
    it 'updates Comment#body' 
    it 'updates Rating#score'
    it 'creates an Event' do
      expect {
          post :update, params

        }.to change { Event.count }.by(1)
    end

    it 'associates current_user with Rating'
    it 'associates Rating with Event'
  end
end
