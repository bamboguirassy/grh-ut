<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210515164218 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE gcategorie DROP FOREIGN KEY FK_7FC5B5E59C2BB0CC');
        $this->addSql('ALTER TABLE gcategorie ADD CONSTRAINT FK_7FC5B5E59C2BB0CC FOREIGN KEY (suivant_id) REFERENCES gcategorie (id)');
        $this->addSql('ALTER TABLE gclasse DROP FOREIGN KEY FK_ED38B3209C2BB0CC');
        $this->addSql('ALTER TABLE gclasse ADD CONSTRAINT FK_ED38B3209C2BB0CC FOREIGN KEY (suivant_id) REFERENCES gclasse (id)');
        $this->addSql('ALTER TABLE gechelon DROP FOREIGN KEY FK_44FA5AB39C2BB0CC');
        $this->addSql('ALTER TABLE gechelon ADD CONSTRAINT FK_44FA5AB39C2BB0CC FOREIGN KEY (suivant_id) REFERENCES gechelon (id)');
        $this->addSql('ALTER TABLE gniveau DROP FOREIGN KEY FK_2960FFDD9C2BB0CC');
        $this->addSql('ALTER TABLE gniveau ADD CONSTRAINT FK_2960FFDD9C2BB0CC FOREIGN KEY (suivant_id) REFERENCES gniveau (id)');
        $this->addSql('ALTER TABLE grade ADD classe_id INT NOT NULL');
        $this->addSql('CREATE INDEX IDX_595AAE348F5EA509 ON grade (classe_id)');
        $this->addSql('ALTER TABLE membre_syndicat CHANGE etat etat TINYINT(1) DEFAULT NULL COMMENT \'true si c\'\'est le syndicat actuel du travailleur
        un employé peut être dans plusieurs syndicats\'');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE gcategorie DROP FOREIGN KEY FK_7FC5B5E59C2BB0CC');
        $this->addSql('ALTER TABLE gcategorie ADD CONSTRAINT FK_7FC5B5E59C2BB0CC FOREIGN KEY (suivant_id) REFERENCES gcategorie (id) ON UPDATE SET NULL ON DELETE SET NULL');
        $this->addSql('ALTER TABLE gclasse DROP FOREIGN KEY FK_ED38B3209C2BB0CC');
        $this->addSql('ALTER TABLE gclasse ADD CONSTRAINT FK_ED38B3209C2BB0CC FOREIGN KEY (suivant_id) REFERENCES gclasse (id) ON UPDATE SET NULL ON DELETE SET NULL');
        $this->addSql('ALTER TABLE gechelon DROP FOREIGN KEY FK_44FA5AB39C2BB0CC');
        $this->addSql('ALTER TABLE gechelon ADD CONSTRAINT FK_44FA5AB39C2BB0CC FOREIGN KEY (suivant_id) REFERENCES gechelon (id) ON UPDATE SET NULL ON DELETE SET NULL');
        $this->addSql('ALTER TABLE gniveau DROP FOREIGN KEY FK_2960FFDD9C2BB0CC');
        $this->addSql('ALTER TABLE gniveau ADD CONSTRAINT FK_2960FFDD9C2BB0CC FOREIGN KEY (suivant_id) REFERENCES gniveau (id) ON UPDATE SET NULL ON DELETE SET NULL');
        $this->addSql('ALTER TABLE grade DROP FOREIGN KEY FK_595AAE344D8771C0');
        $this->addSql('ALTER TABLE grade DROP FOREIGN KEY FK_595AAE34B3E9C81');
        $this->addSql('ALTER TABLE grade DROP FOREIGN KEY FK_595AAE34BCF5E72D');
        $this->addSql('ALTER TABLE grade DROP FOREIGN KEY FK_595AAE348F5EA509');
        $this->addSql('DROP INDEX IDX_595AAE348F5EA509 ON grade');
        $this->addSql('ALTER TABLE grade DROP classe_id');
        $this->addSql('ALTER TABLE membre_syndicat CHANGE etat etat TINYINT(1) DEFAULT NULL COMMENT \'true si c\'\'est le syndicat actuel du travailleur
                un employé peut être dans plusieurs syndicats\'');
    }
}
