<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210516160950 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE contrat ADD date_debut DATE NOT NULL, ADD date_fin DATE NOT NULL, DROP etat');
        $this->addSql('ALTER TABLE diplome_employe ADD statut_formation VARCHAR(255) NOT NULL, ADD commentaire LONGTEXT DEFAULT NULL, CHANGE annee_obtention annee_obtention VARCHAR(10) DEFAULT NULL');
        $this->addSql('ALTER TABLE grade ADD classe_id INT NOT NULL');
        $this->addSql('ALTER TABLE grade ADD CONSTRAINT FK_595AAE348F5EA509 FOREIGN KEY (classe_id) REFERENCES gclasse (id)');
        $this->addSql('CREATE INDEX IDX_595AAE348F5EA509 ON grade (classe_id)');
        $this->addSql('ALTER TABLE membre_syndicat CHANGE etat etat TINYINT(1) DEFAULT NULL COMMENT \'true si c\'\'est le syndicat actuel du travailleur
        un employé peut être dans plusieurs syndicats\'');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE contrat ADD etat TINYINT(1) NOT NULL, DROP date_debut, DROP date_fin');
        $this->addSql('ALTER TABLE diplome_employe DROP statut_formation, DROP commentaire, CHANGE annee_obtention annee_obtention VARCHAR(10) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`');
        $this->addSql('ALTER TABLE grade DROP FOREIGN KEY FK_595AAE348F5EA509');
        $this->addSql('DROP INDEX IDX_595AAE348F5EA509 ON grade');
        $this->addSql('ALTER TABLE grade DROP classe_id');
        $this->addSql('ALTER TABLE membre_syndicat CHANGE etat etat TINYINT(1) DEFAULT NULL COMMENT \'true si c\'\'est le syndicat actuel du travailleur
                un employé peut être dans plusieurs syndicats\'');
    }
}
