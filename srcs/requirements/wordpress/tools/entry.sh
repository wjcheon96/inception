sleep 10

# https://make.wordpress.org/cli/handbook/guides/installing/
# wp-cli installation
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# wp-cli download
cd /var/www

wp core install --allow-root --path=/var/www \
								--url=wocheon.42.fr \
								--title=Inception \
								--admin_user=$WP_ADMIN \
								--admin_password=$WP_ADMIN_PASSWORD \
								--admin_email=wocheon@student.42seoul.kr \
								--skip-email

wp user create --allow-root \
				$WP_USER user1@student.42seoul.kr \
				--role=author \
				--user_pass=$WP_PASSWORD && \
				wp plugin update --all

sleep 5
exec php-fpm7.3 -F