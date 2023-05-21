wp core download  --path="/var/www/html/wordpress" --allow-root
wp config create --path="/var/www/html/wordpress" --allow-root --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_UP --dbhost=$HOSTNAME
wp core install --path="/var/www/html/wordpress" --allow-root --url=$DOMAIN --title="$WP_TITLE" --admin_user=$WP_A --admin_password=$WP_AP --admin_email=$WP_AE
wp plugin update --allow-root --all
wp user create --path="/var/www/html/wordpress" --allow-root $WP_USER $WP_UE --user_pass=$WP_UP

php-fpm7.3 -F
