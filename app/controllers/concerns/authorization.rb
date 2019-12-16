##
# Provides helper methods for authorization tasks common across different controllers
module Authorization

  private

    ##
    # Disallow action if the current user is not the owner of the POI or admin
    def allow_if_owner!
      current_record = instance_variable_get(:"@#{controller_name.singularize}")

      unless current_record.owner == current_user || current_user.admin?
        deny_access!
      end
    end

    ##
    # Shows error message to the user to let them know they aren't authorized to perform an action
    #
    # The caller should implment its own authorization logic
    def deny_access!
      index_path = self.public_send("#{controller_name}_path")

      respond_to do |format|
        format.html { redirect_to index_path, alert: "You don't have permission to do that" }
        format.json { head :no_content, status: :unauthorized }
      end
    end

end