-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Client :  mysql.1:3306
-- Généré le :  Mar 18 Avril 2017 à 10:12
-- Version du serveur :  5.7.14-8
-- Version de PHP :  5.6.27

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `daheardit-record`
--

-- --------------------------------------------------------

--
-- Structure de la table `artist`
--

DROP TABLE IF EXISTS `artist`;
CREATE TABLE `artist` (
  `id` bigint(20) NOT NULL,
  `name` text,
  `url` text,
  `image` text,
  `links_carousel` text,
  `more` text,
  `is_public` tinyint(1) DEFAULT '1',
  `slug` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `artist`
--

INSERT INTO `artist` (`id`, `name`, `url`, `image`, `links_carousel`, `more`, `is_public`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Ben et Béné', NULL, NULL, 'http://vimeo.com/channels/dahearditrecords/5998420\nhttp://vimeo.com/channels/dahearditrecords/5998150\nhttp://vimeo.com/channels/dahearditrecords/5998017\nhttp://vimeo.com/channels/dahearditrecords/5998677\n', '<ul>\n  <li><a href=\"http://www.benetbene.net\">www.benetbene.net</a></li>\n  <li><a href=\"https://www.facebook.com/pages/Ben-et-B%C3%A9n%C3%A9/20216379469\">facebook</a></li>\n  <li><a href=\"http://www.myspace.com/benetbene\">Myspace</a></li>\n<ul>\n', 1, 'ben-et-bene', '2012-07-05 12:40:17', '2012-07-05 12:40:17'),
(2, 'Buskerdroid', '', '', '', '<ul>\r\n  <li><a href=\"http://www.buskerdroid.com/\">http://www.buskerdroid.com/</a></li>\r\n  <li><a href=\"https://www.facebook.com/buskerdroid\">Facebook</a></li>\r\n  <li><a href=\"http://www.myspace.com/buskerdroid\">Myspace</a></li>\r\n  <li><a href=\"http://soundcloud.com/buskerdroid/sets\">Soundcloud</a></li>\r\n<ul>\r\n', 1, 'buskerdroid', '2012-07-05 12:40:17', '2012-11-01 12:21:11'),
(3, 'Computer Truck', '', '', '', '<ul>\r\n  <li><a href=\"http://computertruck.parishq.net\">http://computertruck.parishq.net</a></li>\r\n  <li><a href=\"http://www.myspace.com/computertruck\">Myspace</a></li>\r\n<ul>\r\n', 1, 'computer-truck', '2012-07-05 12:40:17', '2013-04-27 16:17:31'),
(4, 'Eat Rabbit', NULL, NULL, NULL, '<ul>\n  <li><a href=\"http://www.myspace.com/eatrabbit\">Myspace</a></li>\n  <li><a href=\"https://www.facebook.com/eatrabbit\">Facebook</a></li>\n<ul>\n', 1, 'eat-rabbit', '2012-07-05 12:40:17', '2012-07-05 12:40:17'),
(5, 'Goto80', NULL, NULL, NULL, '<ul>\n  <li><a href=\"http://www.goto80.com\">www.goto80.com</a></li>\n  <li><a href=\"https://www.facebook.com/goto80\">Facebook</a></li>\n  <li><a href=\"http://twitter.com/#!/goto80\">Twitter</a></li>\n<ul>\n', 1, 'goto80', '2012-07-05 12:40:17', '2012-07-05 12:40:17'),
(6, '[guÿôm]', NULL, NULL, NULL, '<ul>\n  <li><a href=\"http://www.egotwister.com/guyom/index/\">www.egotwister.com/guyom/index/</a></li>\n  <li><a href=\"http://www.myspace.com/guyoml\">Myspace</a></li>\n<ul>\n', 1, 'guyom', '2012-07-05 12:40:17', '2012-07-05 12:40:17'),
(7, 'Jacques Cochise', '', '', '', '<ul>\r\n  <li><a href=\"http://cochise.canalblog.com/\">http://cochise.canalblog.com/</a></li>\r\n  <li><a href=\"http://www.cochisecomix.tumblr.com/\">http://www.cochisecomix.tumblr.com/</a></li>\r\n  <li><a href=\"http://jacquescochise.tumblr.com/>http://jacquescochise.tumblr.com/</a></li>\r\n<li><a href=\"https://soundcloud.com/jacquescochise\">https://soundcloud.com/jacquescochise</a></li>\r\n<ul>\r\n', 1, 'jacques-cochise', '2012-07-05 12:40:17', '2014-05-26 22:56:13'),
(8, 'Mini Roc', NULL, NULL, NULL, '<ul>\n  <li><a href=\"http://www.miniroc.com/\">www.miniroc.com/</a></li>\n  <li><a href=\"http://www.myspace.com/miniroc\">Myspace</a></li>\n<ul>\n', 1, 'mini-roc', '2012-07-05 12:40:17', '2012-07-05 12:40:17'),
(10, 'Pocketmaster', NULL, NULL, NULL, '<ul>\n  <li><a href=\"http://www.pocketmaster.ch/\">www.pocketmaster.ch/</a></li>\n  <li><a href=\"http://www.myspace.com/pocketmaster\">Myspace</a></li>\n<ul>\n', 1, 'pocketmaster', '2012-07-05 12:40:17', '2012-07-05 12:40:17'),
(11, 'Puyo Puyo', '', '', 'https://vimeo.com/11503305https://vimeo.com/7233308', '<ul>\r\n  <li><a href=\"http://puyopuyo.lautre.net/\">http://puyopuyo.lautre.net/</a></li>\r\n  <li><a href=\"https://www.facebook.com/officialpuyopuyo\">Facebook/</a></li>\r\n  <li><a href=\"http://www.myspace.com/puyopuyo\">Myspace</a></li>\r\n<ul>\r\n', 1, 'puyo-puyo', '2012-07-05 12:40:17', '2013-02-24 20:09:13'),
(12, 'Sidabitball', '', '', 'https://www.youtube.com/watch?v=bF6QaC4f9Kc\r\nhttps://vimeo.com/14505117\r\nhttps://vimeo.com/5998863\r\n', '<ul>\r\n  <li><a href=\"http://www.sidabitball.com/\">www.sidabitball.com</a></li>\r\n<ul>\r\n', 1, 'sidabitball', '2012-07-05 12:40:17', '2016-11-28 21:41:52'),
(13, 'Sputnik Booster', NULL, NULL, NULL, '<ul>\n  <li><a href=\"https://www.facebook.com/pages/Sputnik-Booster-The-Future-Posers/117490921652175\">Facebook</a></li>\n  <li><a href=\"http://www.myspace.com/sputnikbooster\">Myspace</a></li>\n<ul>\n', 1, 'sputnik-booster', '2012-07-05 12:40:17', '2012-07-05 12:40:17'),
(14, 'Tom Woxom', '', '', '', '', 1, 'tom-woxom', '2012-07-05 12:40:17', '2013-10-01 15:53:15'),
(15, 'Vicnet', '', '', '', '<ul>\r\n  <li><a href=\"http://www.vic-net.com/\">www.vic-net.com</a></li>\r\n  <li><a href=\"https://www.facebook.com/pages/Vicnet/419589410001\">Facebook</a></li>\r\n  <li><a href=\"http://www.myspace.com/vicnet\">Myspace</a></li>\r\n<ul>\r\n', 1, 'vicnet', '2012-07-05 12:40:17', '2016-12-05 11:43:41'),
(16, 'Xerak', NULL, NULL, 'https://vimeo.com/14327568\n', '<ul>\n  <li><a href=\"http://www.xerak.com/\">www.xerak.com</a></li>\n  <li><a href=\"https://www.facebook.com/xerak\">Facebook</a></li>\n  <li><a href=\"http://www.myspace.com/xerak1\">Myspace</a></li>\n<ul>\n', 1, 'xerak', '2012-07-05 12:40:17', '2012-07-05 12:40:17'),
(17, 'Astroboiler', NULL, NULL, NULL, '<ul>\n  <li><a href=\"http://www.myspace.com/astroboiler>Myspace</a></li>\n</ul>\n', 1, 'astroboiler', '2012-07-05 12:40:17', '2012-07-05 12:40:17'),
(18, 'Les Robots Musique', NULL, NULL, NULL, '<ul>\n  <li><a href=\"http://www.myspace.com/lesrobotsmusique\">Myspace</a></li>\n<ul>\n', 1, 'les-robots-musique', '2012-07-05 12:40:17', '2012-07-05 12:40:17'),
(20, 'Marc de Blanchard', 'http://marc.arette.free.fr/', '', 'http://vimeo.com/70095396', '<ul>\r\n  <li><a href=\"http://marc.arette.free.fr/\">http://marc.arette.free.fr/</a></li>\r\n  <li><a href=\"http://soundcloud.com/marc-de-blanchard\">Soundcloud</a></li>\r\n</ul>\r\n', 1, 'marc-de-blanchard', '2012-11-25 20:11:44', '2013-07-11 15:41:41'),
(21, 'Debmaster', 'http://www.debmaster.org', '', '', '<ul>\r\n  <li><a href=\"http://www.debmaster.org/\">www.debmaster.org</a></li>\r\n  <li><a href=\"https://www.facebook.com/pages/Debmaster/7920146722?fref=ts\">Facebook</a></li>\r\n  <li><a href=\"https://soundcloud.com/debmaster\">Soundcloud</a></li>\r\n<ul>\r\n', 1, 'debmaster', '2013-02-20 20:03:16', '2013-02-26 13:01:13'),
(22, 'Dj Black Negro', '', '', '', '', 1, 'dj-black-negro', '2013-12-01 17:13:53', '2013-12-06 10:34:29'),
(23, 'Infecticide', 'https://www.facebook.com/infecticide?fref=ts', '', 'https://www.youtube.com/watch?v=i7FEegisUYc', '', 1, 'infecticide', '2014-01-18 10:47:13', '2015-06-25 22:24:46'),
(24, 'The Fat', 'https://www.facebook.com/thefatmusic', '', '', 'https://soundcloud.com/thefatmusic\r\n', 1, 'the-fat', '2014-09-25 16:11:07', '2014-09-30 10:14:51'),
(25, 'Le Matin', 'http://lematin.autiste.org', '', '', '', 1, 'le-matin', '2014-11-14 18:34:08', '2014-11-20 17:49:36'),
(26, 'Skinfaxe', 'https://soundcloud.com/skinfaxe1', '', '', '', 1, 'skinfaxe', '2015-03-10 21:15:09', '2015-03-16 13:15:06'),
(27, 'Klaten', 'https://soundcloud.com/klatentwiz', '', '', '', 1, 'klaten', '2016-04-19 11:24:06', '2016-04-23 17:33:54'),
(28, 'Eddie 135 & The Shitblaster', 'https://www.facebook.com/eddie135/', '', '', '', 1, 'eddie-135-the-shitblaster', '2017-04-11 18:13:50', '2017-04-11 18:43:35');

-- --------------------------------------------------------

--
-- Structure de la table `artist_translation`
--

DROP TABLE IF EXISTS `artist_translation`;
CREATE TABLE `artist_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `presentation` text,
  `lang` char(2) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `artist_translation`
--

INSERT INTO `artist_translation` (`id`, `presentation`, `lang`) VALUES
(1, 'Ben et Béné is a French Electro-8bit-Punk duo.\nIn 2003, after singing and playing in a lot of punk and indie rock outfits, Ben decided to play his own music. He began composing with a cheap computer, then Gameboy and Reason.\nBéné just qualified for art-school, joining Ben in his project. She shows her “Real Video”, a mix of TV movies and domestic video, during their concerts.\nTheir music is the meeting of many influences: punk, 8bit, electro, clubbing… Their shows are always completely crazy ! This is due to to their electric voices which give an amazing high energy to their music.\nThey are on www.beradio.net the first and third Monday of each month.\n', 'en'),
(1, 'Ben et Béné est un duo 8bit - punk né fin 2003.\nBen musicien indie rock a eu de nombreuses expériences de groupe qui l\'ont conduit à cette idée: \"fais tout toi-même!\". Muni d\'un laptop, d\'une gameboy, d\'un micro et d\'autres petites choses bricolées, il se lance donc dans la composition de chansons d\'ordinateurs furieusement dansante mais décalées : une electropunk au pays des merveilles.\nBéné, plasticienne, diffuse en live des vidéos réelles et façonne l\'aspect graphique du groupe : site web - pochette de disques - stickers etc- Véritable show girl à la voix diabolique, elle est capable d\'électriser n\'importe quel public.\nPersuadés que le meilleur moyen de faire de la musique c\'est d\'aller en jouer n\'importe où, le duo écume sans relache les scènes alternatives européennes.\nDepuis 3 ans, ils organisent en France, Belgique et Pays-Bas les soirées electro-8bit & lo-fi : We Are Not Toys. 2006/2007 est déjà une période charnière dans leur parcours avec l\'animation d\'une émission bimensuelle sur beradio.net le lundi soir (We are not toys).\n', 'fr'),
(2, 'Being edited currently. Come back soon !\r\n', 'en'),
(2, 'En cours de rédaction. Revenez bientôt !\r\n', 'fr'),
(3, 'French composer, mixing chip-instruments with modern sounds. His music is intense and varied, mostly dance-oriented, hard and melodic.\r\nActive members since 2002 of the Paris Hq micromusic he helped to develop the chiptune & low fi electro scene in France by organising concerts and inviting artists who never had the chance to play in Paris. That’s during these shows that he started his first gigs under the pseudo Computer Truck… \r\nDuring the same period he was introduced to circuit bending and started using bended toys & synth for his music.\r\nHis influence are varied, from retro electropop to breakcore and harsh noize. He describe his music by “riot toy party music”, a music you can dance on and wich evolve to the 80’s c64 sound to “ultime electrogrind music” (which you can only listen during the gigs because his more violent tracks have not yet been released so don’t search on his myspace or webpage…) with uncomprehensible voice on it thanks to his Halloween special fx voice transformer. A music made to unite retarded nerds and crustyPunx.\r\nps : laptop plus diverse transformed toyz and voice...\r\n', 'en'),
(3, 'French composer, mixing chip-instruments with modern sounds. His music is intense and varied, mostly dance-oriented, hard and melodic.\r\nActive members since 2002 of the Paris Hq micromusic he helped to develop the chiptune & low fi electro scene in France by organising concerts and inviting artists who never had the chance to play in Paris. That’s during these shows that he started his first gigs under the pseudo Computer Truck… \r\nDuring the same period he was introduced to circuit bending and started using bended toys & synth for his music.\r\nHis influence are varied, from retro electropop to breakcore and harsh noize. He describe his music by “riot toy party music”, a music you can dance on and wich evolve to the 80’s c64 sound to “ultime electrogrind music” (which you can only listen during the gigs because his more violent tracks have not yet been released so don’t search on his myspace or webpage…) with uncomprehensible voice on it thanks to his Halloween special fx voice transformer. A music made to unite retarded nerds and crustyPunx.\r\nps : laptop plus diverse transformed toyz and voice...\r\n', 'fr'),
(4, 'Being edited currently. Come back soon !\n', 'en'),
(4, 'En cours de rédaction. Revenez bientôt !\n', 'fr'),
(5, '?Goto80 is Anders Carlsson, born in Sweden. He grew up in the underground computer subculture called the demoscene on the Amiga, C64, Gameboy and PC since the early 1990\'s. Soon he was developing a relationship especially with the Commodore 64 where his brain and the soundchips would form a buggy and dirty relationship.\nAlready in his early teens he would explore musical styles ranging from ambient through cheesy 1980\'s music through to gabber and noisy breaks.\nAfter his first first vinyl release in 2001 he gained a reputation outside the geek communities, and also started performing live.\nHe kept expanding the boundaries of chip music to work with several retarded musical styles, and added more vocals.\nHis music has also been heard under alot of other names, such as the lo-fi c64 guitar band Superdöner and the vocal micropop duo HT.\nJust as in the demoscene, he collaborates alot with visual artists, especially Entter and Jossystem to do live shows that at this point are far from silent nerdery and videogame nostalgia.\nGoto80 still tries to push the boundaries of the 8-bit sound and has by now developed an unmatched skill of abusing different music genres with his personal chip-music touch.\nIn 2007 he\'s performed about 100 shows and made about 40 releases - most of them for free download.\n', 'en'),
(5, 'Goto80 est Anders Carlsson, né en Suède. Il a grandi dans la culture underground appelée \"demoscene\" sur Amiga, C64, Gameboy et PC depuis le début des années 90.Assez vite il développa une relation particulière avec le commodore 64, dans lequel son cerveau et les soundchips eurent des rapports triturés et déstructurés.\nDéjà, adolescent, il explorait des modèles musicaux s\'étendant de la musique ambiante aux gabbers et autres breaks \"noisy\", en passant par la musique \"caoutchouc salé\" des années 80.\nAprès son premier album vinyle en 2001, il commence à être connu en dehors de la communauté de \"geeks\" et à faire des performances live.\nIl a toujours repoussé les limites de la \"chip music\", travaillant avec plusieurs styles musicaux anciens et en y ajoutant des voix.\nEn 2007 il a déjà à son actif une centaine de performances live, une quarantaine d\'album, la majorité en libre téléchargement.\nOn retrouve sa musique sous d\'autres noms , comme le groupe lo-fi c64 guitare \"Superdöner\" et le duo vocal micropop \"HT\".\nExactement comme dans la \"demoscene\", il collabore beaucoup avec des artistes visuels, surtout Entter et Jossystem pour des concerts qui jusqu\'à maintenant sont loins de la nostalgie des jeux video.\nGoto80 continue de repousser les limites du son 8-bit et a développé jusquà maintenant une façon unique de maltraiter différents genres musicaux avec sa touche personnelle \"chip music\".\n', 'fr'),
(6, '[Guÿôm] aka Guillaume is first of all a superhero. He discovered his super powers about ten years ago after accidental and fatal exposure to liberal economy speeches. But thanks to his unstoppable will, [guÿôm] survived and gained super powers allowing him to fight without truce against the traders and speculators to set things right and punish the evil. He is equipped with a superhero mask made of vibranium and pure virgin merinos wool (70% minimum) which grants him supra vision thanks to an adamatium catalyst. His clothes were woven from old Pravda numbers, in order to protect himself from the hostile O.P.A. Also, [Guÿôm] relates his adventures through music. The latter is 16 bits (twice as good as 8 bits!!) electro barred, techno parodic, breakcore furious, idm? Screw the labels, [Guÿôm] goes above and beyond restrictive categories.\n', 'en'),
(6, '[Guÿôm] aka Guillaume est avant tout un super héros.\nIl a découvert ses super pouvoirs il y a une dizaine d\'années suite à une exposition accidentelle et mortelle à des discours sur l\'économie libérale. Mais grâce à une volonté inébranlable [guÿôm] s\'en est sorti et a acquis des super pouvoirs lui permettant de combattre sans relâche les traders et les spéculateurs pour redresser les torts et punir les méchants. Il est équipé d\'un masque de super héros fait en vibranium et de pure laine vierge de mérinos (70% minimum) qui lui permet d\'avoir une supra vision grâce à un catalyseur en adamantium. Ses vêtements ont été tissés grâce à des anciens numéros de la Pravda, afin de se proteger contre les O.P.A. hostiles. Accessoirement [Guÿôm] relate ses aventures au moyen de la musique.\nCelle ci est faite en 16 bits (deux fois mieux que le 8 bits!!) Electro barrée, techno parodique, breakcore furieux, idm?\nAu diable les étiquettes, [Guÿôm] s\'affranchit des cases trop restrictives.\n', 'fr'),
(7, 'Being edited currently. Come back soon !\r\n', 'en'),
(7, 'En cours de rédaction. Revenez bientôt !\r\n', 'fr'),
(8, 'Mini Roc is electro musician Jan Michelbach from Bochum, Germany. Experementing with electronic sounds and different music styles for about seven years, he got in touch with the 8bit-music scene in 2003.\nQuickly he became excited by lo-fi sounds generated with classic videogame and computer consoles. Also amazed by the simplicity, nevertheless the range of technology behind 8bit tracks, he soon began producing his own combining typical game sounds with modern electro and techno elements.\nSince beginning of 2005 Mini Roc has produced his tracks exclusively on a Gameboy and performed them on several live gigs across Europe.\n', 'en'),
(8, 'Mini Roc, de son vrai nom Jan MichelBack est un musicien allemand faisant de la musique éléctro. \nIl a expérimenté différentes sonorités et styles musicaux pendant sept ans avant de découvrir la scène 8bit, en 2003.\nTrès vite, il tombe amoureux des sons lo-fi générés par les jeux vidéos des anciennes consoles, imprésionné par la simplicité technique développée par les morceaux 8bit. \nIl commence alors très rapidement à produire son propre panel de sons, provenants de jeux mélangés à des sonoritées modernes de l\'électro et des brides de techno.\nEn 2005 , Mini Roc produit des morceaux exclusivement joués sur Gameboy et les à joués en live à travers toute l\'Europe.\n', 'fr'),
(10, 'Pocketmaster is a lowtech-music-project from Basel founded in 2005 by Cube-C and Emglio Laser.\nThey use the soundchips of classic gameboy and 8-bit or 16-bit homecomputers, especially the one of Commodore 64. Of course also newer hardware is used to some extend, mixed up with samples of various sources. As a result, freaky electropop or micropunk makes you dance until game over.\nToo squiggly and too humorous to sink into minimal mainstream, they squeak and bleep with international success\n', 'en'),
(10, 'Pocketmaster est un projet de musique lowtech fondé en 2005 à Basel par Cube-C et Emglio Laser.\nIls utilisent les cartes son d\'une gameboy classique et des ordinateurs 8-bit ou 16-bit, surtout celui de Commodore 64.  Bien sûr, ils utilisent aussi du matériel un peu plus moderne, avec un mélange de samples de diverses sources.  Le résultat: de l\'electropop insolite ou du micropunk qui vous fera danser jusqu\'à game over.\nTrop de gribouillis et trop humoristique pour caler dans le minimal mainstream, ils piaillent et ils raillent avec un succés international.  ?\n', 'fr'),
(11, 'After being a new wave drummer in the 80s, Pascal Lebrain became Puyo Puyo around 2002. \r\nIt was the computer and the program Protools Free that allowed him to create a slightly devious and crazy lo-fi electropop music, home made with little material, but much enthusiasm. \r\nFirst good news: Feliz Kubin took him on his label Gagarin Records for a maxi vinyl entitled \"A novel Trick Item\" in 2004.. He then started a series of concerts throughout Europe - and even in Mexico - dancing the Puyo Puyo in video clips he put together himself in the same ludic and low-budjet spirit as always. This mutant karaoke, both fragile and energetic, became is trademark, along with his famous cosmodroid helmet.\r\nFrom compilations to maxis, he went on producing his music, but still asked his electronic idols to remix one of his pieces. This is how Felix Kubin, Candie Hank, Brezel Goering (Stereototal), Frederik Schikowski, Groupgris (Kap Bambino) and Gangpol got started on the project: the album came out in 2009 as a picture disc under Brain Records, a label created for the occasion. The Brain is also a radio show hosted and produced by Lebrain and his partner Eva Lebrain since 1999, with whom he also organizes evening concerts and parties in Nantes called \"Superboums\".\r\n', 'en'),
(11, 'Après avoir été batteur new-wave dans les eighties, Pascal Lebrain s\'est transformé en Puyo Puyo vers 2002.\r\nCe sont l\'ordinateur et le logiciel Protools free qui lui ont fourni l\'occasion d\'élaborer une musique electropop lo-fi un peu déviante et déglinguée, bricolée à la maison avec un matériel minimal et un enthousiasme maximal.\r\nPremier bonheur : Felix Kubin le signe sur son label Gagarin Records pour un maxi vinyl \"A novel Trick item\" (2004). Il enchaîne alors les concerts dans toute l\'Europe - et même à Mexico ! - dansant le Puyo Puyo devant des clips qu\'il confectionne lui-même toujours dans un esprit ludique et low-budget. Ce karaoke mutant à la fois fragile et énergétique devient sa marque de fabrique, ainsi que son célèbre casque de cosmodroïde.\r\nDe compilations en maxis il continue ensuite à produire sa musique en dilettante, ce qui ne l\'empêche pas de proposer à ses idoles électroniques de remixer un de ses morceaux. C\'est ainsi que Felix Kubin, Candie Hank, Brezel Goering (Stereototal), Frederik Schikowski, Groupgris (Kap Bambino) et Gangpol participent au projet : le disque sort en 2009 sous forme de picture disc chez The Brain Records, label créé pour l\'occasion. A noter que The Brain est aussi une émission de radio qu\'il anime et produit avec sa compagne Eva Lebrain depuis 1999, avec laquelle il organise aussi à Nantes des soirées concerts + party baptisées Superboums.\r\n', 'fr'),
(12, 'Sidabitball is not a musician, let alone a person.\r\nIt is the name of a music program that his creator, Pierre Boquet, has been working on for 5 years already. A standard in agroalimentary and musical industries, it has notably been used by Justin Guetta during the mastering of David Timberlake\'s last album.\r\nRight now, the Sidabitball program works exclusively on gameboy, but rumors of carrying the program to other platforms are going around.\r\n', 'en'),
(12, 'Sidabitball n\'est pas un musicien, encore moins une personne.\r\nC\'est le nom d\'un programme de musique que son géniteur, Pierre Boquet, met au point depuis déja 5 ans. Standard de fait dans les industries de la production musicale et de l\'agroalimentaire, il a notamment été utilisé par Justin Guetta lors du mastering du dernier album de David Timberlake.\r\nÀ l\'heure actuelle, le programme Sidabitball fonctionne exclusivement sur gameboy, mais les rumeurs d\'un portage du programme sur d\'autres plateformes vont bon train.\r\n', 'fr'),
(13, 'Being edited currently. Come back soon !\n', 'fr'),
(14, 'Tom Woxom is a german artist from the Ruhrarea. He plays electro music inspired from his earlier experiences running Protracker on Amiga 500.\r\nAfter having been looking for \"better sounds\" and \"higher fidelity\" for years he discovered that his earlier works were definitely more simple and rocking, and that they were funnier to compute. That\'s why he decided to give the Amiga 500 another go.\r\nTom Woxom built his sound in 2008 running the Amiga combined with playing true waveforms, some little keyboards and modern technologies for arrangement and recording.\r\nHe\'s looking forward to performing live soon.\r\n', 'en'),
(14, 'Tom Woxom is a german artist from the Ruhrarea. He plays electro music inspired from his earlier experiences running Protracker on Amiga 500.\r\nAfter having been looking for \"better sounds\" and \"higher fidelity\" for years he discovered that his earlier works were definitely more simple and rocking, and that they were funnier to compute. That\'s why he decided to give the Amiga 500 another go.\r\nTom Woxom built his sound in 2008 running the Amiga combined with playing true waveforms, some little keyboards and modern technologies for arrangement and recording.\r\nHe\'s looking forward to performing live soon.\r\n', 'fr'),
(15, 'Designer by day and musician by night, Vicnet has been active for fifteen years. He navigates skillfully between funk, skweee, synthpop, IDM, and even Hebraic acid with his band, Moishemoishemoishele, which gathers Olamm and Shoboshobo. In love with analog synthesizers and rhythm boxes, his live shows evoke a psychotropic Herbie Hancock.\r\n\r\nThe question of machine relations is central in his design work as it is in his music. In contemporary theater sets, he conceives technical and poetic scenography that involves light and sound as if they were characters in their own right. His design creations, be they furniture, lighting, or aural objects, are edited by societies such as Ligne Roset or Boîte Concept. Device collector, tweaker of synthesized voices and 8-bit sonorities in his first albums on the label Deco, founded by Lionel Fernandez from the pioneer experimental band Sister Iodine, he has since then continuously explored spaces for creation as well as varied and contrasted collaborations between institutionalized contexts and free cultures.\r\n\r\nVoilé is Vicnet\'s second album on Da ! Heard It Records after Mr. Hadopi in 2010.\r\n', 'en'),
(15, 'Designer le jour, Vicnet est également musicien la nuit. Actif depuis 15 ans, il navigue habilement entre funk, skweee, synthpop, IDM ou même acid hébraïque avec son groupe Moishemoishemoishele qui réunit Olamm et Shoboshobo. Amoureux des synthétiseurs analogiques et boîtes à rythmes, ses lives évoquent un Herbie Hancock sous psychotropes.\r\nDans son travail de design comme dans sa musique, la question du rapport aux machines est centrale. Sur les scènes de théâtre contemporain, il conçoit des scénographies techniques et poétiques qui impliquent la lumière et le son comme des personnages à part entière. Ses créations de design, mobiliers, luminaires et objets sonores, sont éditées par des sociétés comme ligne Roset ou la Boîte Concept. Collectionneur d\'appareils, bidouilleur de voix de synthèse et de sonorités 8-bit dans ses premiers albums sur le label Deco fondé par Lionel Fernandez du groupe pionnier du rock expérimental Sister Iodine, il n\'a cessé depuis d\'explorer des espaces de création et de collaborations variés et contrastés, entre contextes institutionnels et cultures libres.\r\nVoilé est le 2ème album de Vicnet sur Da ! Heard It Records après Mr. Hadopi en 2010.\r\nDans son travail de design comme dans sa musique, la question du rapport aux machines est centrale. Sur les scènes de théâtre contemporain, il conçoit des scénographies techniques et poétiques qui impliquent la lumière et le son comme des personnages à part entière. Ses créations de design, mobiliers, luminaires et objets sonores, sont éditées par des sociétés comme ligne Roset ou la Boîte Concept. Collectionneur d\'appareils, bidouilleur de voix de synthèse et de sonorités 8-bit dans ses premiers albums sur le label Deco fondé par Lionel Fernandez de Sister Iodine, il n\'a cessé depuis d\'explorer des espaces de création et de collaborations variés et contrastés, entre contextes institutionnels et cultures libres.\r\n\"Voilé est le 2ème album de Vicnet sur Da ! Heard It Records après Mr. Hadopi en 2010\"\r\n', 'fr'),
(16, 'XERAK is a designer and a musician creator of the electro trash kawaii mouvement. His universe comes from the Japanese comics the American comics the Pxl Art the Pop art and the science fiction movies of the 50’s.\nThe XERAK music is a melt of electro acid punk toy kawaii with a little bit of Japanese 90’s techno. (Denki Groove, Pierre Taki…).\nDuring his lives the sound is followed by his hypnotics designs his energics video creations and his funnies video games. For the shows he plays differents characters like The Delux Punk Pink Poodle the Sexfloor Preacher the Mutant cooker the Mutant Disco Samouraï and the Mutant President.\n', 'fr'),
(17, 'Being edited currently. Come back soon !\n', 'en'),
(17, 'En cours de rédaction. Revenez bientôt !\n', 'fr'),
(18, 'Being edited currently. Come back soon !\n', 'en'),
(18, 'Venus tous deux d\'une étoile lointaine à bord d\'un vaisseau interplanétaire,  Rod Droïd et Puyo Puyo s\'apprêtaient à faire une tournée galactique triomphale au sein de l\'orchestre impérial. Soudain, leur engin spatial explosa en vol dans une averse de météores. Précipités dans la stratosphère, nos deux compères robots furent alors projetés sur terre et plus précisément à Nantes, France. Ayant pris l\'apparence humaine, ils se remirent illico à faire la seule chose qu\'ils savaient faire : de la musique et des concerts, pour survivre dans cet environnement hostile, à des milliers d\'années-lumière de chez eux. Les Robots Musique étaient nés.\nLeur duo rappelle naturellement le folklore Kriktoïen, en plus offensif du point de vue rythmique. Leurs textes sont simples (n\'oublions pas que ce sont des robots) et légers comme les poèmes Hwagaagaa de leur enfance. Quant à leur sens de la mélodie, il évoque immanquablement les airs entraînants de Gamma Leonis et de Celestia, deux astres célèbres pour leurs happy tunes. Leurs morceaux sont courts, efficaces et parfaits pour les folles chorégraphies métalliques.  \nVoici quelques mois, Da! Heard it records, toujours en quête de nouveaux talents, eut vent de ce duo droïdesque et décida de le signer sur son label digital. Comme ils ne savaient pas signer, les Robots Musique firent simplement coucou avec la main.\n', 'fr'),
(20, 'Marc de Blanchard is a protean artist who lives in Rennes. As a graphic designer, plastician, and musician he develops curious and off-putting universes, often inspired by the scientific and biological world.\r\nThe self-educated musician likes sounds that crack, melodies that transport, and twisted rhythms that he sprinkles with film extracts or obscure soundtracks. He seeks to confront genres in an uneven and melodic musical bricolage. He also creates numerous mixes, programs and other sound montages that he diffuses on the Internet, on independent radios, or live by way of wild DJ sets coupled with video projections.\r\nIn 2006, he started torturing his own piano-improvised melodies with his computer. It is from these musical games that his first album, “Hydraphony”, takes its source. Released in 2010, this album blends classical music, traditional folklore, and sound experimentation. It’s followed by “Hypothermy”, an EP tinted with psychobilly, electronica, and lyrical getaways. In parallel, he begins collaboration with a harpist to develop Wezen, a visual, musical, and scenic show.\r\nIncreasingly active musically, his practice is always in movement, seeking a universe that is both coherent and phantasmagorical, without limiting himself by genre or style.\r\nTo find out more:  http://marc.arette.free.fr/\r\n', 'en'),
(20, 'Marc de Blanchard est un artiste protéiforme vivant à Rennes. Designer graphique, illustrateur, plasticien et musicien, il développe des univers curieux et déroutants, souvent inspirés par le domaine scientifique et biologique.\r\nMusicien autodidacte, il aime les sons qui craquent, les mélodies qui transportent et les rythmes tordus qu’il parsème d’extraits de films ou de bandes sonores obscures. Il cherche à confronter les genres dans un bricolage musical bancal et mélodique. Il réalise également de nombreux mixes, émissions et autres montages sonores qu’il diffuse sur Internet, sur des radios indépendantes ou en live sous forme de DJ sets sauvages agrémentés de projections vidéos.\r\nEn 2006, il commença à torturer par ordinateur ses propres mélodies qu’il improvise au piano. De ces jeux musicaux prendra source son premier album : « Hydraphony ». Sorti en 2010, cet album mêle musique classique, folklore traditionnel et expérimentations sonores. S’en suivra « Hypothermy », un EP teinté de psychobilly, d’electronica et d’envolées lyriques. Parallèlement, il débute une collaboration avec une harpiste pour développer Wezen, un spectacle visuel, musical et scénique.\r\nDe plus en plus actif musicalement, sa pratique est toujours en mouvement, en quête d’un univers à la fois cohérent et fantasmagorique, sans limite de genre ou de style.\r\nPour en savoir plus : http://marc.arette.free.fr/\r\n', 'fr'),
(21, 'With his borderline obsessive “wonkiness”, Julien Deblois, aka Debmaster, trims his mustache every day the same way he trims his music. \r\nA kind of tornado of bleeps finding its strength as much in hip-hop as in more obscure genres such as Moldavian 8bit or African accordion. \r\nOne thing is certain : he never goes half way. His live shows are a kind of kick in the ass to the lack of variety and slackening of electronic \r\nmusic (sound familiar?). After a 4-year debut in France, he now lives in Berlin, which allows him to sweep the European rooms at an \r\nunrestrained rhythm.', 'en'),
(21, 'D’un \"bancalisme\" quasi obsessionnel, Julien Deblois aka Debmaster taille sa moustache tous les jours de la même façon que sa \r\nmusique. Une sorte de tornade de bleeps trouvant sa force autant dans le hip hop que dans des genres plus obscurs comme le 8bit \r\nmoldave ou l\'accordéon africain. Une chose est sûre, c\'est qu\'il ne fait pas les choses à moitié. Ses lives sont une sorte de coup de pied \r\nau cul face au manque de variété et au ramollissement de la musique électronique (ça vous parle?). Après avoir fait ses armes 4 années \r\nen France, il habite aujourd\'hui à Berlin, ce qui lui permet maintenant de balayer les salles européennes à un rythme effréné.', 'fr'),
(22, 'DJ Black Negro is a white guy, born and brought up in a rural part of eastern belgium. DJ Black Negro was first introduced to music with the mainstream hardcore tekno he was listening to during the party in belgium clubs every week end. \r\n\r\nDJ Black Negro then was introduced to free party with friends but failed in being accept by the scene because of his taste which were  considered too \"clubbing\" by the travelers... DJ Black Negro is no original guy. Black Negro got no ambition. \r\n\r\nActually, DJ Black Negro will die listening & producing all his life only one musical genre -  maybe the most up tied of all - the \"thunder dome\" techno. DJ Black Negro thinks artists shouldn\'t possess copyrights, DJ Black Negro is unemployed and  needs samples to create because of a lack of machines he can\'t buy. \r\n\r\nDJ black negro is a nihilistic junky.', 'en'),
(22, 'DJ Black Negro est blanc. Natif de la Belgique rurale, il a découvert la musique à l’occasion des fêtes tekno hardcore organisées chaque weekend dans les clubs de la région.\r\n\r\nDJ Black Negro a ensuite découvert la scène free party, par le biais de quelques amis, mais n’a jamais pu s’y intégrer. Ses goûts musicaux étaient considérés trop “clubbing” par les travelers. DJ Black Negro n’est pas un mec original. DJ Black Negro n’a pas d’ambition. \r\n		\r\nÀ sa mort, DJ Black Negro n’aura écouté et produit qu’un seul genre musical - peut être le plus attachant de tous - : la techno “Thunder Dome”. DJ Black Negro pense que les artistes ne devraient posséder aucun copyright. DJ Black Negro est sans emploi et utilise des samples car il n’a pas les moyens de s’acheter de machines.\r\nDJ Black Negro est un junkie nihiliste.', 'fr'),
(23, 'The trio first met at a friendly Scrabble evening in the countryside. Heavy in triple-word scores and assumed neologisms, the three rascals and their mischievous verbs finally got along to found the “Neo-neologisms for subversive Scrabble” association, an avant-garde innovative concept they proposed at the FFSc. They were met with rejection for “regulatory aberration” and “non-compliance to traditions.” Disappointed and disillusioned, they begun to discharge their pain in deliciously infected compositions: Infecticide was born.\r\n \r\nInfecticide brandished the absurd at the service of the serious. An ingeniously handled second degree with influences as diverse as the military frigidity of Front 242 and Liaisons Dangereuses, or the festive exuberance of Detroit Grand Pubahs and the Beastie Boys. A sharp and efficient electro-punk wave with neo-Dadaist texts for an unclassifiable mixture that is as grating as it is jarring.', 'en'),
(23, 'C\'est lors d’une soirée Scrabble chez des amis en province que le trio fit connaissance. Forts de mots comptent triple et néologismes assumés, les trois lascars au verbe espiègle sympathisèrent pour finalement fonder l’association “Néo-néologismes pour Scrabble subversif”, un concept novateur et avant-gardiste qu’ils proposèrent à la FFSc. C’est d’un refus pour “aberration réglementaire” et “non conformité aux traditions” qu’ils furent remerciés. Déçus et désabusés, ils se mirent à déverser leurs maux dans des compositions délicieusement infectées : Infecticide était né.\r\n\r\nInfecticide brandit l\'absurde au service du sérieux. Un second degré ingénueusement manié aux influences aussi diverses que la froideur militaire de Front 242 et Liaisons Dangereuses, ou l\'exubérance festive de Detroit Grand Pubahs et des Beastie Boys. Une electro-punk-wave pointue et efficace aux textes néo-dadaïstes pour une mixture inclassable aussi grinçante que détonnante.\r\n', 'fr'),
(24, 'The Fat, a band based in the north of Paris, consists of two pillars: Jacques de Candé and Thomas Suire. Louis Pontvianne and Romain Drogoul join the two comrades live. ', 'en'),
(24, 'The Fat, groupe basé au nord de Paris, est constitué de deux piliers, Jacques de Candé et Thomas Suire. En live, Louis Pontvianne et Romain Drogoul rejoignent les deux compères. ', 'fr'),
(25, 'Le Matin belongs to the privileged class that never use their supermarket plastic tokens when they need a shopping cart. It is of those who manage to create this virtuous loop of self-penetration that provides supreme independence to the beings that evolve in packs known as the supermarket shopping carts.\r\n\r\nLe Matin confronts the attach system of shopping carts with its virtuosity to point a finger at the flaws of our ultra-consumerist societies. Working the night shift for the Carts, Le Matin has no other choice but to work its solfège and its MPC1000 alone in a room… early in the morning. Yes, Le Matin likes to call a spade a spade.\r\nThus, after participating in the initiation of the Bugcore movement more than ten years ago, Le Matin now treads – without error – new musical lands made of analog synths and rhythm boxes to shamelessly flirt with Chicago’s house, Detroit’s electro, and minimal wave synth. ', 'en'),
(25, 'Le Matin appartient à la classe de privilégiés qui jamais n’usent de leur jeton en plastique de supermarché pour utiliser un Caddie. Il est de ceux qui réussissent à créer cette boucle vertueuse d’auto-pénétration offrant indépendance suprême à ces êtres évoluant en meute que sont les chariots à roulettes de supermarché.\r\n\r\nLe Matin use de sa virtuosité face au système d’attache des chariots pour pointer du doigt les failles de nos sociétés ultra-consuméristes. Oeuvrant la nuit pour les Caddies, Le Matin n’a d’autre choix que de travailler son solfège et sa MPC1000 seul dans sa chambre au... petit matin. Oui, Le Matin aime appeler un chat un chat.\r\n\r\nAinsi, après avoir participé à l\'initiation du mouvement Bugcore il y a maintenant plus de 10 ans, Le Matin foule aujourd’hui - sans Erreur - de nouvelles contrées musicales faites de synthés analogiques et de boites à rythmes pour flirter sans vergogne avec la house de Chicago, l\'électro de Détroit, ou la synth wave minimale. ', 'fr'),
(26, 'Guitar and piano were well too restrictive to let Skinfaxe’s whimsical imagination run loose. In her synth lab, she experimented and stripped the sounds to better dress them. Like a good tightrope walker, Skinfaxe plays with effects and other arrangements with a vision for a well-organized messy result. \r\n', 'en'),
(26, 'La guitare et le piano étaient bien trop restrictifs pour laisser champ libre à l’imaginaire châtoyant de Skinfaxe. Dans son laboratoire à synthés, elle expérimente et dénude les sons pour mieux les rhabiller. En bonne équilibriste, Skinfaxe joue avec effets et autres arrangements en vue d’un résultat bordélique bien rangé. ', 'fr'),
(27, 'After escaping from the enclosure of the insane Darling Dada stables, Klaten was identified sometimes playing the MIDI accordion on breakcore. After two albums that mingle cartoonish humor, massive rhythms, and uninhibited drill’n’bass soarings, he lands at Da ! Heard It to explore new territories for the duration of an album.', 'en'),
(27, 'Echappé de l’enclos de la folle écurie Darling Dada, Klaten a été identifié comme jouant parfois de l’accordéon MIDI sur du breakcore.  Après deux albums où se cotoient humour cartoonesque, rythmes massifs et envolées drill’n’bass décomplexées, il attérit chez Da ! Heard It pour explorer de nouveaux territoires le temps d’un disque.\r\n', 'fr'),
(28, 'Eddie 135\r\n\r\nWhen asked about their projects, Adrien Kanter and Matthieu Philippe de l’Isle appear voluble and speak in stereo of different memories, which obviously makes note-taking difficult. To report this interview, which took place over fruit juice one dark December afternoon tinted with Christmas magic, it is therefore suitable to mix everything together in order to lose the reader in a nebula of artistic and musical projects as diverse as they are convoluted.\r\n\r\nOf course, at first this could seem like a clumsy move or a Casse-Gueule (Matthieu is a member of the group, last album released this year on la Souterraine) but this fill of exotic and dominical vitamins takes us right to a certain tropical awakening or Réveil des Tropiques (free psyche-kraut combo in which our two specimens work), and more randomly to Adrien’s project for which a pun is not as easily constructed (Testarossa, a punk noise pop experimental escape). To this is added the organization of collective improvisations comprising each time four guests (the “4 à Table” series at the Société de Curiosité de Paris) or the presentation of a piece for cello, guitar, and sinusoidal waves in Hamburg at the Blurred Edges festival in 2016.\r\n\r\nSince 2005, the duo has also appeared under the name of Eddie 135, whose new opus is the object of this globally approximate text. For the story, titillated by a first concert de salon featuring wiggling young nymphal dance students, Adrien and Matthieu released the cassette Nixon Now! In 2008. That same year, they ty their hand at other aural experiments as attested by their recording of  Jardins in Nanterre, where two contracted cellos melt into the diffuse noise of a distracted rude audience.\r\n\r\nAfter a series of performances in Japan and Portugal, organized during the great era of Myspace, they met Londoner Shitblaster. Between two concerts of Metallica, whom he was following, this peculiar character invited them into his Camberwell studio. From there, Dragon’s Teeth was born, a jam recorded and edited in five days with the help of Indian fast food and analog devices. The result, feverish and compressed like a small hangover, constitutes the 33rd reference of Da! Heard It Records.\r\n', 'en'),
(28, 'Eddie 135\r\n\r\nQuand on leur demande de parler de leurs projets, Adrien Kanter et Matthieu Philippe de l’Isle se montrent volubiles et parlent en stéréo de souvenirs différents, ce qui rend évidemment la prise de notes difficile. Pour rendre compte de cet entretien déroulé autour d’un jus de fruits par un sombre après-midi de Décembre teinté de magie de Noël, il convient donc de tout mélanger afin de perdre le lecteur dans une nébuleuse de projets artistiques et musicaux aussi divers qu’alambiqués.\r\n\r\nBien-sûr, cela pourrait sembler à priori Casse-Gueule (Matthieu est membre du groupe, dernier album paru cette année sur la Souterraine) mais ce plein de vitamines exotique et dominical nous amène directement à un certain Réveil des Tropiques (combo free psyche-kraut où œuvrent nos deux spécimens) et plus aléatoirement au projet d’Adrien pour lequel je n’ai pas trouvé de jeu de mots (Testarossa,échappée punk noise pop expérimentale). A cela s’ajoutent l’organisation d’improvisations collectives comprenant à chaque fois quatre invités (la série “4 à Table” à la Société de Curiosité de Paris) ou encore la présentation d’une pièce pour violoncelle, guitares et ondes sinusoïdales à Hambourg au festival Blurred Edges en 2016.\r\n\r\nDepuis 2005, le duo apparaît également sous le nom d’Eddie135 dont un nouvel opus est l’objet de ce texte globalement approximatif. Pour l’histoire, émoustillés par un premier concert de salon où se trémoussent de jeunes nymphettes étudiantes en danse, Adrien et Matthieu sortent la cassette “Nixon Now!” en 2008. La même année, ils s’essaient à d’autres expériences sonores comme en témoigne l’enregistrement de “Jardins” à Nanterre où deux violoncelles traités se fondent dans le bruit diffus d’un public distrait et malpoli.\r\n\r\nAprès une série de concerts au Japon et au Portugal organisée à la grande époque de Myspace, ils rencontrent le londonien Shitblaster. Entre 2 concerts de Metallica qu’il suit dans leur tournée, ce curieux personnage les invite dans son studio de Camberwell. De là naît Dragon\'s Teeth, jam enregistré et édité en 5 jours à l’aide de fast food indienne et de machines analogiques. Le résultat, fiévreux et compressé comme une petite gueule de bois constitue la 33ème référence de Da ! Heard It Records.\r\n', 'fr');

-- --------------------------------------------------------

--
-- Structure de la table `artwork_artist`
--

DROP TABLE IF EXISTS `artwork_artist`;
CREATE TABLE `artwork_artist` (
  `id` bigint(20) NOT NULL,
  `name` text,
  `url` text,
  `image` text,
  `links_carousel` text,
  `more` text,
  `is_public` tinyint(1) DEFAULT '1',
  `slug` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `artwork_artist`
--

INSERT INTO `artwork_artist` (`id`, `name`, `url`, `image`, `links_carousel`, `more`, `is_public`, `slug`, `created_at`, `updated_at`) VALUES
(8, 'Junie Briffaz \r\n', 'http://juniebi.tumblr.com/\r\n', '', '', '', 1, 'junie-briffaz', '2016-10-09 21:55:16', '2016-10-09 21:55:16'),
(9, 'Elise Kobisch-Miana \r\n', 'http://www.elise-kobisch-miana.fr/', '', '', '', 1, 'elise-kobisch-miana', '2016-10-09 21:58:08', '2016-10-09 21:58:08'),
(10, 'Shoboshobo', 'http://www.shoboshobo.com/', '', '', '', 1, 'shoboshobo', '2016-10-09 21:58:53', '2016-10-09 21:58:53'),
(11, 'Pia-Mélissa Laroche', 'http://www.piamelissalaroche.fr/\r\n', '', '', '', 1, 'pia-melissa-laroche', '2016-10-09 21:59:43', '2016-10-09 21:59:43'),
(12, 'Entter', 'http://fousiongallery.com/portfolio/artist-entter/\r\n', '', '', '', 1, 'entter', '2016-10-09 22:04:18', '2016-10-09 22:04:18'),
(13, 'Thibault Huertas', 'http://www.thibaulthuertas.com/\r\n', '', '', '', 1, 'thibault-huertas', '2016-10-09 22:09:21', '2016-10-09 22:09:21'),
(14, 'Julien Bodechon ', 'http://julienbodechon.com', '', '', '', 1, 'julien-bodechon', '2016-10-09 22:10:17', '2016-10-09 22:10:17'),
(15, 'Nazzilla', 'http://www.nazzilla.com/\r\n', '', '', '', 1, 'nazzilla', '2016-10-09 22:10:53', '2016-10-09 22:10:53'),
(17, 'Stereotype', 'http://st3r3otyp3.tumblr.com/\r\n', '', '', 'http://st3r3otyp3.tumblr.com/\r\nhttp://vortex-zine.net/\r\nhttp://www.brkcore.fr/', 1, 'stereotype', '2016-10-09 22:11:41', '2016-11-28 21:31:12'),
(18, 'Nicolas Marmin', '', '', '', '', 1, 'nicolas-marmin', '2016-10-09 22:13:54', '2016-10-09 22:13:54'),
(20, 'Otro', 'http://www.thejazzist.nu/', '', '', '', 1, 'otro', '2016-10-09 22:14:34', '2016-10-09 22:14:34'),
(22, 'Yann Lélias', 'http://yannlelias.fr/', '', '', '', 1, 'yan-lelias', '2016-10-09 22:16:02', '2016-10-09 22:16:17'),
(23, 'Sammy Stein', 'http://www.sammystein.fr', '', '', '', 1, 'sammy-stein', '2016-10-09 22:16:53', '2016-10-09 22:17:15'),
(24, 'Thomas Cheneseau', 'https://facebookfeedback.blog/', '', '', '', 1, 'thomas-cheneseau', '2017-01-25 19:45:54', '2017-01-27 23:27:41'),
(25, 'Amélie Taillard', 'https://www.mixcloud.com/Ameliet29', '', '', '', 1, 'amelie-taillard', '2017-04-11 18:20:12', '2017-04-11 18:20:12');

-- --------------------------------------------------------

--
-- Structure de la table `artwork_artist_translation`
--

DROP TABLE IF EXISTS `artwork_artist_translation`;
CREATE TABLE `artwork_artist_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `presentation` text,
  `lang` char(2) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `artwork_artist_translation`
--

INSERT INTO `artwork_artist_translation` (`id`, `presentation`, `lang`) VALUES
(8, 'Junie Briffaz lives and works in Toulouse. She is an illustrator.\r\nShe likes small animals, violence, and Persian miniatures.\r\nShe thus tries to have her three passions cohabit through her paintings and drawings.\r\n', 'en'),
(8, '\r\n\r\nJunie Briffaz vit et travaille à Toulouse. Elle est illustratrice. \r\nElle aime les petits animaux, la violence et les miniatures persanes.\r\nElle essaye donc de faire cohabiter ses trois passions au travers de ses peintures ou dessins.', 'fr'),
(9, 'Elise Kobisch-Miana lives and works in Paris. She specializes in the design and production of masks, special effects, and realistic props for theater, opera, and cinema. After her training at the Opéra National du Rhin in Strasbourg, she started working in 2007 at the theater, where she supervises and produces various projects related to makeup, hair styling, special effects, and props.\r\nToday, her work focuses mainly on the creation of mannequins, masks, and other realistic imitations of the head and various other body parts. She is self-taught and has been drawing forever, and she recently started creating album sleeves. She is the one behind the divine artwork of Le martin by Le Matin.', 'en'),
(9, 'Elise Kobisch-Miana vit et travaille à Paris. Elle est spécialisée dans la conception et la réalisation de masques, d’effets spéciaux, et d’accessoires réalistes de théâtre, d’opéra et de cinéma. Après une formation à L’Opéra National du Rhin à Strasbourg, elle débute en 2007 au théâtre où elle supervise et réalise les projets dans les domaines variés tels que le maquillage,la coiffure, les effets spéciaux, ou les accessoires.\r\nAujourd’hui, son travail est axé principalement sur la réalisation de mannequins, de masques et d’imitations réalistes de têtes et de diverses parties de corps humain. Elle dessine en autodidacte depuis toujours, et réalise des pochettes d\'album depuis peu. ', 'fr'),
(10, 'Behind this onomatopoeia hides Mehdi Hercberg, an prolific and instinctive artist who also teaches at the Estienne school in Paris.\r\nInfluenced notably by the Japanese experimental scene, we find in Shoboshobo this spirit imprinted with rigor and repetition that drives to a total detachment from gesture and representation. At times close to abstraction, his drawings and notably his “walldrawings” combine mastery and improvisation. In his universe swarm monsters, characters with scrawled anatomies, landscapes made of geometric shapes that drip, all hiding behind a seeming simplicity. A world that is boiling, gory, and delirious.\r\nHis work, expressed through drawings or installations, has been exposed in many European countries, as well as in Argentina, the United States, and Japan. As an illustrator, he collaborated with many brands, institutions, and medias, including the New York Times, Zeit magazine, Fondation Cartier, the Centre Georges Pompidou, Pictoplasma, Chronic’art, Plant Magazine, H&M, Levis, Red Bull, Pull & Bear,…\r\nHe lives and works in Paris. ', 'en'),
(10, 'Shoboshobo\r\nDerrière cette onomatopée se cache Mehdi Hercberg, artiste et dessinateur prolifique et instinctif,également enseignant à l’école Estienne à Paris.\r\nInfluencé notamment par la scène expérimentale japonaise on retrouve dans le travail de Shoboshobo cet esprit emprunt de rigueur et de répétition qui conduit à un détachement total du geste et de la représentation. Parfois proche de l’abstraction, ses dessins et notamment ses «walldrawings» combinent maîtrise et improvisation. Son univers fourmille de monstres,de personnages à l’anatomie gribouillée, de paysages aux formes géométriques et dégoulinantes se cachant derrière une apparente simplicité. Un monde bouillonnant, gore et délirant.\r\nSon travail exprimé sous la forme de dessins ou d\'installations s\'est vu exposé dans de nombreux pays d\'Europe ainsi qu\'en Argentine, aux Etats-unis ou au Japon... En tant qu\'illustrateur, il a collaboré avec de nombreuses marques, institutions et médias tels que New York Times, Zeit magazine, Fondation Cartier, Centre Georges Pompidou, Pictoplasma, Chronic\'art, Plant Magazine, H&M, Levis, Red Bull, Pull & Bear... Il  vit et travaille à Paris.', 'fr'),
(11, 'Pia-Mélissa Laroche lives and works in Paris. A trained graphic artist, she has been drawing to retranscribe a stream of thoughts. Her works are a rereading of the objects and structures that she encounters. It is the observation of a world that is material or impalpable, sometimes told in the form of an unexpected narration.', 'en'),
(11, 'Pia-Mélissa Laroche vit et travaille à Paris. Graphiste de formation elle pratique le dessin comme pour retranscrire un cheminement de pensée. Ses travaux sont une relecture des objets ou des structures qu\'elle rencontre. C\'est l\'observation d\'un monde matériel ou impalpable parfois racontée sous la forme d\'une narration inattendue.', 'fr'),
(12, 'Entter (Raúl Berrueco, Santander 1977) studied Fine Arts at the Basque Country University and had been working later as digital designer and Art Director. As visual artist, he worked as professional video jockey and performer for years, collaborating with electronic musicians on acclaimed audiovisual shows in Sonar and many other festivals. He also did animation videoclips for music bands and worked for theater productions as video mapping creator. He’s well known by his lowfi/8bit glitchy approach to visual arts and crazy energetic performances.\r\n', 'en'),
(12, 'Entter (Raúl Berrueco, Santander 1977) studied Fine Arts at the Basque Country University and had been working later as digital designer and Art Director. As visual artist, he worked as professional video jockey and performer for years, collaborating with electronic musicians on acclaimed audiovisual shows in Sonar and many other festivals. He also did animation videoclips for music bands and worked for theater productions as video mapping creator. He’s well known by his lowfi/8bit glitchy approach to visual arts and crazy energetic performances.\r\n', 'fr'),
(13, 'Thibault Huertas works as a graphic designer in Paris. He lends a hand with numerous D!HR projects and we owe him thanks for—among many other things—the current design of Da! Heard It Records’s website. \r\n', 'en'),
(13, 'Thibault Huertas est un designer graphique travaillant à Paris. Il prête main forte aux nombreux projets D!HR, et c’est à lui que l’on doit - entre bien d’autres -  le design actuel du site Da! Heard It Records. \r\n', 'fr'),
(14, 'The sleeve for Rock the Boulevard, Reach the Bourgeois by Computer Truck, that’s him. Before becoming the web designer that he is today, Julien Bodechon had devoted himself to various professional activities, in which graphics and love of vinyl were always present.\r\n', 'en'),
(14, 'The sleeve for Rock the Boulevard, Reach the Bourgeois by Computer Truck, that’s him. Before becoming the web designer that he is today, Julien Bodechon had devoted himself to various professional activities, in which graphics and love of vinyl were always present.\r\n', 'fr'),
(15, 'Nazzilla is originally from Italy. He is the label’s former graphic artist. He is renowned for his penchant for pixel art, and he is behind many album covers, namely Kickstart and Robot by Tom Woxom, Gameboy Love EP by Buskerdroid, as well as Astroboiler by Astroboiler. \r\n', 'en'),
(15, 'Nazzilla est originaire d’Italie. C’est l’ancien graphiste du label. Avec un penchant notable et reconnu pour le pixel art, on lui doit de nombreuses pochettes d’album, notamment pour “Kickstart” et “Robot” de Tom Woxom, “Gameboy Love EP” de Buskerdroid ou “Astroboiler” d’Astroboiler.\r\n', 'fr'),
(16, 'Being edited currently. Come back soon !\r\n', 'en'),
(16, 'En cours de rédaction. Revenez bientôt !\r\n\r\n', 'fr'),
(17, 'Graphic designer, illustrator and screenprinter from Lyon, Stéven Marcato alias “Stéréotype,” born in 1979, lives and works in Paris. Fascinated by weird science and stereotypical imagery through time, he is active in publishing and in the alternative music scene. There, he develops his laboratory of graphical experiments, which he feeds like a true cabinet of curiosities.', 'en'),
(17, 'Graphiste, illustrateur et sérigraphe originaire de Lyon, Stéven Marcato alias Stéréotype, né en 1979, vit et travaille à Paris. Passionné par les sciences bizarres et l\'imagerie stéréotypée à travers les époques, il est actif dans l\'édition et la scène musicale alternative. C\'est là qu\'il développe son laboratoire d\'expérimentations graphiques, qu\'il alimente comme un véritable cabinet de curiosités.\r\n', 'fr'),
(18, '\r\nBeing edited currently. Come back soon !', 'en'),
(18, 'En cours de rédaction. Revenez bientôt !\r\n', 'fr'),
(19, '\r\nBeing edited currently. Come back soon !', 'en'),
(19, 'En cours de rédaction. Revenez bientôt !\r\n', 'fr'),
(20, '', 'en'),
(20, '\r\n', 'fr'),
(21, 'Satanik Mike lives and works in Paris. He is the one behind the Jacques Cochise’s first release on D!HR: Vengeance.\r\n', 'en'),
(21, '\r\nSatanik Mike vit et travaille à Paris. C’est à lui que l’on doit la pochette de la première sortie de Jacques Cochise sur D!HR : “Vengeance”. \r\n', 'fr'),
(22, 'Yann Lélias lives and works near Évreux in Normandy. His activities are split between his job as a graphic artist, and his passion for photography and music.\r\n\r\nHis pictures can be found in the specialized pages of Fanzines—Tell mum everything is ok, Équilibre Fragile…—when they are not exposed.\r\n\r\nYann is also a musician and participates in many projects. At the dawn of the 2000 years, along with Frédérique Louvat and Jacques Cochise, he formed Les Amis de Bulle, insane off-the-wall DIY music based on improvisations. He was also part of Alice the Goon, an indie rock band that performed in Paris and Normandy for nearly fifteen years. Recently, with Frédérique Louvat. He put up a new project, Le Goût Acide des Conservateurs, a mix of synth wave, krautrock, and film soundtrack. \r\n', 'en'),
(22, 'Yann Lélias vit et travaille près d’Évreux en Normandie. Il partage ses activités entre son métier de graphiste, sa passion pour la photographie et la musique.\r\n\r\nOn peut retrouver ses photos dans les pages de Fanzines spécialisés - Tell mum everything is ok, Équilibre Fragile… - lorsqu’elles ne sont pas exposées. \r\n\r\nYann est également musicien et participe à de nombreux projets. À l’aube des années 2000, il forme avec Frédérique Louvat et Jacques Cochise “Les Amis de Bulle”, musique DIY dingue et foutraque à base d’improvisations. Il fait également partie d’Alice the goon, groupe de rock indé qui se produira entre Paris et la Normandie pendant presque 15 ans. Récemment, avec Frédérique Louvat, il monte un nouveau projet “Le goût acide des conservateurs”, mélange synth wave, krautrock et BO de film…\r\n', 'fr'),
(23, 'http://www.sammystein.fr\r\nhttp://lagonrevue.com\r\nhttp://www.collectionrevue.com\r\nhttp://sammyste.tumblr.com', 'en'),
(23, 'http://www.sammystein.fr\r\nhttp://lagonrevue.comhttp://\r\nwww.collectionrevue.com\r\nhttp://sammyste.tumblr.com', 'fr'),
(24, 'Thomas Cheneseau est artiste et commissaire d\'exposition membre de l\'EnsAD Lab (laboratoire de recherche de l\'École des Arts Décoratifs de Paris)\r\n', 'en'),
(24, 'Thomas Cheneseau is an artist and exhibition commissioner member of EnsAD Lab (laboratoire de recherche de l’Ecole des Arts Décoratifs de Paris).\r\n', 'fr'),
(25, 'IIllustrator, editor (paper and music) at the heart of the label Consternation and of l’Atelier de la Santé (risography workshop located in Rennes), one of the founders of Triple A, graphic edition library, still in Rennes, DJ under the name Aube.\r\n\r\nhttps://www.mixcloud.com/Ameliet29\r\nhttp://peaufineamelie.tumblr.com\r\nhttp://consternationlabel.tumblr.com\r\nhttps://tripleatripleatriplea.tumblr.com', 'en'),
(25, 'Dessinatrice, éditrice (papier et musique) au sein du label Consternation et de l\'Atelier de la Santé (atelier de risographie situé à Rennes), une des fondatrice du Triple A, bibliothèque d\'édition graphique, toujours à Rennes, DJ sous le nom de Aube.\r\n\r\nhttps://www.mixcloud.com/Ameliet29\r\nhttp://peaufineamelie.tumblr.com\r\nhttp://consternationlabel.tumblr.com\r\nhttps://tripleatripleatriplea.tumblr.com', 'fr');

-- --------------------------------------------------------

--
-- Structure de la table `content`
--

DROP TABLE IF EXISTS `content`;
CREATE TABLE `content` (
  `id` bigint(20) NOT NULL,
  `links1` text,
  `links2` text,
  `footer_video` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `content`
--

INSERT INTO `content` (`id`, `links1`, `links2`, `footer_video`, `created_at`, `updated_at`) VALUES
(1, '<h2>Da ! Heard It Records</h2>\r\n<ul>\r\n  <li><a href=\"http://www.discogs.com/label/Da%20!%20Heard%20It%20Records\">Discogs</a></li>\r\n  <li><a href=\"https://www.facebook.com/dahearditrecords\">Facebook</a></li>\r\n  <li><a href=\"http://freemusicarchive.org/label/Da__Heard_It_Records/\">Free Music Archive</a></li>\r\n  <li><a href=\"https://twitter.com/#!/daheardit\">Twitter</a></li>\r\n  <li><a href=\"https://vimeo.com/channels/dahearditrecords\">Vimeo</a></li>\r\n</ul>\r\n\r\n<h2>Distribution</h2>\r\n<ul>\r\n  <li><a href=\"https://ruedesgardes.incongru.org\">Rue des Gardes</a></li>\r\n</ul>\r\n', '<h2>Constructions Incongrues</h2>\r\n<ul>\r\n     <li><a href=\"http://empilements.incongru.org\">Empilements</a> \r\n     <li><a href=\"http//www.musiqueapproximative.net\">Musique Approximative</a>\r\n     <li><a href=\"http://www.mazemod.org/\">Mazemod</a>\r\n     <li><a href=\"http://www.musiques-incongrues.net\">Musiques Incongrues</a>\r\n     <li><a href=\"http://www.ouiedire.net/\">Ouïedire</a>\r\n     <li><a href=\"http://www.pardon-my-french.fr/\">Pardon My French</a>\r\n     <li><a href=\"http://www.pastis-hosting.net/\">Pastis Hosting</a>\r\n     <li><a href=\"ruedesgardes.incongru.org\">Rue Des Gardes</a>\r\n     <li><a href=\"http://www.thisisradioclash.org/\">This Is Radio Clash</a>\r\n\r\n</ul>', '<iframe src=\"http://player.vimeo.com/video/5997914?byline=0&portrait=0\" width=\"350\" height=\"300\" class=\"infos_vids_embed\" frameborder=\"0\"></iframe>\r\n', '2012-07-05 12:40:19', '2016-11-28 21:50:51');

-- --------------------------------------------------------

--
-- Structure de la table `content_translation`
--

DROP TABLE IF EXISTS `content_translation`;
CREATE TABLE `content_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `informations` text,
  `greetings` text,
  `lang` char(2) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `content_translation`
--

INSERT INTO `content_translation` (`id`, `informations`, `greetings`, `lang`) VALUES
(1, 'Da ! Heard it Records is a netlabel since 2006.\r\nThe aim of this eclectic record company is to promote new artists and new types if music. D!HR is an outward-looking label, accessible to professional and amateur musicians alike, and to all types of listener, thanks to its policy of open and free culture and to the types of music it publishes.\r\nIts albums are distributed under a Creative Commons licence, encouraging sharing and reuse of the music.\r\nNow you can discover the musical universe of Da ! Heard It Records on site\r\nBy subscribing to the rss feed or newsletter you will be kept informed of upcoming releases.\r\n\r\n<h3 name=\"discover\"> Discover the label </h3>\r\n\r\n<p><strong>Documentary:</strong> <a href=\"https://www.youtube.com/watch?v=Ve5c6Ou8ZLY\">D!HR - Netlabel & Free Culture</a> réalisé par <a href=\"https://www.youtube.com/channel/UCHFUSbHtTamAIEpurl5BGuQ\">Maxime Parasite</a>\r\n<br /><strong>Radio: </strong> <a href=\"http://www.ouiedire.net/emission/bagage-4\"> Da ! Heard It Records - Chamade</a>  par <a href=\"https://www.mixcloud.com/Sainte-Rita\">Nils</a> <br /> \r\n<strong>Radio</strong>: <a href=\"http://www.netwaves.org/2015/04/download-compilation-amp-podcast.html\">Da ! Heard It Records an anthology </a> <a href=\"\">Netwaves</a> </p>', '<strong>Press release:</strong> <a href=\"http://www.mangemoncaca.com\"/>Anne</a>, <a href=\"http://www.serendip-arts.org\"/>Fred</a>, <a href=\"http://germainfraisse.com/\"\">Germain</a>, Léa, Ptite Gonze <br /> \r\n<strong>Web development, etc : </strong> Michel Bertier <br />\r\n<strong>Mastering :</strong> <a href=\"http://www.mixcloud.com/DjFulciSeleKtone/\">Momo Seb</a>, Romain Drogoul,<a href=\"https://soundcloud.com/darrenkeen\">Darren Keen</a><br />\r\n<strong>Translation </strong> : Treas, Dany, Gabriel<br />\r\n<strong>Vids : </strong>Maxime Parasite, <a href=\"https://paulineangotti.com/\"/>Pauline Angotti</a><br />\r\n<strong>Artists, donors, friends, illustrator, etc </strong>', 'en'),
(1, 'Da ! Heard it Records est un net-label qui existe depuis 2006. Label éclectique, il a pour ambition de promouvoir de nouveaux artistes et des nouvelles musiques. D!HR est un label ouvert au monde, tant aux artistes professionnels qu\'aux amateurs, accessible à tout auditeur de par sa position engagée sur la culture libre et gratuite et par la nature de ses publications. En effet, chaque sortie est téléchargeable gratuitement sur le site, dans divers formats audios et disponible en CD série limitée à un prix abordable. Les morceaux sont diffusés sous une licence Creative Commons, encourageant le partage et la réutilisation des œuvres.\r\n\r\n<h3 name=\"discover\"> Découvrir le label </h3>\r\n\r\n<p><strong>Documentaire:</strong> <a href=\"https://www.youtube.com/watch?v=Ve5c6Ou8ZLY\">D!HR - Netlabel & Free Culture</a> réalisé par <a href=\"https://www.youtube.com/channel/UCHFUSbHtTamAIEpurl5BGuQ\">Maxime Parasite</a>\r\n<br /><strong>Radio: </strong> <a href=\"http://www.ouiedire.net/emission/bagage-4\"> Da ! Heard It Records - Chamade</a>  par <a href=\"https://www.mixcloud.com/Sainte-Rita\">Nils</a> <br /> \r\n<strong>Radio</strong>: <a href=\"http://www.netwaves.org/2015/04/download-compilation-amp-podcast.html\">Da ! Heard It Records an anthology </a> <a href=\"\">Netwaves</a> </p>', '<strong>Communiqué de presse :</strong> <a href=\"http://www.mangemoncaca.com\"/>Anne</a>, <a href=\"http://www.serendip-arts.org\"/>Fred</a>, <a href=\"http://germainfraisse.com/\"\">Germain</a>, Léa, Ptite Gonze <br /> \r\n<strong>Développement, etc : </strong> Michel Bertier <br />\r\n<strong>Mastering/Mixage :</strong> <a href=\"http://www.mixcloud.com/DjFulciSeleKtone/\">Momo Seb</a>, Romain Drogoul, <a href=\"https://soundcloud.com/darrenkeen\">Darren Keen</a><br />\r\n<strong>Traduction </strong> : Treas, Dany, Gabriel<br />\r\n<strong>Vidéos : </strong>Maxime Parasite, <a href=\"https://paulineangotti.com/\"/>Pauline Angotti</a><br />\r\n<strong>Les artistes, donateurs, copains, ilustrateurs/trices, etc </strong>', 'fr');

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `id` bigint(20) NOT NULL,
  `image` text,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `post`
--

INSERT INTO `post` (`id`, `image`, `slug`, `created_at`, `updated_at`) VALUES
(6, '1.jpg', 'd-hr-is-back', '2012-07-05 00:00:00', '2012-07-05 12:40:19'),
(7, 'd37f8ae18b719ff1aafd0f200a0d8360acb859de.jpg', 'serenade-by-marc-de-blanchard', '2012-11-26 13:50:45', '2012-11-26 13:50:45'),
(8, 'd13ff347f16d463d536bde8a51a35736b9c5c521.jpg', 'crevin-by-demaster', '2013-02-25 11:24:37', '2013-02-25 11:24:37'),
(9, 'c29e63ae1f1f8f4e928158dc862ded5060a8c595.png', 'infecticide-chansons-tristes', '2014-01-25 17:04:47', '2014-01-25 17:04:47'),
(10, '0a9025f4ddacb978c2598b262b9f953ebf04b5f2.jpg', 'jacques-cochise-documents-interdits-les-pistes-oubliees', '2014-06-04 12:56:33', '2014-06-04 12:56:33'),
(11, '4499a4a616b3b2298d8ee5000a65258a49f0952b.png', 'd-hr-26-the-fat-meat-me', '2014-09-30 11:26:46', '2014-09-30 11:26:46'),
(12, '682b0d66991e0452a7561d343a27c96da1a28578.png', 'skinfaxe-failure-system', '2015-03-16 13:38:06', '2015-03-16 13:38:06');

-- --------------------------------------------------------

--
-- Structure de la table `post_translation`
--

DROP TABLE IF EXISTS `post_translation`;
CREATE TABLE `post_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `title` text,
  `body` text,
  `lang` char(2) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `post_translation`
--

INSERT INTO `post_translation` (`id`, `title`, `body`, `lang`) VALUES
(6, 'D!HR is back !', 'D!HR is ready for the summer with a brand-spanking-new site created by <a href=\"http://www.thibaulthuertas.com/\">Thibault Huertas</a> in collaboration with Constructions Incongrues. We give great thanks to Nazilla who designed the first version of the site. You can see Nazilla\'s new compositions on their site <a href=\"http://www.nazilla.com\">www.nazilla.com</a>. This is also a great opportunity to introduce the label\'s 18th release: Plan 9 des Robots Musiques (Plan 9 of the Music Robots), a Rod Droïd and Puyo Puyo duo! This album will make for a great accompaniment as you browse through our new site.\n', 'en'),
(6, 'D!HR est de retour !', 'D!HR se met à l\'heure d\'été avec un nouveau site tout beau tout propre realisé par <a href=\"http://www.thibaulthuertas.com/\">Thibault Huertas</a> en collaboration avec le bureau des Constructions Incongrues. Nous remercions infiniement Nazilla qui avait réalisé la premiere version du site, vous pouvez voir ses nouvelles compositions sur son site <a href=\"http://www.nazilla.com\">www.nazilla.com</a>.  C\'est aussi l\'occasion de vous présenter la 18ème release du label : Plan 9 des Robots Musiques ;  duo de Rod Droïd et Puyo Puyo ! Cet album vous accompagnera parfaitement pendant votre visite du nouveau site. \n', 'fr'),
(7, 'Serenade by Marc de Blanchard\r\n', '<p>D!HR is ending november musicaly, and is proud to offer it\'s 19\'th release :\r\n\"Serenade\", by Marc Blanchard.</p>\r\n\r\n<p>A colorful and robotic EP, that we hope, will surprise you.</p>\r\n\r\n<p>To your headphones, now !</p>', 'en'),
(7, 'Serenade par Marc de Blanchard', '<p>D!HR termine le mois de novembre en musique et est fier de vous présenter sa 19ème release : Serenade de Marc de Blanchard. </p>\r\n<p>Un EP coloré et robotique qui, nous l\'espérons, vous surprendra, et auquel nous souhaitons le plus grand succès. </p>\r\n<p>A vos écouteurs, toute ! </p>', 'fr'),
(8, 'Crevin by Demaster ! ', 'D!HR is pleased to announce its 20th release after 7 years of existence.\r\nFor this occasion, Debmaster offers us his new opus CREVIN, a 16-track album where arpeggic bleep bleeps meet dirty hip-hop beats.\r\n\r\nThis release is accompanied by 12-page libretto by Sammy Stein (http://www.sammystein.fr).\r\n\r\nEnjoy!', 'en'),
(8, 'Crevin par Debmaster ! ', 'D!HR à le plaisir d\'annoncer sa 20ème sortie après sept ans d\'existence. \r\nPour cette occasion Debmaster nous offre son nouvel opus CREVIN, un album de 16 titres mariant avec brio des bleeps & des beats.\r\n\r\nLa sortie est accompagnée d’un livret de 12 pages de Sammy Stein (http://www.sammystein.fr).\r\n\r\nBon appétit auditif ! !', 'fr'),
(9, 'Infecticide - Chansons Tristes', 'For its 24th release, Da! Heard It Records indulges in a wild irony doped with the borne absurdity of the three Infecticide trolls. With “Chansons Tristes” (“Sad Songs”), the trio proposes a first album, impossible to classify according to any musical catalog. The album may be downloaded at the following address: http://www.daheardit-records.net/en/discography/dhr-24\r\n\r\n', 'en'),
(9, 'Infecticide - Chansons Tristes', 'Pour sa 24è sortie, Da ! Heard It Records s’offre l’ironie déjantée dopée à l’absurdité assumée des trois affreux d’Infecticide. Avec “Chansons Tristes”, le trio nous propose un premier album décloisonné de tout catalogage musical. \r\nPour l’écouter ou le télécharger c’est par ici : http://www.daheardit-records.net/fr/discography/dhr-24', 'fr'),
(10, 'Jacques Cochise - Documents Interdits : Les Pistes Oubliées', 'Jacques Cochise marks Da ! Heard It Records’ 25th release with Documents interdits: les pistes oubliées (“Forbidden documents: the forgotten tracks”), an opus of seven pieces putting to music the famous off voice of the “Les Documents Interdits.”\r\nAired on La Sept in the late 80s, these precursor videos of the “found footage” genre would keep the audience on the edge of their seats through eight episodes transmitted across the waves without any explanation whatsoever.\r\nThe album can be downloaded at the following address:http://www.daheardit-records.net/en/discography/dhr-25 ', 'en'),
(10, 'Jacques Cochise - Documents Interdits : Les Pistes Oubliées', 'C’est Jacques Cochise qui marque la 25e sortie de Da ! Heard It Records avec “Documents interdits : les pistes oubliées”, un opus de sept morceaux mettant en musique la fameuse voix off des vidéos “Les Documents Interdits”. \r\nPour écouter/télécharger la sortie c\'est par ici : http://www.daheardit-records.net/fr/discography/dhr-25#release', 'fr'),
(11, '[D!HR-26] The Fat - Meat Me', 'For its 26th release, Da ! Heard It Records invites you to come meet The Fat, with their first album: “Meat Me”.\r\n\r\nThe album can be downloaded at the following address: http://www.daheardit-records.net/en/discography/dhr-26\r\n', 'en'),
(11, '[D!HR-26] The Fat - Meat Me', 'Pour sa 26ème sortie, Da ! Heard It Records vous invite à partir à la rencontre de THE FAT avec leur premier album : “Meat Me”. \r\n\r\nPour l\'écouter en ligne ou le télécharger librement c\'est par ici : http://www.daheardit-records.net/fr/discography/dhr-26#release ', 'fr'),
(12, 'Skinfaxe - Failure System', 'For its 28th release, Da ! Heard It Records presents Skinfaxe’s first album: Failure System.\r\nAn opus of eight tracks of electronic sounds, Failure System offers us a well-led orchestration of synthetic derailments.\r\n\r\nLike a good tour guide, Skinfaxe takes us to the hidden corners of her diverse ambiences and sonorities, experimented on in Reason. The result is an album with an increasing intensity in which every sound is whittled from its raw form, ready to receive pageantry and arrangements to bring out a piece with a colorful personality.\r\n\r\nDistributed under CreativeCommons license BY-NC-ND, the album is downloadable at the following link: http://www.daheardit-records.net/en/discography/dhr-28', 'en'),
(12, 'Skinfaxe - Failure System', 'Pour sa 28e release, Da ! Heard It Records a la primeur de proposer le premier album de Skinfaxe : Failure System. \r\nOpus de 8 titres aux sonorités électroniques, Failure System nous offre une orchestration bien menée de déraillements synthétiques. \r\n\r\nSkinfaxe en bon guide touristique, nous entraine dans les recoins perdus de ses diverses ambiances et sonorités, expérimentées sur Reason. Le résultat est un album à l’intensité croissante où chaque son est taillé à brut, prêt à recevoir apparâts et arrangements pour en faire ressortir un morceau au caractère bien trempé. \r\n\r\nDistribué sous licence Creative Commons BY-NC-ND, l’album est téléchargeable à cette adresse : http://www.daheardit-records.net/fr/discography/dhr-28', 'fr');

-- --------------------------------------------------------

--
-- Structure de la table `release`
--

DROP TABLE IF EXISTS `release`;
CREATE TABLE `release` (
  `id` bigint(20) NOT NULL,
  `title` text,
  `sku` text,
  `released_at` date DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT '1',
  `is_new` tinyint(1) DEFAULT '0',
  `image1` text,
  `image2` text,
  `links_carousel` text,
  `artist_id` bigint(20) DEFAULT NULL,
  `artwork_artist_id` bigint(20) DEFAULT NULL,
  `paypal_id` text,
  `is_available` tinyint(1) DEFAULT '1',
  `price` varchar(255) DEFAULT '5',
  `links_press` text,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `release`
--

INSERT INTO `release` (`id`, `title`, `sku`, `released_at`, `is_public`, `is_new`, `image1`, `image2`, `links_carousel`, `artist_id`, `artwork_artist_id`, `paypal_id`, `is_available`, `price`, `links_press`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Rock the Boulevard, Reach the Bourgeois', 'D!HR-01', '2006-09-06', 1, 0, '', '', '', 3, 14, '5AZL7SJHW9DTG', 0, '4 (CD)', 'http://www.radiofrance.fr/chaines/france-culture2/emissions_ete/tentatives/fiche.php?diffusion_id=52425http://www.thefrenchtouch.org/tft/objet.php?objet=1752&session_tft_new=8ebe7f7077c450c635d99499373d69d0http://gratisvibes.com/post/2-step-8-bit/', 'dhr-01', '2012-07-05 12:40:17', '2016-10-09 22:17:53'),
(2, 'Digi-Dig', 'D!HR-02', '2006-12-11', 1, 0, '', '', '', 5, 12, 'RTLDMM5DQKL2Y', 0, '4 (CD)', 'http://gratisvibes.com/post/goto80-and-digi-dig/http://www.culture-netlabel.com/content/view/144/63/', 'dhr-02', '2012-07-05 12:40:17', '2016-10-09 22:18:54'),
(3, 'Trip to Trip', 'D!HR-03', '2007-04-14', 1, 0, '', '', 'https://vimeo.com/5246710\r\nhttps://vimeo.com/5247303\r\nhttps://vimeo.com/5247868', 1, NULL, 'JGY7S2LRHML66', 0, '4 (CD)', 'http://www.electrochoc.org/index.php?2007/06/05/323-ben-et-bene-da-heard-it-records-myspacehttp://www.thefrenchtouch.org/tft/objet.php?objet=2145', 'dhr-03', '2012-07-05 12:40:17', '2016-10-10 03:20:46'),
(4, 'Pixel Def', 'D!HR-04', '2007-05-25', 1, 0, '', '', 'https://vimeo.com/14327568', 16, NULL, 'PYPDDAE2ZZ92L', 1, '4 (CD)', 'http://www.thefrenchtouch.org/tft/objet.php?objet=2138', 'dhr-04', '2012-07-05 12:40:17', '2016-10-10 03:22:30'),
(5, 'Miniland', 'D!HR-05', '2007-10-23', 1, 0, '', '', '', 8, NULL, 'EBH7WQWHU478C', 0, '4 (CD)', 'http://www.musicaoltranza.net/', 'dhr-05', '2012-07-05 12:40:17', '2014-09-25 22:21:50'),
(6, 'Robot Science', 'D!HR-06', '2008-06-05', 1, 0, '', '', '', 13, 20, 'P446RGPLZYFKS', 1, '4 (CD)', '', 'dhr-06', '2012-07-05 12:40:17', '2016-10-09 22:19:23'),
(7, 'Grotesque', 'D!HR-07', '2008-10-01', 1, 0, '', '', 'https://vimeo.com/14505117\r\nhttps://vimeo.com/5998863', 12, 20, 'VHK2UMBMFCCLJ', 1, '4', '', 'dhr-07', '2012-07-05 12:40:17', '2016-10-10 03:12:32'),
(8, 'The Awareness of Raving Rabbit', 'D!HR-08', '2007-10-23', 1, 0, '', '', '', 6, 18, 'FSXY892YCF3YG', 1, '4 (CD)', '', 'dhr-08', '2012-07-05 12:40:17', '2016-10-09 22:20:01'),
(9, 'Kickstart', 'D!HR-09', '2009-01-25', 1, 0, '', '', '', 14, 15, 'JHTCPCHH32X9Q', 0, '4 (CD)', '', 'dhr-09', '2012-07-05 12:40:17', '2016-10-09 22:21:05'),
(10, 'Kiss the Dolphin', 'D!HR-10', '2009-03-27', 1, 0, '', '', '', 4, NULL, '', 0, '4 (CD)', '', 'dhr-10', '2012-07-05 12:40:17', '2013-10-01 16:35:20'),
(11, 'Disco', 'D!HR-11', '2009-09-07', 1, 0, '', '', 'https://vimeo.com/7233308', 11, NULL, 'KPSK56LY8W2RN', 1, '4 (CD)', '', 'dhr-11', '2012-07-05 12:40:17', '2016-10-10 03:11:04'),
(12, 'Mr. Hadopi', 'D!HR-12', '2010-01-10', 1, 0, '', '', '', 15, 10, '6ZQL27VVGR3PL', 0, '4 (CD)', 'http://netlabelsrevue.blogspot.com/2010/04/vicnet-mr-hadopi.htmlhttp://www.etherreal.com/spip.php?article3562http://globaltechno.wordpress.com/2010/02/08/comment-faire-la-nique-a-la-loi-hadopi-telechargez-vicnet/', 'dhr-12', '2012-07-05 12:40:17', '2016-10-09 22:21:28'),
(13, 'Residue', 'D!HR-13', '2010-10-01', 1, 0, '', '', '', 10, 15, 'FVHECLBV6TPMC', 1, '4 (CD)', 'http://www.poin-poin.com/dressez-vos-esgourdes-mainmenu-35/79-indusmusiques-nouvelles/777-pocketmaster-residue', 'dhr-13', '2012-07-05 12:40:17', '2016-12-06 10:00:01'),
(14, 'Astroboiler', 'D!HR-14', '2010-01-21', 1, 0, '', '', '', 17, 15, '6HMMP5W6Y8B9S', 0, '4 (CD)', 'http://etherreal.com/spip.php?article4106', 'dhr-14', '2012-07-05 12:40:17', '2016-10-09 22:22:08'),
(15, 'Robot', 'D!HR-15', '2011-03-28', 1, 0, '', '', '', 14, 15, '22SF6ZQ8HSY3U', 1, '4 (CD)', '', 'dhr-15', '2012-07-05 12:40:17', '2016-10-09 22:22:30'),
(16, 'Gameboy Love EP', 'D!HR-16', '2011-08-10', 1, 0, '', '', '', 2, 15, '5KQHBCVEZSTKY', 1, '4 (CD)', '', 'dhr-16', '2012-07-05 12:40:17', '2016-10-09 22:22:49'),
(17, 'Vengeance', 'D!HR-17', '2011-10-23', 1, 0, '', '', '', 7, 21, 'JLTLFVP52F39G', 1, '4 (CD)', '', 'dhr-17', '2012-07-05 12:40:17', '2016-10-09 22:23:12'),
(18, 'Plan 9', 'D!HR-18', '2012-07-05', 1, 0, '', '', '', 18, 17, 'X9CACU5AN79EQ', 1, '4 (CD)', '', 'dhr-18', '2012-07-05 12:40:17', '2016-10-09 22:23:34'),
(20, 'Serenade', 'D!HR-19', '2012-11-26', 1, 0, '', '', '', 20, NULL, 'GGHJGJLZWFD6N', 1, '4 (CD)', '', 'dhr-19', '2012-11-25 20:21:39', '2014-09-25 21:48:37'),
(21, 'Crevin', 'D!HR-20', '2013-02-25', 1, 0, '', '', 'http://vimeo.com/55759771\r\nhttp://vimeo.com/55583728', 21, 23, 'AAUN758DWRNVS', 1, '6 (cd + zine + badge)', '', 'dhr-20', '2013-02-20 20:12:40', '2016-10-09 22:23:55'),
(22, 'Gleichtakt', 'D!HR-21', '2013-10-02', 1, 0, '', '', '', 14, 15, 'D4RK838QG8AQJ', 1, '4 (CD)', '', 'dhr-21', '2013-10-01 15:57:28', '2016-12-06 09:59:08'),
(23, 'Activité Animale', 'D!HR-22', '2013-10-16', 1, 0, '', '', 'http://vimeo.com/74823707', 20, NULL, 'A86H36JFPTNDS', 1, '4 (cd + badge + poster)', 'http://www.indiemusic.fr/2013/11/20/marc-de-blanchard-activite-animale/', 'dhr-22', '2013-10-15 14:39:16', '2014-09-25 21:45:51'),
(24, 'Thunder Doom', 'D!HR-23', '2013-12-05', 1, 0, '', '', '', 22, NULL, 'VUDB6C79493K2', 1, '4', '', 'dhr-23', '2013-12-01 17:15:20', '2014-09-25 21:44:58'),
(25, 'Chansons Tristes', 'D!HR-24', '2014-01-25', 1, 0, '', '', 'https://www.youtube.com/watch?v=7rfojtaXgl0\r\nhttp://www.youtube.com/watch?v=pZjARICSKck\r\nhttp://www.youtube.com/watch?v=Epbu4IVFcec\r\nhttp://www.youtube.com/watch?v=nby_Y5174Fc\r\nhttp://www.youtube.com/watch?v=ucKqRg97HYk\r\nhttp://www.youtube.com/watch?v=nviZqHMu08g\r\nhttp://www.youtube.com/watch?v=OfB0WzyI6wo\r\n', 23, NULL, 'PGRPHC94CBYQE\r\n', 0, '5 (cd + badge + poster)', 'http://gonzai.com/infecticide-chansons-tristes\r\nhttp://lemetadroneordinaire.blog.lemonde.fr/2014/02/19/infecticide-plante-du-riz-pour-ses-amis/', 'dhr-24', '2014-01-18 10:48:39', '2016-10-10 03:07:38'),
(26, 'Documents interdits : les pistes oubliées', 'D!HR-25', '2014-06-04', 1, 0, '', '', '', 7, 22, 'CVR7SE4M6ZWFW', 0, '6 (Pochette Sérigraphiée)', '', 'dhr-25', '2014-06-03 19:38:38', '2016-10-09 22:25:28'),
(27, 'Meat Me', 'D!HR-26', '2014-09-30', 1, 0, '', '', 'https://vimeo.com/114366139\r\nhttps://vimeo.com/114366138', 24, 11, 'EG4TSKP8CMH28', 0, '6 (CD / Badge / Cartes / Poster A3)', '', 'dhr-26', '2014-09-25 16:12:24', '2016-10-10 03:11:46'),
(28, 'Le Martin', 'D!HR-27', '2014-11-20', 1, 0, '', '', '', 25, 9, 'TEJUP9QRRMQ9J', 1, '6 (CD / Cartes / Badge / Autocollant)', '', 'dhr-27', '2014-11-14 18:35:30', '2016-10-09 22:26:14'),
(29, 'Failure System', 'D!HR-28', '2015-03-16', 1, 0, '', '', '', 26, NULL, ' JA2LJZB6YH4BA', 1, '5', '', 'dhr-28', '2015-03-10 21:52:51', '2015-03-16 13:14:26'),
(33, 'Poil de Cœur', 'D!HR-29', '2016-02-05', 1, 0, '', '', 'https://www.youtube.com/watch?v=hpBV8iQxYqA\r\nhttps://www.youtube.com/watch?v=GxNNgIHiA9U\r\nhttps://www.youtube.com/watch?v=bmB6jEJCcT4', 23, 8, 'YSNYU8TQ92EZ6', 1, '6 (CD / Badge / Cartes postales / Sticker)', '', 'dhr-29', '2016-02-02 19:45:03', '2017-02-02 14:05:29'),
(34, 'Klaten', 'D!HR-30', '2016-04-20', 1, 0, '', '', '', 27, 9, 'AVG8UMRUSU3PC', 1, '6 (CD / Cartes / Badge)', '', 'dhr-30', '2016-04-19 11:28:20', '2017-02-02 14:05:14'),
(35, '#010010', 'D!HR-31', '2016-12-01', 1, 0, '', '', '', 10, NULL, 'CHT9JNP69U5QA', 1, '4 (CD / Badge)', '', 'dhr-31', '2016-11-29 21:51:24', '2017-04-11 19:30:42'),
(36, 'Voilé', 'D!HR-32', '2017-01-31', 1, 1, '', '', 'https://vimeo.com/197199832', 15, 24, '7BMSC4EXAAGLC', 1, '5 (CD)', '', 'dhr-32', '2017-01-25 19:44:06', '2017-02-02 12:34:39'),
(37, 'The Dragon\'s Teeth', 'D!HR-33', '2017-04-11', 0, 1, '', '', '', 28, 25, 'Y3R6E8X78KUP4', 1, '5', '', 'dhr-33', '2017-04-11 18:37:29', '2017-04-17 14:29:58');

-- --------------------------------------------------------

--
-- Structure de la table `release_translation`
--

DROP TABLE IF EXISTS `release_translation`;
CREATE TABLE `release_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `presentation` text,
  `lang` char(2) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `release_translation`
--

INSERT INTO `release_translation` (`id`, `presentation`, `lang`) VALUES
(1, 'Artwork by : <a href=\"http://www.julienbodechon.com/\">Julien Bodechon</a>', 'en'),
(1, 'Pochette par : <a href=\"http://www.julienbodechon.com/\">Julien Bodechon</a>', 'fr'),
(2, 'Artwork by : <a href=\"http://entter.com/\">Entter</a>', 'en'),
(2, 'Pochette par : <a href=\"http://entter.com/\">Entter</a>', 'fr'),
(3, 'Bleep bleep punks Ben and Béné are piling up demos recorded in their kitchen since 2003. For the release of their EP on the Parisian net-label Da ! Heard It Records, they decided this time to pack up mics, computers and gameboy in their car.\r\nA few months later, this improvised move gave birth to Trip to Trip: 4 titles and 4 videos on a cd/dvd tracing their realistico-imaginary journey through 4 cities: a crime in Brest, a return to their roots in Comines-Komen (a Franco-Belgian city from their origins), a documentary on Paris and a dream in Boubek (imaginary town, half norman, half northern) on which they invited a native to set voice and text. True to their wacky minds, Trip to Trip is pop melodies, punk rage, a free spirit and 8bit sounds. An energetic voyage that will give you a taste for vacation...\r\n\r\nMastering by : <a href=\"http://www.mixcloud.com/DjFulciSeleKtone/\">Momoseb</a> - Artwork by : <a href=\"http://www.benetbene.net\">Ben et béné</a>', 'en'),
(3, 'Les deux punks bleep bleep Ben et Béné accumulent les démos enregistrées dans leur cuisine depuis 2003. Pour la sortie de leur EP sur le net-label parisien Da ! Heard It Records, ils ont décidé, cette fois,d’embarquer micros, ordinateurs et gameboy dans leur voiture.\r\nQuelques mois plus tard, ce déménagement improvisé donne naissance à Trip to Trip : 4 titres et 4 vidéos sur un cd/dvd retraçant leur périple realistico-imaginaire à travers 4 villes : un crime à Brest, un retour aux sources à Comines-Komen (ville franco belge de leurs origines), un documentaire sur Paris et un rêve à Boubek (ville imaginaire moitié normande, moitié nordiste) sur laquelle ils ont invité un autochtone à poser voix et texte. Fidèles à leur esprit loufoque, Trip to Trip, ce sont des mélodies pop, de larage punk, un esprit free et des sons 8bit. Un voyage bien énergiquequi vous donnera le goût des vacances...\r\nL\'ep est en libre téléchargement sur www.daheardit-records.net.\r\n\r\nMastering par : <a href=\"http://www.mixcloud.com/DjFulciSeleKtone/\">Momoseb</a> - Pochette par : <a href=\"http://www.benetbene.net\">Ben et béné</a>', 'fr'),
(4, 'Xerak offers us an over-vitamined, trash kawaii mutant concentrate with 8bit and techno punk sonorities, directly inspired by the American and Japanese comic book universe, pixel art, pop art as well as middle of the century sci-fi movie aesthetics.\r\n\r\n\r\nMastering by : <a href=\"http://www.xerak.com\">Xerak</a>', 'en'),
(4, 'Xerak nous offre un concentré mutant trash kawaii survitaminé aux sonorités 8bits et techno punk directement inspiré de l’univers de la bande dessinée américaine et japonaise, du pixel art, du pop art, ainsi que dans l\'esthétique des films de science fiction du milieu du siècle.\r\n\r\nPochette par : <a href=\"http://www.xerak.com\">Xerak</a>', 'fr'),
(5, 'Artwork by : <a href=\"http://www.nazzilla.com/\">Nazilla</a>', 'en'),
(5, 'Pochette par : <a href=\"http://www.nazzilla.com/\">Nazilla</a>', 'fr'),
(6, 'This time, it is German born Sputnik booster who presents his new album Robot Science. Fifteen electrotrash/8bit pieces created with the sound chips of the Commodore 64, Nintendo Game Boy & Atari ST. The album comes with a front & back sleeve created by the dealer of pixel Otro.\r\nWith his new album, Sputnik Booster revisits and customizes our youth with talent. From the first seconds, Robot Science creates an psychological anti-wrinkler. Take out your Mickey shaped ear protectors and your Frizzy Pazzy candy bags, Sputnik along with his atypical copilot, Commodore 64 takes you on a musical road trip of over 50min on his flying Game boy.\r\nOn the way, he picks up the Atari to show us his vision of Disco, without forgetting the Commodore 64, Sputnik’s facetious copilot. You get it, Robot Science is a true breath of fresh air, bringing your chilhood memories down out of the attic.\r\n\r\nArtwork by : <a href=\"http://www.ilbm.info/\">Otro</a>', 'en'),
(6, 'Cette fois-ci c\'est notre allemand Sputnik Booster qui vous propose son nouvel album Robot Science. Quinze morceaux Electrotrash/8-Bits produits grâce aux puces sonores des Commodore 64, Nintendo Game Boy & Atari ST. L\'album est accompagné d\'une pochette recto/verso réalisée par le dealeur de pixel Otro.\r\nAvec son nouvel album, Sputnik Booster revisite et customise notre jeunesse avec talent. Dès les premières secondes, Robot Science fait l\'effet d\'un antiride psychologique, ressortez vos protège-oreilles en forme de Mickey, et vos sachets de bonbons Frizzy pazzy, Sputnik et son copilote atypique, le Commodore 64 vous offrent un road trip musical de plus de 50mn enfourché sur sa Game Boy volante.\r\nSur la route, il prend l\'Atari en stop pour nous faire découvrir sa vision du Disco, sans oublier le Commodore 64, le copilote facétieux de Sputnik. Vous l\'aurez compris, Robot Science est une vraie bouffée d\'air frais, faisant redescendre du grenier nos vieux souvenirs d\'enfants.\r\n\r\nPochette par : <a href=\"http://www.ilbm.info/\">Otro</a>', 'fr'),
(7, '', 'en'),
(7, '', 'fr'),
(8, 'Da ! Heard It Records opens up to new sonorities with the release of [Guÿôm]’s second album: \"The Awareness of Raving Rabbit\".\r\n[Guÿôm], capricious super hero and nut case, crosses through several musical spheres. The Little Prince may have visited seven planets, [Guÿôm] makes us discover nine through his pieces. This initiatory voyage with his imaginary friends (such as Big Doudou and the famous Billybob) allows him to become conscious of the absurdities that surround him.\r\nFor [Guÿôm], The world is in the image of his musical universe: without border. Well, danse now!\r\n\r\nArtwork by : Nicolas Marmin ', 'en'),
(8, 'Da ! Heard It Records s\'ouvre à des sonorités différentes de celles qu\'on lui connaît en sortant le second album de [Guÿôm] : \"The Awareness of Raving Rabbit\".\r\n[Guÿôm], super héros fantasque et fou furieux traverse différentes sphères musicales. Si le Petit Prince a visité sept planètes, [Guÿôm] nous en fait découvrir neuf au fil de ses morceaux. Ce voyage initiatique avec ses amis imaginaires (tels que Gros Doudou, et le fameux Billybob) lui permet de prendre conscience des absurdités qui l\'entourent.\r\nPour [Guÿôm], le monde est à l\'image de son univers musical : Sans Frontières. Et bien dansez maintenant !\r\n\r\nPochette par : Nicolas Marmin \r\n', 'fr'),
(9, 'Da ! Heard It Records is going back to the classics with its ninth production: \"Kickstart\", the first album by Tom Woxom, a German composer fascinated by the Amiga 500.\r\nWith help from his treasured computer, a couple of keyboards and software, Tom Woxom built himself a puzzling musical universe. Through ornate beats and powerful heady basses, this album lures the listener into multiple atmospheres. Tom Woxom dares unusual pairings, as in Sofachips, where he combines a soul voice with an electro melody on the verge of dance music.\r\nDiscover this innovative artist by downloading his album for free. \r\n\r\nArtwork by : <a href=\"http://www.nazzilla.com/\">Nazilla</a>', 'en'),
(9, 'Da ! Heard It Records révise ses classiques avec sa neuvième production : « Kickstart », le premier album de l\'allemand Tom Woxom, compositeur passionné par l\'Amiga 500.\r\nÀ l\'aide de son ordinateur fétiche, de quelques logiciels et claviers, Tom Woxom s\'est créé un univers musical déroutant. Une rythmique étoffée, des basses entêtantes et puissantes, cet album entraîne l\'auditeur dans de multiples ambiances. Tom Woxom ose des mariages inattendus, comme dans Sofachips où il assemble une voix soul avec une mélodie electro à la limite de la dance.\r\nDécouvrez un artiste innovant en téléchargeant gratuitement son album. \r\n\r\nPochette par : <a href=\"http://www.nazzilla.com/\">Nazilla</a>', 'fr'),
(10, 'Da ! Heard It Records gets down to a higher tempo, with the tenth release of the label: Kiss The Dolphin\r\nKiss the Dolphin is the third album of the Lyon-based Eat Rabbit; atypical one, cut into fourteen tracks that finally merge into one unique sound piece. A mish-mash of beats and rythmic madness, lined up with humor and brilliance by a mad rabbit determined to boost our auditive adrenalin.\r\nThe album cover is silkscreened and paw-made in a limited numbered edition by the rabbit himself, in different versions, including a phosphorescent one !\r\n« It\'s not hard to party» : download the electro-bootycore album here: http://www.daheardit-records.net/en/discography/dhr10/ and share it loud with your friends.\r\n\r\nArtwork by : <a href=\"http://www.daheardit-records.net/fr/artist/eat-rabbit\">Eat Rabbit</a>', 'en'),
(10, 'Da ! Heard It Records passe au tempo supérieur avec la dixième sortie du label : Kiss the Dolphin.\r\nKiss the Dolphin , troisième opus du lyonnais Eat Rabbit, est un album atypique, scindé en quatorze titres pour au final n\'en former qu\'un.\r\nVéritable pièce sonore au rythme effréné, Kiss the Dolphin est un méli-mélo de beats enchaînés avec humour et intelligence par un lapin bien décidé à faire monter notre adrénaline auditive.\r\nSérigraphiée et numérotée, la pochette de l\'album a été confectionnée par l\'artiste lui-même, dans plusieurs versions différentes dont une phosphorescente.\r\n« It\'s not hard to party » : téléchargez l\'album electro-bootycore l\'adresse suivante http://www.daheardit-records.net/fr/discographie/dhr10/ et faites en profiter vos amis.\"\r\n\r\nPochette par : <a href=\"http://www.daheardit-records.net/fr/artist/eat-rabbit\">Eat Rabbit</a>', 'fr'),
(11, 'Disco is the sixth production from the charismatic Puyo Puyo. This latest release puts forward a rather large selection of electronic pop references, giving prominent parts to voice and groovy melodies. This album is a delicious witches brew of German new-wave, Psychopolka, Turbopop and that little Puyesque je-ne-sais-quoi, iodiosyncratic dissonant melodies, glitch and kitsch licks.\r\nSharp uptempo beats adventurously push the thirteen tracks into the punctuated fiefdom of the punchy manifesto (P is for Puyo, Eddie the Head), as well as into the incantatory refrains of 80\'s keyboards (Up and away, Amour), while passing through acid-disco (Grave Groove), industrial-cinematic (Robot robot, Six kings six pigs) and even dark-wave (I fall, completely berserkte, Spleen)\r\nEach composition creates a sonic universe with a singular narrative, appealing like a love song earworm and often with wake-up-the-dead energy. Please download - for free! - all thirteen tracks of Puyo puyo goes disco at http://www.daheardit-records.net/en/discography/dhr11/ And no matter what.... Play it loud!\r\n\r\n\r\nMastering by : Puyo Puyo', 'en'),
(11, 'Sixième production du charismatique Puyo Puyo, \"Disco\" s\'offre comme un grand mix de références pop électroniques, qui fait la part belle à la voix et aux mélodies groovy. New new-wave allemande, Psychopolka, Turbopop ? Un peu de tout ça et un je-ne-sais-quoi Puyo Puyesque, avec son lot de mélodies dissonantes et de sonorités glitch et kitsch.\r\nBeats acérés et uptempo, les treize tracks s\'aventurent aussi bien dans les contrées scandées du manifeste punchy (P is for Puyo, Eddie the Head) que de la ritournelle incantatoire aux claviers eighties (Up and away, Amour), en passant par des chemins de traverse acid-disco (Grave Groove), industriel-cinématique (Robot robot, Six kings six pigs) ou encore dark-wave (I fall, tout en fureur et spleen ).\r\nChaque composition synthétise un univers sonore et narratif singulier, attachant comme une chanson d\'amour qui colle en boucle au cortex et souvent énergétique à réveiller les morts. Téléchargez gratuitement les treize titres de Puyo Puyo goes disco sur http://www.daheardit-records.net/fr/discographie/dhr11/ . Et surtout… Play it loud !\r\n\r\nPochette par : Puyo Puyo', 'fr'),
(12, 'You can\'t judge a book by its cover. While Vicnet seems to mock future victims of the new Hadopi 2.0 law by welcoming with glee the Sarkozy government\'s initiative with his second album Mr. Hadopi, this album is more of a cry against an ubiquitous hypocrisy and a vibrant ode to free culture. Penniless and starving from long months of finicky work in the cold on this free album, he limited his desires-and eating habits- to the bare minimum, and changed his methods to create a purer music, less digital and warmer: a technoid and monstrously funky pump, lively and hyperactive. While you could consider it a maturity album, to Vicnet, it is more of a rejuvenation: he describes his productions for the label Da! Heard It Records as an \"old man\'s music for young people\".\r\nCreated, among other things, with his Roland SH-101 found in a Monaco trashcan, his TB-303 and various synthesized voices, Vicnet gives us a viscerally electro album, with mixed influences and memories evoking Egyptian Lover under MDMA. Regurgitated traces of sounds gathered from malls, gas stations and streets, taken in, digested and reconstructed by Vincent\'s lo-fi vision make the Mr Hadopi listening experience like admiring a Sagrada Familia rearranged and rebuilt life size with lego blocks.\r\nMr. Hadopi by Vicnet is illustrated by his acolyte Shoboshobo, with whom he created the \"Hassid house\" trio Moishemoishemoishele.\r\nYou can download Mr. Hadopi from the Da! Heard It Records website: http://www.daheardit-records.net/en/discography/dhr12/\r\nThe downloading of this file is free and requires no engagement, but is under your full responsibility. At your own risk, you may make as many copies of Mr Hadopi as you wish, and share it with your hacker friends.\r\n\r\nArtwork by : <a href=\"http://www.shoboshobo.com/\">Shoboshobo</a>', 'en'),
(12, 'Il ne faut pas se fier aux apparences. Si Vicnet semble accueillir en fanfare l\'initiative du gouvernement Sarkozy, au nez et à la barbe des futures victimes de la jeune loi HADOPI 2.0, Mr Hadopi est plutôt un pamphlet contre l\'hypocrisie dominante et un hommage vibrant à la libre culture. Appauvri et affamé par de longs mois à fignoler dans le froid cet album gratuit, il a réduit ses désirs - et son alimentation - à l\'essentiel, et changé ses méthodes pour produire une musique plus épurée, moins digitale et plus chaleureuse: une pompe technoïde et monstrueusement funky, dansante et hyperactive. On pourrait parler d\'album de la maturité mais pour Vicnet, ça serait plutôt une cure de jouvence: il décrit ses productions pour le label Da ! Heard It Records comme de la \"musique de vieux pour les jeunes\".\r\nRéalisé entre autres avec son Roland SH-101 sauvé d\'une poubelle à Monaco, sa TB-303 ainsi que diverses voix de synthèse, Vicnet nous offre un album viscéralement electro, un mélange touffu d\'influences et de souvenirs qui évoque du Egyptian Lover sous MDMA. Régurgitations de traces sonores glanées en voyage dans la rue, les grands magasins, les stations-service, consommées en speed au casque, digérées et reconstituées par la vision lo-tech de Vicnet, écouter Mr. Hadopi donne l\'impression d\'admirer une Sagrada Familia bricolée, remontée grandeur nature en blocs de Lego.\r\nMr. Hadopi de Vicnet est illustré par son acolyte Shoboshobo, avec lequel il a crée le trio \"hassid house\" Moishemoishemoishele.\r\nVous pouvez télécharger Mr. Hadopi sur le site de Da ! Heard It Records : http://www.daheardit-records.net/fr/discographie/dhr12/\r\nCe téléchargement est gratuit et sans engagement, mais sous votre entière responsabilité. A vos risques et périls, vous pouvez faire de Mr Hadopi autant de copies que vous le souhaitez et le partager avec vos amis hackers.\r\n\r\nPochette par : <a href=\"http://www.shoboshobo.com/\">Shoboshobo</a>', 'fr'),
(13, 'Residue is Swiss duo Pocketmaster\'s first album. \r\nAfter the festive EP Tin Guerilla (2008/self-produced), the Cube-C and Emiglio Laser duo abandons self-production to release its first label album.\r\nUsed to lowtech manipulations and samples from old chips, toys or other various sources, this time, Pocketmaster chose to surprise us by preserving the sound card\'s raw sound, without manipulation. A certain image-radical-purety! \r\nThe album is thus concocted entirely from the Game-boy and Commodore 64 duo, spiced up with all sorts of samples and a few old synthesizers, all recorded in a record time. The result is a twelve tracker, fresh and joyful, in the spirit of the duo\'s over-vitamin live performances.\r\nYet, the two artists don\'t hesitate to have their pieces drift through several musical universes. In addition to a track remixed my Stu, and a Naomi Sample cover, Residue offers the listeners a magnificent cover of the \"It Crowd\" series\' credits. \r\nContrary to its title \"Residue\", which means leftover, or relics, this first album is innovative and illustrates the wacky duo\'s wish to always surpass themselves.\r\n\r\nArtwork by : <a href=\"http://www.nazzilla.com/\">Nazilla</a>', 'en'),
(13, 'Residue est le premier album du duo suisse Pocketmaster. \r\nApres le festif EP Tin Guerilla (2008/auto-produit), le duo formé par Cube-C et Emiglio Laser quitte les bancs de l\'auto-production pour sortir son premier album signé sur un label.\r\nHabitué des manipulations lowtech et samples de vieilles puces, jouets ou sources variées, Pocketmaster a choisi cette fois de nous surprendre et de conserver le son brut des carte son, sans manipulations. Une certaine image – radicale – de la pureté ! \r\nL\'album est donc entièrement concocté à partir du duo de Game-boy et de Commodore 64, épicé par toutes sortes de samples et de quelques vieux synthétiseurs, le tout, enregistré en un temps record. Le résultat est un douze titres frais et joyeux, dans l\'esprit des lives survitaminés du duo.\r\nLes deux artistes n\'hésitent cependant pas à faire dériver leurs morceaux dans plusieurs univers musicaux. En plus d\'un titre remixé par Stu, et d\'une reprise de Naomi Sample, Residue offre aux auditeurs une magnifique reprise du générique de la série \"It Crowd\". \r\nA l\'opposé de son titre \"Residue\" qui signifie restes, ou reliques, ce premier disque est un album innovant, illustrant la volonté des deux farfelus de toujours se dépasser.\r\n\r\nPochette par : <a href=\"http://www.nazzilla.com/\">Nazilla</a>', 'fr'),
(14, 'Astroboiler is an explosive project composed by a protean artiste prominent in the micromusic community in 1991. Acid music producer today, with the album Astroboiler, he delivers a whole new universe. Today, Da! Heard It Records republishes this album initially released on cassette tape.\r\nThis rather mysterious recording made in 1995 both plunges us in a movie soundtrack atmosphere and makes us think about the industrial and experimental scene of the 80s, with bands such as Sutcliffe Jügend in England or David Lee Myers in the US. The music is comparable to electronica or IDM, abstract hip hop, sometimes even breakcore, you can see a certain ressemblance with Autechre’s music, a band that emerged around the same time as this album came out.\r\nIn seven pieces, Astroboiler tells a strange sonorous story, with special attention given to timbre. Indeed, several sound sources are manipulated, such as analog synthesizers, concrete sounds, and acoustic instruments (later modified) as you will hear in the first piece with its melodic section played on the harp.\r\nIt is a very personal and abstract album. It takes its listeners into a bipolar atmosphere, keeping in the background a constant cold, austere, perhaps even disturbing loom, which through careful dosage, sometimes lets out warm and soothing colors.\r\nThe piece titles are purely functional (each title is the timing of the piece), reflecting the minimalist character of the album.\r\nIn fact, the album has no name, eponymous album or simple desire to evoke nothing, as if to prevent anything from becoming a distraction from the music.\r\nThe artwork was created by Nazzilla, who successfully captured the artist’s universe. The sleeve is just as abstract as the pieces, thus rendering what we are about to hear.\r\nGet a direct ticket for a celestial universe by downloading the album: http://www.daheardit-records.net/en/discography/dhr14/\r\n\r\nArtwork by : <a href=\"http://www.nazzilla.com/\">Nazilla</a>', 'en'),
(14, 'Astroboiler est un projet détonnant composé par un artiste protéiforme, présent au sein de la communauté micromusic en 1999, producteur d\'Acid music aujourd’hui, avec l’album Astroboiler il nous livre un tout autre univers. Da ! Heard Record réédite aujourd’hui cet album initialement sorti sur cassette audio.\r\nCet enregistrement assez mystérieux réalisé en 1995 nous plonge à la fois dans une ambiance de musiques de films tout en nous faisant songer à la scène industrielle et expérimentale des années 80 avec des groupes comme Sutcliffe Jügend en Angleterre ou ceux de David Lee Myers aux Etats-Unis. Sa musique est aussi assimilable aux genres electronica ou IDM, abstract hip hop, parfois même breakcore, on peut y voir une certaine similitude avec la musique d’Autechre, groupe qui émerge au même moment que la création de cet album.\r\nAstroboiler raconte en sept morceaux une histoire sonore singulière, avec une attention particulière portée sur le timbre. En effet, plusieurs sources sonores sont manipulées telles que celles de synthétiseurs analogiques, de sons concrets, ou bien de sons d’instruments acoustiques (remodifiés par la suite) comme vous pourrez l’entendre sur le premier morceau avec la section mélodique réalisée à la harpe.\r\nC’est un album très personnel et abstrait, Il emmène son auditeur dans une atmosphère bipolaire avec toujours en trame de fond un caractère froid, austère, sombre voir parfois dérangeant qui par un savant dosage laisse émerger par instants des couleurs chaudes et apaisantes.\r\nLes titres des morceaux sont purement fonctionnels (chaque titre est le minutage de chaque morceau) , reflétant le caractère minimaliste de l’album. L’album n’a d’ailleurs pas de nom, album éponyme ou bien simple volonté de ne rien vouloir évoquer, comme si rien ne devait détourner l’attention de la musique.\r\nL’artwork a été réalisé par Nazzilla, qui a sû cerner l’univers de l’artiste. La pochette est tout aussi abstraite que les morceaux comme une évocation à ce qu’on s’apprête à entendre.\r\nPrenez un aller direct pour un univers céleste en téléchargeant l’album http://www.daheardit-records.net/fr/discographie/dhr14/\r\n\r\nPochette par : <a href=\"http://www.nazzilla.com/\">Nazilla</a>', 'fr'),
(15, 'Robot, a new album by Tom Woxom\r\nRobot is the 2nd album from the German artist Tom Woxom, and marks the 15th release from Da! Heard It Records. This album is more personal and more polished : the Amiga 500 specialist has added a pinch of Gameboy Classic and some Commodore 64. Dedicated robot rights activist, Tom Woxom devotes this album and most of its tracks to them. He fights for a more equal world, and freedom of the robots.\r\nIt’s an 8-bit electro work, which some will sometimes venture to call “technoid”, the perfect word to conceptualize his artistic approach. As in his first album, Tom used sounds generated directly by his Amiga, the C64 or the DMG-01 and modified them in several ways. Best Amigavocals through a Vocoder.\r\nJust taking one track, Ro or Nanobot, who cares? is a perfect example of Tom using his Amiga 500 for vocals. Amiga sonorities arranged in throbbing rythms set this track apart by its clarity and beauty.\r\nA bit of help by Low Bit Revolte during post-prodution rendered the end product more sleek and sparkly. Robot is an personal, almost intimate album but Tom Woxom nonetheless he is honored by Low Bit Revolte and Rico Zerone remixing two of his tracks.\r\nUndeniably, Robot has opened a new page in Tom’s book of music. One definitely recognizes the mark of the artist, refined, affirmed and enriched by his artistic research.\r\nDownload this free album here : http://www.daheardit-records.net/en/discography/dhr15/\r\n\r\nArtwork by : <a href=\"http://www.nazzilla.com/\">Nazilla</a>', 'en'),
(15, 'Robot, un nouvel album signé Tom Woxom\r\nQuinzième production de Da ! Heard It Records , Robot est le second album de l’allemand Tom Woxom. Album plus personnel et plus abouti que le précédent, l’artiste a ajouté à son univers une légère touche de game boy et Commodore64. Fervent défenseur du droit des robots, Tom Woxom leur dédie son album ainsi que la plupart de ses titres. Il millite pour un monde moins hostile aux robots, plus égalitaire.\r\nUn album 8bit electro, que certains s’amuseront parfois à décrire comme “technoid”, un mot parfait pour imager son approche artistique. Comme sur son premier album Tom à utilisé des sons d\'Amiga, de C64 et de DMG-01 qu\'il modifie par la suite , notamment à l\'aide d\'un vocoder.\r\nPour ne parler que d’un seul titre Ro or nanobot, who cares ? est un parfait exemple de l\'utilisation vocale que fait Tom de son Amiga 500. Accompagné de sonorités typiquement Amiga et d\'une rythmique lancinante, ce titre se démarque de l\'album par sa clarté et sa beauté.\r\nAidé par Low Bit Revolte en post-production, le rendu final est plus léché, plus cristallin. Robot est un album personnel et intimiste , mais Tom Woxom a tout de même laissé carte blanche à Low Bit Revolte et Rico Zerone pour le remix de deux morceaux.\r\nRobot ouvre incontestablement une nouvelle page dans la musique de Tom. On y retrouve la patte reconnaissable de l’artiste, affinée, affirmée et enrichie par ses recherches artistiques.\r\nTéléchargez gratuitement le nouvel album de Tom ici : http://www.daheardit-records.net/fr/discographie/dhr15/\r\n\r\nPochette par : <a href=\"http://www.nazzilla.com/\">Nazilla</a>', 'fr'),
(16, 'Gameboy Love EP is the new album by the hyperactive Italian chiptuner Buskerdroid. It comprises 5 tracks made exclusively using the LSDJ software.\r\nThis 16th original Da! Heard It Records production is back to the basics : 8bit music!\r\nBuskerdroid offers his listeners some serious energy through his doped-up sounds. Taking no prisoners, he drags his Gameboy into the most unexpected corners by creating hybrid tracks combining 8bit and hardtek.\r\nGameboy Love EP will leave you breathless, it’s short, clear and concise, leaving the listener in an over-excited, confused and crazed state of mind. The title track 3D(istortion), to mention just one,submerge the listener into an absurd universe thanks to its relentless rythm and throbbing melody.\r\nGameboy Love EP is meant for connoisseurs of the chiptune movement, but also for fanatics of much more violent electro styles.\r\nWhy wait? Download Gameboy Love EP here now!\r\n\r\nMastering by: <a href=\"http://www.mixcloud.com/DjFulciSeleKtone/\">Momoseb</a> - Artwork by : <a href=\"http://www.nazzilla.com/\">Nazilla</a>', 'en'),
(16, 'Nouvel album du chiptuner italien et hyperactif Buskerdroid, Gameboy Love EP contient cinq morceaux intégralement composés à l’aide du logiciel LSDJ, seizième production sur le label Da ! Heard It Records celle-ci s’annonce comme un retour aux sources : la musique 8bit .\r\nBuskerdroid offre à ses auditeurs une musique véritablement énergique de part son son survitaminé. L’artiste est sans concessions, il emmène sa gameboy dans ses plus étonnants retranchements en créant des morceaux hybrides mêlant 8bit et hardtek.\r\nGameboy Love EP coupe le souffle de son auditeur, c’est un EP net, court et concis laissant son auditeur dans un état de sur-excitation, d’incompréhension et de frustration. Le titre 3D(istortion) , pour ne citer que lui, submerge son auditeur dans un univers saugrenu, grâce à son rythme effréné et sa mélodie lancinante.\r\nGameboy Love EP s’adresse aux connaisseurs de la mouvance chiptune mais aussi aux amoureux d’autres mouvements electro bien plus violents.\r\nN’attendez pas, téléchargez Gameboy Love EP ici dès maintenant.\r\n\r\nMastering par : <a href=\"http://www.mixcloud.com/DjFulciSeleKtone/\">Momoseb</a> - Pochette par : <a href=\"http://www.nazzilla.com/\">Nazilla</a>', 'fr'),
(17, 'Da ! Heard It Records is proud to present Vengeance, its 17th uncommon production. Flying the colors of vengeance, this album is a real head-butt to love.\r\nJacques Cochise does not do things half-ass : his album doesn’t smooth around the corners, he collides with them head on : 10m39s or uncut exhuberance.\r\nVengeance is first and foremost a personal album, a message to a girl. That doesn’t mean that Jacques has abandoned the concept of melody, in fact he proves himself once again as clear and effective.\r\nThe artwork was designed by Satanik Mike, a graphical artist also in love with vengeance and mutilated by love.\r\n\r\nArtwork by : <a href=\"http://templealphacanismajoris.partouze-cagoule.fr/\">Satanik Mike</a>', 'en'),
(17, 'Da ! Heard It Records est fier de vous présenter Vengeance, une dix-septième production peu commune. Placé sous le signe de la vengeance, cet album est un véritable coup de boule à l’amour.\r\nJacques Cochise, jeune artiste multi-supports ne fait pas les choses à moitié. Son album n’arrondit pas les angles, il rentre dedans : 10mn39 d’exutoire sans mesure.\r\nVengeance est avant tout un album personnel , un message à une fille . Jacques n’a pas délaissé la mélodie pour autant. Une fois de plus, il s’avère net et efficace.\r\nL’artwork a été réalisé sur mesure par Satanik Mike, un graphiste lui aussi amoureux de la vengeance et mutilé de l’humour.\r\nExutoire, antidépresseur et musicalement magique, cet album séduira tout autant les mutilés de l’amour que les autres, téléchargez le sans attendre.\r\n\r\nPochette par : <a href=\"http://templealphacanismajoris.partouze-cagoule.fr/\">Satanik Mike</a>', 'fr'),
(18, 'Coming from a far-away star aboard an interplanetary ship, Rod Droïd and Puyo Puyo were getting ready for a triumphant galactic tour in the heart of the imperial orchestra. Suddenly, their space engine exploded in midflight during a meteor shower. Propelled into the stratosphere, our two robot companions were thus projected to Earth, and more precisely, to Nantes, France. Assuming a human appearance, they immediately set to do the only things they knew how, music and concerts, in order to survive in this hostile environment thousands of light-years away from home. The Music Robots were born.\r\nThe duo is naturally reminiscent of Kriktoian folklore, only more offensive as far as rhythm goes. Their lyrics are simple (they are robots after all) and as light as the Hwagaagaa poems of their childhood. As for their sense of melody, it unmistakably evokes the engaging airs of Gamma Leonis and of Celestia, two stars famous for their happy tunes. Their pieces are short, efficient, and perfect for crazy, metallic choreographies.\r\nA few months ago, Da! Heard it Records-always on the lookout for new talents-heard of this droidesque duo and decided to have them sign on its digital label. The robots, not knowing how to sign, simply waved their hands hello\r\n\r\nArtwork by : <a href=\"http://stereotype.ws/\">Stereotype</a>', 'en'),
(18, 'Venus tous deux d\'une étoile lointaine à bord d\'un vaisseau interplanétaire,  Rod Droïd et Puyo Puyo s\'apprêtaient à faire une tournée galactique triomphale au sein de l\'orchestre impérial. Soudain, leur engin spatial explosa en vol dans une averse de météores. Précipités dans la stratosphère, nos deux compères robots furent alors projetés sur terre et plus précisément à Nantes, France. Ayant pris l\'apparence humaine, ils se remirent illico à faire la seule chose qu\'ils savaient faire : de la musique et des concerts, pour survivre dans cet environnement hostile, à des milliers d\'années-lumière de chez eux. Les Robots Musique étaient nés.\r\nLeur duo rappelle naturellement le folklore Kriktoïen, en plus offensif du point de vue rythmique. Leurs textes sont simples (n\'oublions pas que ce sont des robots) et légers comme les poèmes Hwagaagaa de leur enfance. Quant à leur sens de la mélodie, il évoque immanquablement les airs entraînants de Gamma Leonis et de Celestia, deux astres célèbres pour leurs happy tunes. Leurs morceaux sont courts, efficaces et parfaits pour les folles chorégraphies métalliques.  \r\nVoici quelques mois, Da! Heard it records, toujours en quête de nouveaux talents, eut vent de ce duo droïdesque et décida de le signer sur son label digital. Comme ils ne savaient pas signer, les Robots Musique firent simplement coucou avec la main.\r\n\r\nPochette par : <a href=\"http://stereotype.ws/\">Stereotype</a>', 'fr'),
(20, 'With this EP, hybrid musician Marc de Blanchard offers the listener a sound journey between field, computer, and chamber music. Sérénade is a cinematic EP marked with magic and levity, yet nostalgic and robotic at the same time. Music boxes and cracking sounds go face-to-face, finally creating an enchanting and catchy melody. Throughout the pieces, Sérénade reminds us of the mechanical and electronic carousels, the fun fair and its lights, the forest and its fauna. And Marc de Blanchard achieves his bet to thrust us into an all-new universe of monsters, electricity, and bird songs.\r\n \r\nAfter Astroboiler, and Vengeance, this 19th release fits itself into a will for eclecticism.\r\nDa! Heard it Records astonishes, thus confirming its ambition for discovery and exploration, and promising beautiful surprises in the months to come.\r\n \r\nDistributed under Creative Commons, the EP can be downloaded here:  http://www.daheardit-records.net/en/discography/dhr-19\r\n\r\nMastering by : <a href=\"http://www.mixcloud.com/DjFulciSeleKtone/\">Momoseb</a> - Artwork by: <a href=\"http://marc.arette.free.fr/\">Marc De Blanchard</a>', 'en'),
(20, 'Avec cet EP, Marc de Blanchard, musicien hybride, propose à l’auditeur un voyage sonore entre musique de chambre, des champs et d’ordinateurs. Sérénade est un EP cinématique tout empreint de féerie et de légèreté, et pourtant nostalgique et robotique à la fois. Boîtes à musique et sons qui craquent s’y confrontent pour finalement créer une mélodie envoûtante et entraînante. Au fil des morceaux, Sérénade nous rappelle les manèges mécaniques et électroniques, la fête foraine et ses lumières, la forêt et sa faune. Et Marc de Blanchard réussit son pari de nous plonger dans un tout nouvel univers de monstres, d’électricité et de chants d’oiseau.\r\n\r\nAprès Astroboiler, et Vengeance, cette 19ème sortie s’inscrit dans une volonté d’éclectisme. Da ! Heard it Records surprend, confirme ainsi son ambition de découverte et d’exploration, et promet de belles surprises pour les mois à venir.\r\n\r\nDistribué sous Creative Commons, l’EP est téléchargeable ici : http://www.daheardit-records.net/fr/discography/dhr-19 \r\n\r\nMastering par : <a href=\"http://www.mixcloud.com/DjFulciSeleKtone/\">Momoseb</a> - Pochette par : <a href=\"http://marc.arette.free.fr/\">Marc De Blanchard</a>', 'fr'),
(21, 'With his new opus CREVIN, Debmaster, both inspired and inspiring, gives \r\na kick in the ass to “Dancefloor” music. In continuation with Crev’ Sessions \r\n(under ex-label BriEfcAse Tockers), CREVIN presents itself today as the \r\nfermata of Crev philosohy, a philosophy for which Sammy Stein offers a \r\ndefinition through the cover he drew. \r\nDirty and stubborn hip-hop beats tinted with arpeggic bleep bleeps for a \r\ndark yet dancing result. CREVIN is falsly awkward, a worked looseness, \r\nthe antonym of Swag. \r\nIt’s a definite nod of the head for the fine amateurs of hip-hop and electro, \r\nbut also for all the lovers of off-the-wall nights, where sweat mixes genres \r\nin a quest for shared discovery. Because CREVINis eclecticism at its \r\nfoundation and the promise of a blissful marriage of several horizons, for \r\nthe better and for the worse. \r\n\r\nMaster by : <a href=\"https://soundcloud.com/touch_people\">Darren Keen</a>- Artwork by :  <a href=\"http://www.sammystein.fr/\">Sammy Stein</a>', 'en'),
(21, 'Avec son nouvel opus CREVIN, Debmaster, inspiré et inspirant, donne un \r\ncoup de pied au cul à la musique «Dancefloor». Dans la continuité de ses \r\nCrev’ Sessions (sous le feu label BriEfcAse Rockers), CREVIN s’avance \r\naujourd’hui comme le point d’orgue de la philosophie Crev, philosophie \r\ndont Sammy Stein (http://www.sammystein.fr) nous propose une définition \r\nà travers la cover qu’il a dessinée. \r\nDes beats hip-hop sales et entêtants, teintés de bleep bleeps harpégiques \r\npour un résultat sombre mais dansant. CREVIN, c’est une fausse \r\nmaladresse, une loositude travaillée, l’antinomie assumée du Swag. \r\nC’est un hochement de tête assuré pour les fins amateurs de hip hop & \r\nd’électro, mais également pour tous les amoureux de soirées déjantées, où \r\nla sueur marie les genres dans une quête de découvertes partagées. Car \r\nCREVIN c’est l’éclectisme à ses fondements et la promesse d’un mariage \r\njouissif de plusieurs horizons, pour le meilleur et pour le pire. \r\n\r\nMastering par : <a href=\"https://soundcloud.com/touch_people\">Darren Keen</a> - Pochette par : <a href=\"http://www.sammystein.fr/\">Sammy Stein</a>', 'fr'),
(22, 'With Gleichtakt, Tom Woxom guides you to the shimmering arpeggios and creaking squarebass order of two good old nintendo gameboys. The synchronized machines are building up a space of digital rhythm and 8-bit sound. Mr. Woxom’s clubsound continiously switches between low and hi-fidelity atmospheres using the simple waveforms from the DMG-01 classic clean and sharp pixelsoundfx to raw and screaming dancefloor bass.\r\n\r\nSweet audio filtering and endless delays take you on a technotic trip back to your handheld years and fast forward on a journey to the green grid of a monochrome screen world.\r\n\r\nListen now to Tom Woxom’s third album, straight out of Germany’s capital of lowbit music : Wuppertal.\r\n\r\nhttp://www.daheardit-records.net/en/discography/dhr-21\r\n', 'en'),
(22, 'Avec Gleichtakt, Tom Woxom nous entraîne dans le monde des arpèges chatoyants et autres basses carrées grinçants de deux Gameboy classiques. Une fois synchronisées, ces dernières bâtissent un espace à la rythmique digitale et aux sonorités 8bit. L\'univers de M. Woxom passe d\'une atmosphère lowfi  à des sons plus léchés, et nous offre aussi bien les sonorités typiques de l’instrument qu\'une basse dancefloor hurlante et crue. \r\n\r\nDe doux filtres audio et des delays sans fins nous transportent dans un pèlerinage technotique prélude à un voyage futuriste au sein de la grille verte d\'un monde d\'écrans monochromes. \r\n\r\nDécouvrez maintenant le troisième album de Tom Woxom, venu tout droit de la capitale allemande de la musique lowbit : Wuppertal.\r\n\r\nhttp://www.daheardit-records.net/fr/discography/dhr-21\r\n\r\nPochette par : <a href=\"http://www.nazzilla.com\">Nazzilla</a>', 'fr'),
(23, 'Activité Animale is an obsessive and heady album organized around nine tracks (and one bonus !)  with a crescendo intensity promising a paroxystic transe.\r\n\r\nThis second opus brings us in a mystical adventure carried by a brutal and heavy bass tainted of an  ingenious mixture of stolen animal and sciencefiction sounds. A well orchestrated  alternation of organic and synthetic sounds evolving on rhythm form IDM to techno and disco to rockabilly.\r\n\r\nActivité Animale tells us about transformation from man to animal, a frightening absurd metamorphosis creating a necessary humility to an open travel where everything is possible. Consider this album as a skillfully build up journey releasing your deeper animal instincts.\r\n\r\nIn fact Activité Animale is first if all an invitation to discover the « galactic zoo » universe of Marc de Blanchard, kingdom of laser tigers and leopards hearts !\r\nWithin this 22nd release, Da ! Heard It Records is promising once again a nice sound and visual adventure. Prepare your grooming to a kicky expedition trough the farthest reaches of your animality.\r\n\r\nDistributed under Creative Commons BY-NC-ND, the EP can be downloaded here:  http://www.daheardit-records.net/fr/discography/dhr-22 \r\n\r\nMastering by Thomas Bloyet - Artwork by <a href=\"http://marcetmariepresentent.tumblr.com\">Marc et Marie Présentent</a>', 'en'),
(23, 'Obsédant et entêtant, Activité Animale de Marc de Blanchard est un album qui s’organise autour de neuf morceaux (et un bonus!), à l’intensité crescendo, et la promesse d’une transe paroxystique.\r\n\r\nCe second opus nous entraîne dans une aventure mystique portée par une basse brute et lourde, teintée d’un ingénieux mélange de sons empreints de l’univers animalier et de la science-fiction. Une alternance bien orchestrée de sonorités organiques et synthétiques évoluant sur des rythmiques passant de l’IDM à la techno, du disco au rockabilly.\r\n\r\nActivité Animale nous conte l’histoire de la transformation de l\'homme à l\'animal, métamorphose angoissante d\'absurdité qui crée l’humilité nécessaire à un voyage ouvert à tous les possibles. Considérez cet album comme un périple savamment construit qui libérera vos instincts animaux les plus enfouis.\r\n\r\nCar Activité Animale, c’est avant tout une invitation à découvrir l’univers « zoogalactique » de Marc de Blanchard, là où règnent les tigres lasers et les cœurs de léopards!\r\n\r\nAvec cette 22ème sortie, Da ! Heard It Records promet une fois de plus de biens belles aventures sonores et visuelles. Préparez donc votre nécessaire de toilett(e)age pour une expédition jouissive aux confins de votre animalité.\r\n\r\nDistribué sous licence Creative Commons BY-NC-ND, l’album est téléchargeable à  cette adresse : http://www.daheardit-records.net/fr/discography/dhr-22\r\n\r\nMastering par Thomas Bloyet - Artwork par <a href=\"http://marcetmariepresentent.tumblr.com\">Marc et Marie Présentent</a>', 'fr'),
(24, 'Edited and compiled from 2008 to 2013 by DJ Black Negro, the Thunder Doom compilation introduces 18 pieces by 16 artists from the 90s’ tekno/gabber/eurodance scene.\r\n\r\nDJ Black Negro—a fully white Belgian and self-proclaimed “nihilist junkie”—performs a work of archiving and research relating to quite a peculiar aesthetic.\r\n\r\nTaken in its whole, this compilation is also a fabulous aural collage to experience all the way through the listening of its pieces by Neophite, Pee Wee Ass Vs Dee Dee Puss, as well as DJ Kannibal Freak.\r\n\r\nAnd as Slask Norton will tell you, “This Is A Public Fuckin Domain To Me Anyway”! ', 'en'),
(24, 'Éditée et compilée entre 2008 et 2013 par DJ Black Negro, la compilation Thunder Doom présente 18 morceaux de 16 artistes issus de la scène tekno/gabber/eurodance des années 90.\r\n\r\nDJ Black Negro - un belge tout blanc, qui se présente comme un “junkie nihiliste” - effectue là un travail d’archivage et de recherche à propos d’une esthétique bien particulière. \r\n\r\nPrise dans son ensemble, cette compilation est aussi un fabuleux travail de collage sonore à découvrir tout au long de l’écoute des morceaux de Neophite, Pee Wee Ass Vs Dee Dee Puss ou encore Dj Kannibal Freak.\r\n\r\nEt c’est Slash Norton qui vous le dit : “This Is A Public Fuckin Domain To Me Anyway” !\r\n', 'fr'),
(25, 'For its 24th release, Da! Heard It Records indulges in a wild irony doped with the borne absurdity of the three Infecticide trolls. With “Chansons Tristes” (“Sad Songs”), the trio proposes a first album, impossible to classify according to any musical catalog.\r\n\r\nAs an anthology of a five-year infected epic, “Chansons Tristes” takes us through the whims of its cold rhythms, distended synths, hopping basses, and crude and dirty riffs—a rare and jarring mix carried by a remarkable attention, where voice, keyboard, drums, and electric guitar harmonize to create a peculiarly offsetting universe.\r\n\r\nFifteen pieces with neo-Dadaist lyrics will leave speechless all spirit unable to go beyond the first degree and enrapture personalities in a displacing way. With its soft references to Liaisons Dangereuses, Detroit Grand Pubahs, or Front 242, the production’s finesse will caress the pointiest ears all the whilst (festively) readjusting the pointiest hats—dark and festive humor thus serving serious matters.\r\n\r\nIn addition to excelling in the production of these aural jewels dotted with electro-punk-wave sonorities, the three Infecticide lads distinguish themselves even more with their scenic presence (and cosmic costumes), which will motivate the jaded and depressed nobody in the back of the room to come closer to the stage and exchange sweat and liberating cries. Cathartic.\r\n\r\n“Chansons Tristes,” Da ! Heard It Records’ 24th release is distributed under Creative Commons license BY-NC-ND. The album may be downloaded at the following address: http://www.daheardit-records.net/en/discography/dhr-24\r\n\r\n', 'en'),
(25, 'Pour sa 24è sortie, Da ! Heard It Records s’offre l’ironie déjantée dopée à l’absurdité assumée des trois affreux d’Infecticide. Avec “Chansons Tristes”, le trio nous propose un premier album décloisonné de tout catalogage musical. \r\n\r\nRecueil d’une épopée de cinq années infectées, “Chansons Tristes” nous emporte/affole au gré de ses rythmiques froides, synthés distendus, basses sautillantes et rifs sales et crus. Un mélange rare et détonnant porté par une exigence remarquable où chant, clavier, batterie et guitare électrique s’accordent pour un univers singulièrement décalé. \r\n\r\nQuinze morceaux aux lyrics néo-dadaïstes qui laisseront pantois tout esprit se limitant au premier degré pour râvir les personnalités à l’approche plus décalée/reculée. Une finesse dans la production qui viendra caresser de ses douces références à Liaisons Dangereuses, Detroit Grand Pubahs ou Front 242 les oreilles les plus pointues, tout en réajustant - festivement - les chapeaux... pointus. De l’humour (noir et festif) donc au service du sérieux. \r\n\r\nEn plus d’exceller dans la production de ces petits bijoux auditifs aux sonorités électro-punk-wave, les trois lascars d’Infecticide se distinguent d’autant plus par leur présence scénique (et leurs costumes cosmiques) qui poussera le quidam blasé et déprimé du fond de la salle à se rapprocher de la scène pour échanger et déverser sueur et cris libérateurs. Cathartique. \r\n\r\n\r\n“Chansons Tristes” la 24e release de Da ! Heard It Records est distribué sous licence Creative Commons BY-NC-ND, l’album est téléchargeable a l’adresse suivante : http://www.daheardit-records.net/fr/discography/dhr-24', 'fr'),
(26, 'Jacques Cochise marks Da ! Heard It Records’ 25th release with Documents interdits: les pistes oubliées (“Forbidden documents: the forgotten tracks”), an opus of seven pieces putting to music the famous off voice of the “Les Documents Interdits.”\r\nAired on La Sept in the late 80s, these precursor videos of the “found footage” genre would keep the audience on the edge of their seats through eight episodes transmitted across the waves without any explanation whatsoever.\r\n \r\nFar from his first album Vengeance which featured 8bit-electro-punchy sounds, Jacques Cochise offers a special place to ambient and synth-wave for the re-adaptation of this televised UFO. Inspired by John Carpenter movie soundtracks, Cochise sublimes the outstanding instants of these videos for an experience that much more intense and breathtaking. From “Pique Nique” (Picnic) to “Fantômes” (Ghosts), the album transports us into an intriguing and worrisome sound universe.\r\n\r\nDocuments interdits: les pistes oubliées is an engaging hybrid album that one listens to—as one would an audio book—carefully.\r\n\r\nDocuments interdits: les pistes oubliées, the 25th Da ! Heard It Records release, is distributed under a Creative Commons License BY-NC-ND. The album can be downloaded at the following address:http://www.daheardit-records.net/en/discography/dhr-25 \r\n\r\nWriter, director and producer of Documents Interdits : <a href=\"\"http://www.jtfilms.eu\">Jean Teddy Filippe</a> - Artwork by <a href=\"http://yannlelias.fr/\">Yann Lélias</a> - Silkscren par <a href=\"http://superheights.com/\">Super Heights</a>', 'en'),
(26, 'C’est Jacques Cochise qui marque la 25e sortie de Da ! Heard It Records avec “Documents interdits : les pistes oubliées”, un opus de sept morceaux mettant en musique la fameuse voix off des vidéos “Les Documents Interdits”. \r\n\r\nDiffusées sur La Sept à la fin des années 80, ces vidéos précurseurs du genre “found footage”, tiendront en haleine les téléspectateurs au cours de douze épisodes émis sur les ondes sans la moindre explication. \r\n\r\nLoin de son premier album “Vengeance” aux sonorités 8bit-électro-punchy, Jacques Cochise offre une place de choix à l’ambient et la synth-wave pour la réadaptation de cet ovni télévisuel. Inspiré des bandes originales des films de John Carpenter, Cochise sublime les instants marquants de ces vidéos pour une expérience d’autant plus intense et haletante. Du “Pique Nique” aux “Fantômes”, l’album nous transporte dans un univers sonore intrigant et angoissant. \r\n\r\n“Documents interdits : les pistes oubliées” est un album hybride et prenant que l’on écoute - tel un livre audio - avec attention. \r\n\r\n“Documents interdits : les pistes oubliées” la 25e release de Da ! Heard It Records est distribué sous licence Creative Commons BY-NC-ND, l’album est téléchargeable à l’adresse suivante : http://www.daheardit-records.net/fr/discography/dhr-25\r\n\r\nAuteur, réalisateur et producteur des Documents Interdits : <a href=\"http://www.jtfilms.eu\">Jean Teddy Filippe</a> - Artwork par <a href=\"http://yannlelias.fr/\">Yann Lélias</a> - Sérigraphie par <a href=\"http://superheights.com/\"> Super Heights</a>\r\n', 'fr');
INSERT INTO `release_translation` (`id`, `presentation`, `lang`) VALUES
(27, 'For its 26th release, Da ! Heard It Records invites you to come meet The Fat, with their first album: “Meat Me”.\r\n\r\nThe Fat, a band based in the north of Paris, consists of two pillars: Jacques de Candé and Thomas Suire. Louis Pontvianne and Romain Drogoul join the two comrades live. One year after their first stage performance at Instants Chavirés, aside pioneers of Russian industrial music Vetrophonia, their first album, Meat Me, comes out.\r\n\r\nThe band aims to let the synths speak. Their qualities, their flaws, the damage they’ve suffered overtime are as utilized in the conception of the pieces as are lengthy improvisation sessions.\r\nA festival of Moog, DSI, Roland, Aelita, Jomox, Oberheim, Eowave… The use of exclusively analog machines kindles a usually cold sound into a latent dampness. The construction of the pieces from a bass line, blurry yet well-framed, thanks to a crispy solid rhythm reminiscent of Oto, accentuates our indecision between choppy gesticulations and petrified emotion.\r\n\r\nAt the beginning of the album, a languorous beat skews all pulse of excitement and favors a listening focused on all of the subtleties in the variations of sonorous matters. When the rhythm accelerates later on, a tribal dialog settles in, where the roundness of the exchanges between melodies and the rhythm box’s primary pulses tangle in despair, as if bliss only ever belonged to the past. A few infecticidian gimmicks erupt on certain tracks, and our bodies appropriate this music in a measured gestural.\r\n\r\nNow, it is your turn to appreciate and have your emotions ascend. Shh!... Listen, there...\r\nThat little repetitive sound, in the background, in a psychotic spiral, where is it taking us to ? Are we not heading towards Forbidden Planet?\r\nTo create the visuals on the sleeve, the band called on Pia-Mélissa Laroche, a graphic illustrator that cherishes lead. Pia’s universe is a mixture of anatomical imagery and geometric volumes where spheres, cubes, and organic cells intertwine. We lose ourselves, like children, in this very personal interpretation of an infinitely small world.\r\n\r\n“Meat Me”, Da ! Heard It Records’ 26th release is distributed under a Creative Commons License BY-NC-ND. The album can be downloaded at the following address: http://www.daheardit-records.net/en/discography/dhr-26\r\n\r\nComposition , recording, mixing by par Suire/De Candé - Mastering by Romain Drogoul (merci à Florent Livet, Etienne Grossein et Pavle Kovacevic) - Artwork by <a href=\"http://www.piamelissalaroche.fr\">Pia-Melissa Laroche</a>\r\n', 'en'),
(27, 'Pour sa 26ème sortie, Da ! Heard It Records vous invite à partir à la rencontre de The Fat avec leur premier album : “Meat Me”. \r\n\r\nThe Fat, groupe basé au nord de Paris, est constitué de deux piliers, Jacques de Candé et Thomas Suire. En live, Louis Pontvianne et Romain Drogoul rejoignent les deux compères. Un an après leur première prestation scénique aux Instants Chavirés, au côté des pionniers de la musique industrielle russe Vetrophonia, sort leur premier album Meat Me. \r\n\r\nL’envie du groupe est de laisser parler les synthés. Leurs qualités, leurs défauts, leurs dommages subits par le temps sont autant utilisés pour la conception des morceaux que les séances d’improvisation à rallonge. Un festival de Moog, DSI, Roland, Aelita, Jomox, Oberheim, Eowave...L’utilisation de machines exclusivement analogiques attise un son habituellement froid vers une moiteur latente. La construction des morceaux par une ligne de basse, trouble et en même temps bien cadrée, grâce à une solide rythmique biscuitée façon Oto, accentue notre indécision entre gesticulations saccadées ou pétrification d’émoi. \r\n\r\nAu début de l’album, un battement principalement langoureux fausse toute pulsion d’excitation, et favorise une écoute attentionnée sur toutes les subtilités des variations des matières sonores. Quand le rythme s’accélère par la suite, un dialogue tribal s’installe, où la rondeur des échanges entre mélodies et pulsions primaires de la boîte à rythme s’enlacent de désespoir, comme si le bonheur n’appartenait toujours qu’au passé. Quelques gimmicks infecticidiens font éruption sur certains titres, et nos corps s’approprient cette musique par une gestuelle mesurée. \r\n\r\nMaintenant c’est à vous d’apprécier et de faire remonter vos émotions. Chut!... écoutez, là... \r\nce petit son répétitif, en arrière plan, en spirale psychotique, vers où nous amène-t-il ? Ne nous  dirigeons nous pas vers Forbidden Planet ?\r\n\r\nPour réaliser les visuels de la pochette, le groupe a fait appel à Pia-Mélissa Laroche, une graphiste illustratrice qui chérit la mine de plomb. L’univers de Pia est un mélange d’imagerie anatomique et de volumes géométriques où s’enchevêtrent sphères, cubes avec des cellules organiques. Nous nous perdons, comme des enfants, dans cette interprétation très personnelle d’un monde infiniment petit.\r\n\r\n“Meat Me”, la 26e release de Da ! Heard It Records est distribué sous licence Creative Commons BY-NC-ND, l’album est téléchargeable à l’adresse suivante : http://www.daheardit-records.net/fr/discography/dhr-26\r\n\r\nComposition, enregistrement, mixage par Suire/De Candé - Mastering par Romain Drogoul (merci à Florent Livet, Etienne Grossein et Pavle Kovacevic) - Artwork par <a href=\"http://www.piamelissalaroche.fr\">Pia-Melissa Laroche</a>', 'fr'),
(28, 'For its 27th release, Da ! Heart It Records gratifies you with a new album by Le Matin: “Le Martin.”\r\n \r\nOver the past decade, we’ve seen this musical UFO pass by on a Chicago house label (<a href=\"http://mathematicsrecordings.blogspot.fr/\">Mathematics Recordings</a>), on the <a href=\"http://parishq.net/contests/number_one/\">ParisHQ</a>  compilation covering Julien Clerc in an 8bit version, and even on a breakcore label (Berzerk Produkts) remixing Franky Vincent!\r\n \r\nWe also owe him must-see video games such as <a href=\"http://oess.saucisse.org/\">Ours en Slip Simulator</a> and  <a href=\"http://www.ci0.org/blektre/\">Blektre</a>  (a real-life simulator)…We get it, Charles Torris is a geek, a comprehensive and prolific artist who likes to cultivate paradoxes.\r\n \r\nIn this album, you will find his sub-realist poetry, where dark – and sometimes coarse – humor slices with a sober, sensitive, and melancholic music. In his displaced universe, synthesizers and “old-style\" rhythm boxes draw landscapes with neon lights, cellophane clouds, and the silicone architecture of a future as fascinating as it is troubling.\r\n \r\nHis sonorities may evoke Detroit’s techno, cold wave, and even the IDM of a DMX Krew. But as the artist says himself – and as the piece Nouvel Évier shows – “If Kraftwerk or Dopplereffekt were French, their balls would spill out from their dirty kangaroo underwear…”\r\n \r\nThis album deserved a case fit for its preciousness, thus it is presented in a folded LP sleeve decorated with a superb illustration, along with a drawing, cards, a badge, and a sticker, all created by  <a href=\"http://www.elise-kobisch-miana.fr/\">Élise Kobisch-Miana</a>.\r\n \r\nLet it be known: this album by Le Matin is to French chanson what sausage is to sauerkraut: indispensable!\r\n“Le Martin”, Da ! Heard It Records’ 27th release is distributed under a  <a href=\"http://creativecommons.org/licenses/by-nc-nd/3.0/fr/\">Creative Commons BY-NC-ND</a> license. The album \r\nmay be listened to and downloaded at the following address:<a href=\"http://www.daheardit-records.net/fr/discography/dhr-27\">http://www.daheardit-records.net/en/discography/dhr-27</a>\r\n\r\nArtwork by <a href=\"http://www.elise-kobisch-miana.fr\">Elise Kobisch-Miana</a>', 'en'),
(28, 'Pour sa 27eme sortie, Da ! Heard It Records vous gratifie d\'un nouvel album de Le Matin : \"Le Martin\".\r\n\r\nCes dix dernières années, on a pu voir passer cet ovni musical sur un label house de Chicago (<a href=\"http://mathematicsrecordings.blogspot.fr/\">Mathematics Recordings</a>), sur la compilation du <a href=\"http://parishq.net/contests/number_one/\">ParisHQ</a> reprenant Julien Clerc version 8bit, et même sur un label de breakcore remixant Franky Vincent!\r\n\r\nOn lui doit également des jeux vidéos incontournables tels qu\'<a href=\"http://oess.saucisse.org/\">Ours en Slip Simlator</a> ou <a href=\"http://www.ci0.org/blektre/\">Blektre</a> (simulateur de vraie vie)... On l\'aura compris, Charles Torris est un geek, un artiste complet et prolifique aimant cultiver les paradoxes.\r\n\r\nVous retrouverez dans cet album sa poésie sous-réaliste, où l\'humour noir, parfois grossier, tranche avec une musique sobre, sensible, et mélancolique. Dans son univers décalé, les synthétiseurs et boîtes a rythmes \"à l\'ancienne\" dessinent des paysages aux lumières de néon, aux nuages cellophanés, et l\'architecture en silicone d\'un futur aussi fascinant qu\'angoissant. \r\n\r\nSes sonorités peuvent évoquer la techno de Détroit, la cold wave, voire l\'IDM d\'un DMX Krew. Mais comme le dit l\'artiste lui même, et comme en témoigne le morceau Nouvel Évier : \"Si Kraftwerk ou Dopplereffekt étaient français ils auraient les couilles qui débordent de leurs slips kangourous sales...\"\r\n\r\nAlbum précieux, il se devait d\'avoir un écrin à la hauteur, aussi le disque se présente dans une pochette de 45T dépliante ornée d’une superbe illustration, accompagnée d’un dessin, de cartes, d’un badge et d’un autocollant, le tout réalisé par <a href=\"http://www.elise-kobisch-miana.fr/\">Elise Kobisch-Miana</a>.\r\n\r\nQu\'on se le dise,  cet album de Le Matin est à la chnason française ce que la saucisse est à la choucroute, indispensable!\r\n \r\n“Le Martin”, la 27eme sortie de Da ! Heard It Records est distribuée sous licence <a href=\"http://creativecommons.org/licenses/by-nc-nd/3.0/fr/\">Creative Commons BY-NC-ND</a>, l’album est librement écoutable et téléchargeable à l’adresse suivante : <a href=\"http://www.daheardit-records.net/fr/discography/dhr-27\">http://www.daheardit-records.net/fr/discography/dhr-27</a>\r\n\r\nArtwork par <a href=\"http://www.elise-kobisch-miana.fr\">Elise Kobisch-Miana</a>', 'fr'),
(29, 'For its 28th release, Da ! Heard It Records presents Skinfaxe’s first album: Failure System.\r\nAn opus of eight tracks of electronic sounds, Failure System offers us a well-led orchestration of synthetic derailments.\r\n \r\nLike a good tour guide, Skinfaxe takes us to the hidden corners of her diverse ambiences and sonorities, experimented on in Reason. The result is an album with an increasing intensity in which every sound is whittled from its raw form, ready to receive pageantry and arrangements to bring out a piece with a colorful personality.\r\n \r\nDistributed under CreativeCommons license BY-NC-ND, the album is downloadable at the following link: http://www.daheardit-records.net/en/discography/dhr-28\r\n\r\nMastering by : <a href=\"http://www.mixcloud.com/DjFulciSeleKtone/\">Momoseb</a> ', 'en'),
(29, 'Pour sa 28e release, Da ! Heard It Records a la primeur de proposer le premier album de Skinfaxe : Failure System. \nOpus de 8 titres aux sonorités électroniques, Failure System nous offre une orchestration bien menée de déraillements synthétiques. \n\nSkinfaxe en bon guide touristique, nous entraine dans les recoins perdus de ses diverses ambiances et sonorités, expérimentées sur Reason. Le résultat est un album à l’intensité croissante où chaque son est taillé à brut, prêt à recevoir apparâts et arrangements pour en faire ressortir un morceau au caractère bien trempé. \n\nDistribué sous licence Creative Commons BY-NC-ND, l’album est téléchargeable à cette adresse : http://www.daheardit-records.net/fr/discography/dhr-28\n\nMastering par : <a href=\"http://www.mixcloud.com/DjFulciSeleKtone/\">Momoseb</a>  ', 'fr'),
(33, 'For Da ! Heard It Records’s 29th release, Infecticide returns to heckle with French chanson with psychoactive brilliance and fervor: “Poil de Coeur” arrives with the new year, like a musical greeting card under a dead Christmas tree. Inside, a journey into deep waters, through treats of neuroleptic wave, punk sweat, and the poetry of evenings that end at 3 pm in the morning… The dominical pleasures proposed by Michel Drucker will never have the same flavor. \r\nAs accomplished artists, the nasty three invest any and all means that get between their dirty hands to turn their offspring into a nocturnal weapon with a sadistic character, and the audience finds itself on its knees in front of such mastery in the art of bullshitting.\r\nWe are dealing with a precious trouple, in picturesque French scenery. Even if the Parisian trio keeps pounding pies in our faces, like with “Fais-le moi-le”, and even if the flat country that is not theirs suits them perfectly, to reduce it to the elegant EBM would ensure showers of rotten tomatoes, as evidenced by the abrasive “Pistache” which could have dubbed a block party at the time of the Boogie Down, or “Ton Tanga”, between electronic power and the exaltation of intimate undergarments. With “Prehistronic” or “Petit Tricheur”, we once again encounter what made the squadron trademark of the first album: a rock mix of synthetic music, or, as one sees fit, a rock synthesis of synesthesia.\r\nOne must also point out the panache behind the lyrics of Infecticide, such as in “Le monopole du coeur”, a phantasmagorical vision of the great dictators of our history; or in “Une petite motte de peur”, of which the hellish slomo dub accents of hell give us a friendly reminder of our condition as humans: “un chimpanzé en pull, un babouin maléfique” (“a chimpanzee in a sweater, a maleficient baboon”).\r\nThe heartening illustrations of Junie Briffaz add a final touch to these 13 firebrands. The physical object, touchable with the figures of one’s hand, offers 1 badge, 2 postcards, the lyrics, and a sticker.\r\n \r\n“Poil de Cœur”, the 29th release of Da ! Heard It Records is distributed under a Creative Commons BY-NC-ND license. The album is available for free listening and downloading at the following address: <a href=\"http://www.daheardit-records.net/en/discography/dhr-29\">http://www.daheardit-records.net/en/discography/dhr-29</a>\r\n\r\nMastering: Romain Drogoul - Artwork: <a href=\"http://juniebi.tumblr.com/\">Junie Briffaz</a> - Press text : Antoine', 'en'),
(33, 'Pour la 29e sortie du label Da ! Heard It Records, Infecticide revient chahuter la chanson française avec éclat et ferveur psychoactive: “Poil de Cœur” arrive avec la nouvelle année, comme une carte de vœux musicale sous un sapin mort. À l’intérieur, une virée en eau profonde entre friandises wave neuroleptiques, sueur punk, et poésie des soirées qui finissent à 15 heures du matin… Les plaisirs dominicaux proposés par michel Drucker n’auront plus jamais la même saveur.\r\n\r\nArtistes complets, les trois affreux investissent tous les moyens qui passent entre leurs mains sales pour faire de leur bébé une arme nocturne à caractère sadique, et le public se retrouve à genoux devant tant de maîtrise dans l’art du foutage de gueule.\r\nC’est que nous avons à faire à un trouple précieux, dans les pittoresques paysages de France. Même si le trio parisien nous martèle à coup de tarte dans la gueule, comme sur “Fais-le moi-le”, que le plat pays qui n’est pas le sien lui sied à merveille, le réduire à l’élégante EBM assurerait une pluie de tomates pourries. En témoigne l’abrasive “Pistache” qui aurait pu recevoir l’adoubement d’une block party à l’époque du Boogie Down, ou encore “Ton Tanga”, entre puissance électronique et exaltation des dessous intimes. On retrouve avec “Prehistronic” ou “Petit Tricheur” ce qui a fait la marque de fabrique de l’escadron sur le premier album, un mélange rock de musiques synthétiques, ou, au choix, une synthèse de rock en synesthésies.\r\nIl faut également souligner le panache derrière les lyrics d’Infecticide, comme dans “Le monopole du cœur”, vision fantasmagorique des grands dictateurs de notre histoire, ou dans “Une petite motte de peur” dont les accents slomo dub de l’enfer nous rappellent amicalement notre condition d’être humain: “un chimpanzé en pull, un babouin maléfique”.\r\n\r\nLes réjouissantes illustrations de Junie Briffaz mettent la touche finale à ces 13 brulôts. L’objet physique au toucher avec les doigt de la main offre 1 badge, 2 cartes postales, les paroles et un stickers. \r\n\r\n“Poil de Cœur”, la 29eme sortie de Da ! Heard It Records est distribuée sous licence Creative Commons BY-NC-ND, l’album est librement écoutable et téléchargeable à l’adresse suivante : <a href=\"http://www.daheardit-records.net/fr/discography/dhr-29\">http://www.daheardit-records.net/fr/discography/dhr-29</a>\r\n\r\nMastering: Romain Drogoul -  Artwork: <a href=\"http://juniebi.tumblr.com/\">Junie Briffaz</a> - Communiqué de presse Antoine', 'fr'),
(34, 'For its 30th release, Da ! Heard It Records gives a touching testimony: that of Klaten’s computer’s last days. Inspired by the epileptic glitches of a video card used up to its circuit, this disc’s seven pieces form a meticulous assembly of violent unknown flying objects from which otherworldly melodies emerge.\r\n \r\n“Tergiversure”, “Déglutogène”, “Exoplaste”: each track seems to be an attempt at a graft to sustain the life of a microprocessor on its last legs for a just a few moments more. Klaten, a professional 3D infographist, has indeed retained from his practice an extreme attention to detail and a taste for peculiar universes, as evidenced by the disc’s sleeve, signed Elise Kobisch-Miana, a panorama of crystals with shattered perspectives reminiscent of the album’s numerous landforms.\r\n \r\nLeading the way with Stipulite, Klaten takes the listener into the winding tunnels of a labyrinthian cave where bouncing rhythms sometimes trigger the tinting of dim mineral glows. Digging deeper into the matter, he pursues his course head hung low, through the sparkling reflections of Exoplaste and the sharp breakbeats of Tergiversure. Once at the heart of an aural boiling magma from which he draws new metallic materials (Phoryaphile, Gramafion), he completes his journey through the breath of Stratiformis in order to cool down the overheating vents of his machine positively controlled at all the VST. Alas, it is already too late…\r\n \r\nUltimate souvenir from this voyage, the Parisian C_C concludes with his own vision of the trip: a remix with massive rhythms and the sound of his analog machines humming in the background. A tribute to the complex landscapes of Autechre and the experiments of the label Schematic, this disc, with its rich and startling imaginary, remains nameless. Like a challenge, the sonorities it deploys give all the hints necessary for the listener to find it a name.\r\n\r\nMixing by MomoSeb - Artwork by <a href=\"http://www.elise-kobisch-miana.fr\">Elise Kobisch-Miana</a> - Press text by  <a href=\"http://germainfraisse.com/\">Germain</a>', 'en'),
(34, 'Pour sa 30ème sortie, Da ! Heard It Records vous offre un témoignage émouvant : celui des derniers jours de l\'ordinateur de Klaten. Inspirés par les glitchs épileptiques d’une carte vidéo usée jusqu’au circuit, les sept morceaux de ce disque forment un assemblage méticuleux d’objets violents non identifiés d’où émergent des mélodies venues d’un autre monde.\r\n\r\nTergiversure, Déglutogène, Exoplaste : chacun des titres présents semble être une tentative de greffe pour maintenir en vie quelques instants supplémentaires un microprocesseur poussé dans ses derniers retranchements. Infographiste 3D de profession, Klaten a en effet gardé de cette pratique un soin extrême du détail et le goût pour les univers singuliers. En témoigne la pochette du disque, signée Elise Kobisch-Miana, panorama de cristaux aux perspectives éclatées qui rappellent les nombreux reliefs de l’album. \r\n\r\nOuvrant la voie avec Stipulite, Klaten fait pénétrer l’auditeur dans les méandres d’une caverne labyrinthique où rythmes rebondissants font parfois teinter de faibles lueurs minérales. Creusant plus profondément dans la matière, il poursuit son parcours tête baissée à travers les reflets étincelants d’Exoplaste et les breakbeats acérés de Tergiversure. Arrivé au coeur d’un magma sonore en ébullition d’où il puise de nouveaux matériaux métalliques (Phoryaphile, Gramafion), il achève son périple par le souffle de Stratiformis afin de refroidir les ventilateurs surchauffés de sa machine controllée positive à tous les VST. Hélas, il est déjà trop tard… \r\n\r\nUltime souvenir de cette traversée, le parisien C_C offre pour conclure sa propre vision du voyage : un remix aux rythmes massifs où bourdonnent en arrière plan le son de ses machines analogiques. Hommage aux paysages complexes d’Autechre et aux expérimentations du label Schematic, ce disque à l’imaginaire riche et surprenant est resté sans nom. Comme un défi pour l’auditeur, les sonorités qu’il déploie donnent toutes les  pistes pour lui en trouver un.\r\n\r\nMixage par MomoSeb - Dessin par <a href=\"http://www.elise-kobisch-miana.fr\">Elise Kobisch-Miana</a> - Communiqué de presse par <a href=\"http://germainfraisse.com/\">Germain</a>', 'fr'),
(35, 'For its 31st release, Da ! Heard It Records summons the 8bit spirit once again.\r\n \r\nTheir “crunchy” sound is dear to them for they make music with chips; the Pocketmasters have kept their oomph since their first album, released right here in 2009. As evidenced in the hexadecimal coded translation of its title, this disc evokes a dark tint, in the image of the years to come. In order to obtain this musical color, the Swiss duo mixed all of the ones from their old consoles and second-hand computers. From this results a series of pieces with a pop energy that gets to the point about our numerical lives on the pixel scale. General surveillance in the all-digital era and old nuclear plants are thus brought back to our live memories via sonorous extracts gleaned from all four corners of the web. Displayed over chiptune melodies thought out first and foremost for your stepper sessions, these diverse citations bring a new lighting to this colorful world. Inspired by the Micromusic scene and the first video game composers, including Chris Huelsbeck, Martin Galway, and Rob Hubbard, this joyfully haywire disc might make you want to load up a cartridge to console yourself.\r\n\r\n#010010, Da ! Heard It Records’ 31st release is distributed under a Creative Commons BY-NC-ND license. The album is free for listening and downloading at the following address: http://www.daheardit-records.net/en/discography/dhr-31\r\n\r\nPres release  <a href=\"http://germainfraisse.com/\">Germain</a>', 'en'),
(35, 'Pour sa 31ème sortie, Da ! Heard It Records invoque l’esprit 8bit à nouveau.\r\n\r\nIls tiennent à leur son “crunchy” car ils font de la musique avec des chips, les Pocketmaster ont gardé la patate depuis leur premier album paru ici-même en 2009. Si l’on en croit la traduction de son titre codé en hexadécimal, ce disque évoque une teinte très sombre à l’image des années qui nous font face. Pour obtenir cette couleur musicale, le duo suisse a mélangé toutes celles de leurs vieilles consoles et autres ordinateurs de brocante. Il en résulte une série de morceaux à l’énergie pop qui fait le point sur nos vies numériques à l’échelle du pixel.  Surveillance généralisée, ère du tout digital, centrales nucléaires vieillissantes sont ainsi ramenées à notre mémoire vive par le biais d’extraits sonores glanés aux quatre coins du web. Disposés sur des mélodies chiptune pensées avant tout pour vos séances de stepper, ces citations diverses apportent un autre éclairage à ce monde haut en couleur. Inspiré par  la scène Micromusic et les premiers compositeurs de musique de jeux vidéos comme Chris Huelsbeck, Martin Galway ou Rob Hubbard, ce disque joyeusement détraqué vous donnera peut-être envie de vous envoyer une cartouche. Il parait que ça console.\r\n\r\n“#010010”, la 31eme sortie de Da ! Heard It Records est distribuée sous licence Creative Commons BY-NC-ND, l’album est librement écoutable et téléchargeable à l’adresse suivante : http://www.daheardit-records.net/fr/discography/dhr-31\r\n\r\nCommuniqué de presse par <a href=\"http://germainfraisse.com/\">Germain</a>', 'fr'),
(36, 'For its 32nd release, Da ! Heard It Records introduces Voilé by Vicnet, a music to explore like an unknown space and inviting to seek out the hidden behind the visible, the unheard-of behind the audible.\r\n\r\nWhat can freedom possibly look like in 2017, when everything and its opposite has already been tried, contradicted, canceled, and retried? Vincent Tordjman has asked himself this question many times, especially over the last few years. Since his last album (Mr. Hadopi, released in 2010 on Da ! Heard It Records), despite being busy with adult life, he has kept his passionate heart, and surrounded with three towers filled with machines, keyboards, and rare contraptions, he has not stopped recording, recording, again, always recording. Over seven years, he has evidently accumulated the equivalent of five albums. But too indecisive, too disappointed by the ever fluctuating state of the scene around him, he hasn’t finished anything, or almost nothing. He abandoned two or three skweee disks, an electronic jazz-rock disc, more acid house, as well as compilations of hand-tweaked music composed for the nocturnal electronica scene.\r\n\r\nYet finally, he finished Voilé, an album of a genre that doesn’t exist, without spite and without any other ambition than that to render the unique music that hides within it—and he might have been right to wait.\r\n\r\nFor the aptly named Voilé, which title matches the impossible-to-source visuals that adorn its sleeve, is so much more than just a new album by an all-too-rare artist that too few in this unjust world would still await. It is the personal diary of a musician too talented for his own good, who, in twelve very generous pieces, poured out all that is most personal, thus best and undoubtedly most beautiful, that his musician heart could produce.\r\n\r\nThe windfall for the listener is that it doesn’t look like anything. Yet while listening to Aladin, Princess, or Bamako, the listener’s head will not be lacking in images. From the theme of the imaginary film Idée de Question to the psychedelic explosion that is the title piece, historical references are not scarce either. But locking oneself into any which song with eyes closed is all that is needed in order to understand that one is dealing with a rare case of a record played, conceived, and operated with old synths, without resembling a museum visit. A windfall, we said. Or a senseless freedom concentrate.\r\n\r\nVoilé,  the 32nd release of Da ! Heard It Records, is distributed under a Creative Commons\r\nBY-NC-ND license, and the album is available for free listening and downloading\r\nat the following address: http://www.daheardit-records.net/en/discography/dhr-32\r\n\r\nMastering by MomoSeb - Illustration by <a href=\"https://facebookfeedback.blog/\">Thomas Cheneseau </a> - Artwork by <a href=\"www.thibaulthuertas.com\">Thibault Huertas</a> -  Press text by Olivier Lamm ', 'en'),
(36, 'Pour sa 32ème sortie, Da ! Heard It Records propose avec Voilé de Vicnet, une musique qui s’explore comme une espace inconnu, et invite à chercher le caché derrière le visible, l’inouï derrière l’audible.\r\n\r\nA quoi ça peut bien encore ressembler, la liberté, en 2017, quand tout et son contraire a déjà été essayé, contredit, annulé, réessayé? Vincent Tordjman s\'est beaucoup posé la question, surtout ces dernières années. Très occupé à sa vie d\'adulte mais le cœur toujours aussi passionné, entouré de trois tours remplies de machines, claviers, bidules très rares, il n\'a eu de cesse, depuis son dernier disque (Mr. Hadopi, sorti en 2010 sur Da ! Heard It Records), d\'enregistrer, enregistrer, encore, toujours enregistrer.  En sept ans, il a sans doute amassé l\'équivalent de cinq albums. Mais trop indécis, trop déçu par l\'état toujours trop fluctuant de la scène autour de lui, il n\'a rien fini, ou presque. Il a abandonné deux ou trois disques de skweee, un disque de jazz rock électronique, d\'autres d\'acid house, des compilations des musiques composées pour la scène ou d\'electronica nocturne tweakée à la main. \r\n\r\nFinalement, il a fini Voilé, tout de même, disque d\'un genre qui n\'existe pas. Sans dépit, sans autre ambition que de faire écouter la musique unique qui s\'y cache - et il a peut être eu raison d\'attendre. \r\nCar Voilé le bien nommé, dont le titre s’accorde aux visuels impossibles à sourcer qui décorent sa pochette, est bien plus qu\'un nouveau disque d\'un artiste trop rare que trop peu, dans le monde injuste qui est le nôtre, attendraient encore. Il est le carnet intime d\'un musicien trop doué pour son propre bien, qui a déversé en douze morceaux très généreux tout ce que son coeur de musicien pouvait produire de plus personnel, donc de meilleur, sans doute de plus beau. \r\n\r\nL\'aubaine pour l\'auditeur, c\'est que ça ne ressemble à rien. Or en écoutant Aladin, Princess ou Bamako, ce ne sont pas les images qui manqueront dans la tête de l\'auditeur. Du thème de film imaginaire d\'Idée de question à l\'explosion psychédélique du morceau-titre, ce ne sont les références historiques qui font défaut non plus. Mais il suffit de se laisser enfermer dans n\'importe quelle chanson en fermant les yeux pour comprendre qu\'on a affaire ici à un cas très rare de disque joué, conçu, opéré avec des vieux synthés, sans qu’il ne ressemble à une visite de musée. Une aubaine, on l\'a dit. Ou un concentré insensé de liberté.\r\n\r\nVoilé, la 32eme sortie de Da ! Heard It Records est distribuée sous licence Creative Commons BY-NC-ND, l’album est librement écoutable et téléchargeable à l’adresse suivante : http://www.daheardit-records.net/fr/discography/dhr-32\r\n\r\nMastering par MomoSeb  - Illustration e par <a href=\"https://facebookfeedback.blog/\">Thomas Cheneseau </a> - Pochette par <a href=\"http://www.thibaulthuertas.com\">Thibault Huertas</a> - Communiqué de presse par Oliver Lamm\r\n', 'fr'),
(37, 'For its 33rd release, Da ! Heard It Records dives into the origins of Creation.\r\n\r\nRecorded in five days in London, at James Ogilvie’s studio in 2010, Dragon’s Teeth is the confrontation of eddie 135’s experimental tweaks and Shitblaster’s science of mix. Saturated like the oil from the fish and chips that three musicians greedily gulp up between two work sessions, the series of improvisations produced by Adrien, Matthieu, and James one evening, serves as the sizzling play-do used to conceive this future disc. From this initial magma that blends rhythm boxes, Juno synthesizer, and a deluge of pyrotechnical effects, accidental beaches form and reveal little by little large blankets that wrap the listener into an actual flow of lava. Petrified, the listener thus takes all the time needed to let oneself become invaded by the ensemble’s numerous textures…\r\n\r\nTaking everything with them on their way, the four gobbling geezers deployed here evolve in jolts to bring back from the depths this mysterious dragon’s tooth. Instinctive, brutal, yet mastered, this album’s boiling energy proves once more that the first idea is often the right one.\r\nDragon’s Teeth, the 33rd release of Da! Heard It Records, is distributed under a Creative Commons License BY-NC-ND. The album is available for free listening and downloading at the following link:\r\nhttp://www.daheardit-records.net/fr/discography/dhr-33\r\n\r\nPres release  <a href=\"http://germainfraisse.com/\">Germain</a>', 'en'),
(37, 'Pour sa 33ème sortie, Da ! Heard It Records vous plonge dans les origines de la Création.\r\n\r\nEnregistré en 5 jours à Londres au studio de James Ogilvie en 2010, Dragon\'s Teeth est la confrontation des bidouilles expérimentales d’eddie135 et de la science du mix du Shitblaster. Saturée comme la graisse des fish & chips que les trois musiciens ingurgitent goulûment entre deux sessions de travail, la série d’improvisations réalisée en un soir par Adrien, Matthieu et James sert de pâte à modeler grésillante pour concevoir ce futur disque. De ce magma initial mêlant boîtes à rythmes, synthétiseur Juno et déluge d’effets pyrotechniques, prennent alors forme des plages accidentées où se dévoilent petit à petit de larges nappes enveloppant l’auditeur dans une véritable coulée de lave. Pétrifié, il prend alors tout le temps de se laisser envahir par les nombreuses textures de l’ensemble...\r\nEmportant tout sur leur passage, les 4 geisers glougloutants déployés ici évoluent par saccades pour ramener des profondeurs cette mystérieuse dent de dragon. Instinctive, brute et pourtant maîtrisée, l’énergie bouillonnante de cet album prouve une fois de plus que la première idée est souvent la bonne.\r\n\r\nDragon’s Teeth, la 33eme sortie de Da ! Heard It Records est distribuée sous licence Creative Commons BY-NC-ND, l’album est librement écoutable et téléchargeable à l’adresse suivante : http://www.daheardit-records.net/fr/discography/dhr-33\r\n\r\nCommuniqué de presse par <a href=\"http://germainfraisse.com/\">Germain</a>', 'fr');

-- --------------------------------------------------------

--
-- Structure de la table `sf_guard_forgot_password`
--

DROP TABLE IF EXISTS `sf_guard_forgot_password`;
CREATE TABLE `sf_guard_forgot_password` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `unique_key` varchar(255) DEFAULT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `sf_guard_group`
--

DROP TABLE IF EXISTS `sf_guard_group`;
CREATE TABLE `sf_guard_group` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `sf_guard_group_permission`
--

DROP TABLE IF EXISTS `sf_guard_group_permission`;
CREATE TABLE `sf_guard_group_permission` (
  `group_id` bigint(20) NOT NULL DEFAULT '0',
  `permission_id` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `sf_guard_permission`
--

DROP TABLE IF EXISTS `sf_guard_permission`;
CREATE TABLE `sf_guard_permission` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `sf_guard_remember_key`
--

DROP TABLE IF EXISTS `sf_guard_remember_key`;
CREATE TABLE `sf_guard_remember_key` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `remember_key` varchar(32) DEFAULT NULL,
  `ip_address` varchar(50) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `sf_guard_user`
--

DROP TABLE IF EXISTS `sf_guard_user`;
CREATE TABLE `sf_guard_user` (
  `id` bigint(20) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email_address` varchar(255) NOT NULL,
  `username` varchar(128) NOT NULL,
  `algorithm` varchar(128) NOT NULL DEFAULT 'sha1',
  `salt` varchar(128) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_super_admin` tinyint(1) DEFAULT '0',
  `last_login` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `sf_guard_user`
--

INSERT INTO `sf_guard_user` (`id`, `first_name`, `last_name`, `email_address`, `username`, `algorithm`, `salt`, `password`, `is_active`, `is_super_admin`, `last_login`, `created_at`, `updated_at`) VALUES
(9, NULL, NULL, 'bertier@constructions-incongrues.net', 'bertier', 'sha1', 'fd8a4efb1273dc97b242edcc7c5a066f', '6cadd6bf19d169616f3273642d657ddcedbbfa7c', 1, 1, '2016-11-29 23:11:40', '2012-07-05 12:40:17', '2016-11-29 23:11:40'),
(10, NULL, NULL, 'bozoorak@gmail.com', 'bozoo', 'sha1', '668924640d95bbdff4420270bb29fc38', '3632db9649ad83cf42c29c1bdb71b181cd2c4c71', 1, 1, '2017-04-17 12:18:10', '2012-07-05 12:40:17', '2017-04-17 12:18:10');

-- --------------------------------------------------------

--
-- Structure de la table `sf_guard_user_group`
--

DROP TABLE IF EXISTS `sf_guard_user_group`;
CREATE TABLE `sf_guard_user_group` (
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `group_id` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `sf_guard_user_permission`
--

DROP TABLE IF EXISTS `sf_guard_user_permission`;
CREATE TABLE `sf_guard_user_permission` (
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `permission_id` bigint(20) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `track`
--

DROP TABLE IF EXISTS `track`;
CREATE TABLE `track` (
  `id` bigint(20) NOT NULL,
  `title` text,
  `number` bigint(20) DEFAULT NULL,
  `release_id` bigint(20) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `track`
--

INSERT INTO `track` (`id`, `title`, `number`, `release_id`, `slug`, `created_at`, `updated_at`) VALUES
(910, 'Loading', 1, 15, 'loading-1', '2012-07-05 12:40:19', '2012-07-05 12:40:19'),
(911, 'Diego', 2, 15, 'diego', '2012-07-05 12:40:19', '2012-07-05 12:40:19'),
(912, 'Ro- Or Nanobot, Who Cares ?', 3, 15, 'ro-or-nanobot-who-cares', '2012-07-05 12:40:19', '2012-07-05 12:40:19'),
(913, 'GTG', 4, 15, 'gtg', '2012-07-05 12:40:19', '2012-07-05 12:40:19'),
(914, 'For Robots', 5, 15, 'for-robots', '2012-07-05 12:40:19', '2012-07-05 12:40:19'),
(915, 'Guru Meditation', 6, 15, 'guru-meditation', '2012-07-05 12:40:19', '2012-07-05 12:40:19'),
(916, 'Synthetisator', 7, 15, 'synthetisator', '2012-07-05 12:40:19', '2012-07-05 12:40:19'),
(917, 'Herz Aus Gold', 8, 15, 'herz-aus-gold', '2012-07-05 12:40:19', '2012-07-05 12:40:19'),
(918, 'Electric People', 9, 15, 'electric-people', '2012-07-05 12:40:19', '2012-07-05 12:40:19'),
(919, 'Robot Or Nanobot ? | remix by Low Bit Revolte', 10, 15, 'robot-or-nanobot-remix-by-low-bit-revolte', '2012-07-05 12:40:19', '2012-07-05 12:40:19'),
(920, 'For Robots Friendly Floater Mix | remixed by Rico Zerone', 11, 15, 'for-robots-friendly-floater-mix-remixed-by-rico-zerone', '2012-07-05 12:40:19', '2012-07-05 12:40:19'),
(921, 'Blast', 1, 16, 'blast', '2012-07-05 12:40:19', '2012-07-05 12:40:19'),
(922, 'Gameboy Love', 2, 16, 'gameboy-love', '2012-07-05 12:40:19', '2012-07-05 12:40:19'),
(923, 'God Bless His Mess', 3, 16, 'god-bless-his-mess', '2012-07-05 12:40:19', '2012-07-05 12:40:19'),
(924, '3D(istortion)', 4, 16, '3d-istortion', '2012-07-05 12:40:19', '2012-07-05 12:40:19'),
(925, 'I Want You', 5, 16, 'i-want-you', '2012-07-05 12:40:19', '2012-07-05 12:40:19'),
(934, 'Planet 16', 1, 18, 'planet-16', '2012-07-05 12:40:19', '2012-07-05 12:40:19'),
(935, 'Yo Yo Yo', 2, 18, 'yo-yo-yo', '2012-07-05 12:40:19', '2012-07-05 12:40:19'),
(936, 'Droids Are Coming', 3, 18, 'droids-are-coming', '2012-07-05 12:40:19', '2012-07-05 12:40:19'),
(937, 'Monster Chase', 4, 18, 'monster-chase', '2012-07-05 12:40:19', '2012-07-05 12:40:19'),
(938, 'Ich Viel Spielen', 5, 18, 'ich-viel-spielen', '2012-07-05 12:40:19', '2012-07-05 12:40:19'),
(939, 'Mushrooms', 6, 18, 'mushrooms', '2012-07-05 12:40:19', '2012-07-05 12:40:19'),
(940, 'Robots Unite', 7, 18, 'robots-unite', '2012-07-05 12:40:19', '2012-07-05 12:40:19'),
(941, 'Plan 9', 8, 18, 'plan-9', '2012-07-05 12:40:19', '2012-07-05 12:40:19'),
(942, 'Good Night Little Robot', 9, 18, 'good-night-little-robot', '2012-07-05 12:40:19', '2012-07-05 12:40:19'),
(943, 'Pont', 1, 20, 'pont', '2012-11-26 14:28:10', '2012-11-26 14:28:10'),
(944, 'Serenade', 2, 20, 'serenade', '2012-11-26 14:28:10', '2012-11-26 14:28:10'),
(945, 'Descendre', 3, 20, 'descendre', '2012-11-26 14:29:07', '2012-11-26 14:29:07'),
(946, 'Esperanza (Tribute to André Minvielle)', 4, 20, 'esperanza-tribute-to-andre-minvielle', '2012-11-26 14:29:07', '2012-11-26 14:29:07'),
(947, 'Escalier', 5, 20, 'escalier', '2012-11-26 14:29:27', '2012-11-26 14:29:27'),
(1044, 'In', 1, 21, 'in', '2013-02-20 21:48:41', '2013-02-20 21:48:41'),
(1045, 'Gazon', 2, 21, 'gazon', '2013-02-20 21:48:42', '2013-02-20 21:48:42'),
(1046, 'Gyrophares', 3, 21, 'gyrophares', '2013-02-20 21:48:42', '2013-02-20 21:48:42'),
(1047, 'Le Cheval Africain', 4, 21, 'le-cheval-africain', '2013-02-20 21:48:43', '2013-02-20 21:48:43'),
(1048, '60', 5, 21, '60', '2013-02-20 21:48:43', '2013-02-20 21:48:43'),
(1049, 'Sans Permis', 6, 21, 'sans-permis', '2013-02-20 21:48:43', '2013-02-20 21:48:43'),
(1050, 'Café', 7, 21, 'cafe', '2013-02-20 21:48:43', '2013-02-20 21:48:43'),
(1051, 'Propylène v2', 8, 21, 'propylene-v2', '2013-02-20 21:48:43', '2013-02-20 21:48:43'),
(1052, 'Vol à Main Nue', 9, 21, 'vol-a-main-nue', '2013-02-20 21:48:44', '2013-02-20 21:48:44'),
(1053, 'Swim Like a...', 10, 21, 'swim-like-a', '2013-02-20 21:48:44', '2013-02-20 21:48:44'),
(1054, 'Hart l\'Aumônier', 11, 21, 'hart-l-aumonier', '2013-02-20 21:48:44', '2013-02-20 21:48:44'),
(1055, 'Erreur de Jeunesse', 12, 21, 'erreur-de-jeunesse', '2013-02-20 21:48:44', '2013-02-20 21:48:44'),
(1056, 'April 26', 13, 21, 'april-26', '2013-02-20 21:48:44', '2013-02-20 21:48:44'),
(1057, 'Cervelet', 14, 21, 'cervelet', '2013-02-20 21:48:44', '2013-02-20 21:48:44'),
(1058, 'Ah Oui', 15, 21, 'ah-oui', '2013-02-20 21:48:44', '2013-02-20 21:48:44'),
(1059, 'Retourné Acrobatique', 16, 21, 'retourne-acrobatique', '2013-02-20 21:48:44', '2013-02-20 21:48:44'),
(1060, 'PLOQ', 1, 22, 'ploq', '2013-10-01 17:58:32', '2013-10-01 17:58:32'),
(1061, 'EP+', 2, 22, 'ep', '2013-10-01 17:58:32', '2013-10-01 17:58:32'),
(1062, 'LICHT', 3, 22, 'licht', '2013-10-01 17:58:32', '2013-10-01 17:58:32'),
(1063, 'COMPUTER CONTROL', 4, 22, 'computer-control', '2013-10-01 17:58:32', '2013-10-01 17:58:32'),
(1064, 'ARKADASCH', 5, 22, 'arkadasch', '2013-10-01 17:58:32', '2013-10-01 17:58:32'),
(1065, 'MASCHINE', 6, 22, 'maschine', '2013-10-01 17:58:32', '2013-10-01 17:58:32'),
(1066, 'YVBR', 7, 22, 'yvbr', '2013-10-01 17:58:32', '2013-10-01 17:58:32'),
(1067, 'CLUB GESPENSTER', 8, 22, 'club-gespenster', '2013-10-01 17:58:32', '2013-10-01 17:58:32'),
(1068, 'YOU ARE RIGHT', 9, 22, 'you-are-right', '2013-10-01 17:58:32', '2013-10-01 17:58:32'),
(1069, 'GLEICHTAKT', 10, 22, 'gleichtakt', '2013-10-01 17:58:32', '2013-10-01 17:58:32'),
(1070, 'NORTH', 11, 22, 'north', '2013-10-01 17:58:32', '2013-10-01 17:58:32'),
(1152, 'La lenteur des mouvements', 1, 23, 'la-lenteur-des-mouvements', '2013-10-15 20:26:53', '2013-10-15 20:26:53'),
(1153, 'Une activité animale insoupçonnée', 2, 23, 'une-activite-animale-insoupconnee', '2013-10-15 20:26:57', '2013-10-15 20:26:57'),
(1154, 'Vieux renard', 3, 23, 'vieux-renard', '2013-10-15 20:27:03', '2013-10-15 20:27:03'),
(1155, 'Je ne suis pas un animal', 4, 23, 'je-ne-suis-pas-un-animal', '2013-10-15 20:27:09', '2013-10-15 20:27:09'),
(1156, 'Les loups sont toujours dans le parages', 5, 23, 'les-loups-sont-toujours-dans-le-parages', '2013-10-15 20:27:17', '2013-10-15 20:27:17'),
(1157, 'Les loups fêtent leur victoire', 6, 23, 'les-loups-fetent-leur-victoire', '2013-10-15 20:27:24', '2013-10-15 20:27:24'),
(1158, 'Entre les dents du tigre', 7, 23, 'entre-les-dents-du-tigre', '2013-10-15 20:27:33', '2013-10-15 20:27:33'),
(1159, 'Un Sanglier (interlude)', 8, 23, 'un-sanglier-interlude', '2013-10-15 20:27:41', '2013-10-15 20:27:41'),
(1160, 'Renard fatigué', 9, 23, 'renard-fatigue', '2013-10-15 20:27:42', '2013-10-15 20:27:42'),
(1161, 'Entre les dents du tigre (version courte)', 10, 23, 'entre-les-dents-du-tigre-version-courte', '2013-10-15 20:27:46', '2013-10-15 20:27:46'),
(1166, 'Dj Black Negro - Intro', 1, 24, 'dj-black-negro-intro', '2013-12-05 22:03:57', '2013-12-05 22:03:57'),
(1167, 'Neophite - Recession', 2, 24, 'neophite-recession', '2013-12-05 22:03:57', '2013-12-05 22:03:57'),
(1168, 'The Lord Of The Old Scool - Introducng The Old Testament Style', 3, 24, 'the-lord-of-the-old-scool-introducng-the-old-testament-style', '2013-12-05 22:03:57', '2013-12-05 22:03:57'),
(1169, 'The Fun Lovin\' Vaginals - I Wanna Fuck You Up', 4, 24, 'the-fun-lovin-vaginals-i-wanna-fuck-you-up', '2013-12-05 22:03:57', '2013-12-05 22:03:57'),
(1170, 'Techno G - Pumpin', 5, 24, 'techno-g-pumpin', '2013-12-05 22:03:57', '2013-12-05 22:03:57'),
(1171, 'Dj Kannibal Freak - The Cannibal Generals Of Liberia', 6, 24, 'dj-kannibal-freak-the-cannibal-generals-of-liberia', '2013-12-05 22:03:57', '2013-12-05 22:03:57'),
(1172, 'GG Allal - Rest In Piss', 7, 24, 'gg-allal-rest-in-piss', '2013-12-05 22:03:57', '2013-12-05 22:03:57'),
(1173, 'T.N.T - Brainswashkiller', 8, 24, 't-n-t-brainswashkiller', '2013-12-05 22:03:57', '2013-12-05 22:03:57'),
(1174, 'Klass Of 86 - Hatred Is Purity', 9, 24, 'klass-of-86-hatred-is-purity', '2013-12-05 22:03:57', '2013-12-05 22:03:57'),
(1175, 'Dj Black Negro - Lower East Side', 10, 24, 'dj-black-negro-lower-east-side', '2013-12-05 22:03:57', '2013-12-05 22:03:57'),
(1176, 'DJ Brico Montage - 62 Façons de tuer un homme', 11, 24, 'dj-brico-montage-62-facons-de-tuer-un-homme', '2013-12-05 22:03:57', '2013-12-05 22:03:57'),
(1177, 'Zombi Zoba - Bath Salt In Miami', 12, 24, 'zombi-zoba-bath-salt-in-miami', '2013-12-05 22:03:57', '2013-12-05 22:03:57'),
(1178, 'The Kollaborator - A Taste Of The Old Country', 13, 24, 'the-kollaborator-a-taste-of-the-old-country', '2013-12-05 22:03:57', '2013-12-05 22:03:57'),
(1179, 'Elephant Dragon - No Prohibition For The Coalition', 14, 24, 'elephant-dragon-no-prohibition-for-the-coalition', '2013-12-05 22:03:57', '2013-12-05 22:03:57'),
(1180, 'Klass Of 86 - I\'m In The [Thunder] Mood For A [Thunder] Mode', 15, 24, 'klass-of-86-i-m-in-the-thunder-mood-for-a-thunder-mode', '2013-12-05 22:03:57', '2013-12-05 22:03:57'),
(1181, 'Kolt - I\'m A DJ ; I\'m A Preak', 16, 24, 'kolt-i-m-a-dj-i-m-a-preak', '2013-12-05 22:03:57', '2013-12-05 22:03:57'),
(1182, 'Pee Wee Ass Vs Dee Dee Puss - Torture Garden', 17, 24, 'pee-wee-ass-vs-dee-dee-puss-torture-garden', '2013-12-05 22:03:57', '2013-12-05 22:03:57'),
(1183, 'Slash Norton - This Is A Public Fuckin Domain To Me Anyway', 18, 24, 'slash-norton-this-is-a-public-fuckin-domain-to-me-anyway', '2013-12-05 22:03:57', '2013-12-05 22:03:57'),
(1217, 'Comme une gomme', 1, 25, 'comme-une-gomme', '2014-01-18 14:05:59', '2014-01-18 14:05:59'),
(1218, 'Prudentia prudentium', 10, 25, 'prudentia-prudentium', '2014-01-18 14:06:05', '2014-01-18 14:06:05'),
(1219, 'Pizza Spinoza', 11, 25, 'pizza-spinoza', '2014-01-18 14:06:12', '2014-01-18 14:06:12'),
(1220, 'Mourir c\'est nul', 12, 25, 'mourir-c-est-nul', '2014-01-18 14:06:17', '2014-01-18 14:06:17'),
(1221, 'Boys band', 13, 25, 'boys-band', '2014-01-18 14:06:17', '2014-01-18 14:06:17'),
(1222, 'Supermale', 14, 25, 'supermale', '2014-01-18 14:06:24', '2014-01-18 14:06:24'),
(1223, 'Lo que quiero', 15, 25, 'lo-que-quiero', '2014-01-18 14:06:28', '2014-01-18 14:06:28'),
(1224, 'Let me shave', 2, 25, 'let-me-shave', '2014-01-18 14:06:35', '2014-01-18 14:06:35'),
(1225, 'Partytime', 3, 25, 'partytime', '2014-01-18 14:06:41', '2014-01-18 14:06:41'),
(1226, 'Baby belle', 4, 25, 'baby-bell', '2014-01-18 14:06:48', '2014-01-18 14:06:48'),
(1227, 'Bagarre générale', 5, 25, 'bagarre-generale', '2014-01-18 14:06:54', '2014-01-18 14:06:54'),
(1228, 'Schönen ball', 6, 25, 'schoenen-ball', '2014-01-18 14:07:02', '2014-01-18 14:07:02'),
(1229, 'Dans mes rêves', 7, 25, 'dans-mes-reves', '2014-01-18 14:07:08', '2014-01-18 14:07:08'),
(1230, 'Scratch on my Peugeot', 8, 25, 'scratch-on-my-peugeot', '2014-01-18 14:07:16', '2014-01-18 14:07:16'),
(1231, 'Chanson triste', 9, 25, 'chanson-triste', '2014-01-18 14:07:22', '2014-01-18 14:07:22'),
(1232, '12-49', 1, 14, '12-49', '2014-05-16 20:33:33', '2014-05-16 20:33:33'),
(1233, '11-28', 2, 14, '11-28', '2014-05-16 20:34:11', '2014-05-16 20:34:11'),
(1234, '7-35', 3, 14, '7-35', '2014-05-16 20:34:46', '2014-05-16 20:34:46'),
(1235, '8-22', 4, 14, '8-22', '2014-05-16 20:35:10', '2014-05-16 20:35:10'),
(1236, '4-53', 5, 14, '4-53', '2014-05-16 20:35:34', '2014-05-16 20:35:34'),
(1237, '10-17', 6, 14, '10-17', '2014-05-16 20:35:49', '2014-05-16 20:35:49'),
(1238, '7-47', 7, 14, '7-47', '2014-05-16 20:36:22', '2014-05-16 20:36:22'),
(1312, 'Le Pique-nique', 1, 26, 'le-pique-nique', '2014-06-04 10:23:59', '2014-06-04 10:23:59'),
(1313, 'Le Soldat', 2, 26, 'le-soldat', '2014-06-04 10:24:11', '2014-06-04 10:24:11'),
(1314, 'Le Naufragé', 3, 26, 'le-naufrage', '2014-06-04 10:24:23', '2014-06-04 10:24:23'),
(1315, 'L\'extraterrestre', 4, 26, 'l-extraterrestre', '2014-06-04 10:24:41', '2014-06-04 10:24:41'),
(1316, 'Les Plongeurs', 5, 26, 'les-plongeurs', '2014-06-04 10:24:58', '2014-06-04 10:24:58'),
(1317, 'Le Cas Ferguson', 6, 26, 'le-cas-ferguson', '2014-06-04 10:25:10', '2014-06-04 10:25:10'),
(1318, 'Les Fantômes', 7, 26, 'les-fantomes', '2014-06-04 10:25:43', '2014-06-04 10:25:43'),
(1369, 'Fiesta muerta', 1, 27, 'fiesta-muerta', '2014-09-25 18:22:42', '2014-09-25 18:22:42'),
(1370, 'Ghetto 70', 2, 27, 'ghetto-70', '2014-09-25 18:22:58', '2014-09-25 18:22:58'),
(1371, 'Jungle juice', 3, 27, 'jungle-juice', '2014-09-25 18:23:15', '2014-09-25 18:23:15'),
(1372, 'Granny\'s birthday', 4, 27, 'granny-s-birthday', '2014-09-25 18:23:39', '2014-09-25 18:23:39'),
(1373, 'Banjo from hell', 5, 27, 'banjo-from-hell', '2014-09-25 18:23:52', '2014-09-25 18:23:52'),
(1374, 'Garlic makes me cry', 6, 27, 'garlic-makes-me-cry', '2014-09-25 18:24:01', '2014-09-25 18:24:01'),
(1375, 'Meat me', 7, 27, 'meat-me', '2014-09-25 18:24:18', '2014-09-25 18:24:18'),
(1376, 'Brutal sex', 8, 27, 'brutal-sex', '2014-09-25 18:24:42', '2014-09-25 18:24:42'),
(1377, 'Death in Legoland', 9, 27, 'death-in-legoland', '2014-09-25 18:24:54', '2014-09-25 18:24:54'),
(1378, 'Help', 10, 27, 'help', '2014-09-25 18:25:22', '2014-09-25 18:25:22'),
(1379, 'Rabbit box', 11, 27, 'rabbit-box', '2014-09-25 18:25:38', '2014-09-25 18:25:38'),
(1380, 'Aelita', 12, 27, 'aelita', '2014-09-25 18:25:55', '2014-09-25 18:25:55'),
(1394, 'on semballe les couilles', 1, 28, 'on-semballe-les-couilles', '2014-11-19 23:14:14', '2014-11-19 23:14:14'),
(1395, 'j\'ai vu un chien (mais c\'etait une femelle)', 2, 28, 'j-ai-vu-un-chien-mais-c-etait-une-femelle', '2014-11-19 23:14:23', '2014-11-19 23:14:23'),
(1396, 'oui c\'est moi charles torris', 3, 28, 'oui-c-est-moi-charles-torris', '2014-11-19 23:14:33', '2014-11-19 23:14:33'),
(1397, 'fausse marade', 4, 28, 'fausse-marade', '2014-11-19 23:14:43', '2014-11-19 23:14:43'),
(1398, 'carnage sur l\'autoroute', 5, 28, 'carnage-sur-l-autoroute', '2014-11-19 23:14:58', '2014-11-19 23:14:58'),
(1399, 'triple Q', 6, 28, 'triple-q', '2014-11-19 23:15:06', '2014-11-19 23:15:06'),
(1400, 'nouvel évier', 7, 28, 'nouvel-evier', '2014-11-19 23:15:15', '2014-11-19 23:15:15'),
(1401, 'lechec toujours lechec', 8, 28, 'lechec-toujours-lechec', '2014-11-19 23:15:26', '2014-11-19 23:15:26'),
(1402, 'hector la pornographie', 9, 28, 'hector-la-pornographie', '2014-11-19 23:15:37', '2014-11-19 23:15:37'),
(1403, 'Lucie est malade', 10, 28, 'lucie-est-malade', '2014-11-19 23:15:47', '2014-11-19 23:15:47'),
(1404, 'narrow', 11, 28, 'narrow', '2014-11-19 23:15:59', '2014-11-19 23:15:59'),
(1405, 'double death (bonus track)', 12, 28, 'double-death-bonus-track', '2014-11-19 23:16:10', '2014-11-19 23:16:10'),
(1406, 'retina (bonus track)', 13, 28, 'retina-bonus-track', '2014-11-19 23:16:18', '2014-11-19 23:16:18'),
(1416, 'Submersion', 1, 29, 'submersion', '2015-03-10 22:18:17', '2015-03-10 22:18:17'),
(1417, 'Fluo Aorta', 2, 29, 'fluo-aorta', '2015-03-10 22:18:36', '2015-03-10 22:18:36'),
(1418, 'Idea By Default', 3, 29, 'idea-by-default', '2015-03-10 22:18:46', '2015-03-10 22:18:46'),
(1419, 'Super Critical State', 4, 29, 'super-critical-state', '2015-03-10 22:19:03', '2015-03-10 22:19:03'),
(1420, 'Retour à la Normale', 5, 29, 'retour-a-la-normale', '2015-03-10 22:19:23', '2015-03-10 22:19:23'),
(1421, 'You', 6, 29, 'you', '2015-03-10 22:19:49', '2015-03-10 22:19:49'),
(1422, 'Spring Transformers', 7, 29, 'spring-transformers', '2015-03-10 22:20:07', '2015-03-10 22:20:07'),
(1423, 'The Exit', 8, 29, 'the-exit', '2015-03-10 22:20:21', '2015-03-10 22:20:21'),
(1438, 'Les Français Préférés Des Français', 1, 33, 'les-francais-preferes-des-francais', '2016-02-03 00:30:40', '2016-02-03 00:30:40'),
(1439, 'Les Animaux Sauvages', 2, 33, 'les-animaux-sauvages', '2016-02-03 00:30:55', '2016-02-03 00:30:55'),
(1440, 'Ton Tanga', 3, 33, 'ton-tanga', '2016-02-03 00:31:09', '2016-02-03 00:31:09'),
(1441, 'Petit Tricheur', 4, 33, 'petit-tricheur', '2016-02-03 00:31:16', '2016-02-03 00:31:16'),
(1442, 'Pistache', 5, 33, 'pistache', '2016-02-03 00:31:24', '2016-02-03 00:31:24'),
(1443, 'Farandole', 6, 33, 'farandole', '2016-02-03 00:31:34', '2016-02-03 00:31:34'),
(1444, 'Derrière Mon Guichet', 7, 33, 'derriere-mon-guichet', '2016-02-03 00:31:42', '2016-02-03 00:31:42'),
(1445, 'Fais-le Moi-le', 8, 33, 'fais-le-moi-le', '2016-02-03 00:31:51', '2016-02-03 00:31:51'),
(1446, 'Une Petite Motte de Peur', 9, 33, 'une-petite-motte-de-peur', '2016-02-03 00:32:01', '2016-02-03 00:32:01'),
(1447, 'Prehistronic', 10, 33, 'prehistronic', '2016-02-03 00:32:10', '2016-02-03 00:32:10'),
(1448, 'Pourquoi Pourquoi', 11, 33, 'pourquoi-pourquoi', '2016-02-03 00:32:20', '2016-02-03 00:32:20'),
(1449, 'Le Monopole du Cœur', 12, 33, 'le-monopole-du-coeur', '2016-02-03 00:32:27', '2016-02-03 00:32:27'),
(1450, 'T\'es dans l\'Armée Maintenant (feat. Michel Bertier)', 13, 33, 't-es-dans-l-armee-maintenant-feat-michel-bertier', '2016-02-03 00:32:36', '2016-02-03 00:32:36'),
(1467, 'Stipulite', 1, 34, 'stipulite', '2016-04-23 17:26:16', '2016-04-23 17:26:16'),
(1468, 'Exoplaste', 2, 34, 'exoplaste', '2016-04-23 17:26:30', '2016-04-23 17:26:30'),
(1469, 'Deglutogene', 3, 34, 'deglutogene', '2016-04-23 17:26:37', '2016-04-23 17:26:37'),
(1470, 'Tergiversure', 4, 34, 'tergiversure', '2016-04-23 17:26:46', '2016-04-23 17:26:46'),
(1471, 'Phoryaphile', 5, 34, 'phoryaphile', '2016-04-23 17:27:00', '2016-04-23 17:27:00'),
(1472, 'Gramafion', 6, 34, 'gramafion', '2016-04-23 17:27:10', '2016-04-23 17:27:10'),
(1473, 'Stratiformis', 7, 34, 'stratiformis', '2016-04-23 17:27:21', '2016-04-23 17:27:21'),
(1474, 'Grama_c_c_version', 8, 34, 'grama-c-c-version', '2016-04-23 17:27:34', '2016-04-23 17:27:34'),
(1521, 'Intro', 1, 1, 'intro', '2016-11-29 20:18:34', '2016-11-29 20:18:34'),
(1522, 'Complimenti', 2, 1, 'complimenti', '2016-11-29 20:18:35', '2016-11-29 20:18:35'),
(1523, 'Robocop (Police System Error)', 3, 1, 'robocop-police-system-error', '2016-11-29 20:18:41', '2016-11-29 20:18:41'),
(1524, 'Obtek (Wankers United RMX)', 4, 1, 'obtek-wankers-united-rmx', '2016-11-29 20:18:45', '2016-11-29 20:18:45'),
(1525, 'Give\'Em Da Boot', 5, 1, 'give-em-da-boot', '2016-11-29 20:18:54', '2016-11-29 20:18:54'),
(1526, 'Euritmix Sux My Dix', 6, 1, 'euritmix-sux-my-dix', '2016-11-29 20:19:04', '2016-11-29 20:19:04'),
(1527, 'The Cave (Ask Olli - Computer Truck RMX)', 7, 1, 'the-cave-ask-olli-computer-truck-rmx', '2016-11-29 20:19:10', '2016-11-29 20:19:10'),
(1528, 'I See Zombie', 8, 1, 'i-see-zombie', '2016-11-29 20:19:22', '2016-11-29 20:19:22'),
(1529, 'Garage A Gogo (John C.Holmes Mix)', 9, 1, 'garage-a-gogo-john-c-holmes-mix', '2016-11-29 20:19:35', '2016-11-29 20:19:35'),
(1530, 'Cracovian Scene (Feat Yan From BenEtBene)', 10, 1, 'cracovian-scene-feat-yan-from-benetbene', '2016-11-29 20:19:47', '2016-11-29 20:19:47'),
(1531, 'Damn Noisy Kidz', 11, 1, 'damn-noisy-kidz', '2016-11-29 20:19:53', '2016-11-29 20:19:53'),
(1532, 'SolideWanker In A Nazi Truckkk... (Feat Wankers United)', 12, 1, 'solidewanker-in-a-nazi-truckkk-feat-wankers-united', '2016-11-29 20:19:59', '2016-11-29 20:19:59'),
(1533, 'Mom', 13, 1, 'mom', '2016-11-29 20:20:05', '2016-11-29 20:20:05'),
(1534, 'Outro - Insect R', 14, 1, 'outro-insect-r', '2016-11-29 20:20:10', '2016-11-29 20:20:10'),
(1535, 'Final Outro - I See Zombiezzz Dark Side & Parallel Dimen', 15, 1, 'final-outro-i-see-zombiezzz-dark-side-parallel-dimen', '2016-11-29 20:20:11', '2016-11-29 20:20:11'),
(1536, 'Flipside Instru (Feat Wankers United)', 16, 1, 'flipside-instru-feat-wankers-united', '2016-11-29 20:20:23', '2016-11-29 20:20:23'),
(1537, 'Cp-L', 1, 2, 'cp-l', '2016-11-29 20:25:57', '2016-11-29 20:25:57'),
(1538, 'Datahell', 2, 2, 'datahell', '2016-11-29 20:26:02', '2016-11-29 20:26:02'),
(1539, 'Exy', 3, 2, 'exy', '2016-11-29 20:26:06', '2016-11-29 20:26:06'),
(1540, 'Bullcactus', 4, 2, 'bullcactus', '2016-11-29 20:26:10', '2016-11-29 20:26:10'),
(1541, 'Soft Commando', 5, 2, 'soft-commando', '2016-11-29 20:26:17', '2016-11-29 20:26:17'),
(1542, 'Monster', 6, 2, 'monster', '2016-11-29 20:26:21', '2016-11-29 20:26:21'),
(1543, 'Spill', 7, 2, 'spill', '2016-11-29 20:26:25', '2016-11-29 20:26:25'),
(1544, 'Markus', 8, 2, 'markus', '2016-11-29 20:26:26', '2016-11-29 20:26:26'),
(1545, 'Rofon', 9, 2, 'rofon', '2016-11-29 20:26:31', '2016-11-29 20:26:31'),
(1546, 'Datahell Beta', 10, 2, 'datahell-beta', '2016-11-29 20:26:38', '2016-11-29 20:26:38'),
(1547, 'Monster', 11, 2, 'monster-1', '2016-11-29 20:26:41', '2016-11-29 20:26:41'),
(1548, 'Brest', 1, 3, 'brest', '2016-11-29 20:28:42', '2016-11-29 20:28:42'),
(1549, 'Comines - Komen', 2, 3, 'comines-komen', '2016-11-29 20:28:50', '2016-11-29 20:28:50'),
(1550, 'Paris Ill Town', 3, 3, 'paris-ill-town', '2016-11-29 20:29:00', '2016-11-29 20:29:00'),
(1551, 'Boubek', 4, 3, 'boubek', '2016-11-29 20:29:07', '2016-11-29 20:29:07'),
(1569, 'Jesus Mega Score XXX', 1, 4, 'jesus-mega-score-xxx', '2016-11-29 20:37:31', '2016-11-29 20:37:31'),
(1570, 'Chopin Is A Fuckin\' Brother ', 2, 4, 'chopin-is-a-fuckin-brother', '2016-11-29 20:37:37', '2016-11-29 20:37:37'),
(1571, 'Pixel Jazz X ', 3, 4, 'pixel-jazz-x', '2016-11-29 20:37:43', '2016-11-29 20:37:43'),
(1572, 'The Binary Disco Killer ', 4, 4, 'the-binary-disco-killer', '2016-11-29 20:37:48', '2016-11-29 20:37:48'),
(1573, 'Moshi Moshi Kiss', 5, 4, 'moshi-moshi-kiss', '2016-11-29 20:37:55', '2016-11-29 20:37:55'),
(1574, 'Bionic Samouraiii', 6, 4, 'bionic-samouraiii', '2016-11-29 20:38:01', '2016-11-29 20:38:01'),
(1575, 'Papi Danse ', 7, 4, 'papi-danse', '2016-11-29 20:38:07', '2016-11-29 20:38:07'),
(1576, 'Delicious Peanut', 8, 4, 'delicious-peanut', '2016-11-29 20:38:10', '2016-11-29 20:38:10'),
(1577, 'Strawberries Panic', 9, 4, 'strawberries-panic', '2016-11-29 20:38:14', '2016-11-29 20:38:14'),
(1578, 'This Lovely Snake', 10, 4, 'this-lovely-snake', '2016-11-29 20:38:21', '2016-11-29 20:38:21'),
(1579, 'La Sphère La Terre', 11, 4, 'la-sphere-la-terre', '2016-11-29 20:38:27', '2016-11-29 20:38:27'),
(1580, 'Distortion Dimension X', 12, 4, 'distortion-dimension-x', '2016-11-29 20:38:31', '2016-11-29 20:38:31'),
(1581, 'Pxlcoucou', 13, 4, 'pxlcoucou', '2016-11-29 20:38:47', '2016-11-29 20:38:47'),
(1582, 'Hello! Hello! Hello!', 1, 5, 'hello-hello-hello', '2016-11-29 20:42:06', '2016-11-29 20:42:06'),
(1583, '414', 2, 5, '414', '2016-11-29 20:42:07', '2016-11-29 20:42:07'),
(1584, 'Oh Hoity - Toity Are We', 3, 5, 'oh-hoity-toity-are-we', '2016-11-29 20:42:16', '2016-11-29 20:42:16'),
(1585, 'Miniland', 4, 5, 'miniland', '2016-11-29 20:42:23', '2016-11-29 20:42:23'),
(1586, 'Select A', 5, 5, 'select-a', '2016-11-29 20:42:25', '2016-11-29 20:42:25'),
(1587, 'Bitter Bleeps', 6, 5, 'bitter-bleeps', '2016-11-29 20:42:33', '2016-11-29 20:42:33'),
(1588, 'It\'s A Long Way To The Top', 7, 5, 'it-s-a-long-way-to-the-top', '2016-11-29 20:42:42', '2016-11-29 20:42:42'),
(1589, 'Piepmatz', 8, 5, 'piepmatz', '2016-11-29 20:42:52', '2016-11-29 20:42:52'),
(1590, 'Rage Against The Highscore', 9, 5, 'rage-against-the-highscore', '2016-11-29 20:42:54', '2016-11-29 20:42:54'),
(1591, 'Miniland2', 10, 5, 'miniland2', '2016-11-29 20:43:03', '2016-11-29 20:43:03'),
(1592, 'Rave On You Zappelphilipp', 11, 5, 'rave-on-you-zappelphilipp', '2016-11-29 20:43:04', '2016-11-29 20:43:04'),
(1593, 'Intro - Jabberwocky', 1, 6, 'intro-jabberwocky', '2016-11-29 20:45:58', '2016-11-29 20:45:58'),
(1594, 'Prophet Punk', 2, 6, 'prophet-punk', '2016-11-29 20:46:03', '2016-11-29 20:46:03'),
(1595, 'Type Your Text', 3, 6, 'type-your-text', '2016-11-29 20:46:09', '2016-11-29 20:46:09'),
(1596, 'Firestorm', 4, 6, 'firestorm', '2016-11-29 20:46:17', '2016-11-29 20:46:17'),
(1597, 'I Wanna Be', 5, 6, 'i-wanna-be', '2016-11-29 20:46:24', '2016-11-29 20:46:24'),
(1598, 'Robot Science', 6, 6, 'robot-science', '2016-11-29 20:46:31', '2016-11-29 20:46:31'),
(1599, 'The Land Of The Ghosts', 7, 6, 'the-land-of-the-ghosts', '2016-11-29 20:46:37', '2016-11-29 20:46:37'),
(1600, 'Oi! The Posers (Remix)', 8, 6, 'oi-the-posers-remix', '2016-11-29 20:46:45', '2016-11-29 20:46:45'),
(1601, 'Rocket Base', 9, 6, 'rocket-base', '2016-11-29 20:46:58', '2016-11-29 20:46:58'),
(1602, 'Syntax Error', 10, 6, 'syntax-error', '2016-11-29 20:47:03', '2016-11-29 20:47:03'),
(1603, 'Space Invaders', 11, 6, 'space-invaders', '2016-11-29 20:47:08', '2016-11-29 20:47:08'),
(1604, 'Monster Planet', 12, 6, 'monster-planet', '2016-11-29 20:47:15', '2016-11-29 20:47:15'),
(1605, 'Pit Stop', 13, 6, 'pit-stop', '2016-11-29 20:47:23', '2016-11-29 20:47:23'),
(1606, 'Computer Toy', 14, 6, 'computer-toy', '2016-11-29 20:47:30', '2016-11-29 20:47:30'),
(1607, 'Deutschland Muss Sterben (Slime Cover)', 15, 6, 'deutschland-muss-sterben-slime-cover', '2016-11-29 20:47:37', '2016-11-29 20:47:37'),
(1608, 'Red Lights', 1, 7, 'red-lights', '2016-11-29 20:52:16', '2016-11-29 20:52:16'),
(1609, 'The Dj Theory', 2, 7, 'the-dj-theory', '2016-11-29 20:52:21', '2016-11-29 20:52:21'),
(1610, 'Rez', 3, 7, 'rez', '2016-11-29 20:52:29', '2016-11-29 20:52:29'),
(1611, 'Break Bite', 4, 7, 'break-bite', '2016-11-29 20:52:35', '2016-11-29 20:52:35'),
(1612, 'Grotesque', 5, 7, 'grotesque', '2016-11-29 20:52:41', '2016-11-29 20:52:41'),
(1613, 'Kids On Acid', 6, 7, 'kids-on-acid', '2016-11-29 20:52:47', '2016-11-29 20:52:47'),
(1614, 'Tekmood', 7, 7, 'tekmood', '2016-11-29 20:52:51', '2016-11-29 20:52:51'),
(1615, 'Sputnik Brothers', 8, 7, 'sputnik-brothers', '2016-11-29 20:52:54', '2016-11-29 20:52:54'),
(1616, 'Fucked', 9, 7, 'fucked', '2016-11-29 20:53:01', '2016-11-29 20:53:01'),
(1617, ' Billybob Enquete', 1, 8, 'billybob-enquete', '2016-11-29 20:54:59', '2016-11-29 20:54:59'),
(1618, ' L\'hymne Des Nounours', 2, 8, 'l-hymne-des-nounours', '2016-11-29 20:55:05', '2016-11-29 20:55:05'),
(1619, ' Kawaii Nuigurumi', 3, 8, 'kawaii-nuigurumi', '2016-11-29 20:55:12', '2016-11-29 20:55:12'),
(1620, ' Le Coup De Blues Des Héros', 4, 8, 'le-coup-de-blues-des-heros', '2016-11-29 20:55:21', '2016-11-29 20:55:21'),
(1621, ' Sans Frontières (Awareness)', 5, 8, 'sans-frontieres-awareness', '2016-11-29 20:55:29', '2016-11-29 20:55:29'),
(1622, ' Gros Doudou Et Le Pays Du Libre Echange', 6, 8, 'gros-doudou-et-le-pays-du-libre-echange', '2016-11-29 20:55:39', '2016-11-29 20:55:39'),
(1623, ' Harry Pretty (C\'est Beau La Vie)', 7, 8, 'harry-pretty-c-est-beau-la-vie', '2016-11-29 20:55:46', '2016-11-29 20:55:46'),
(1624, ' Les Angoisses Existencielles De Couin Couin Le Canard', 8, 8, 'les-angoisses-existencielles-de-couin-couin-le-canard', '2016-11-29 20:55:53', '2016-11-29 20:55:53'),
(1625, ' ...Eh Bien ! Dansez Maintenant!', 9, 8, 'eh-bien-dansez-maintenant', '2016-11-29 20:56:03', '2016-11-29 20:56:03'),
(1626, 'Loading', 1, 9, 'loading', '2016-11-29 20:59:20', '2016-11-29 20:59:20'),
(1627, 'Chipset', 2, 9, 'chipset', '2016-11-29 20:59:23', '2016-11-29 20:59:23'),
(1628, 'This Is Amiga Speaking', 3, 9, 'this-is-amiga-speaking', '2016-11-29 20:59:30', '2016-11-29 20:59:30'),
(1629, 'Paula And Sid', 4, 9, 'paula-and-sid', '2016-11-29 20:59:44', '2016-11-29 20:59:44'),
(1630, 'Planet On', 5, 9, 'planet-on', '2016-11-29 20:59:52', '2016-11-29 20:59:52'),
(1631, 'Sofachips', 6, 9, 'sofachips', '2016-11-29 21:00:01', '2016-11-29 21:00:01'),
(1632, 'Electronic Mind', 7, 9, 'electronic-mind', '2016-11-29 21:00:11', '2016-11-29 21:00:11'),
(1633, 'Changemode', 8, 9, 'changemode', '2016-11-29 21:00:21', '2016-11-29 21:00:21'),
(1634, 'Kickstart', 9, 9, 'kickstart', '2016-11-29 21:00:31', '2016-11-29 21:00:31'),
(1635, 'Amigabass', 10, 9, 'amigabass', '2016-11-29 21:00:42', '2016-11-29 21:00:42'),
(1636, 'Woxom', 11, 9, 'woxom', '2016-11-29 21:00:51', '2016-11-29 21:00:51'),
(1637, 'Casio Dream', 12, 9, 'casio-dream', '2016-11-29 21:00:58', '2016-11-29 21:00:58'),
(1638, 'Flybass (Tom Woxom\'s Kickstart Edit)', 13, 9, 'flybass-tom-woxom-s-kickstart-edit', '2016-11-29 21:01:06', '2016-11-29 21:01:06'),
(1639, 'Chipset (Steve\'s Vocoder Dudez Version)', 14, 9, 'chipset-steve-s-vocoder-dudez-version', '2016-11-29 21:01:14', '2016-11-29 21:01:14'),
(1640, 'Waves Of Piss', 1, 10, 'waves-of-piss', '2016-11-29 21:06:34', '2016-11-29 21:06:34'),
(1641, 'Monsieur Dauphin', 2, 10, 'monsieur-dauphin', '2016-11-29 21:06:43', '2016-11-29 21:06:43'),
(1642, 'Aquatron', 3, 10, 'aquatron', '2016-11-29 21:06:53', '2016-11-29 21:06:53'),
(1643, 'Seagulls', 4, 10, 'seagulls', '2016-11-29 21:07:02', '2016-11-29 21:07:02'),
(1644, 'The Book Of The Dead Seahorses', 5, 10, 'the-book-of-the-dead-seahorses', '2016-11-29 21:07:09', '2016-11-29 21:07:09'),
(1645, 'Squid', 6, 10, 'squid', '2016-11-29 21:07:18', '2016-11-29 21:07:18'),
(1646, 'Caviar On A Booty', 7, 10, 'caviar-on-a-booty', '2016-11-29 21:07:23', '2016-11-29 21:07:23'),
(1647, 'Black Sharks', 8, 10, 'black-sharks', '2016-11-29 21:07:31', '2016-11-29 21:07:31'),
(1648, 'Save Me Flipper', 9, 10, 'save-me-flipper', '2016-11-29 21:07:37', '2016-11-29 21:07:37'),
(1649, 'Japanese Plankton', 10, 10, 'japanese-plankton', '2016-11-29 21:07:42', '2016-11-29 21:07:42'),
(1650, 'Bouncing Tale', 11, 10, 'bouncing-tale', '2016-11-29 21:07:46', '2016-11-29 21:07:46'),
(1651, 'Deep Deep Deep', 12, 10, 'deep-deep-deep', '2016-11-29 21:07:53', '2016-11-29 21:07:53'),
(1652, 'Whale Burger', 13, 10, 'whale-burger', '2016-11-29 21:07:57', '2016-11-29 21:07:57'),
(1653, 'Hard To Party', 14, 10, 'hard-to-party', '2016-11-29 21:08:02', '2016-11-29 21:08:02'),
(1654, 'Initials PP', 1, 11, 'initials-pp', '2016-11-29 21:12:19', '2016-11-29 21:12:19'),
(1655, 'Eddie The Head', 2, 11, 'eddie-the-head', '2016-11-29 21:12:23', '2016-11-29 21:12:23'),
(1656, 'Frankeinstein Meets The Mummy', 3, 11, 'frankeinstein-meets-the-mummy', '2016-11-29 21:12:28', '2016-11-29 21:12:28'),
(1657, 'The Village', 4, 11, 'the-village', '2016-11-29 21:12:34', '2016-11-29 21:12:34'),
(1658, 'Up And Away', 5, 11, 'up-and-away', '2016-11-29 21:12:39', '2016-11-29 21:12:39'),
(1659, 'Robo Robo', 6, 11, 'robo-robo', '2016-11-29 21:12:43', '2016-11-29 21:12:43'),
(1660, 'Amour', 7, 11, 'amour', '2016-11-29 21:12:48', '2016-11-29 21:12:48'),
(1661, 'Lazy', 8, 11, 'lazy', '2016-11-29 21:12:54', '2016-11-29 21:12:54'),
(1662, 'Grave Groove', 9, 11, 'grave-groove', '2016-11-29 21:13:00', '2016-11-29 21:13:00'),
(1663, 'Yoopeeya', 10, 11, 'yoopeeya', '2016-11-29 21:13:07', '2016-11-29 21:13:07'),
(1664, 'Mechanical Man', 11, 11, 'mechanical-man', '2016-11-29 21:13:11', '2016-11-29 21:13:11'),
(1665, 'Six Kings, Six Pigs', 12, 11, 'six-kings-six-pigs', '2016-11-29 21:13:17', '2016-11-29 21:13:17'),
(1666, 'I Fall', 13, 11, 'i-fall', '2016-11-29 21:13:21', '2016-11-29 21:13:21'),
(1667, 'Swiss Underwater', 1, 12, 'swiss-underwater', '2016-11-29 21:16:08', '2016-11-29 21:16:08'),
(1668, 'SMS', 2, 12, 'sms', '2016-11-29 21:16:20', '2016-11-29 21:16:20'),
(1669, 'Handicapped Lover', 3, 12, 'handicapped-lover', '2016-11-29 21:16:29', '2016-11-29 21:16:29'),
(1670, 'Mr. Hadopi', 4, 12, 'mr-hadopi', '2016-11-29 21:16:39', '2016-11-29 21:16:39'),
(1671, 'Aphte 707', 5, 12, 'aphte-707', '2016-11-29 21:16:47', '2016-11-29 21:16:47'),
(1672, 'Chinese Sportswear', 6, 12, 'chinese-sportswear', '2016-11-29 21:16:59', '2016-11-29 21:16:59'),
(1673, 'Up And Down', 7, 12, 'up-and-down', '2016-11-29 21:17:07', '2016-11-29 21:17:07'),
(1674, 'Acid Liver', 8, 12, 'acid-liver', '2016-11-29 21:17:16', '2016-11-29 21:17:16'),
(1675, 'Paper Eyeballs Part XXIII', 9, 12, 'paper-eyeballs-part-xxiii', '2016-11-29 21:17:27', '2016-11-29 21:17:27'),
(1676, 'Paper Eyeballs Part XXIV', 10, 12, 'paper-eyeballs-part-xxiv', '2016-11-29 21:17:36', '2016-11-29 21:17:36'),
(1677, 'Feelgood - Jamie Lidell - Vicnet Mix', 11, 12, 'feelgood-jamie-lidell-vicnet-mix', '2016-11-29 21:17:43', '2016-11-29 21:17:43'),
(1678, 'Egyptian Night', 12, 12, 'egyptian-night', '2016-11-29 21:17:52', '2016-11-29 21:17:52'),
(1683, 'Dr. Sleepgood 2 ', 1, 13, 'dr-sleepgood-2', '2016-11-29 21:24:29', '2016-11-29 21:24:29'),
(1684, 'Crunch', 2, 13, 'crunch', '2016-11-29 21:24:35', '2016-11-29 21:24:35'),
(1685, 'Ninja Maggots', 3, 13, 'ninja-maggots', '2016-11-29 21:24:42', '2016-11-29 21:24:42'),
(1686, 'Wrong Calibration', 4, 13, 'wrong-calibration', '2016-11-29 21:24:50', '2016-11-29 21:24:50'),
(1687, 'Unsynthetish', 5, 13, 'unsynthetish', '2016-11-29 21:24:55', '2016-11-29 21:24:55'),
(1688, 'It Crowd Remix', 6, 13, 'it-crowd-remix', '2016-11-29 21:25:00', '2016-11-29 21:25:00'),
(1689, 'Mob', 7, 13, 'mob', '2016-11-29 21:25:06', '2016-11-29 21:25:06'),
(1690, 'Play The Game', 8, 13, 'play-the-game', '2016-11-29 21:25:14', '2016-11-29 21:25:14'),
(1691, 'Frag\'Em', 9, 13, 'frag-em', '2016-11-29 21:25:19', '2016-11-29 21:25:19'),
(1692, 'Information RMX', 10, 13, 'information-rmx', '2016-11-29 21:25:24', '2016-11-29 21:25:24'),
(1693, 'Die Uhr Rmx', 11, 13, 'die-uhr-rmx', '2016-11-29 21:25:29', '2016-11-29 21:25:29'),
(1694, 'Epilog (Stu RMX)', 12, 13, 'epilog-stu-rmx', '2016-11-29 21:25:36', '2016-11-29 21:25:36'),
(1695, 'Intro', 1, 17, 'intro-1', '2016-11-29 21:28:59', '2016-11-29 21:28:59'),
(1696, 'Pourquoi', 2, 17, 'pourquoi', '2016-11-29 21:29:00', '2016-11-29 21:29:00'),
(1697, 'Fuck My Bitch', 3, 17, 'fuck-my-bitch', '2016-11-29 21:29:03', '2016-11-29 21:29:03'),
(1698, 'Pom Pom Girl', 4, 17, 'pom-pom-girl', '2016-11-29 21:29:05', '2016-11-29 21:29:05'),
(1699, 'Loosdee', 5, 17, 'loosdee', '2016-11-29 21:29:09', '2016-11-29 21:29:09'),
(1700, 'Pensée', 6, 17, 'pensee', '2016-11-29 21:29:13', '2016-11-29 21:29:13'),
(1701, 'Ex-Cuse', 7, 17, 'ex-cuse', '2016-11-29 21:29:15', '2016-11-29 21:29:15'),
(1702, 'Los Angeles', 8, 17, 'los-angeles', '2016-11-29 21:29:21', '2016-11-29 21:29:21'),
(1711, 'Dr Sleepgood 3', 1, 35, 'dr-sleepgood-3', '2016-11-29 22:41:03', '2016-11-29 22:41:03'),
(1712, 'Come To Light', 2, 35, 'come-to-light', '2016-11-29 22:41:08', '2016-11-29 22:41:08'),
(1713, 'The King Pin', 3, 35, 'the-king-pin', '2016-11-29 22:41:14', '2016-11-29 22:41:14'),
(1714, 'The Dark Seed', 4, 35, 'the-dark-seed', '2016-11-29 22:41:20', '2016-11-29 22:41:20'),
(1715, 'Vorwaerts', 5, 35, 'vorwaerts', '2016-11-29 22:41:26', '2016-11-29 22:41:26'),
(1716, 'Just A Minute', 6, 35, 'just-a-minute', '2016-11-29 22:41:30', '2016-11-29 22:41:30'),
(1717, 'Ride', 7, 35, 'ride', '2016-11-29 22:41:36', '2016-11-29 22:41:36'),
(1718, 'Atomic Fessenheim Edition', 8, 35, 'atomic-fessenheim-edition', '2016-11-29 22:41:42', '2016-11-29 22:41:42'),
(1719, 'Highway Up North', 9, 35, 'highway-up-north', '2016-11-29 22:41:49', '2016-11-29 22:41:49'),
(1720, 'Verchromte Menschen', 10, 35, 'verchromte-menschen', '2016-11-29 22:41:56', '2016-11-29 22:41:56'),
(1721, 'Vorwaerts Tom Woxom Version Tatkraft', 11, 35, 'vorwaerts-tom-woxom-version-tatkraft', '2016-11-29 22:42:03', '2016-11-29 22:42:03'),
(1722, 'Drive A Tribute To Space Night', 12, 35, 'drive-a-tribute-to-space-night', '2016-11-29 22:42:08', '2016-11-29 22:42:08'),
(1735, 'Leap', 1, 36, 'leap', '2017-01-26 01:29:48', '2017-01-26 01:29:48'),
(1736, 'Idée de Question', 2, 36, 'idee-de-question', '2017-01-26 01:29:58', '2017-01-26 01:29:58'),
(1737, 'Aladin ', 3, 36, 'aladin', '2017-01-26 01:30:08', '2017-01-26 01:30:08'),
(1738, 'Reflected Lightwave', 4, 36, 'reflected-lightwave', '2017-01-26 01:30:17', '2017-01-26 01:30:17'),
(1739, 'Voilé', 5, 36, 'voile', '2017-01-26 01:30:23', '2017-01-26 01:30:23'),
(1740, 'Princess', 6, 36, 'princess', '2017-01-26 01:30:29', '2017-01-26 01:30:29'),
(1741, 'Wide', 7, 36, 'wide', '2017-01-26 01:30:33', '2017-01-26 01:30:33'),
(1742, 'Bamako', 8, 36, 'bamako', '2017-01-26 01:30:40', '2017-01-26 01:30:40'),
(1743, 'Synthenneagramme', 9, 36, 'synthenneagramme', '2017-01-26 01:30:52', '2017-01-26 01:30:52'),
(1744, 'Bells', 10, 36, 'bells', '2017-01-26 01:30:58', '2017-01-26 01:30:58'),
(1745, 'Cold Moons', 11, 36, 'cold-moons', '2017-01-26 01:31:08', '2017-01-26 01:31:08'),
(1746, 'The Cave', 12, 36, 'the-cave', '2017-01-26 01:31:17', '2017-01-26 01:31:17'),
(1747, 'The Sage', 1, 37, 'the-sage', '2017-04-11 19:57:03', '2017-04-11 19:57:03'),
(1748, 'Interlude', 2, 37, 'interlude', '2017-04-11 19:57:16', '2017-04-11 19:57:16'),
(1749, 'Pull the man', 3, 37, 'pull-the-man', '2017-04-11 19:57:20', '2017-04-11 19:57:20'),
(1750, 'Dragon\'s teeth pt1', 4, 37, 'dragon-s-teeth-pt1', '2017-04-11 19:57:31', '2017-04-11 19:57:31'),
(1751, 'Dragon\'s teeth pt2', 5, 37, 'dragon-s-teeth-pt2', '2017-04-11 19:58:16', '2017-04-11 19:58:16'),
(1752, 'Le Snare de Vérité', 6, 37, 'le-snare-de-verite', '2017-04-11 19:58:32', '2017-04-11 19:58:32');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `artist_sluggable_idx` (`slug`);

--
-- Index pour la table `artist_translation`
--
ALTER TABLE `artist_translation`
  ADD PRIMARY KEY (`id`,`lang`);

--
-- Index pour la table `artwork_artist`
--
ALTER TABLE `artwork_artist`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `artwork_artist_sluggable_idx` (`slug`);

--
-- Index pour la table `artwork_artist_translation`
--
ALTER TABLE `artwork_artist_translation`
  ADD PRIMARY KEY (`id`,`lang`);

--
-- Index pour la table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `content_translation`
--
ALTER TABLE `content_translation`
  ADD PRIMARY KEY (`id`,`lang`);

--
-- Index pour la table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_sluggable_idx` (`slug`);

--
-- Index pour la table `post_translation`
--
ALTER TABLE `post_translation`
  ADD PRIMARY KEY (`id`,`lang`);

--
-- Index pour la table `release`
--
ALTER TABLE `release`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `release_sluggable_idx` (`slug`),
  ADD KEY `artist_id_idx` (`artist_id`);

--
-- Index pour la table `release_translation`
--
ALTER TABLE `release_translation`
  ADD PRIMARY KEY (`id`,`lang`);

--
-- Index pour la table `sf_guard_forgot_password`
--
ALTER TABLE `sf_guard_forgot_password`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_idx` (`user_id`);

--
-- Index pour la table `sf_guard_group`
--
ALTER TABLE `sf_guard_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `sf_guard_group_permission`
--
ALTER TABLE `sf_guard_group_permission`
  ADD PRIMARY KEY (`group_id`,`permission_id`),
  ADD KEY `sf_guard_group_permission_permission_id_sf_guard_permission_id` (`permission_id`);

--
-- Index pour la table `sf_guard_permission`
--
ALTER TABLE `sf_guard_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `sf_guard_remember_key`
--
ALTER TABLE `sf_guard_remember_key`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_idx` (`user_id`);

--
-- Index pour la table `sf_guard_user`
--
ALTER TABLE `sf_guard_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_address` (`email_address`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `is_active_idx_idx` (`is_active`);

--
-- Index pour la table `sf_guard_user_group`
--
ALTER TABLE `sf_guard_user_group`
  ADD PRIMARY KEY (`user_id`,`group_id`),
  ADD KEY `sf_guard_user_group_group_id_sf_guard_group_id` (`group_id`);

--
-- Index pour la table `sf_guard_user_permission`
--
ALTER TABLE `sf_guard_user_permission`
  ADD PRIMARY KEY (`user_id`,`permission_id`),
  ADD KEY `sf_guard_user_permission_permission_id_sf_guard_permission_id` (`permission_id`);

--
-- Index pour la table `track`
--
ALTER TABLE `track`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `track_sluggable_idx` (`slug`),
  ADD KEY `release_id_idx` (`release_id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `artist`
--
ALTER TABLE `artist`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT pour la table `artwork_artist`
--
ALTER TABLE `artwork_artist`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT pour la table `content`
--
ALTER TABLE `content`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `post`
--
ALTER TABLE `post`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT pour la table `release`
--
ALTER TABLE `release`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT pour la table `sf_guard_forgot_password`
--
ALTER TABLE `sf_guard_forgot_password`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `sf_guard_group`
--
ALTER TABLE `sf_guard_group`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `sf_guard_permission`
--
ALTER TABLE `sf_guard_permission`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `sf_guard_remember_key`
--
ALTER TABLE `sf_guard_remember_key`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `sf_guard_user`
--
ALTER TABLE `sf_guard_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `track`
--
ALTER TABLE `track`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1753;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `artist_translation`
--
ALTER TABLE `artist_translation`
  ADD CONSTRAINT `artist_translation_id_artist_id` FOREIGN KEY (`id`) REFERENCES `artist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `content_translation`
--
ALTER TABLE `content_translation`
  ADD CONSTRAINT `content_translation_id_content_id` FOREIGN KEY (`id`) REFERENCES `content` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `post_translation`
--
ALTER TABLE `post_translation`
  ADD CONSTRAINT `post_translation_id_post_id` FOREIGN KEY (`id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `release`
--
ALTER TABLE `release`
  ADD CONSTRAINT `release_artist_id_artist_id` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`id`);

--
-- Contraintes pour la table `release_translation`
--
ALTER TABLE `release_translation`
  ADD CONSTRAINT `release_translation_id_release_id` FOREIGN KEY (`id`) REFERENCES `release` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `sf_guard_forgot_password`
--
ALTER TABLE `sf_guard_forgot_password`
  ADD CONSTRAINT `sf_guard_forgot_password_user_id_sf_guard_user_id` FOREIGN KEY (`user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `sf_guard_group_permission`
--
ALTER TABLE `sf_guard_group_permission`
  ADD CONSTRAINT `sf_guard_group_permission_group_id_sf_guard_group_id` FOREIGN KEY (`group_id`) REFERENCES `sf_guard_group` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sf_guard_group_permission_permission_id_sf_guard_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `sf_guard_permission` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `sf_guard_remember_key`
--
ALTER TABLE `sf_guard_remember_key`
  ADD CONSTRAINT `sf_guard_remember_key_user_id_sf_guard_user_id` FOREIGN KEY (`user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `sf_guard_user_group`
--
ALTER TABLE `sf_guard_user_group`
  ADD CONSTRAINT `sf_guard_user_group_group_id_sf_guard_group_id` FOREIGN KEY (`group_id`) REFERENCES `sf_guard_group` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sf_guard_user_group_user_id_sf_guard_user_id` FOREIGN KEY (`user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `sf_guard_user_permission`
--
ALTER TABLE `sf_guard_user_permission`
  ADD CONSTRAINT `sf_guard_user_permission_permission_id_sf_guard_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `sf_guard_permission` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sf_guard_user_permission_user_id_sf_guard_user_id` FOREIGN KEY (`user_id`) REFERENCES `sf_guard_user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `track`
--
ALTER TABLE `track`
  ADD CONSTRAINT `track_release_id_release_id` FOREIGN KEY (`release_id`) REFERENCES `release` (`id`);
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
