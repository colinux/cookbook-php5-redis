#
# Cookbook Name:: php5-redis
# Recipe:: default
#
# Copyright 2013, Colin Darie <colindarie@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "php5-redis::default"

package "php5-dev" do
  action :install
end

source_dir = "#{Chef::Config[:file_cache_path]}/php5-redis"

git source_dir do
  repository 'https://github.com/nicolasff/phpredis.git'
  reference '2.2.3'
  action :sync
end

bash "install_php5-redis" do
  cwd source_dir
  code <<-EOH
    phpize
    ./configure
    make clean && make && make install
  EOH
  environment 'PREFIX' => "/usr/local/bin"
end