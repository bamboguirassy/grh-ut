<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210616090741 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('DROP INDEX cni ON employe');
        $this->addSql('ALTER TABLE employe CHANGE cni cni VARCHAR(45) NOT NULL');
        $this->addSql('ALTER TABLE fonction_employe CHANGE interimaire interimaire TINYINT(1) DEFAULT NULL COMMENT \'true ou false pour savoir si la fonction est intérimaire ou pas\'');
        $this->addSql('ALTER TABLE membre_syndicat CHANGE etat etat TINYINT(1) DEFAULT NULL COMMENT \'true si c\'\'est le syndicat actuel du travailleur
        un employé peut être dans plusieurs syndicats\'');
        $this->addSql('ALTER TABLE structure_fonction CHANGE appelation appelation VARCHAR(255) DEFAULT NULL');
        $this->addSql('ALTER TABLE structure_fonction ADD CONSTRAINT FK_580577F781CFA4CE FOREIGN KEY (rang) REFERENCES rang (id)');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE employe CHANGE cni cni VARCHAR(45) CHARACTER SET utf8mb4 DEFAULT NULL COLLATE `utf8mb4_unicode_ci`');
        $this->addSql('CREATE UNIQUE INDEX cni ON employe (cni)');
        $this->addSql('ALTER TABLE fonction_employe CHANGE interimaire interimaire TINYINT(1) DEFAULT NULL');
        $this->addSql('ALTER TABLE membre_syndicat CHANGE etat etat TINYINT(1) DEFAULT NULL');
        $this->addSql('ALTER TABLE structure_fonction DROP FOREIGN KEY FK_580577F781CFA4CE');
        $this->addSql('ALTER TABLE structure_fonction CHANGE appelation appelation VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`');
    }
}
