<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210506234347 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('CREATE TABLE responsabilite (id INT AUTO_INCREMENT NOT NULL, fonction_id INT NOT NULL, structure_id INT NOT NULL, INDEX IDX_4EA0982057889920 (fonction_id), INDEX IDX_4EA098202534008B (structure_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('ALTER TABLE responsabilite ADD CONSTRAINT FK_4EA0982057889920 FOREIGN KEY (fonction_id) REFERENCES fonction (id)');
        $this->addSql('ALTER TABLE responsabilite ADD CONSTRAINT FK_4EA098202534008B FOREIGN KEY (structure_id) REFERENCES structure (id)');
        $this->addSql('ALTER TABLE fonction ADD etat TINYINT(1) DEFAULT NULL, ADD rang INT NOT NULL');
        $this->addSql('ALTER TABLE membre_syndicat CHANGE etat etat TINYINT(1) DEFAULT NULL COMMENT \'true si c\'\'est le syndicat actuel du travailleur
        un employé peut être dans plusieurs syndicats\'');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('DROP TABLE responsabilite');
        $this->addSql('ALTER TABLE fonction DROP etat, DROP rang');
        $this->addSql('ALTER TABLE membre_syndicat CHANGE etat etat TINYINT(1) DEFAULT NULL COMMENT \'true si c\'\'est le syndicat actuel du travailleur
                un employé peut être dans plusieurs syndicats\'');
    }
}
