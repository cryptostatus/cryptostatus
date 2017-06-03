template "#{node.nginx.dir}/sites-available/cryptostatus.conf" do
  source 'cryptostatus.conf.erb'
  mode '0644'
  notifies :reload, 'service[nginx]', :delayed
end

nginx_site 'cryptostatus.conf'
