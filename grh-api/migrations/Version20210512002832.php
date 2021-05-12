<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210512002832 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE employe ADD CONSTRAINT FK_F804D3B92534008B FOREIGN KEY (structure_id) REFERENCES structure (id)');
        $this->addSql('ALTER TABLE gclasse CHANGE type_employe type_employe INT NOT NULL');
        $this->addSql('ALTER TABLE membre_syndicat CHANGE etat etat TINYINT(1) DEFAULT NULL COMMENT \'true si c\'\'est le syndicat actuel du travailleur
        un employé peut être dans plusieurs syndicats\'');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE employe DROP FOREIGN KEY FK_F804D3B92534008B');
        $this->addSql('ALTER TABLE gclasse CHANGE type_employe type_employe INT DEFAULT NULL');
        $this->addSql('ALTER TABLE grade DROP FOREIGN KEY FK_595AAE344D8771C0');
        $this->addSql('ALTER TABLE grade DROP FOREIGN KEY FK_595AAE34B3E9C81');
        $this->addSql('ALTER TABLE grade DROP FOREIGN KEY FK_595AAE34BCF5E72D');
        $this->addSql('ALTER TABLE membre_syndicat CHANGE etat etat TINYINT(1) DEFAULT NULL COMMENT \'true si c\'\'est le syndicat actuel du travailleur un employé peut être dans plusieurs syndicats\'');
    }
}
