<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210610134626 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('DROP INDEX cni ON employe');
        $this->addSql('ALTER TABLE membre_syndicat CHANGE etat etat TINYINT(1) DEFAULT NULL COMMENT \'true si c\'\'est le syndicat actuel du travailleur
        un employé peut être dans plusieurs syndicats\'');
        $this->addSql('ALTER TABLE rang ADD appelation VARCHAR(255) NOT NULL');
        $this->addSql('ALTER TABLE responsabilite ADD rang_id INT NOT NULL');
        $this->addSql('ALTER TABLE responsabilite ADD CONSTRAINT FK_4EA098203CC0D837 FOREIGN KEY (rang_id) REFERENCES rang (id)');
        $this->addSql('CREATE INDEX IDX_4EA098203CC0D837 ON responsabilite (rang_id)');
        $this->addSql('ALTER TABLE structure_fonction ADD rang INT NOT NULL');
        $this->addSql('ALTER TABLE structure_fonction ADD CONSTRAINT FK_580577F781CFA4CE FOREIGN KEY (rang) REFERENCES rang (id)');
        $this->addSql('CREATE INDEX IDX_580577F781CFA4CE ON structure_fonction (rang)');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('CREATE UNIQUE INDEX cni ON employe (cni)');
        $this->addSql('ALTER TABLE membre_syndicat CHANGE etat etat TINYINT(1) DEFAULT NULL');
        $this->addSql('ALTER TABLE rang DROP appelation');
        $this->addSql('ALTER TABLE responsabilite DROP FOREIGN KEY FK_4EA098203CC0D837');
        $this->addSql('DROP INDEX IDX_4EA098203CC0D837 ON responsabilite');
        $this->addSql('ALTER TABLE responsabilite DROP rang_id');
        $this->addSql('ALTER TABLE structure_fonction DROP FOREIGN KEY FK_580577F781CFA4CE');
        $this->addSql('DROP INDEX IDX_580577F781CFA4CE ON structure_fonction');
        $this->addSql('ALTER TABLE structure_fonction DROP rang');
    }
}
