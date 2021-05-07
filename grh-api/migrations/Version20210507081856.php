<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210507081856 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('CREATE TABLE echelon_classe (id INT AUTO_INCREMENT NOT NULL, echelon_id INT NOT NULL, niveau_id INT NOT NULL, categorie_id INT NOT NULL, indice VARCHAR(10) NOT NULL, INDEX IDX_39991F64D8771C0 (echelon_id), INDEX IDX_39991F6B3E9C81 (niveau_id), INDEX IDX_39991F6BCF5E72D (categorie_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE gcategorie (id INT AUTO_INCREMENT NOT NULL, suivant_id INT DEFAULT NULL, nom VARCHAR(255) NOT NULL, indice VARCHAR(10) NOT NULL, ordre INT NOT NULL, UNIQUE INDEX UNIQ_7FC5B5E59C2BB0CC (suivant_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE gclasse (id INT AUTO_INCREMENT NOT NULL, suivant_id INT DEFAULT NULL, nom VARCHAR(255) NOT NULL, indice VARCHAR(10) NOT NULL, ordre INT NOT NULL, UNIQUE INDEX UNIQ_ED38B3209C2BB0CC (suivant_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE gclasse_gcategorie (gclasse_id INT NOT NULL, gcategorie_id INT NOT NULL, INDEX IDX_72EFA80AB9E6C6D8 (gclasse_id), INDEX IDX_72EFA80ABBD4BBC6 (gcategorie_id), PRIMARY KEY(gclasse_id, gcategorie_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE gclasse_gniveau (gclasse_id INT NOT NULL, gniveau_id INT NOT NULL, INDEX IDX_8DAEAF65B9E6C6D8 (gclasse_id), INDEX IDX_8DAEAF653D86FF50 (gniveau_id), PRIMARY KEY(gclasse_id, gniveau_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE gechelon (id INT AUTO_INCREMENT NOT NULL, suivant_id INT DEFAULT NULL, nom VARCHAR(255) NOT NULL, indice VARCHAR(10) NOT NULL, ordre INT NOT NULL, UNIQUE INDEX UNIQ_44FA5AB39C2BB0CC (suivant_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE gniveau (id INT AUTO_INCREMENT NOT NULL, suivant_id INT DEFAULT NULL, nom VARCHAR(255) NOT NULL, indice VARCHAR(10) NOT NULL, ordre INT NOT NULL, UNIQUE INDEX UNIQ_2960FFDD9C2BB0CC (suivant_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE profession (id INT AUTO_INCREMENT NOT NULL, classe_id INT DEFAULT NULL, nom VARCHAR(255) NOT NULL, INDEX IDX_BA930D698F5EA509 (classe_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE responsabilite (id INT AUTO_INCREMENT NOT NULL, fonction_id INT NOT NULL, structure_id INT NOT NULL, INDEX IDX_4EA0982057889920 (fonction_id), INDEX IDX_4EA098202534008B (structure_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE echelon_classe ADD CONSTRAINT FK_39991F64D8771C0 FOREIGN KEY (echelon_id) REFERENCES gechelon (id)');
        $this->addSql('ALTER TABLE echelon_classe ADD CONSTRAINT FK_39991F6B3E9C81 FOREIGN KEY (niveau_id) REFERENCES gniveau (id)');
        $this->addSql('ALTER TABLE echelon_classe ADD CONSTRAINT FK_39991F6BCF5E72D FOREIGN KEY (categorie_id) REFERENCES gcategorie (id)');
        $this->addSql('ALTER TABLE gcategorie ADD CONSTRAINT FK_7FC5B5E59C2BB0CC FOREIGN KEY (suivant_id) REFERENCES gcategorie (id)');
        $this->addSql('ALTER TABLE gclasse ADD CONSTRAINT FK_ED38B3209C2BB0CC FOREIGN KEY (suivant_id) REFERENCES gclasse (id)');
        $this->addSql('ALTER TABLE gclasse_gcategorie ADD CONSTRAINT FK_72EFA80AB9E6C6D8 FOREIGN KEY (gclasse_id) REFERENCES gclasse (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE gclasse_gcategorie ADD CONSTRAINT FK_72EFA80ABBD4BBC6 FOREIGN KEY (gcategorie_id) REFERENCES gcategorie (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE gclasse_gniveau ADD CONSTRAINT FK_8DAEAF65B9E6C6D8 FOREIGN KEY (gclasse_id) REFERENCES gclasse (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE gclasse_gniveau ADD CONSTRAINT FK_8DAEAF653D86FF50 FOREIGN KEY (gniveau_id) REFERENCES gniveau (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE gechelon ADD CONSTRAINT FK_44FA5AB39C2BB0CC FOREIGN KEY (suivant_id) REFERENCES gechelon (id)');
        $this->addSql('ALTER TABLE gniveau ADD CONSTRAINT FK_2960FFDD9C2BB0CC FOREIGN KEY (suivant_id) REFERENCES gniveau (id)');
        $this->addSql('ALTER TABLE profession ADD CONSTRAINT FK_BA930D698F5EA509 FOREIGN KEY (classe_id) REFERENCES gclasse (id)');
        $this->addSql('ALTER TABLE responsabilite ADD CONSTRAINT FK_4EA0982057889920 FOREIGN KEY (fonction_id) REFERENCES fonction (id)');
        $this->addSql('ALTER TABLE responsabilite ADD CONSTRAINT FK_4EA098202534008B FOREIGN KEY (structure_id) REFERENCES structure (id)');
        $this->addSql('ALTER TABLE employe ADD profession_id INT DEFAULT NULL, ADD date_prise_service DATE DEFAULT NULL, ADD date_sortie DATE DEFAULT NULL, ADD motif_sortie LONGTEXT DEFAULT NULL, ADD numero_main_oeuvre VARCHAR(50) DEFAULT NULL');
        $this->addSql('ALTER TABLE employe ADD CONSTRAINT FK_F804D3B9FDEF8996 FOREIGN KEY (profession_id) REFERENCES profession (id)');
        $this->addSql('CREATE INDEX IDX_F804D3B9FDEF8996 ON employe (profession_id)');
        $this->addSql('ALTER TABLE fonction ADD etat TINYINT(1) DEFAULT NULL, ADD rang INT NOT NULL');
        $this->addSql('ALTER TABLE fonction_employe CHANGE etat etat TINYINT(1) DEFAULT NULL COMMENT \'true ou false pour savoir si la fonction est toujours d\'\'actualité Donner la possibilité de définir une fonction comme étant la courante\'');
        $this->addSql('ALTER TABLE membre_syndicat CHANGE etat etat TINYINT(1) DEFAULT NULL COMMENT \'true si c\'\'est le syndicat actuel du travailleur
        un employé peut être dans plusieurs syndicats\'');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE echelon_classe DROP FOREIGN KEY FK_39991F6BCF5E72D');
        $this->addSql('ALTER TABLE gcategorie DROP FOREIGN KEY FK_7FC5B5E59C2BB0CC');
        $this->addSql('ALTER TABLE gclasse_gcategorie DROP FOREIGN KEY FK_72EFA80ABBD4BBC6');
        $this->addSql('ALTER TABLE gclasse DROP FOREIGN KEY FK_ED38B3209C2BB0CC');
        $this->addSql('ALTER TABLE gclasse_gcategorie DROP FOREIGN KEY FK_72EFA80AB9E6C6D8');
        $this->addSql('ALTER TABLE gclasse_gniveau DROP FOREIGN KEY FK_8DAEAF65B9E6C6D8');
        $this->addSql('ALTER TABLE profession DROP FOREIGN KEY FK_BA930D698F5EA509');
        $this->addSql('ALTER TABLE echelon_classe DROP FOREIGN KEY FK_39991F64D8771C0');
        $this->addSql('ALTER TABLE gechelon DROP FOREIGN KEY FK_44FA5AB39C2BB0CC');
        $this->addSql('ALTER TABLE echelon_classe DROP FOREIGN KEY FK_39991F6B3E9C81');
        $this->addSql('ALTER TABLE gclasse_gniveau DROP FOREIGN KEY FK_8DAEAF653D86FF50');
        $this->addSql('ALTER TABLE gniveau DROP FOREIGN KEY FK_2960FFDD9C2BB0CC');
        $this->addSql('ALTER TABLE employe DROP FOREIGN KEY FK_F804D3B9FDEF8996');
        $this->addSql('DROP TABLE echelon_classe');
        $this->addSql('DROP TABLE gcategorie');
        $this->addSql('DROP TABLE gclasse');
        $this->addSql('DROP TABLE gclasse_gcategorie');
        $this->addSql('DROP TABLE gclasse_gniveau');
        $this->addSql('DROP TABLE gechelon');
        $this->addSql('DROP TABLE gniveau');
        $this->addSql('DROP TABLE profession');
        $this->addSql('DROP TABLE responsabilite');
        $this->addSql('DROP INDEX IDX_F804D3B9FDEF8996 ON employe');
        $this->addSql('ALTER TABLE employe DROP profession_id, DROP date_prise_service, DROP date_sortie, DROP motif_sortie, DROP numero_main_oeuvre');
        $this->addSql('ALTER TABLE fonction DROP etat, DROP rang');
        $this->addSql('ALTER TABLE fonction_employe CHANGE etat etat TINYINT(1) DEFAULT NULL COMMENT \'true ou false pour savoir si la fonction est toujours d\'\'actualité
                Donner la possibilité de définir une fonction comme étant la courante\'');
        $this->addSql('ALTER TABLE membre_syndicat CHANGE etat etat TINYINT(1) DEFAULT NULL COMMENT \'true si c\'\'est le syndicat actuel du travailleur
                un employé peut être dans plusieurs syndicats\'');
    }
}
