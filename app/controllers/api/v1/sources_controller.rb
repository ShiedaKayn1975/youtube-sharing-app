class Api::V1::SourcesController < Api::V1::ApiController
  def index
    @sources = Source.all
  end
end
