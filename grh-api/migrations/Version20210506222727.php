<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210506222727 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('CREATE TABLE echelon_classe (id INT AUTO_INCREMENT NOT NULL, echelon_id INT NOT NULL, niveau_id INT NOT NULL, categorie_id INT NOT NULL, indice VARCHAR(10) NOT NULL, INDEX IDX_39991F64D8771C0 (echelon_id), INDEX IDX_39991F6B3E9C81 (niveau_id), INDEX IDX_39991F6BCF5E72D (categorie_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE gclasse_gcategorie (gclasse_id INT NOT NULL, gcategorie_id INT NOT NULL, INDEX IDX_72EFA80AB9E6C6D8 (gclasse_id), INDEX IDX_72EFA80ABBD4BBC6 (gcategorie_id), PRIMARY KEY(gclasse_id, gcategorie_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE gclasse_gniveau (gclasse_id INT NOT NULL, gniveau_id INT NOT NULL, INDEX IDX_8DAEAF65B9E6C6D8 (gclasse_id), INDEX IDX_8DAEAF653D86FF50 (gniveau_id), PRIMARY KEY(gclasse_id, gniveau_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('ALTER TABLE echelon_classe ADD CONSTRAINT FK_39991F64D8771C0 FOREIGN KEY (echelon_id) REFERENCES gechelon (id)');
        $this->addSql('ALTER TABLE echelon_classe ADD CONSTRAINT FK_39991F6B3E9C81 FOREIGN KEY (niveau_id) REFERENCES gniveau (id)');
        $this->addSql('ALTER TABLE echelon_classe ADD CONSTRAINT FK_39991F6BCF5E72D FOREIGN KEY (categorie_id) REFERENCES gcategorie (id)');
        $this->addSql('ALTER TABLE gclasse_gcategorie ADD CONSTRAINT FK_72EFA80AB9E6C6D8 FOREIGN KEY (gclasse_id) REFERENCES gclasse (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE gclasse_gcategorie ADD CONSTRAINT FK_72EFA80ABBD4BBC6 FOREIGN KEY (gcategorie_id) REFERENCES gcategorie (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE gclasse_gniveau ADD CONSTRAINT FK_8DAEAF65B9E6C6D8 FOREIGN KEY (gclasse_id) REFERENCES gclasse (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE gclasse_gniveau ADD CONSTRAINT FK_8DAEAF653D86FF50 FOREIGN KEY (gniveau_id) REFERENCES gniveau (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE fonction_employe CHANGE etat etat TINYINT(1) DEFAULT NULL COMMENT \'true ou false pour savoir si la fonction est toujours d\'\'actualité Donner la possibilité de définir une fonction comme étant la courante\'');
        $this->addSql('ALTER TABLE membre_syndicat CHANGE etat etat TINYINT(1) DEFAULT NULL COMMENT \'true si c\'\'est le syndicat actuel du travailleur
        un employé peut être dans plusieurs syndicats\'');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('DROP TABLE echelon_classe');
        $this->addSql('DROP TABLE gclasse_gcategorie');
        $this->addSql('DROP TABLE gclasse_gniveau');
        $this->addSql('ALTER TABLE fonction_employe CHANGE etat etat TINYINT(1) DEFAULT NULL COMMENT \'true ou false pour savoir si la fonction est toujours d\'\'actualité
                Donner la possibilité de définir une fonction comme étant la courante\'');
        $this->addSql('ALTER TABLE membre_syndicat CHANGE etat etat TINYINT(1) DEFAULT NULL COMMENT \'true si c\'\'est le syndicat actuel du travailleur
                un employé peut être dans plusieurs syndicats\'');
    }
}
