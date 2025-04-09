#!/bin/bash
# Usage:
# First make a directory for your new site at
# /var/www/example.local
# Make sure you have your apache configuration template at
# /etc/apache2/sites-available/example.local.conf
# Make sure you've updated db_root_user and db_root_pw below
# Then run this script with the base name of your site as the first argument
# e.g. create-site example
# For Drupal 10 sites, I have another conf file
##!/bin/bash
#!/bin/bash

site=$1
site_type=$2

# Check if the site variable ends with .local
if [[ $site == *.local ]]; then
    domain_name=$site
    site=${site%.local}
else
    domain_name="$site.local"
fi

document_root="/var/www/$domain_name/htdocs"
app_env="dev"
app_name=$site
db_root_user="admin"
db_root_pw="admin"

# Determine the configuration file to use based on site_type
if [[ $site_type == "d10" ]]; then
    config_file="example-d10.local.conf"
else
    config_file="example.local.conf"
fi

cd /etc/apache2/sites-available
sudo cp $config_file "$site".local.conf
sudo sed -i "s/{{ domain_name }}/${domain_name}/g" "$site".local.conf
sudo sed -i "s={{ document_root }}=${document_root}=g" "$site".local.conf
sudo sed -i "s/{{ app_env }}/${app_env}/g" "$site".local.conf
sudo sed -i "s/{{ app_name }}/${app_name}/g" "$site".local.conf
sudo a2ensite "$site".local
sudo systemctl reload apache2
echo "127.0.0.1 ${domain_name}" | sudo tee -a /etc/hosts
mysql -u${db_root_user} -p${db_root_pw} -e "create database ${site}_dev"
