-- Ajouter un nouvel aliment (id_stock est un booléen où 1 rpz 0 et 2 rpz 1)
INSERT INTO `aliment` (`id`, `nom`, `dt_achat`, `prix_achat`, `id_stock`) VALUES (NULL, 'Courge', NOW(), '5.5', '1'); 
-- Ajouter une nouvelle saison (Ici Hiver par exemple)
INSERT INTO `sais` (`id`, `sais`) VALUES (NULL, 'Hiver');
-- Insérer un type (par exemple ici, Cucurbitacée)
INSERT INTO `type` (`id`, `type`) VALUES (NULL, 'Cucurbitacée');
-- Insert du stock, FALSE OR TRUE donc Booléen donc bon... un troisième genre PERDU DANS LE MORDOR 
INSERT INTO `stock` (`id`, `stock`) VALUES (NULL, '2');
-- Script associatif
INSERT INTO `assoc_alim_type_sais` (`id`, `alim_id`, `type_id`, `sais_id`) VALUES (NULL, '1', '3', '4');
-- UPDATE
UPDATE `aliment` SET `stock_id` = '1' WHERE `aliment`.`id` = 2;
