<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210222092238 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('CREATE TABLE adresse (id INT AUTO_INCREMENT NOT NULL, employe INT DEFAULT NULL, ville VARCHAR(45) NOT NULL, quartier VARCHAR(145) NOT NULL, etat TINYINT(1) DEFAULT NULL COMMENT \'plusieurs adresses peuvent être actives en meme temps et les adresses non valables peuvent être désactivées\', INDEX fk_adresse_employe1_idx (employe), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE document (id INT AUTO_INCREMENT NOT NULL, employe INT DEFAULT NULL, type_document INT DEFAULT NULL, nom VARCHAR(145) NOT NULL, filename VARCHAR(145) NOT NULL, filepath VARCHAR(245) NOT NULL, INDEX fk_document_employe1_idx (employe), INDEX fk_document_type_document1_idx (type_document), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE employe (id INT AUTO_INCREMENT NOT NULL, caisse_sociale INT DEFAULT NULL, grade INT DEFAULT NULL, mutuelle_sante INT DEFAULT NULL, nationalite INT DEFAULT NULL, type_employe INT DEFAULT NULL, prenoms VARCHAR(145) NOT NULL, nom VARCHAR(45) NOT NULL, date_naissance DATE NOT NULL, lieu_naissance VARCHAR(65) NOT NULL, cni VARCHAR(45) NOT NULL, matricule VARCHAR(45) NOT NULL, matricule_caisse_sociale VARCHAR(45) DEFAULT NULL, date_recrutement DATE NOT NULL, situtation_matrimoniale VARCHAR(45) DEFAULT NULL, retraite TINYINT(1) DEFAULT NULL COMMENT \'true ou false, false par defaut\', genre VARCHAR(45) NOT NULL COMMENT \'Homme ou Femme\', etat TINYINT(1) DEFAULT NULL COMMENT \'true ou false pur indiquer si l\'\'employé est toujours actif\', email_univ VARCHAR(45) DEFAULT NULL, email VARCHAR(45) DEFAULT NULL, filename VARCHAR(145) DEFAULT NULL, filepath TEXT DEFAULT NULL, telephone_primaire VARCHAR(45) NOT NULL, telephone_secondaire VARCHAR(45) DEFAULT NULL, INDEX fk_employe_mutuelle_sante1_idx (mutuelle_sante), INDEX fk_employe_pays1_idx (nationalite), INDEX fk_employe_caisse_sociale1_idx (caisse_sociale), INDEX fk_employe_grade1_idx (grade), INDEX fk_employe_type_employe1_idx (type_employe), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE fonction_employe (id INT AUTO_INCREMENT NOT NULL, employe INT DEFAULT NULL, fonction INT DEFAULT NULL, structure INT DEFAULT NULL, type_contrat INT DEFAULT NULL, date_prise_fonction DATE NOT NULL, duree INT DEFAULT NULL COMMENT \'non obligatoire si le type est cdi mais l\'\'est pour cdd\', etat TINYINT(1) DEFAULT NULL COMMENT \'true ou false pour savoir si la fonction est toujours d\'\'actualité
        Donner la possibilité de définir une fonction comme étant la courante\', INDEX fk_fonction_employe_employe1_idx (employe), INDEX fk_fonction_employe_type_contrat1_idx (type_contrat), INDEX fk_fonction_employe_fonction1_idx (fonction), INDEX fk_fonction_employe_structure1_idx (structure), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE grade (id INT AUTO_INCREMENT NOT NULL, classification VARCHAR(45) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE membre_famille (id INT AUTO_INCREMENT NOT NULL, employe INT DEFAULT NULL, prenoms VARCHAR(45) NOT NULL, nom VARCHAR(45) NOT NULL, date_naissance DATE NOT NULL, lieu_naissance VARCHAR(145) NOT NULL, genre VARCHAR(45) NOT NULL COMMENT \'Homme ou Femme\', lien_parente VARCHAR(45) NOT NULL COMMENT \'enfant, epoux\', telephone VARCHAR(45) DEFAULT NULL, INDEX fk_membre_famille_employe1_idx (employe), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE membre_syndicat (id INT AUTO_INCREMENT NOT NULL, employe INT DEFAULT NULL, syndicat INT DEFAULT NULL, date_enregistrement DATE NOT NULL, etat TINYINT(1) DEFAULT NULL COMMENT \'true si c\'\'est le syndicat actuel du travailleur
        un employé peut être dans plusieurs syndicats\', INDEX fk_membre_syndicat_syndicat1_idx (syndicat), INDEX fk_membre_syndicat_employe1_idx (employe), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('ALTER TABLE adresse ADD CONSTRAINT FK_C35F0816F804D3B9 FOREIGN KEY (employe) REFERENCES employe (id)');
        $this->addSql('ALTER TABLE document ADD CONSTRAINT FK_D8698A76F804D3B9 FOREIGN KEY (employe) REFERENCES employe (id)');
        $this->addSql('ALTER TABLE document ADD CONSTRAINT FK_D8698A761596AD8A FOREIGN KEY (type_document) REFERENCES type_document (id)');
        $this->addSql('ALTER TABLE employe ADD CONSTRAINT FK_F804D3B9A6CE7BD9 FOREIGN KEY (caisse_sociale) REFERENCES caisse_sociale (id)');
        $this->addSql('ALTER TABLE employe ADD CONSTRAINT FK_F804D3B9595AAE34 FOREIGN KEY (grade) REFERENCES grade (id)');
        $this->addSql('ALTER TABLE employe ADD CONSTRAINT FK_F804D3B9C2DF197E FOREIGN KEY (mutuelle_sante) REFERENCES mutuelle_sante (id)');
        $this->addSql('ALTER TABLE employe ADD CONSTRAINT FK_F804D3B99EC4D73F FOREIGN KEY (nationalite) REFERENCES pays (id)');
        $this->addSql('ALTER TABLE employe ADD CONSTRAINT FK_F804D3B9D025BC4C FOREIGN KEY (type_employe) REFERENCES type_employe (id)');
        $this->addSql('ALTER TABLE fonction_employe ADD CONSTRAINT FK_3554BF21F804D3B9 FOREIGN KEY (employe) REFERENCES employe (id)');
        $this->addSql('ALTER TABLE fonction_employe ADD CONSTRAINT FK_3554BF21900D5BD FOREIGN KEY (fonction) REFERENCES fonction (id)');
        $this->addSql('ALTER TABLE fonction_employe ADD CONSTRAINT FK_3554BF216F0137EA FOREIGN KEY (structure) REFERENCES structure (id)');
        $this->addSql('ALTER TABLE fonction_employe ADD CONSTRAINT FK_3554BF214815F666 FOREIGN KEY (type_contrat) REFERENCES type_contrat (id)');
        $this->addSql('ALTER TABLE membre_famille ADD CONSTRAINT FK_9654F0AEF804D3B9 FOREIGN KEY (employe) REFERENCES employe (id)');
        $this->addSql('ALTER TABLE membre_syndicat ADD CONSTRAINT FK_F212A945F804D3B9 FOREIGN KEY (employe) REFERENCES employe (id)');
        $this->addSql('ALTER TABLE membre_syndicat ADD CONSTRAINT FK_F212A94547704176 FOREIGN KEY (syndicat) REFERENCES syndicat (id)');
        $this->addSql('ALTER TABLE structure CHANGE type_entite type_entite INT DEFAULT NULL');
        $this->addSql('ALTER TABLE syndicat CHANGE type_employe type_employe INT DEFAULT NULL');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE adresse DROP FOREIGN KEY FK_C35F0816F804D3B9');
        $this->addSql('ALTER TABLE document DROP FOREIGN KEY FK_D8698A76F804D3B9');
        $this->addSql('ALTER TABLE fonction_employe DROP FOREIGN KEY FK_3554BF21F804D3B9');
        $this->addSql('ALTER TABLE membre_famille DROP FOREIGN KEY FK_9654F0AEF804D3B9');
        $this->addSql('ALTER TABLE membre_syndicat DROP FOREIGN KEY FK_F212A945F804D3B9');
        $this->addSql('ALTER TABLE employe DROP FOREIGN KEY FK_F804D3B9595AAE34');
        $this->addSql('DROP TABLE adresse');
        $this->addSql('DROP TABLE document');
        $this->addSql('DROP TABLE employe');
        $this->addSql('DROP TABLE fonction_employe');
        $this->addSql('DROP TABLE grade');
        $this->addSql('DROP TABLE membre_famille');
        $this->addSql('DROP TABLE membre_syndicat');
        $this->addSql('ALTER TABLE structure CHANGE type_entite type_entite INT NOT NULL');
        $this->addSql('ALTER TABLE syndicat CHANGE type_employe type_employe INT NOT NULL');
    }
}
