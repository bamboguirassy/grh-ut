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
        $this->addSql('ALTER TABLE grade ADD CONSTRAINT FK_595AAE344D8771C0 FOREIGN KEY (echelon_id) REFERENCES gechelon (id)');
        $this->addSql('ALTER TABLE grade ADD CONSTRAINT FK_595AAE34B3E9C81 FOREIGN KEY (niveau_id) REFERENCES gniveau (id)');
        $this->addSql('ALTER TABLE grade ADD CONSTRAINT FK_595AAE34BCF5E72D FOREIGN KEY (categorie_id) REFERENCES gcategorie (id)');
        $this->addSql('ALTER TABLE grade ADD CONSTRAINT FK_595AAE348F5EA509 FOREIGN KEY (classe_id) REFERENCES gclasse (id)');
        $this->addSql('ALTER TABLE membre_syndicat CHANGE etat etat TINYINT(1) DEFAULT NULL COMMENT \'true si c\'\'est le syndicat actuel du travailleur
        un employé peut être dans plusieurs syndicats\'');
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
