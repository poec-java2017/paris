/*----------------------team---------------------------------*/
INSERT INTO `paris`.`team` (`id`, `name`, `active`) VALUES 
	('1', 'PSG', '1'),
	('2', 'Lyon', '1'),
	('3', 'Monaco', '1'), 
	('4', 'Lille', '1'),
	('5', 'Marseille', '1'),
	('6', 'Nice', '1');

/*----------------------competition--------------------------*/
INSERT INTO `paris`.`competition` (`id`, `name`, `active`) VALUES 
	('1', 'Ligue 1', '1'),
	('2', 'Coupe de la Ligue', '1'),
	('3', 'Amicale', '1');

/*------------------competition_has_team----------------------*/
INSERT INTO `paris`.`competition_has_team` (`competition_id`, `team_id`) VALUES 
	('1', '1'),
	('1', '2'),
	('1', '3'), 
	('1', '4'),
	('1', '5'),
	('1', '6'),	
	('2', '3'),
	('2', '1');

/*------------------------event--------------------------*/
INSERT INTO `paris`.`event` (`id`, `idCompetition`, `idTeamHost`, `idTeamGuest`, `date`, `coteHost`, `coteTie`, `coteGuest`) VALUES
	('1', '1', '2', '1', '2017-02-23', '1.45', '3.50', '2.25'),
	('2', '1', '3', '5', '2017-02-23', '2.30', '4.20', '1.25'),
	('3', '1', '6', '4', '2017-02-23', '4.15', '4.25', '6.45'),
	('4', '2', '4', '2', '2017-03-01', '1.45', '2.30', '3.25'),
	('5', '2', '1', '2', '2017-03-01', '8.25', '1.35', '9.85');

/*----------------------country--------------------------*/
INSERT INTO `paris`.`country` (`id`, `name`, `iso`) VALUES 
	('1', 'France', 'fr'),
	('2', 'Belgique', 'be'),
	('3', 'Suisse', 'sw');

/*----------------------city----------------------------*/
INSERT INTO `paris`.`city` (`id`, `name`, `idCountry`) VALUES 
	('1', 'Rouen', '1'),
	('2', 'Paris', '1'),
	('3', 'Marseille', '1'),
	('4', 'Bourgtherould', '1'),
	('5', 'Anvers', '2'),
	('6', 'Bruxelles', '2'),
	('7', 'Genève', '3');

/*--------------------adresse----------------------------*/
INSERT INTO `paris`.`address` (`id`, `street`, `postcode`, `idCity`) VALUES 
	('1', '42 rue du pain perdue', '76000', '1'),
	('2', '4 avenue du maréchal', '75000', '2'),
	('3', '85 hameau de la vache', '27520', '4'),
	('4', '48 avenue sauf une fois au chalet', '65854', '5');

/*----------------------user----------------------------*/
INSERT INTO `paris`.`user` (`id`, `lastname`, `firstname`, `email`, `password`, `dateNaissance`, `idAddress`) VALUES 
	('1', 'Tenance', 'Romain', 'tenance.r@gmail.com', 'azerty', '1988-01-01', '1'),
	('2', 'Nault', 'Jeromine', 'jerono@mail.fr', 'azerty', '1957-03-18', '3'),
	('3', 'Dufois', 'Axelle', 'axel58@gmail.com', 'azerty', '1991-06-08', '2'),
	('4', 'Paletant', 'Jean-Michel', 'jenmich@mail.lol', 'azerty', '1969-06-06', '4');

/*----------------------operation_type----------------------------*/
INSERT INTO `paris`.`operation_type` (`id`, `name`) VALUES 
	('1', 'Débit Compte'),
	('2', 'Crédit Compte'),
	('3', 'Miser'),
	('4', 'Récuper gains');

/*----------------------operation----------------------------*/
INSERT INTO `paris`.`operation` (`id`, `idOperationType`, `idUser`, `amount`, `date`) VALUES 
	('1', '2', '1', '150', '2017-02-07'),
	('2', '3', '1', '10', '2017-02-07'),
	('3', '3', '2', '5', '2017-02-05'),
	('4', '3', '3', '20', '2017-01-27'),
	('5', '3', '4', '40', '2017-01-22');

/*----------------------bet----------------------------*/
INSERT INTO `paris`.`bet` (`idUser`, `idEvent`, `idBetOperation`, `date`, `quotation`) VALUES 
	('1', '1', '2', '2017-02-07', '2.45'),
	('2', '2', '3', '2017-02-05', '1.55'),
	('3', '1', '4', '2017-01-27', '2.35'),
	('1', '3', '5', '2017-01-22', '2.40');
































