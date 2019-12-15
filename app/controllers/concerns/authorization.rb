module Authorization

  private

    # Disallow action if the current user is not the owner of the POI or admin
    def allow_if_owner!
      current_record = instance_variable_get(:"@#{controller_name.singularize}")

      unless current_record.owner == current_user || current_user.admin?
        deny_access!
      end
    end

    def deny_access!
      index_url = self.public_send("#{controller_name}_url")

      respond_to do |format|
        format.html { redirect_to index_url, alert: "You don't have permission to do that" }
        format.json { head :no_content, status: :unauthorized }
      end
    end

end