ey_cloud_report "whenever" do 
	message "starting whenever recipe"
end

appname="cook-smarts"

if ['solo', 'app-master'].include?(node[:instance_role])
	local_user=node[:users].first
	execute "whenever" do
		cwd "/data/cook_smarts/current"
		user local_user[:username]
		command "whenever --update-crontab 'cook_smarts_#{node[:enviroment][:framework_env]}'"
		action :run
	end

	ey_cloud_report "whenever" do
		message "whenever recipe complete"
	end
end