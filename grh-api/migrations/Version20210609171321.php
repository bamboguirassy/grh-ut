<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210609171321 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE structure DROP FOREIGN KEY fk_structure_typeentite');
        $this->addSql('DROP TABLE type_entite');
        $this->addSql('ALTER TABLE grade ADD CONSTRAINT FK_595AAE344D8771C0 FOREIGN KEY (echelon_id) REFERENCES gechelon (id)');
        $this->addSql('ALTER TABLE grade ADD CONSTRAINT FK_595AAE34B3E9C81 FOREIGN KEY (niveau_id) REFERENCES gniveau (id)');
        $this->addSql('ALTER TABLE grade ADD CONSTRAINT FK_595AAE34BCF5E72D FOREIGN KEY (categorie_id) REFERENCES gcategorie (id)');
        $this->addSql('ALTER TABLE grade ADD CONSTRAINT FK_595AAE348F5EA509 FOREIGN KEY (classe_id) REFERENCES gclasse (id)');
        $this->addSql('ALTER TABLE membre_syndicat CHANGE etat etat TINYINT(1) DEFAULT NULL COMMENT \'true si c\'\'est le syndicat actuel du travailleur
        un employé peut être dans plusieurs syndicats\'');
        $this->addSql('DROP INDEX fk_structure_typeentite_idx ON structure');
        $this->addSql('ALTER TABLE structure DROP type_entite');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('CREATE TABLE type_entite (id INT AUTO_INCREMENT NOT NULL, nom VARCHAR(45) CHARACTER SET utf8 NOT NULL COLLATE `utf8_general_ci`, code VARCHAR(45) CHARACTER SET utf8 NOT NULL COLLATE `utf8_general_ci`, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB COMMENT = \'\' ');
        $this->addSql('ALTER TABLE grade DROP FOREIGN KEY FK_595AAE344D8771C0');
        $this->addSql('ALTER TABLE grade DROP FOREIGN KEY FK_595AAE34B3E9C81');
        $this->addSql('ALTER TABLE grade DROP FOREIGN KEY FK_595AAE34BCF5E72D');
        $this->addSql('ALTER TABLE grade DROP FOREIGN KEY FK_595AAE348F5EA509');
        $this->addSql('ALTER TABLE membre_syndicat CHANGE etat etat TINYINT(1) DEFAULT NULL COMMENT \'true si c\'\'est le syndicat actuel du travailleur
                un employé peut être dans plusieurs syndicats\'');
        $this->addSql('ALTER TABLE structure ADD type_entite INT DEFAULT NULL');
        $this->addSql('ALTER TABLE structure ADD CONSTRAINT fk_structure_typeentite FOREIGN KEY (type_entite) REFERENCES type_entite (id)');
        $this->addSql('CREATE INDEX fk_structure_typeentite_idx ON structure (type_entite)');
    }
}
