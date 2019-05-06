bin/console ezplatform:install ezplatform-ee-clean
php bin/console doctrine:schema:update --dump-sql --force
bin/console kaliop:migration:migrate --path migrations/kaliop_migrations/users/201804161300_users.yml -n 
bin/console kaliop:migration:migrate --path migrations/kaliop_migrations/content_types/201804161300_content_types.yml -n
bin/console kaliop:migration:migrate --path migrations/kaliop_migrations/sections/201804161300_sections.yml -n
bin/console kaliop:migration:migrate --path migrations/kaliop_migrations/content/Components/201804161300_components.yml -n
bin/console kaliop:migration:migrate --path migrations/kaliop_migrations/content/Catalog/201804161300_product_catalog.yml -n
bin/console kaliop:migration:migrate --path migrations/kaliop_migrations/roles/201804161300_roles.yml -n
php bin/console silversolutions:switchdataprovider ez
bin/console ezplatform:reindex
bin/console cache:clear
