ey_cloud_report "whenever" do 
	message "starting whenever recipe"
end

appname="cook-smarts"
Chef::Log.info "Starting whenever recipe"
if ['solo', 'app-master'].include?(node[:instance_role])
	local_user=node[:users].first
	execute "whenever" do
		Chef::Log.info "Running whenever recipe"
		cwd "/data/cook_smarts/current"
		user local_user[:username]
		command "whenever --update-crontab 'cook_smarts_#{node[:enviroment][:framework_env]}'"
		action :run
	end
	Chef::Log.info "Completed whenever recipe"
	ey_cloud_report "whenever" do
		message "whenever recipe complete"
	end
end