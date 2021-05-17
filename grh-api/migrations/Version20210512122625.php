<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210512122625 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE fonction_employe DROP FOREIGN KEY FK_3554BF216F0137EA');
        $this->addSql('ALTER TABLE fonction_employe DROP FOREIGN KEY FK_3554BF21900D5BD');
        $this->addSql('DROP INDEX fk_fonction_employe_fonction1_idx ON fonction_employe');
        $this->addSql('DROP INDEX fk_fonction_employe_structure1_idx ON fonction_employe');
        $this->addSql('ALTER TABLE fonction_employe ADD responsabilite INT NOT NULL, DROP fonction, DROP structure');
        $this->addSql('ALTER TABLE fonction_employe ADD CONSTRAINT FK_3554BF214EA09820 FOREIGN KEY (responsabilite) REFERENCES structure_fonction (id)');
        $this->addSql('CREATE INDEX fk_fonction_employe_responsabilite_idx ON fonction_employe (responsabilite)');
        $this->addSql('ALTER TABLE membre_syndicat CHANGE etat etat TINYINT(1) DEFAULT NULL COMMENT \'true si c\'\'est le syndicat actuel du travailleur
        un employé peut être dans plusieurs syndicats\'');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE fonction_employe DROP FOREIGN KEY FK_3554BF214EA09820');
        $this->addSql('DROP INDEX fk_fonction_employe_responsabilite_idx ON fonction_employe');
        $this->addSql('ALTER TABLE fonction_employe ADD fonction INT DEFAULT NULL, ADD structure INT DEFAULT NULL, DROP responsabilite');
        $this->addSql('ALTER TABLE fonction_employe ADD CONSTRAINT FK_3554BF216F0137EA FOREIGN KEY (structure) REFERENCES structure (id) ON UPDATE NO ACTION ON DELETE NO ACTION');
        $this->addSql('ALTER TABLE fonction_employe ADD CONSTRAINT FK_3554BF21900D5BD FOREIGN KEY (fonction) REFERENCES fonction (id) ON UPDATE NO ACTION ON DELETE NO ACTION');
        $this->addSql('CREATE INDEX fk_fonction_employe_fonction1_idx ON fonction_employe (fonction)');
        $this->addSql('CREATE INDEX fk_fonction_employe_structure1_idx ON fonction_employe (structure)');
        $this->addSql('ALTER TABLE grade DROP FOREIGN KEY FK_595AAE344D8771C0');
        $this->addSql('ALTER TABLE grade DROP FOREIGN KEY FK_595AAE34B3E9C81');
        $this->addSql('ALTER TABLE grade DROP FOREIGN KEY FK_595AAE34BCF5E72D');
        $this->addSql('ALTER TABLE membre_syndicat CHANGE etat etat TINYINT(1) DEFAULT NULL COMMENT \'true si c\'\'est le syndicat actuel du travailleur un employé peut être dans plusieurs syndicats\'');
    }
}
