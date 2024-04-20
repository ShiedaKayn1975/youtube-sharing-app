class ApplicationController < ActionController::API
  include Authorization
  include ResponseHelper
end
