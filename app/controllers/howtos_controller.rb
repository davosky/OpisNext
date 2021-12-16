# frozen_string_literal: true

class HowtosController < ApplicationController
  load_and_authorize_resource

  before_action :set_howto, only: %i[show edit update destroy]

  def index
    @howtos = Howto.all.paginate(page: params[:page], per_page: 5)
  end

  def show; end

  def new
    @howto = Howto.new
    # authorize! :create, @howto
  end

  def edit
    # authorize! :update, @howto
  end

  def create
    @howto = Howto.new(howto_params)

    respond_to do |format|
      if @howto.save
        format.html { redirect_to @howto, notice: 'Howto was successfully created.' }
        format.json { render :show, status: :created, location: @howto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @howto.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @howto.update(howto_params)
        format.html { redirect_to @howto, notice: 'Howto was successfully updated.' }
        format.json { render :show, status: :ok, location: @howto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @howto.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @howto.destroy
    respond_to do |format|
      format.html { redirect_to howtos_url, notice: 'Howto was successfully destroyed.' }
      format.json { head :no_content }
    end
    # authorize! :destroy, @howto
  end

  private

  def set_howto
    @howto = Howto.find(params[:id])
  end

  def howto_params
    params.require(:howto).permit(:title, :topic, :description)
  end
end
