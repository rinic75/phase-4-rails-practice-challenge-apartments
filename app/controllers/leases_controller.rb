class LeasesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

  def create 
    lease= lease.create!(lease_params)
    render json: lease, status: :created
  end

  def destroy
    lease = Lease.find(params[:id])
    lease.destroy
    head :no_content
  end


  private

  def lease_params
    params.permit(:apartment_id, :tenant_id, :rent)
  end

  def record_not_found(error)
    render json: { error: error.message }, status: :not_found
  end

  def record_invalid(error)
    render json: { error: error.message }, status: :unprocessable_entity
  end

end
