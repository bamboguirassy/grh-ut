<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210610093652 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE responsabilite DROP FOREIGN KEY FK_4EA0982057889920');
        $this->addSql('ALTER TABLE structure_fonction DROP FOREIGN KEY FK_580577F757889920');
        $this->addSql('CREATE TABLE rang (id INT AUTO_INCREMENT NOT NULL, nom VARCHAR(255) NOT NULL, etat TINYINT(1) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('DROP TABLE fonction');
        $this->addSql('DROP INDEX IDX_4EA0982057889920 ON responsabilite');
        $this->addSql('ALTER TABLE responsabilite DROP fonction_id');
        $this->addSql('DROP INDEX IDX_580577F757889920 ON structure_fonction');
        $this->addSql('ALTER TABLE structure_fonction DROP fonction_id');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

    }
}
