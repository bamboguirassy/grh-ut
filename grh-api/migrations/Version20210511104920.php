<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210511104920 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');  
        $this->addSql('ALTER TABLE employe ADD struture_id INT NOT NULL, ADD numero_affiliation_ipres VARCHAR(20) DEFAULT NULL');
        $this->addSql('ALTER TABLE employe ADD CONSTRAINT FK_F804D3B99C2214AD FOREIGN KEY (struture_id) REFERENCES structure (id)');
        $this->addSql('CREATE INDEX IDX_F804D3B99C2214AD ON employe (struture_id)');
        $this->addSql('ALTER TABLE grade ADD CONSTRAINT FK_595AAE344D8771C0 FOREIGN KEY (echelon_id) REFERENCES gechelon (id)');
        $this->addSql('ALTER TABLE grade ADD CONSTRAINT FK_595AAE34B3E9C81 FOREIGN KEY (niveau_id) REFERENCES gniveau (id)');
        $this->addSql('ALTER TABLE grade ADD CONSTRAINT FK_595AAE34BCF5E72D FOREIGN KEY (categorie_id) REFERENCES gcategorie (id)');
        $this->addSql('CREATE INDEX IDX_595AAE344D8771C0 ON grade (echelon_id)');
        $this->addSql('CREATE INDEX IDX_595AAE34B3E9C81 ON grade (niveau_id)');
        $this->addSql('CREATE INDEX IDX_595AAE34BCF5E72D ON grade (categorie_id)');
        $this->addSql('ALTER TABLE membre_syndicat CHANGE etat etat TINYINT(1) DEFAULT NULL COMMENT \'true si c\'\'est le syndicat actuel du travailleur
        un employé peut être dans plusieurs syndicats\'');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('DROP TABLE structure_fonction');
        $this->addSql('ALTER TABLE employe DROP FOREIGN KEY FK_F804D3B99C2214AD');
        $this->addSql('DROP INDEX IDX_F804D3B99C2214AD ON employe');
        $this->addSql('ALTER TABLE employe DROP struture_id, DROP numero_affilition_ipres');
        $this->addSql('ALTER TABLE grade DROP FOREIGN KEY FK_595AAE344D8771C0');
        $this->addSql('ALTER TABLE grade DROP FOREIGN KEY FK_595AAE34B3E9C81');
        $this->addSql('ALTER TABLE grade DROP FOREIGN KEY FK_595AAE34BCF5E72D');
        $this->addSql('DROP INDEX IDX_595AAE344D8771C0 ON grade');
        $this->addSql('DROP INDEX IDX_595AAE34B3E9C81 ON grade');
        $this->addSql('DROP INDEX IDX_595AAE34BCF5E72D ON grade');
        $this->addSql('ALTER TABLE membre_syndicat CHANGE etat etat TINYINT(1) DEFAULT NULL COMMENT \'true si c\'\'est le syndicat actuel du travailleur
                un employé peut être dans plusieurs syndicats\'');
    }
}
