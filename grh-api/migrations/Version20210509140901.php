<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210509140901 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE gclasse ADD type_employe INT DEFAULT NULL');
        $this->addSql('ALTER TABLE gclasse ADD CONSTRAINT FK_ED38B320D025BC4C FOREIGN KEY (type_employe) REFERENCES type_employe (id)');
        $this->addSql('CREATE INDEX IDX_ED38B320D025BC4C ON gclasse (type_employe)');
        $this->addSql('ALTER TABLE membre_syndicat CHANGE etat etat TINYINT(1) DEFAULT NULL COMMENT \'true si c\'\'est le syndicat actuel du travailleur
        un employé peut être dans plusieurs syndicats\'');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE gclasse DROP FOREIGN KEY FK_ED38B320D025BC4C');
        $this->addSql('DROP INDEX IDX_ED38B320D025BC4C ON gclasse');
        $this->addSql('ALTER TABLE gclasse DROP type_employe');
        $this->addSql('ALTER TABLE membre_syndicat CHANGE etat etat TINYINT(1) DEFAULT NULL COMMENT \'true si c\'\'est le syndicat actuel du travailleur
                un employé peut être dans plusieurs syndicats\'');
    }
}
