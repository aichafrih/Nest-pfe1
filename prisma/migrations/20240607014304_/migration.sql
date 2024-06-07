-- CreateTable
CREATE TABLE `User` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `Nom` VARCHAR(80) NOT NULL,
    `Prenom` VARCHAR(80) NOT NULL,
    `NumTel` VARCHAR(8) NOT NULL,
    `Adresse` VARCHAR(191) NOT NULL,
    `email` VARCHAR(80) NOT NULL,
    `MotDePasse` VARCHAR(80) NOT NULL,
    `Ville` VARCHAR(191) NOT NULL,
    `CodePostal` VARCHAR(191) NULL,
    `PhotoProfil` VARCHAR(191) NULL,
    `resetCode` VARCHAR(191) NULL,

    UNIQUE INDEX `User_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Admin` (
    `ida` INTEGER NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(80) NOT NULL,
    `MotDePasse` VARCHAR(80) NOT NULL,
    `PhotoProfil` VARCHAR(191) NULL,
    `isAdmin` BOOLEAN NOT NULL DEFAULT true,

    UNIQUE INDEX `Admin_email_key`(`email`),
    PRIMARY KEY (`ida`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Publication` (
    `pubid` INTEGER NOT NULL AUTO_INCREMENT,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `marque` VARCHAR(20) NOT NULL,
    `model` VARCHAR(30) NOT NULL,
    `anneeFabrication` INTEGER NOT NULL,
    `nombrePlace` INTEGER NOT NULL,
    `couleur` VARCHAR(30) NOT NULL,
    `kilometrage` INTEGER NOT NULL,
    `prix` FLOAT NOT NULL,
    `descrption` VARCHAR(400) NULL,
    `typeCarburant` ENUM('Essence', 'Diesel', 'GPL', 'Gpl', 'Gnl', 'GNL', 'Electrique', 'Ethanol') NOT NULL,
    `userId` INTEGER NOT NULL,
    `videoId` INTEGER NULL,
    `city` ENUM('TUNIS', 'Tunis', 'tunis', 'ARIANA', 'Ariana', 'ariana', 'Ben_Arous', 'ben_arous', 'BEN_AROUS', 'ben_Arous', 'Bizerte', 'bizerte', 'BIZERTE', 'Gabes', 'gabes', 'GABES', 'Gafsa', 'gafsa', 'GAFSA', 'Jendouba', 'jendouba', 'JENDOUBA', 'Kairouan', 'kairouan', 'KAIROUAN', 'Kasserine', 'KASERINE', 'kasserine', 'kebili', 'Kebili', 'KEBILI', 'Mahdia', 'mahdia', 'MAHDIA', 'Manouba', 'manouba', 'MANOUBA', 'Medenine', 'medenine', 'MEDENINE', 'Monastir', 'monastir', 'MONASTIR', 'NABEUL', 'Nabeul', 'nabeul', 'Sfax', 'sfax', 'SFAX', 'Sidi_Bouzid', 'sidi_Bouzid', 'sidi_bouzid', 'SIDI_BOUZID', 'Siliana', 'siliana', 'SILIANA', 'SOUSSE', 'Sousse', 'sousse', 'Tataouine', 'tataouine', 'TATAOUINE', 'TOZEUR', 'Tozeur', 'tozeur', 'Zaghouan', 'zaghoun', 'ZAGHOUAN', 'BEJA', 'Beja', 'beja', 'Kef', 'kef', 'KEF') NOT NULL,
    `boiteVitesse` ENUM('Manuelle', 'Automatique') NOT NULL,
    `transmission` VARCHAR(191) NOT NULL,
    `carrassorie` VARCHAR(191) NOT NULL,
    `sellerie` ENUM('Alcantara', 'Cuir', 'Similcuir', 'Tissu', 'Plastique', 'Velours') NOT NULL,

    UNIQUE INDEX `Publication_videoId_key`(`videoId`),
    PRIMARY KEY (`pubid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Equippement` (
    `equipid` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`equipid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `EquippementPublication` (
    `idep` INTEGER NOT NULL AUTO_INCREMENT,
    `publicationId` INTEGER NOT NULL,
    `equippementId` INTEGER NOT NULL,

    UNIQUE INDEX `EquippementPublication_publicationId_equippementId_key`(`publicationId`, `equippementId`),
    PRIMARY KEY (`idep`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Video` (
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `url` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Image` (
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `path` VARCHAR(191) NOT NULL,
    `publicationId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `PublicationFavorite` (
    `userId` INTEGER NOT NULL,
    `publicationId` INTEGER NOT NULL,
    `idpf` INTEGER NOT NULL AUTO_INCREMENT,

    PRIMARY KEY (`idpf`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Subscription` (
    `ids` INTEGER NOT NULL AUTO_INCREMENT,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `price` DOUBLE NOT NULL,
    `duration` INTEGER NOT NULL,
    `description` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`ids`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Expert` (
    `ide` INTEGER NOT NULL AUTO_INCREMENT,
    `firstName` VARCHAR(191) NOT NULL,
    `lastName` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `cv` VARCHAR(191) NOT NULL,
    `city` ENUM('TUNIS', 'Tunis', 'tunis', 'ARIANA', 'Ariana', 'ariana', 'Ben_Arous', 'ben_arous', 'BEN_AROUS', 'ben_Arous', 'Bizerte', 'bizerte', 'BIZERTE', 'Gabes', 'gabes', 'GABES', 'Gafsa', 'gafsa', 'GAFSA', 'Jendouba', 'jendouba', 'JENDOUBA', 'Kairouan', 'kairouan', 'KAIROUAN', 'Kasserine', 'KASERINE', 'kasserine', 'kebili', 'Kebili', 'KEBILI', 'Mahdia', 'mahdia', 'MAHDIA', 'Manouba', 'manouba', 'MANOUBA', 'Medenine', 'medenine', 'MEDENINE', 'Monastir', 'monastir', 'MONASTIR', 'NABEUL', 'Nabeul', 'nabeul', 'Sfax', 'sfax', 'SFAX', 'Sidi_Bouzid', 'sidi_Bouzid', 'sidi_bouzid', 'SIDI_BOUZID', 'Siliana', 'siliana', 'SILIANA', 'SOUSSE', 'Sousse', 'sousse', 'Tataouine', 'tataouine', 'TATAOUINE', 'TOZEUR', 'Tozeur', 'tozeur', 'Zaghouan', 'zaghoun', 'ZAGHOUAN', 'BEJA', 'Beja', 'beja', 'Kef', 'kef', 'KEF') NOT NULL DEFAULT 'TUNIS',
    `passe` VARCHAR(191) NOT NULL,
    `tel` VARCHAR(191) NOT NULL,
    `description` TEXT NOT NULL,
    `cout` VARCHAR(191) NOT NULL,
    `PhotoProfil` VARCHAR(191) NULL,
    `isExpert` BOOLEAN NOT NULL DEFAULT true,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `Expert_email_key`(`email`),
    PRIMARY KEY (`ide`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DemandExpertise` (
    `idde` INTEGER NOT NULL AUTO_INCREMENT,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `status` ENUM('EN_ATTENTE', 'ACCEPTE', 'REJETE', 'TERMINE') NOT NULL DEFAULT 'EN_ATTENTE',
    `userId` INTEGER NOT NULL,
    `pubId` INTEGER NOT NULL,
    `expertId` INTEGER NOT NULL,
    `rapportId` INTEGER NULL,
    `paye` BOOLEAN NOT NULL DEFAULT false,

    UNIQUE INDEX `DemandExpertise_rapportId_key`(`rapportId`),
    UNIQUE INDEX `DemandExpertise_expertId_userId_pubId_key`(`expertId`, `userId`, `pubId`),
    PRIMARY KEY (`idde`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Rapport` (
    `idr` INTEGER NOT NULL AUTO_INCREMENT,
    `expertiseId` INTEGER NOT NULL,
    `date_expertise` VARCHAR(191) NOT NULL,
    `adresse_expertise` VARCHAR(191) NOT NULL,
    `lieu_expertise` VARCHAR(191) NOT NULL,
    `expert_nom` VARCHAR(191) NOT NULL,
    `email_expert` VARCHAR(191) NOT NULL,
    `tele_expert` VARCHAR(191) NOT NULL,
    `nom_client` VARCHAR(191) NOT NULL,
    `adresse_client` VARCHAR(191) NOT NULL,
    `tel_client` VARCHAR(191) NOT NULL,
    `email_client` VARCHAR(191) NOT NULL,
    `marque_v` VARCHAR(191) NOT NULL,
    `modele_v` VARCHAR(191) NOT NULL,
    `motirisation_v` VARCHAR(191) NOT NULL,
    `couleur_v` VARCHAR(191) NOT NULL,
    `transmission_v` VARCHAR(191) NOT NULL,
    `km_v` INTEGER NOT NULL,
    `his_prio` INTEGER NOT NULL,
    `immatriculation_v` VARCHAR(191) NOT NULL,
    `carrosserie` VARCHAR(191) NOT NULL,
    `type_carburent` VARCHAR(191) NOT NULL,
    `puissance` VARCHAR(191) NOT NULL,
    `nb_place` INTEGER NOT NULL,
    `nb_porte` INTEGER NOT NULL,
    `commentaire_exp` TEXT NOT NULL,
    `userId` INTEGER NOT NULL,
    `expertId` INTEGER NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `Rapport_expertiseId_key`(`expertiseId`),
    PRIMARY KEY (`idr`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ExpertRequest` (
    `ider` INTEGER NOT NULL AUTO_INCREMENT,
    `firstName` VARCHAR(191) NOT NULL,
    `lastName` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `telephone` VARCHAR(191) NOT NULL,
    `cv` VARCHAR(191) NOT NULL,
    `status` VARCHAR(191) NOT NULL DEFAULT 'en attente',
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `city` ENUM('TUNIS', 'Tunis', 'tunis', 'ARIANA', 'Ariana', 'ariana', 'Ben_Arous', 'ben_arous', 'BEN_AROUS', 'ben_Arous', 'Bizerte', 'bizerte', 'BIZERTE', 'Gabes', 'gabes', 'GABES', 'Gafsa', 'gafsa', 'GAFSA', 'Jendouba', 'jendouba', 'JENDOUBA', 'Kairouan', 'kairouan', 'KAIROUAN', 'Kasserine', 'KASERINE', 'kasserine', 'kebili', 'Kebili', 'KEBILI', 'Mahdia', 'mahdia', 'MAHDIA', 'Manouba', 'manouba', 'MANOUBA', 'Medenine', 'medenine', 'MEDENINE', 'Monastir', 'monastir', 'MONASTIR', 'NABEUL', 'Nabeul', 'nabeul', 'Sfax', 'sfax', 'SFAX', 'Sidi_Bouzid', 'sidi_Bouzid', 'sidi_bouzid', 'SIDI_BOUZID', 'Siliana', 'siliana', 'SILIANA', 'SOUSSE', 'Sousse', 'sousse', 'Tataouine', 'tataouine', 'TATAOUINE', 'TOZEUR', 'Tozeur', 'tozeur', 'Zaghouan', 'zaghoun', 'ZAGHOUAN', 'BEJA', 'Beja', 'beja', 'Kef', 'kef', 'KEF') NOT NULL,
    `description` TEXT NOT NULL,
    `cout` VARCHAR(191) NOT NULL,
    `adminId` INTEGER NOT NULL,

    PRIMARY KEY (`ider`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Notification` (
    `idn` INTEGER NOT NULL AUTO_INCREMENT,
    `content` TEXT NOT NULL,
    `isRead` BOOLEAN NOT NULL DEFAULT false,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `userId` INTEGER NULL,
    `adminId` INTEGER NULL,
    `expertId` INTEGER NULL,

    PRIMARY KEY (`idn`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CreationCompteRequest` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nom` VARCHAR(191) NOT NULL,
    `prenom` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `telephone` VARCHAR(191) NULL,
    `adresse` VARCHAR(191) NULL,
    `ville` VARCHAR(191) NULL,
    `commentaire` VARCHAR(191) NOT NULL,
    `codePostal` VARCHAR(191) NULL,
    `photoProfil` VARCHAR(191) NULL,
    `status` VARCHAR(191) NOT NULL DEFAULT 'en attente',
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `adminId` INTEGER NOT NULL,

    UNIQUE INDEX `CreationCompteRequest_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_EquippementToPublication` (
    `A` INTEGER NOT NULL,
    `B` INTEGER NOT NULL,

    UNIQUE INDEX `_EquippementToPublication_AB_unique`(`A`, `B`),
    INDEX `_EquippementToPublication_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Publication` ADD CONSTRAINT `Publication_videoId_fkey` FOREIGN KEY (`videoId`) REFERENCES `Video`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Publication` ADD CONSTRAINT `Publication_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `EquippementPublication` ADD CONSTRAINT `EquippementPublication_publicationId_fkey` FOREIGN KEY (`publicationId`) REFERENCES `Publication`(`pubid`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `EquippementPublication` ADD CONSTRAINT `EquippementPublication_equippementId_fkey` FOREIGN KEY (`equippementId`) REFERENCES `Equippement`(`equipid`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Image` ADD CONSTRAINT `Image_publicationId_fkey` FOREIGN KEY (`publicationId`) REFERENCES `Publication`(`pubid`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PublicationFavorite` ADD CONSTRAINT `PublicationFavorite_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PublicationFavorite` ADD CONSTRAINT `PublicationFavorite_publicationId_fkey` FOREIGN KEY (`publicationId`) REFERENCES `Publication`(`pubid`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DemandExpertise` ADD CONSTRAINT `DemandExpertise_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DemandExpertise` ADD CONSTRAINT `DemandExpertise_pubId_fkey` FOREIGN KEY (`pubId`) REFERENCES `Publication`(`pubid`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DemandExpertise` ADD CONSTRAINT `DemandExpertise_expertId_fkey` FOREIGN KEY (`expertId`) REFERENCES `Expert`(`ide`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Rapport` ADD CONSTRAINT `Rapport_expertiseId_fkey` FOREIGN KEY (`expertiseId`) REFERENCES `DemandExpertise`(`idde`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Rapport` ADD CONSTRAINT `Rapport_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Rapport` ADD CONSTRAINT `Rapport_expertId_fkey` FOREIGN KEY (`expertId`) REFERENCES `Expert`(`ide`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ExpertRequest` ADD CONSTRAINT `ExpertRequest_adminId_fkey` FOREIGN KEY (`adminId`) REFERENCES `Admin`(`ida`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Notification` ADD CONSTRAINT `Notification_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Notification` ADD CONSTRAINT `Notification_adminId_fkey` FOREIGN KEY (`adminId`) REFERENCES `Admin`(`ida`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Notification` ADD CONSTRAINT `Notification_expertId_fkey` FOREIGN KEY (`expertId`) REFERENCES `Expert`(`ide`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CreationCompteRequest` ADD CONSTRAINT `CreationCompteRequest_adminId_fkey` FOREIGN KEY (`adminId`) REFERENCES `Admin`(`ida`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_EquippementToPublication` ADD CONSTRAINT `_EquippementToPublication_A_fkey` FOREIGN KEY (`A`) REFERENCES `Equippement`(`equipid`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_EquippementToPublication` ADD CONSTRAINT `_EquippementToPublication_B_fkey` FOREIGN KEY (`B`) REFERENCES `Publication`(`pubid`) ON DELETE CASCADE ON UPDATE CASCADE;
