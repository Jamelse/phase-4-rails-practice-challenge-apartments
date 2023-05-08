class LeasesController < ApplicationController

  def create
    lease = Lease.create!(lease_params)
    render json: lease, status: :created
  end

  def destroy
    lease = Lease.find(params[:id])
    lease.destroy
    render json: {}, status: :no_content
  end

  private 

  def lease_params
    params.permit(:rent)
  end

end
