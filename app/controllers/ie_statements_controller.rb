# frozen_string_literal: true

class IeStatementsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ie_statement, only: [:show]

  # GET /ie_statements
  def index
    @ie_statements = current_user.ie_statements
    render json: @ie_statements
  end

  # POST /ie_statements
  def create
    @ie_statement = current_user.ie_statements.new(ie_statement_params)

    if @ie_statement.save
      render json: @ie_statement, status: :created
    else
      render json: { message: @ie_statement.errors }
    end
  end

  # GET /ie_statements/:id
  def show
    render json: @ie_statement
  end

  private

  def set_ie_statement
    @ie_statement = current_user.ie_statements.find(params[:id])
  end

  def ie_statement_params
    params.require(:ie_statement).permit(:income, :expenditure)
  end
end
