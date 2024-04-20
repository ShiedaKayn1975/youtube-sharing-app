# frozen_string_literal: true

class Api::V1::ApiController < ApplicationController
  before_action :authenticate_user!
end
