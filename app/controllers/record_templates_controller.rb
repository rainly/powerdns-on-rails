class RecordTemplatesController < ApplicationController
  
  require_role "admin"
  
  def create
    @record_template = RecordTemplate.new(params[:record_template])
    @zone_template = ZoneTemplate.find(params[:zone_template][:id])
    @record_template.zone_template = @zone_template
    if @record_template.save
      flash[:info] = "Record Template created!"
    end
  end
  
  def update
    @record_template = RecordTemplate.find(params[:id])
    if @record_template.update_attributes(params[:record_template])
      @record_template.save!
      flash[:info] = "Record Template updated!"
    end
    
  end
  
  def destroy
    @record_template = RecordTemplate.find(params[:id])
    zt = @record_template.zone_template
    @record_template.destroy
    flash[:info] = "Record Template successfully destroyed!"
    redirect_to template_path( zt )
  end
  
end