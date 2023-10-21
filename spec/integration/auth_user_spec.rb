require 'swagger_helper'
describe 'Users Session API' do
  path '/api/v1/users/login.json' do
    post 'User Login' do
      tags 'users'
      consumes 'application/json'

      parameter name: :user, in: :body, schema: {
        type: :object,
        required: %w[email password],
        properties: {
          user: {
            type: :object,
            description: 'user mail ',
            properties: {
              email: {
                type: :string,
                description: 'user mail',
                example: 'email@haider.com'
              },
              password: {
                type: :string,
                description: 'user password',
                example: '123456789'
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
  end

  path '/api/v1/users/signup.json' do
    post 'User SignUp' do
      tags 'users'
      consumes 'application/json'

      parameter name: :user, in: :body, schema: {
        type: :object,
        required: %w[email password],
        properties: {
          user: {
            type: :object,
            description: 'user mail ',
            properties: {
              email: {
                type: :string,
                description: 'user mail',
                example: 'email@haider.com'
              },
              password: {
                type: :string,
                description: 'user password',
                example: '123456789'
              }
            }
          }
        }
      }

      response '200', 'SignUp Success' do
        run_test!
      end

      response '422', 'SignUp Failed' do
        run_test!
      end
    end
  end

  path '/api/v1/users/signup' do
    delete 'User delete' do
      tags 'users'
      consumes 'application/json'

      parameter name: :password, in: :query, type: :string, required: true, example: Faker::Internet.password

      response '200', 'Deleted Success' do
        run_test!
      end

      response '422', 'Deleted Failed' do
        run_test!
      end
    end
  end

  path '/api/v1/users/logout' do
    delete 'User Logout' do
      tags 'users'
      consumes 'application/json', 'application/xml'
      security [Bearer: {}]
      parameter({
                  in: :header,
                  type: :string,
                  name: :Authorization,
                  required: true,
                  description: 'Client token'
                })

      response '200', 'Logout Success' do
        run_test!
      end

      response '401', 'Logout Failed' do
        run_test!
      end
    end
  end

  path '/api/v1/users/password' do
    post ' Forget Password Request' do
      tags 'users'
      consumes 'application/json'

      parameter name: :user, in: :body, schema: {
        type: :object,
        required: %w[email],
        properties: {
          user: {
            type: :object,
            description: 'user mail ',
            properties: {
              email: {
                type: :string,
                description: 'user mail',
                example: 'email@haider.com'
              }
            }
          }
        }
      }
      response '201', 'Forget password Success' do
        run_test!
      end

      response '422', 'Failed' do
        run_test!
      end
    end
  end

  path '/api/v1/users/password' do
    patch ' Rest Password Request' do
      tags 'users'
      consumes 'application/json'

      parameter name: :user, in: :body, schema: {
        type: :object,
        required: %w[password reset_password_token password_confirmation],
        properties: {
          user: {
            type: :object,
            description: 'user details ',
            properties: {
              reset_password_token: {
                type: :string,
                description: 'user mail ',
                example: 'TOKEN_HERE'
              },
              password: {
                type: :string,
                description: 'user password',
                example: '123456789'
              },
              password_confirmation: {
                type: :string,
                description: 'user password',
                example: '123456789'
              }
            }
          }
        }
      }
      response '204', 'Rest password Success' do
        run_test!
      end

      response '422', 'Failed' do
        run_test!
      end
    end
  end
end
