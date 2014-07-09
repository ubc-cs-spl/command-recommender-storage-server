require 'rubygems'
require 'json'

class CommandRecommenderController < ApplicationController
  respond_to :json

  def upload_data
    @command_errors = save_data(params[:user_id],params[:commands])

    if @user = User.find_by_user_id(params[:user_id])
      @user.last_upload_date = Time.now.getutc
    else
      @user = User.new({:user_id => params[:user_id],
                        :last_upload_date => Time.now.getutc})
    end

    respond_to do |format|
      if @command_errors.length == 0 && @user.save
        format.json {render :json => params[:commands]}
      else
        format.json {render json: {:user_errors => @user.errors,
                                   :command_errors => @command_errors},
                            status: 422}
      end
    end
  end

  private
  def save_data(user_id, usage_data)
    @command_errors = Array.new
    usage_data.each{ |command|
      new_command = Command.new(:user_id => user_id,
                                :what => command[:what],
                                :kind => command[:kind],
                                :bundleVersion => command[:bundleVersion],
                                :description => command[:description],
                                :bindingUsed => command[:bindingUsed],
                                :bundleId => command[:bundleId],
                                :time => command[:when])
      unless new_command.save
        @command_errors.push(new_command.errors)
        puts new_command.errors.inspect
      end
      if command[:kind] == 'command'
        if CommandDetail.first(:command_id => command[:name]).nil?
          detail = CommandDetail.new(:command_id => command[:description],
                                     :command_name => command[:name],
                                     :description => command[:info])
          detail.save
        end
      end
    }
    return @command_errors
  end
end

