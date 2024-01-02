class EasyBrokerListsController < ApplicationController
  def index
    list = EasyBrokerService.get_title_lists

    render json: list
  end
end