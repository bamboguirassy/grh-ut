<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210510143616 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE contrat ADD type_contrat_id INT NOT NULL, ADD employe_id INT NOT NULL, ADD duree_en_mois INT DEFAULT NULL, ADD etat TINYINT(1) NOT NULL, ADD date_rupture DATE DEFAULT NULL, ADD motif_rupture LONGTEXT DEFAULT NULL, ADD expire TINYINT(1) DEFAULT NULL, ADD rompu TINYINT(1) DEFAULT NULL');
        $this->addSql('ALTER TABLE contrat ADD CONSTRAINT FK_60349993520D03A FOREIGN KEY (type_contrat_id) REFERENCES type_contrat (id)');
        $this->addSql('ALTER TABLE contrat ADD CONSTRAINT FK_603499931B65292 FOREIGN KEY (employe_id) REFERENCES employe (id)');
        $this->addSql('CREATE INDEX IDX_60349993520D03A ON contrat (type_contrat_id)');
        $this->addSql('CREATE INDEX IDX_603499931B65292 ON contrat (employe_id)');
        $this->addSql('ALTER TABLE membre_syndicat CHANGE etat etat TINYINT(1) DEFAULT NULL COMMENT \'true si c\'\'est le syndicat actuel du travailleur
        un employé peut être dans plusieurs syndicats\'');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE contrat DROP FOREIGN KEY FK_60349993520D03A');
        $this->addSql('ALTER TABLE contrat DROP FOREIGN KEY FK_603499931B65292');
        $this->addSql('DROP INDEX IDX_60349993520D03A ON contrat');
        $this->addSql('DROP INDEX IDX_603499931B65292 ON contrat');
        $this->addSql('ALTER TABLE contrat DROP type_contrat_id, DROP employe_id, DROP duree_en_mois, DROP etat, DROP date_rupture, DROP motif_rupture, DROP expire, DROP rompu');
        $this->addSql('ALTER TABLE membre_syndicat CHANGE etat etat TINYINT(1) DEFAULT NULL COMMENT \'true si c\'\'est le syndicat actuel du travailleur
                un employé peut être dans plusieurs syndicats\'');
    }
}
