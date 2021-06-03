<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210601222419 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('DROP INDEX fk_employe_grade1_idx ON employe');
        $this->addSql('ALTER TABLE employe ADD indice INT DEFAULT NULL, ADD diplome_academique VARCHAR(100) DEFAULT NULL, CHANGE grade grade VARCHAR(80) DEFAULT NULL, CHANGE cni cni VARCHAR(45) DEFAULT NULL, CHANGE matricule matricule VARCHAR(45) DEFAULT NULL, CHANGE date_recrutement date_recrutement DATE DEFAULT NULL, CHANGE telephone_primaire telephone_primaire VARCHAR(45) DEFAULT NULL');
        $this->addSql('ALTER TABLE grade ENGINE=INNODB');
        $this->addSql('ALTER TABLE employe ADD CONSTRAINT FK_F804D3B938710B55 FOREIGN KEY (indice) REFERENCES grade (id)');
        $this->addSql('CREATE INDEX fk_employe_indice1_idx ON employe (indice)');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE employe DROP FOREIGN KEY FK_F804D3B938710B55');
        $this->addSql('DROP INDEX fk_employe_indice1_idx ON employe');
        $this->addSql('ALTER TABLE employe DROP indice, DROP diplome_academique, CHANGE cni cni VARCHAR(45) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`, CHANGE matricule matricule VARCHAR(45) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`, CHANGE date_recrutement date_recrutement DATE NOT NULL, CHANGE telephone_primaire telephone_primaire VARCHAR(45) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`, CHANGE grade grade INT DEFAULT NULL');
        $this->addSql('CREATE INDEX fk_employe_grade1_idx ON employe (grade)');
        $this->addSql('ALTER TABLE grade DROP FOREIGN KEY FK_595AAE344D8771C0');
        $this->addSql('ALTER TABLE grade DROP FOREIGN KEY FK_595AAE34B3E9C81');
        $this->addSql('ALTER TABLE grade DROP FOREIGN KEY FK_595AAE34BCF5E72D');
        $this->addSql('ALTER TABLE grade DROP FOREIGN KEY FK_595AAE348F5EA509');
        
    }
}
