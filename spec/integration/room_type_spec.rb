require 'swagger_helper'

describe 'Room API' do
  path '/api/v1/room_type' do
    post 'create room' do

    end
    get 'list of rooms' do
      tags 'rooms'
      consumes 'application/json', 'application/xml'

      parameter name: :per_page, in: :query, type: :string, required: false, example: 10
      parameter name: :page, in: :query, type: :string, required: true, example: 1
      parameter({
        in: :header,
        type: :string,
        name: 'Authorization',
        required: true,
        description: 'user Barer token'
      })

      response '200', 'Room Success' do
        run_test!
      end
    end
  end

end
