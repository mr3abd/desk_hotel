require 'swagger_helper'

describe 'Room API' do
  path '/api/v1/reservation' do
    post 'create reservation' do
      tags 'reservation'
      consumes 'application/json'
      parameter({
        in: :header,
        type: :string,
        name: 'Authorization',
        required: true,
        description: 'user Barer token'
      })
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          reservation: {
            type: :object,
            description: 'user mail ',
            properties: {
              room_id: {
                type: :integer,
                description: '',
                example: 'room id'
              },
              guests_count: {
                type: :integer,
                description: 'guests count',
                example: 2
              },
              end_date: {
                type: :string,
                description: 'capacity count guests',
                example: '2022-10-10'
              },
              start_date: {
                type: :string,
                example: '2022-10-1'
              }
            }
          }
        }
      }
      response '200', 'reservation Success' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 attributes: { type: :hash }
               },
               required: %w[id attributes]

        run_test!
      end

      response '401', 'reservation Failed' do
        run_test!
      end
    end
    get 'list of rooms' do
      tags 'reservation'
      consumes 'application/json', 'application/xml'

      parameter name: :per_page, in: :query, type: :string, required: false, example: 10
      parameter name: :page, in: :query, type: :string, required: true, example: 1
      parameter name: :start_date, in: :query, type: :integer, required: false, example: 1
      parameter name: :end_date, in: :query, type: :integer, required: false, example: 5
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

  path '/api/v1/room/{id}' do

    put 'update room info' do
      tags 'rooms'
      consumes 'application/json', 'application/xml'

      parameter({
        in: :header,
        type: :string,
        name: 'Authorization',
        required: true,
        description: 'user Barer token'
      })
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          reservation: {
            type: :object,
            description: 'user mail ',
            properties: {
              room_id: {
                type: :integer,
                description: '',
                example: 'room id'
              },
              guests_count: {
                type: :integer,
                description: 'guests count',
                example: 2
              },
              end_date: {
                type: :string,
                description: 'capacity count guests',
                example: '2022-10-10'
              },
              start_date: {
                type: :string,
                example: '2022-10-1'
              },
              status: {
                type: :string,
                exampe: 'cancel'
              }
            }
          }
        }
      }
    end
  end

end
