Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins 'localhost:8080', 'bx-pokecoin-prod.herokuapp.com/', 'bx-pokecoin-qa.herokuapp.com/',
              'localhost',
              'localhost:4200',
              'localhost:3000',
              'localhost:8100',
              'app.hobz.com.br',
              'app-qa.hobz.com.br',
              'deliveryapp.hobz.com.br',
              'deliveryapp-qa.hobz.com.br',
              'app.hobz.com.br',
              '192.168.0.70:8080',
              '192.168.0.37:8100'
      resource '*',
               headers: :any,
               methods: %i[get post put patch delete options head]
    end
  end