# frozen_string_literal: true

# class of controller
class ServController < ApplicationController
  include ServHelper
  before_action :set_params, only: :result
  before_action :segments_of_powers, only: :result
  before_action :largest_segment, only: :result

  def index; end

  def result
    @xml_res = { before_processing: @arr, length: @length, after: @res_arr, largest_segment: @max_subarr }
    respond_to do |format|
      format.html
      format.xml { render xml: @xml_res }
    end
  end
end
