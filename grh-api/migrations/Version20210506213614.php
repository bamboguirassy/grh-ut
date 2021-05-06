<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210506213614 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('CREATE TABLE gcategorie (id INT AUTO_INCREMENT NOT NULL, suivant_id INT DEFAULT NULL, nom VARCHAR(255) NOT NULL, indice VARCHAR(10) NOT NULL, ordre INT NOT NULL, UNIQUE INDEX UNIQ_7FC5B5E59C2BB0CC (suivant_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE gclasse (id INT AUTO_INCREMENT NOT NULL, suivant_id INT DEFAULT NULL, nom VARCHAR(255) NOT NULL, indice VARCHAR(10) NOT NULL, ordre INT NOT NULL, UNIQUE INDEX UNIQ_ED38B3209C2BB0CC (suivant_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE gechelon (id INT AUTO_INCREMENT NOT NULL, suivant_id INT DEFAULT NULL, nom VARCHAR(255) NOT NULL, indice VARCHAR(10) NOT NULL, ordre INT NOT NULL, UNIQUE INDEX UNIQ_44FA5AB39C2BB0CC (suivant_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE gniveau (id INT AUTO_INCREMENT NOT NULL, suivant_id INT DEFAULT NULL, nom VARCHAR(255) NOT NULL, indice VARCHAR(10) NOT NULL, ordre INT NOT NULL, UNIQUE INDEX UNIQ_2960FFDD9C2BB0CC (suivant_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE profession (id INT AUTO_INCREMENT NOT NULL, classe_id INT DEFAULT NULL, nom VARCHAR(255) NOT NULL, INDEX IDX_BA930D698F5EA509 (classe_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('ALTER TABLE gcategorie ADD CONSTRAINT FK_7FC5B5E59C2BB0CC FOREIGN KEY (suivant_id) REFERENCES gcategorie (id)');
        $this->addSql('ALTER TABLE gclasse ADD CONSTRAINT FK_ED38B3209C2BB0CC FOREIGN KEY (suivant_id) REFERENCES gclasse (id)');
        $this->addSql('ALTER TABLE gechelon ADD CONSTRAINT FK_44FA5AB39C2BB0CC FOREIGN KEY (suivant_id) REFERENCES gechelon (id)');
        $this->addSql('ALTER TABLE gniveau ADD CONSTRAINT FK_2960FFDD9C2BB0CC FOREIGN KEY (suivant_id) REFERENCES gniveau (id)');
        $this->addSql('ALTER TABLE profession ADD CONSTRAINT FK_BA930D698F5EA509 FOREIGN KEY (classe_id) REFERENCES gclasse (id)');
        $this->addSql('ALTER TABLE employe ADD profession_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE employe ADD CONSTRAINT FK_F804D3B9FDEF8996 FOREIGN KEY (profession_id) REFERENCES profession (id)');
        $this->addSql('CREATE INDEX IDX_F804D3B9FDEF8996 ON employe (profession_id)');
        $this->addSql('ALTER TABLE fonction_employe CHANGE etat etat TINYINT(1) DEFAULT NULL COMMENT \'true ou false pour savoir si la fonction est toujours d\'\'actualité
        Donner la possibilité de définir une fonction comme étant la courante\'');
        $this->addSql('ALTER TABLE membre_syndicat CHANGE etat etat TINYINT(1) DEFAULT NULL COMMENT \'true si c\'\'est le syndicat actuel du travailleur
        un employé peut être dans plusieurs syndicats\'');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE gcategorie DROP FOREIGN KEY FK_7FC5B5E59C2BB0CC');
        $this->addSql('ALTER TABLE gclasse DROP FOREIGN KEY FK_ED38B3209C2BB0CC');
        $this->addSql('ALTER TABLE profession DROP FOREIGN KEY FK_BA930D698F5EA509');
        $this->addSql('ALTER TABLE gechelon DROP FOREIGN KEY FK_44FA5AB39C2BB0CC');
        $this->addSql('ALTER TABLE gniveau DROP FOREIGN KEY FK_2960FFDD9C2BB0CC');
        $this->addSql('ALTER TABLE employe DROP FOREIGN KEY FK_F804D3B9FDEF8996');
        $this->addSql('DROP TABLE gcategorie');
        $this->addSql('DROP TABLE gclasse');
        $this->addSql('DROP TABLE gechelon');
        $this->addSql('DROP TABLE gniveau');
        $this->addSql('DROP TABLE profession');
        $this->addSql('DROP INDEX IDX_F804D3B9FDEF8996 ON employe');
        $this->addSql('ALTER TABLE employe DROP profession_id');
        $this->addSql('ALTER TABLE fonction_employe CHANGE etat etat TINYINT(1) DEFAULT NULL COMMENT \'true ou false pour savoir si la fonction est toujours d\'\'actualité
                Donner la possibilité de définir une fonction comme étant la courante\'');
        $this->addSql('ALTER TABLE membre_syndicat CHANGE etat etat TINYINT(1) DEFAULT NULL COMMENT \'true si c\'\'est le syndicat actuel du travailleur
                un employé peut être dans plusieurs syndicats\'');
    }
}
