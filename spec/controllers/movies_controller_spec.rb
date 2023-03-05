require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  context 'Movies Master' do
    let(:application) { create(:application) }
    let(:movie_params) do
      { "title" => "The Avengers",
        "description" => "adalah sebuah filmpahlawan super Amerika tahun 2012 berdasarkan tim pahlawan super Marvel Comics dengan nama yang sama",
        "rating" => 8.9,
        "image" => "#<ActionDispatch::Http::UploadedFile:0x00007f9d9203bab0>"
      }
    end

    describe "GET # index" do
      it "index should return 200" do
        get :index
        expect(response).to have_http_status(:ok)
      end
    end

    describe "POST # create" do
      it 'will return 200' do
        post :create, params: { movie: movie_params }
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)['title']).to eq('The Avengers')
      end
    end

    describe "PUT # update" do
      before do
        @movie = create(:movie)
      end

      it "will return 200" do
        put :update, params: { id: @movie.id, movie: { "title" => 'The Avengers: Age of Ultron' } }
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)['title']).to eq('The Avengers: Age of Ultron')
      end
    end

    describe "DELETE # destory" do
      before do
        @movie = create(:movie)
      end

      it "will return 200" do
        delete :destroy, params: { id: @movie.id }
        expect(response).to have_http_status(:ok)
        expect(Movie.where(id: @movie.id).count).to eq(0)
      end
    end
  end
end
