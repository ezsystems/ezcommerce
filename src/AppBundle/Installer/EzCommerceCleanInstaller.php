<?php
/**
 * @copyright Copyright (C) eZ Systems AS. All rights reserved.
 * @license For full copyright and license information view LICENSE file distributed with this source code.
 */
namespace AppBundle\Installer;

use EzSystems\PlatformInstallerBundle\Installer\CoreInstaller;
use Symfony\Component\Filesystem\Filesystem;

class EzCommerceCleanInstaller extends CoreInstaller
{
    use InstallerCommandExecuteTrait;

    public function importData()
    {
        $liveSchema = $this->db->getSchemaManager()->createSchema();
        $dbPlatform = $this->db->getDatabasePlatform();

        foreach (['kaliop_migrations', 'kaliop_migrations_contexts'] as $tableName) {
            if (!$liveSchema->hasTable($tableName)) {
                continue;
            }
            $this->db->exec($dbPlatform->getTruncateTableSQL($tableName));
        }

        $migrationCommands = [
            'ezplatform:install ezplatform-ee-clean',
            'doctrine:schema:update --dump-sql --force',
            'kaliop:migration:migrate --path migrations/kaliop_migrations/users/201804161300_users.yml -n',
            'kaliop:migration:migrate --path migrations/kaliop_migrations/content_types/201804161300_content_types.yml -n',
            'kaliop:migration:migrate --path migrations/kaliop_migrations/sections/201804161300_sections.yml -n',
            'kaliop:migration:migrate --path migrations/kaliop_migrations/content/Components/201804161300_components.yml -n',
            'kaliop:migration:migrate --path migrations/kaliop_migrations/content/Catalog/201804161300_product_catalog.yml -n',
            'kaliop:migration:migrate --path migrations/kaliop_migrations/roles/201804161300_roles.yml -n',
            'silversolutions:switchdataprovider ez',
            'ezplatform:reindex',
        ];

        foreach ($migrationCommands as $cmd) {
            $this->output->writeln(sprintf('executing migration: %s', $cmd));
            $this->executeCommand($this->output, $cmd, 0);
        }
    }

    public function importBinaries()
    {
        $this->output->writeln('Copying storage directory contents...');
        $fs = new Filesystem();
        $fs->mkdir('web/var/site');
    }
}
