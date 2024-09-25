class WelcomeController < ApplicationController
  def index
    render html: "¡Hola, mundo!"
  end
end
