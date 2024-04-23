#!/bin/bash
sudo apt update
sudo apt install nginx unzip -y
zip_file='/tmp/sbs.zip'
download_url='https://www.free-css.com/assets/files/free-css-templates/download/page295/sbs.zip' 
template_folder='/tmp/sbs-html'
cd /tmp
# clean temp folder
if [ -d "${template_folder}" ]; then
  sudo rm -rf ${template_folder}
fi
# remove /tmp/kider.zip if it exists
if [ -f "${zip_file}" ]; then
  sudo rm ${zip_file}
fi
wget $download_url

unzip ${zip_file}
# if folder /var/www/html/kids exists, remove it
if [ -d "/var/www/html/kids" ]; then
  sudo rm -rf /var/www/html/kids
fi
sudo mv /tmp/sbs-html /var/www/html/kids