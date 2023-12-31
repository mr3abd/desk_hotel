require 'swagger_helper'

describe 'Room API' do
  path '/api/v1/room' do
    post 'create room' do
      tags 'rooms'
      consumes 'application/json'
      parameter({
        in: :header,
        type: :string,
        name: 'Authorization',
        required: true,
        description: 'user Barer token'
      })
      parameter name: :room, in: :body, schema: {
        type: :object,
        properties: {
          room: {
            type: :object,
            description: 'user mail ',
            properties: {
              description: {
                type: :string,
                description: '',
                example: 'details for room'
              },
              price: {
                type: :decimal,
                description: 'price room',
                example: 20
              },
              capacity: {
                type: :integer,
                description: 'capacity count guests',
                example: 3
              },
              room_type_id: {
                type: :integer,
                example: 1
              }
            }
          }
        }
      }
      response '200', 'Login Success' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 attributes: { type: :hash }
               },
               required: %w[id attributes]

        run_test!
      end

      response '401', 'Login Failed' do
        run_test!
      end
    end
    get 'list of rooms' do
      tags 'rooms'
      consumes 'application/json', 'application/xml'

      parameter name: :per_page, in: :query, type: :string, required: false, example: 10
      parameter name: :page, in: :query, type: :string, required: true, example: 1
      parameter name: :price_gt, in: :query, type: :integer, required: false, example: 1
      parameter name: :price_less, in: :query, type: :integer, required: false, example: 5
      parameter name: :room_type_id, in: :query, type: :integer, required: false
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
    get 'get room info' do
      tags 'rooms'
      consumes 'application/json', 'application/xml'

      parameter({
        in: :header,
        type: :string,
        name: 'Authorization',
        required: true,
        description: 'user Barer token'
      })
      parameter name: :id, in: :path, type: 'integer', required: true

      response '200', 'room Success' do
        run_test!
      end

      response '404', 'room Not Found' do
        run_test!
      end
    end
    put 'update room info' do
      tags 'rooms'
      consumes 'application/json', 'application/xml'
      parameter name: :room, in: :body, schema: {
        type: :object,
        properties: {
          room: {
            type: :object,
            description: 'user mail ',
            properties: {
              description: {
                type: :string,
                description: '',
                example: 'details for room'
              },
              price: {
                type: :decimal,
                description: 'price room',
                example: 20
              },
              capacity: {
                type: :integer,
                description: 'capacity count guests',
                example: 3
              },
              room_type_id: {
                type: :integer,
                example: 1
              }
            }
          }
        }
      }
      parameter({
        in: :header,
        type: :string,
        name: 'Authorization',
        required: true,
        description: 'user Barer token'
      })
    end
  end

end
