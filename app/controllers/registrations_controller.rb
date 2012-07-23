# encoding: UTF-8
class RegistrationsController < Devise::RegistrationsController

	def new
		super
	end

	def create
		super
	end

	def edit
		super
	end

	def update
		@user = current_user
		@old_username = @user.username_was
		if resource.update_with_password(params[resource_name])
			unless current_user.community_id.nil?
				@user = current_user
				@community = Community.find(@user.community_id)
				Post.create(headline: "Spielername geändert",
							category: "com" + @community.id.to_s,
							content: @old_username + " spielt jetzt unter dem Namen " + @user.username + " weiter.")
    		end
    		set_flash_message :notice, :updated if is_navigational_format?
    		sign_in resource_name, resource, :bypass => true
    		respond_with resource, :location => after_update_path_for(resource)
    	else
    		clean_up_passwords(resource)
    		respond_with_navigational(resource){ render_with_scope :edit }
    	end
    end

    def destroy
    	super
    end

    def cancel
    	super
    end

    protected

    def build_resource(hash=nil)
      super
    end

    def after_sign_up_path_for(resource)
      super
    end

    def redirect_location(scope, resource) #:nodoc:
      super
    end

    def after_inactive_sign_up_path_for(resource)
      super
    end

    def after_update_path_for(resource)
		super
    end

    def authenticate_scope!
    	super
    end
end

