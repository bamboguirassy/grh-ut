<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210510155714 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('DROP TABLE echelon_classe');
        $this->addSql('ALTER TABLE grade ADD echelon_id INT NOT NULL, ADD niveau_id INT NOT NULL, ADD categorie_id INT NOT NULL');
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

        $this->addSql('CREATE TABLE echelon_classe (id INT AUTO_INCREMENT NOT NULL, echelon_id INT NOT NULL, niveau_id INT NOT NULL, categorie_id INT NOT NULL, indice VARCHAR(10) NOT NULL COLLATE utf8mb4_unicode_ci, INDEX IDX_39991F64D8771C0 (echelon_id), INDEX IDX_39991F6B3E9C81 (niveau_id), INDEX IDX_39991F6BCF5E72D (categorie_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = \'\' ');
        $this->addSql('ALTER TABLE echelon_classe ADD CONSTRAINT FK_39991F64D8771C0 FOREIGN KEY (echelon_id) REFERENCES gechelon (id) ON UPDATE NO ACTION ON DELETE NO ACTION');
        $this->addSql('ALTER TABLE echelon_classe ADD CONSTRAINT FK_39991F6B3E9C81 FOREIGN KEY (niveau_id) REFERENCES gniveau (id) ON UPDATE NO ACTION ON DELETE NO ACTION');
        $this->addSql('ALTER TABLE echelon_classe ADD CONSTRAINT FK_39991F6BCF5E72D FOREIGN KEY (categorie_id) REFERENCES gcategorie (id) ON UPDATE NO ACTION ON DELETE NO ACTION');
        $this->addSql('ALTER TABLE grade DROP FOREIGN KEY FK_595AAE344D8771C0');
        $this->addSql('ALTER TABLE grade DROP FOREIGN KEY FK_595AAE34B3E9C81');
        $this->addSql('ALTER TABLE grade DROP FOREIGN KEY FK_595AAE34BCF5E72D');
        $this->addSql('DROP INDEX IDX_595AAE344D8771C0 ON grade');
        $this->addSql('DROP INDEX IDX_595AAE34B3E9C81 ON grade');
        $this->addSql('DROP INDEX IDX_595AAE34BCF5E72D ON grade');
        $this->addSql('ALTER TABLE grade DROP echelon_id, DROP niveau_id, DROP categorie_id');
        $this->addSql('ALTER TABLE membre_syndicat CHANGE etat etat TINYINT(1) DEFAULT NULL COMMENT \'true si c\'\'est le syndicat actuel du travailleur
                un employé peut être dans plusieurs syndicats\'');
    }
}
