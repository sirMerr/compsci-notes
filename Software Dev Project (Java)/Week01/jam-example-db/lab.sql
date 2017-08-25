DROP TABLE IF EXISTS appointment;
DROP TABLE IF EXISTS group_record;
DROP TABLE IF EXISTS account;

CREATE TABLE account (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  lastname VARCHAR(30),
  firstname VARCHAR(30),
  email VARCHAR(60) NOT NULL DEFAULT '',
  email_password VARCHAR(60) NOT NULL DEFAULT '',
  port INT NOT NULL DEFAULT 465
);

CREATE TABLE group_record (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(30),
  rgb BIGINT,
  account_id INT,
  KEY account_id (account_id),
  CONSTRAINT account_1 FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE appointment (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  group_id INT NOT NULL,
  title VARCHAR(60),
  location VARCHAR(60),
  start_time TIMESTAMP DEFAULT current_timestamp,
  end_time TIMESTAMP DEFAULT current_timestamp,
  details VARCHAR(255),
  whole_day BOOLEAN DEFAULT FALSE,
  reminder_interval INT,
  alarm_reminder BOOLEAN DEFAULT FALSE,
  KEY group_id (group_id),
  CONSTRAINT group_1 FOREIGN KEY (group_id) REFERENCES group_record(id)
);

insert into account (email_password, firstname, lastname, email, port) values ('wlcTOpmjTa', 'Jenelle', 'Skym', 'jskym0@aol.com', 97);
insert into account (email_password, firstname, lastname, email, port) values ('93vDZO2CXDof', 'Sunny', 'Tryhorn', 'stryhorn1@china.com.cn', 72);
insert into account (email_password, firstname, lastname, email, port) values ('RFjKeE7i', 'Ruy', 'Raiment', 'rraiment2@epa.gov', 10);
insert into account (email_password, firstname, lastname, email, port) values ('elZkPif', 'Curt', 'Raymond', 'craymond3@wsj.com', 32);
insert into account (email_password, firstname, lastname, email, port) values ('UrBMyOVk9vwc', 'Jodi', 'Yanyshev', 'jyanyshev4@psu.edu', 99);
insert into account (email_password, firstname, lastname, email, port) values ('49hNfE0ue', 'Amitie', 'Vanini', 'avanini5@home.pl', 72);
insert into account (email_password, firstname, lastname, email, port) values ('mwc0Mq1', 'Aleda', 'Sagg', 'asagg6@typepad.com', 71);
insert into account (email_password, firstname, lastname, email, port) values ('QLLxgbLjIpyc', 'Kimmy', 'Goodison', 'kgoodison7@ebay.com', 62);
insert into account (email_password, firstname, lastname, email, port) values ('VBifm9', 'Meyer', 'Yellop', 'myellop8@exblog.jp', 72);
insert into account (email_password, firstname, lastname, email, port) values ('goKPkx', 'Harlen', 'Baraja', 'hbaraja9@army.mil', 67);
insert into account (email_password, firstname, lastname, email, port) values ('sBeLlCKtn', 'Karlen', 'Colisbe', 'kcolisbea@hp.com', 87);
insert into account (email_password, firstname, lastname, email, port) values ('XZO5KeTgzH', 'Brandon', 'Kolushev', 'bkolushevb@globo.com', 61);
insert into account (email_password, firstname, lastname, email, port) values ('5f1h6Ko', 'Roseanne', 'Izkovici', 'rizkovicic@multiply.com', 27);
insert into account (email_password, firstname, lastname, email, port) values ('Mi1UaWGuN', 'Gunar', 'Hornbuckle', 'ghornbuckled@live.com', 42);
insert into account (email_password, firstname, lastname, email, port) values ('PhAdPTEX', 'Ivy', 'Tyce', 'itycee@yahoo.com', 50);
insert into account (email_password, firstname, lastname, email, port) values ('ZGDA9uGBES', 'Jacobo', 'Johansson', 'jjohanssonf@ifeng.com', 99);
insert into account (email_password, firstname, lastname, email, port) values ('j83GucAMEf9W', 'Xaviera', 'Dorking', 'xdorkingg@dot.gov', 39);
insert into account (email_password, firstname, lastname, email, port) values ('sS2cDoj', 'Lilian', 'Gaythwaite', 'lgaythwaiteh@slideshare.net', 10);
insert into account (email_password, firstname, lastname, email, port) values ('ajOdHVFAuGU', 'Tabbitha', 'Connochie', 'tconnochiei@techcrunch.com', 11);
insert into account (email_password, firstname, lastname, email, port) values ('Fqt5VOS8kLO', 'Kenon', 'Yu', 'kyuj@angelfire.com', 30);
insert into account (email_password, firstname, lastname, email, port) values ('zBCreX7spS', 'Egor', 'Flieger', 'efliegerk@tripod.com', 77);
insert into account (email_password, firstname, lastname, email, port) values ('34by650m', 'Hally', 'Duligall', 'hduligalll@cbsnews.com', 29);
insert into account (email_password, firstname, lastname, email, port) values ('6ZUMQo', 'Early', 'Willingham', 'ewillinghamm@fda.gov', 81);
insert into account (email_password, firstname, lastname, email, port) values ('L2rzYJQG', 'Clayborne', 'Francois', 'cfrancoisn@ftc.gov', 51);
insert into account (email_password, firstname, lastname, email, port) values ('t7kIrs2', 'Kimmy', 'Bateson', 'kbatesono@redcross.org', 4);
insert into account (email_password, firstname, lastname, email, port) values ('Xz5wzrCuL', 'Jillie', 'McInteer', 'jmcinteerp@army.mil', 89);
insert into account (email_password, firstname, lastname, email, port) values ('KKX1Amra', 'Ogdan', 'McAnalley', 'omcanalleyq@sina.com.cn', 18);
insert into account (email_password, firstname, lastname, email, port) values ('qU3s8tQBmnu8', 'Dagmar', 'Bromige', 'dbromiger@craigslist.org', 70);
insert into account (email_password, firstname, lastname, email, port) values ('WFIExlhinWxi', 'Natale', 'Kennedy', 'nkennedys@shinystat.com', 1);
insert into account (email_password, firstname, lastname, email, port) values ('6kAvnqrQ1CG', 'Darrick', 'Wiseman', 'dwisemant@tripod.com', 52);
insert into account (email_password, firstname, lastname, email, port) values ('fTB1MPWmnn', 'Pearl', 'Ahmed', 'pahmedu@163.com', 60);
insert into account (email_password, firstname, lastname, email, port) values ('nfB48EubuQ3', 'Linet', 'Flancinbaum', 'lflancinbaumv@europa.eu', 91);
insert into account (email_password, firstname, lastname, email, port) values ('6rdB6q6BTz', 'Forest', 'Lehrian', 'flehrianw@plala.or.jp', 28);
insert into account (email_password, firstname, lastname, email, port) values ('LmLdrJMly', 'Morissa', 'Quinnette', 'mquinnettex@discuz.net', 24);
insert into account (email_password, firstname, lastname, email, port) values ('meQqL8xe3Fy', 'Jourdain', 'Cleeton', 'jcleetony@house.gov', 93);
insert into account (email_password, firstname, lastname, email, port) values ('g7Xj6b2', 'Rosanna', 'Honacker', 'rhonackerz@ftc.gov', 41);
insert into account (email_password, firstname, lastname, email, port) values ('cp8Nwqt', 'Fair', 'Haveline', 'fhaveline10@delicious.com', 22);
insert into account (email_password, firstname, lastname, email, port) values ('TpsHDPFbjqm', 'Farand', 'McSwan', 'fmcswan11@nih.gov', 32);
insert into account (email_password, firstname, lastname, email, port) values ('S9babfSo', 'Deeann', 'Godar', 'dgodar12@friendfeed.com', 53);
insert into account (email_password, firstname, lastname, email, port) values ('gGP7RtQy', 'Arlyne', 'Picton', 'apicton13@hostgator.com', 88);
insert into account (email_password, firstname, lastname, email, port) values ('2tDmy5cMz', 'Bradan', 'Pennigar', 'bpennigar14@businessinsider.com', 100);
insert into account (email_password, firstname, lastname, email, port) values ('rnwO7pxTV', 'Padgett', 'Triplet', 'ptriplet15@hao123.com', 59);
insert into account (email_password, firstname, lastname, email, port) values ('YfkbAGHNNFz', 'Margalo', 'Gynne', 'mgynne16@mlb.com', 34);
insert into account (email_password, firstname, lastname, email, port) values ('xcA7GJVI', 'Caye', 'Fullard', 'cfullard17@earthlink.net', 11);
insert into account (email_password, firstname, lastname, email, port) values ('Rj4e9zK', 'Luz', 'Dackombe', 'ldackombe18@ocn.ne.jp', 45);
insert into account (email_password, firstname, lastname, email, port) values ('c9l39f28k5', 'Jammal', 'Kauscher', 'jkauscher19@examiner.com', 36);
insert into account (email_password, firstname, lastname, email, port) values ('ZebJTFz', 'Mathias', 'di Rocca', 'mdirocca1a@mapquest.com', 33);
insert into account (email_password, firstname, lastname, email, port) values ('9BpB58KNkqK', 'Stacey', 'MacDonogh', 'smacdonogh1b@senate.gov', 67);
insert into account (email_password, firstname, lastname, email, port) values ('g80NH7', 'Bridget', 'Hayworth', 'bhayworth1c@dagondesign.com', 36);
insert into account (email_password, firstname, lastname, email, port) values ('oflN43V', 'Neale', 'Glowach', 'nglowach1d@hexun.com', 36);
insert into account (email_password, firstname, lastname, email, port) values ('9vPJSFNq', 'Aeriell', 'Iacobini', 'aiacobini1e@netscape.com', 7);
insert into account (email_password, firstname, lastname, email, port) values ('8nM2blYy', 'Cos', 'Bellamy', 'cbellamy1f@unicef.org', 71);
insert into account (email_password, firstname, lastname, email, port) values ('TiWSfN', 'Lotti', 'Quinnelly', 'lquinnelly1g@feedburner.com', 34);
insert into account (email_password, firstname, lastname, email, port) values ('iju6PRX6l', 'Elnar', 'Precious', 'eprecious1h@infoseek.co.jp', 15);
insert into account (email_password, firstname, lastname, email, port) values ('GenAlZi1', 'Bert', 'Mottram', 'bmottram1i@columbia.edu', 31);
insert into account (email_password, firstname, lastname, email, port) values ('jwZrZ5l', 'Rory', 'Hamsher', 'rhamsher1j@reddit.com', 67);
insert into account (email_password, firstname, lastname, email, port) values ('KqcChq', 'Carena', 'Kilbee', 'ckilbee1k@google.com.br', 90);
insert into account (email_password, firstname, lastname, email, port) values ('dcqlx6I9Se', 'Gasparo', 'Wittleton', 'gwittleton1l@ifeng.com', 16);
insert into account (email_password, firstname, lastname, email, port) values ('nBkj3gNZUR', 'Taryn', 'Sumnall', 'tsumnall1m@about.com', 76);
insert into account (email_password, firstname, lastname, email, port) values ('exDqK3b', 'Tiffi', 'Kepling', 'tkepling1n@squarespace.com', 31);
insert into account (email_password, firstname, lastname, email, port) values ('pH8LnRIQBe', 'Wenda', 'Haythornthwaite', 'whaythornthwaite1o@cnbc.com', 67);
insert into account (email_password, firstname, lastname, email, port) values ('8wwKglwgmTY', 'Auria', 'Feldbrin', 'afeldbrin1p@feedburner.com', 31);
insert into account (email_password, firstname, lastname, email, port) values ('Nqy9SN38', 'Carlie', 'Ensor', 'censor1q@amazon.com', 46);
insert into account (email_password, firstname, lastname, email, port) values ('Y1pcvPgq', 'Venita', 'Fonteyne', 'vfonteyne1r@bloomberg.com', 55);
insert into account (email_password, firstname, lastname, email, port) values ('Q7GxkyRh', 'Carry', 'Climie', 'cclimie1s@imdb.com', 10);
insert into account (email_password, firstname, lastname, email, port) values ('hbq47gWXn0x', 'Natka', 'Cordeiro', 'ncordeiro1t@usda.gov', 47);
insert into account (email_password, firstname, lastname, email, port) values ('hZQsEnnGic', 'Maison', 'Henricsson', 'mhenricsson1u@chron.com', 91);
insert into account (email_password, firstname, lastname, email, port) values ('QvABrnQN5V', 'Wilmar', 'Enright', 'wenright1v@parallels.com', 18);
insert into account (email_password, firstname, lastname, email, port) values ('SN77Qih', 'Dallis', 'Coombe', 'dcoombe1w@reverbnation.com', 54);
insert into account (email_password, firstname, lastname, email, port) values ('I59oQX', 'Jasper', 'Edgworth', 'jedgworth1x@desdev.cn', 80);
insert into account (email_password, firstname, lastname, email, port) values ('ZepMuL14', 'Dedra', 'Trembath', 'dtrembath1y@sitemeter.com', 49);
insert into account (email_password, firstname, lastname, email, port) values ('V1cCm5BI', 'Rodina', 'Ingrem', 'ringrem1z@fc2.com', 8);
insert into account (email_password, firstname, lastname, email, port) values ('4gDiHcYSv', 'Rhea', 'McLarnon', 'rmclarnon20@usgs.gov', 96);
insert into account (email_password, firstname, lastname, email, port) values ('YzIOW02x', 'Jocelyne', 'Anton', 'janton21@fda.gov', 23);
insert into account (email_password, firstname, lastname, email, port) values ('SAZhUrYFz7', 'Brennen', 'Humbert', 'bhumbert22@nasa.gov', 74);
insert into account (email_password, firstname, lastname, email, port) values ('wSUOp4', 'Bryn', 'Sorsby', 'bsorsby23@cnn.com', 22);
insert into account (email_password, firstname, lastname, email, port) values ('kp1fbnetY4', 'Cristal', 'Rawnsley', 'crawnsley24@sakura.ne.jp', 79);
insert into account (email_password, firstname, lastname, email, port) values ('u7e4MGEckY', 'Carin', 'Merring', 'cmerring25@shinystat.com', 58);
insert into account (email_password, firstname, lastname, email, port) values ('nMx8gQi4mk', 'Dani', 'Samms', 'dsamms26@booking.com', 48);
insert into account (email_password, firstname, lastname, email, port) values ('FGYIA2JG', 'Madlin', 'Beagen', 'mbeagen27@csmonitor.com', 62);
insert into account (email_password, firstname, lastname, email, port) values ('RBC7GpspKaP', 'Puff', 'Wittier', 'pwittier28@samsung.com', 29);
insert into account (email_password, firstname, lastname, email, port) values ('yKuJasNAH', 'Marcel', 'Gowlett', 'mgowlett29@unesco.org', 33);
insert into account (email_password, firstname, lastname, email, port) values ('y4jkjkSm', 'Alec', 'Bosman', 'abosman2a@harvard.edu', 44);
insert into account (email_password, firstname, lastname, email, port) values ('TxjVeNuyp', 'Abelard', 'Ivanchenkov', 'aivanchenkov2b@google.nl', 13);
insert into account (email_password, firstname, lastname, email, port) values ('fKhKPAw', 'Wynne', 'Brendish', 'wbrendish2c@gnu.org', 70);
insert into account (email_password, firstname, lastname, email, port) values ('rh466mnz621', 'Buffy', 'Vannah', 'bvannah2d@blogspot.com', 86);
insert into account (email_password, firstname, lastname, email, port) values ('IsODYvnD', 'Helsa', 'Meugens', 'hmeugens2e@360.cn', 88);
insert into account (email_password, firstname, lastname, email, port) values ('gbOH3xXf', 'Annemarie', 'Brech', 'abrech2f@smh.com.au', 80);
insert into account (email_password, firstname, lastname, email, port) values ('tGqinHNx', 'Gilburt', 'Ceney', 'gceney2g@ihg.com', 55);
insert into account (email_password, firstname, lastname, email, port) values ('U2HR6Vdsl', 'Lanie', 'Gidney', 'lgidney2h@alibaba.com', 5);
insert into account (email_password, firstname, lastname, email, port) values ('HKOl5bm67PYa', 'Leonardo', 'Cancellieri', 'lcancellieri2i@google.de', 83);
insert into account (email_password, firstname, lastname, email, port) values ('GmoErgvPp', 'Alika', 'Brewitt', 'abrewitt2j@123-reg.co.uk', 30);
insert into account (email_password, firstname, lastname, email, port) values ('CRfbh0bL4DV', 'Timmy', 'Taig', 'ttaig2k@cnet.com', 5);
insert into account (email_password, firstname, lastname, email, port) values ('0Cve9Sw1M', 'Herrick', 'Forsythe', 'hforsythe2l@shutterfly.com', 74);
insert into account (email_password, firstname, lastname, email, port) values ('jQpZ9714', 'Celestina', 'Mangon', 'cmangon2m@nsw.gov.au', 71);
insert into account (email_password, firstname, lastname, email, port) values ('F7kSUKVN', 'Waiter', 'Matthis', 'wmatthis2n@deviantart.com', 98);
insert into account (email_password, firstname, lastname, email, port) values ('yUXyiykMb', 'Shalne', 'Szepe', 'sszepe2o@seesaa.net', 89);
insert into account (email_password, firstname, lastname, email, port) values ('te5ZGLyPpNEX', 'Kaitlynn', 'Nuscha', 'knuscha2p@oakley.com', 32);
insert into account (email_password, firstname, lastname, email, port) values ('UfGdCN8qgh', 'Daphna', 'Iwanowicz', 'diwanowicz2q@tumblr.com', 47);
insert into account (email_password, firstname, lastname, email, port) values ('GtxRfSaeo', 'Lita', 'Baigent', 'lbaigent2r@redcross.org', 67);

insert into group_record (name, rgb, account_id) values ('Bytecard', '4135296343', 64);
insert into group_record (name, rgb, account_id) values ('Alpha', '5082131095', 70);
insert into group_record (name, rgb, account_id) values ('Bamity', '9207311267', 47);
insert into group_record (name, rgb, account_id) values ('Toughjoyfax', '6252377694', 71);
insert into group_record (name, rgb, account_id) values ('Andalax', '4831146099', 35);
insert into group_record (name, rgb, account_id) values ('Sub-Ex', '0779478568', 15);
insert into group_record (name, rgb, account_id) values ('Gembucket', '5191702751', 78);
insert into group_record (name, rgb, account_id) values ('Voltsillam', '6992089129', 12);
insert into group_record (name, rgb, account_id) values ('Sub-Ex', '8622364453', 15);
insert into group_record (name, rgb, account_id) values ('Aerified', '5776254728', 25);
insert into group_record (name, rgb, account_id) values ('Veribet', '8455066091', 96);
insert into group_record (name, rgb, account_id) values ('Flexidy', '2412481121', 61);
insert into group_record (name, rgb, account_id) values ('Asoka', '0140126481', 18);
insert into group_record (name, rgb, account_id) values ('Tin', '1212399544', 52);
insert into group_record (name, rgb, account_id) values ('Daltfresh', '9197258415', 40);
insert into group_record (name, rgb, account_id) values ('Job', '8019463046', 15);
insert into group_record (name, rgb, account_id) values ('Otcom', '0488586798', 5);
insert into group_record (name, rgb, account_id) values ('Voyatouch', '9796708280', 60);
insert into group_record (name, rgb, account_id) values ('Stronghold', '5513419351', 59);
insert into group_record (name, rgb, account_id) values ('Greenlam', '0598520457', 7);
insert into group_record (name, rgb, account_id) values ('Solarbreeze', '2631610032', 37);
insert into group_record (name, rgb, account_id) values ('Span', '6132598529', 12);
insert into group_record (name, rgb, account_id) values ('Otcom', '6979931350', 40);
insert into group_record (name, rgb, account_id) values ('Tampflex', '3073809058', 83);
insert into group_record (name, rgb, account_id) values ('Bigtax', '9430498002', 5);
insert into group_record (name, rgb, account_id) values ('Aerified', '4359564961', 3);
insert into group_record (name, rgb, account_id) values ('Gembucket', '1331633982', 84);
insert into group_record (name, rgb, account_id) values ('Trippledex', '5197948310', 58);
insert into group_record (name, rgb, account_id) values ('Hatity', '4327876070', 10);
insert into group_record (name, rgb, account_id) values ('Veribet', '0983791627', 18);
insert into group_record (name, rgb, account_id) values ('Bigtax', '6255568741', 90);
insert into group_record (name, rgb, account_id) values ('Lotlux', '3235033513', 70);
insert into group_record (name, rgb, account_id) values ('Alpha', '9335099562', 58);
insert into group_record (name, rgb, account_id) values ('Duobam', '8334994508', 35);
insert into group_record (name, rgb, account_id) values ('Aerified', '2378648111', 68);
insert into group_record (name, rgb, account_id) values ('Tempsoft', '1283027704', 77);
insert into group_record (name, rgb, account_id) values ('Y-find', '0222412100', 22);
insert into group_record (name, rgb, account_id) values ('Fintone', '2990756299', 31);
insert into group_record (name, rgb, account_id) values ('Zamit', '0240408942', 73);
insert into group_record (name, rgb, account_id) values ('Zathin', '6948936881', 54);
insert into group_record (name, rgb, account_id) values ('Home Ing', '0800363515', 52);
insert into group_record (name, rgb, account_id) values ('Bitwolf', '4789863360', 43);
insert into group_record (name, rgb, account_id) values ('Zathin', '9106631681', 28);
insert into group_record (name, rgb, account_id) values ('Kanlam', '2156184399', 97);
insert into group_record (name, rgb, account_id) values ('Subin', '4870289911', 34);
insert into group_record (name, rgb, account_id) values ('Vagram', '5527397819', 63);
insert into group_record (name, rgb, account_id) values ('Greenlam', '1156175054', 76);
insert into group_record (name, rgb, account_id) values ('Ronstring', '1084929198', 26);
insert into group_record (name, rgb, account_id) values ('Tempsoft', '2271656699', 17);
insert into group_record (name, rgb, account_id) values ('It', '4878900598', 2);
insert into group_record (name, rgb, account_id) values ('Tampflex', '8588379368', 50);
insert into group_record (name, rgb, account_id) values ('Flowdesk', '6658240523', 91);
insert into group_record (name, rgb, account_id) values ('Lotlux', '4460483092', 97);
insert into group_record (name, rgb, account_id) values ('Domainer', '6939788328', 23);
insert into group_record (name, rgb, account_id) values ('Asoka', '3245866887', 54);
insert into group_record (name, rgb, account_id) values ('Greenlam', '8229479631', 48);
insert into group_record (name, rgb, account_id) values ('Biodex', '3929102412', 6);
insert into group_record (name, rgb, account_id) values ('Sub-Ex', '3268004776', 41);
insert into group_record (name, rgb, account_id) values ('Quo Lux', '4745048386', 17);
insert into group_record (name, rgb, account_id) values ('Flowdesk', '2612576614', 38);
insert into group_record (name, rgb, account_id) values ('Zoolab', '1514169002', 96);
insert into group_record (name, rgb, account_id) values ('Stronghold', '3280575680', 80);
insert into group_record (name, rgb, account_id) values ('Zaam-Dox', '3294788290', 34);
insert into group_record (name, rgb, account_id) values ('Stronghold', '0036360775', 38);
insert into group_record (name, rgb, account_id) values ('It', '8534801886', 66);
insert into group_record (name, rgb, account_id) values ('Daltfresh', '3347999037', 88);
insert into group_record (name, rgb, account_id) values ('Job', '9295830695', 39);
insert into group_record (name, rgb, account_id) values ('Holdlamis', '7100156491', 44);
insert into group_record (name, rgb, account_id) values ('Trippledex', '6859666021', 51);
insert into group_record (name, rgb, account_id) values ('Tresom', '9530546076', 36);
insert into group_record (name, rgb, account_id) values ('Lotlux', '8841709618', 92);
insert into group_record (name, rgb, account_id) values ('Kanlam', '9558455385', 69);
insert into group_record (name, rgb, account_id) values ('Konklab', '4706948924', 88);
insert into group_record (name, rgb, account_id) values ('Daltfresh', '8152282065', 1);
insert into group_record (name, rgb, account_id) values ('Cardify', '0246683902', 56);
insert into group_record (name, rgb, account_id) values ('Domainer', '7399805652', 28);
insert into group_record (name, rgb, account_id) values ('Bitwolf', '1168437865', 77);
insert into group_record (name, rgb, account_id) values ('Matsoft', '7171227375', 8);
insert into group_record (name, rgb, account_id) values ('Voyatouch', '3541377674', 72);
insert into group_record (name, rgb, account_id) values ('Wrapsafe', '9527082862', 54);
insert into group_record (name, rgb, account_id) values ('Sonair', '0445588454', 8);
insert into group_record (name, rgb, account_id) values ('Flexidy', '6393416513', 84);
insert into group_record (name, rgb, account_id) values ('Zoolab', '4820831542', 30);
insert into group_record (name, rgb, account_id) values ('It', '1775116530', 89);
insert into group_record (name, rgb, account_id) values ('Holdlamis', '2246929903', 15);
insert into group_record (name, rgb, account_id) values ('Latlux', '5787025555', 4);
insert into group_record (name, rgb, account_id) values ('Zontrax', '5232795694', 46);
insert into group_record (name, rgb, account_id) values ('Duobam', '7434877081', 39);
insert into group_record (name, rgb, account_id) values ('Quo Lux', '6042102923', 28);
insert into group_record (name, rgb, account_id) values ('Veribet', '5445709124', 98);
insert into group_record (name, rgb, account_id) values ('Cardify', '4585885978', 71);
insert into group_record (name, rgb, account_id) values ('Cardguard', '0168202573', 18);
insert into group_record (name, rgb, account_id) values ('Pannier', '8042586698', 28);
insert into group_record (name, rgb, account_id) values ('Job', '9583477176', 43);
insert into group_record (name, rgb, account_id) values ('It', '4499215471', 45);
insert into group_record (name, rgb, account_id) values ('Sub-Ex', '8130403307', 34);
insert into group_record (name, rgb, account_id) values ('Sonsing', '2617321924', 14);
insert into group_record (name, rgb, account_id) values ('Holdlamis', '0096216700', 78);
insert into group_record (name, rgb, account_id) values ('Konklux', '8713103784', 7);
insert into group_record (name, rgb, account_id) values ('Greenlam', '1582725187', 98);

insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Basic Industries', 'Illinois', 17, '2016-12-16 00:25:52', '2017-02-18 15:00:27', 'Synergized well-modulated core', false, 3, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Consumer Services', 'North Carolina', 72, '2017-04-26 01:52:31', '2017-03-28 15:25:58', 'Cross-platform web-enabled product', true, 65, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Consumer Services', 'Illinois', 81, '2016-10-17 02:19:39', '2017-06-15 09:07:32', 'Inverse foreground service-desk', true, 32, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Transportation', 'Florida', 4, '2017-04-26 21:54:49', '2016-09-04 18:20:21', 'Open-source encompassing encryption', false, 31, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('n/a', 'California', 2, '2017-01-08 03:34:02', '2017-07-31 15:24:55', 'Ergonomic motivating paradigm', false, 16, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Capital Goods', 'California', 23, '2016-11-09 11:51:47', '2017-02-20 18:35:38', 'Right-sized systematic knowledge user', false, 5, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Finance', 'Pennsylvania', 22, '2017-05-01 19:13:16', '2016-11-12 04:54:00', 'Decentralized foreground workforce', true, 32, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Public Utilities', 'Texas', 12, '2017-07-27 22:35:42', '2017-08-09 01:46:02', 'Seamless 5th generation hierarchy', true, 76, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Consumer Services', 'Texas', 26, '2017-08-06 01:46:52', '2016-10-14 23:11:37', 'Cloned high-level moratorium', true, 49, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Consumer Durables', 'Florida', 22, '2017-05-18 15:26:19', '2016-08-28 02:04:43', 'Business-focused web-enabled approach', true, 27, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Technology', 'Florida', 52, '2017-06-29 00:40:04', '2017-07-26 06:07:41', 'Secured hybrid data-warehouse', true, 24, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Health Care', 'Nebraska', 21, '2017-04-04 15:48:25', '2017-01-22 14:04:31', 'Multi-channelled scalable frame', true, 84, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Health Care', 'Missouri', 27, '2017-01-16 17:08:01', '2017-03-05 01:37:32', 'Multi-channelled fresh-thinking application', false, 42, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Finance', 'Arizona', 34, '2016-12-02 07:33:47', '2017-05-21 15:06:49', 'Decentralized hybrid implementation', true, 88, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Consumer Services', 'Florida', 14, '2017-05-01 14:47:54', '2017-08-13 03:16:15', 'Universal contextually-based hub', false, 76, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Consumer Services', 'District of Columbia', 51, '2016-09-26 21:56:42', '2016-10-09 04:55:21', 'Stand-alone global projection', false, 80, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('n/a', 'Florida', 14, '2016-12-21 19:56:57', '2016-11-28 21:23:35', 'Advanced value-added collaboration', false, 45, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Finance', 'Florida', 87, '2017-06-29 22:09:29', '2016-09-21 06:00:41', 'Synergized attitude-oriented info-mediaries', true, 62, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('n/a', 'Minnesota', 44, '2017-02-06 05:41:56', '2017-04-30 05:02:24', 'Down-sized contextually-based data-warehouse', false, 41, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('n/a', 'Iowa', 53, '2017-06-28 07:16:24', '2017-01-03 20:20:28', 'Automated multimedia adapter', false, 89, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Consumer Durables', 'Mississippi', 56, '2016-10-28 06:40:19', '2017-02-14 19:06:31', 'Public-key maximized definition', true, 1, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Consumer Services', 'California', 4, '2016-10-05 04:19:55', '2017-07-17 22:45:40', 'Mandatory logistical data-warehouse', true, 71, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('n/a', 'Virginia', 74, '2017-07-03 22:19:35', '2017-03-14 13:30:26', 'Synchronised dedicated migration', true, 15, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Finance', 'South Carolina', 81, '2016-08-31 07:02:37', '2017-03-12 20:34:49', 'Reduced zero defect database', false, 9, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('n/a', 'California', 62, '2017-03-04 06:43:43', '2016-12-22 08:42:08', 'Networked zero defect ability', true, 36, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Consumer Services', 'Maryland', 90, '2016-10-04 16:57:39', '2016-08-31 23:19:01', 'Polarised optimal leverage', false, 30, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Energy', 'Texas', 1, '2016-09-14 02:54:58', '2016-09-28 00:53:02', 'Profit-focused mission-critical focus group', true, 87, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Finance', 'Texas', 38, '2017-05-29 18:11:53', '2017-06-12 22:43:59', 'Realigned multi-tasking paradigm', true, 59, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Health Care', 'Ohio', 14, '2017-04-18 00:37:44', '2016-10-18 11:25:12', 'Function-based user-facing protocol', true, 44, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Technology', 'North Carolina', 56, '2017-06-09 05:14:09', '2017-04-02 08:37:48', 'Quality-focused responsive knowledge user', false, 30, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Consumer Services', 'Idaho', 22, '2017-08-20 04:16:35', '2017-03-29 18:42:21', 'Devolved cohesive matrix', false, 81, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Finance', 'Washington', 54, '2017-05-21 05:06:03', '2016-09-28 16:32:34', 'Reverse-engineered impactful leverage', true, 27, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Health Care', 'Colorado', 46, '2017-04-19 06:45:33', '2016-10-17 16:56:43', 'Team-oriented human-resource analyzer', false, 86, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Finance', 'Colorado', 29, '2017-03-21 17:20:53', '2017-02-15 00:33:43', 'Re-engineered dynamic extranet', false, 75, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Finance', 'California', 93, '2016-10-24 15:58:26', '2017-02-15 17:54:11', 'Re-engineered user-facing flexibility', true, 48, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Energy', 'Ohio', 23, '2017-06-19 16:14:05', '2017-07-17 18:06:28', 'Virtual encompassing knowledge user', true, 55, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('n/a', 'Iowa', 91, '2017-06-13 18:04:24', '2017-08-03 01:36:02', 'Total disintermediate initiative', false, 52, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('n/a', 'California', 31, '2016-10-02 03:58:49', '2016-09-03 18:20:26', 'Implemented 4th generation flexibility', false, 79, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('n/a', 'South Dakota', 15, '2017-07-08 03:51:37', '2016-10-10 02:33:56', 'Automated executive project', false, 6, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Consumer Services', 'Florida', 18, '2016-08-25 21:35:34', '2017-07-22 12:17:54', 'Total human-resource support', true, 55, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('n/a', 'Arizona', 96, '2017-05-14 01:44:41', '2016-09-28 11:27:01', 'Exclusive multi-state Graphic Interface', false, 77, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Health Care', 'Ohio', 84, '2017-06-07 10:10:22', '2016-08-27 03:06:16', 'Switchable stable ability', true, 84, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Finance', 'Georgia', 30, '2016-10-11 02:17:10', '2017-03-15 19:53:06', 'Optimized dynamic customer loyalty', true, 34, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Finance', 'Texas', 34, '2017-01-08 06:30:35', '2016-12-15 18:24:09', 'Persevering asynchronous success', false, 61, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Health Care', 'Alabama', 31, '2017-07-08 03:16:29', '2017-07-20 22:19:11', 'Polarised client-server local area network', true, 46, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Health Care', 'Texas', 38, '2017-07-15 20:06:23', '2017-03-15 05:04:36', 'Operative zero tolerance conglomeration', true, 57, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Capital Goods', 'California', 23, '2017-04-13 23:36:15', '2017-02-12 00:14:38', 'Function-based grid-enabled open system', true, 13, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('n/a', 'Ohio', 50, '2017-01-14 21:35:33', '2017-01-08 17:29:04', 'Enterprise-wide background encryption', false, 99, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Technology', 'Colorado', 28, '2016-08-27 01:28:46', '2016-10-11 05:06:06', 'Monitored homogeneous circuit', true, 66, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Finance', 'Mississippi', 99, '2017-08-13 19:02:55', '2016-11-14 06:09:20', 'Realigned web-enabled attitude', false, 60, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Health Care', 'California', 36, '2017-03-24 05:13:43', '2017-07-04 22:32:31', 'Reduced bifurcated instruction set', true, 86, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Capital Goods', 'New York', 77, '2017-08-18 14:30:42', '2017-04-28 13:57:41', 'User-friendly analyzing knowledge base', false, 74, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('n/a', 'Iowa', 13, '2017-04-10 13:01:40', '2016-11-03 12:40:04', 'Customizable optimal projection', true, 49, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Basic Industries', 'California', 63, '2017-07-22 22:46:08', '2016-12-21 09:16:53', 'Expanded 24/7 initiative', false, 35, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('n/a', 'Tennessee', 32, '2016-09-22 16:46:46', '2017-06-03 02:34:52', 'Visionary encompassing interface', false, 8, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Consumer Services', 'Nevada', 65, '2017-04-11 09:35:02', '2016-11-14 19:27:16', 'Front-line demand-driven migration', true, 86, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Miscellaneous', 'Florida', 98, '2017-07-14 23:34:08', '2017-06-14 15:14:40', 'Cross-platform non-volatile alliance', true, 7, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Consumer Services', 'District of Columbia', 71, '2017-01-16 14:13:51', '2017-07-26 02:12:09', 'Cross-platform 24/7 interface', true, 82, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Consumer Durables', 'Texas', 2, '2017-04-12 11:33:33', '2017-05-24 19:06:09', 'Synergistic multi-tasking hardware', true, 42, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Basic Industries', 'Illinois', 36, '2017-01-28 01:01:24', '2016-12-06 09:53:41', 'Cloned hybrid extranet', true, 9, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Technology', 'California', 66, '2017-03-15 05:25:57', '2016-09-14 14:55:13', 'Down-sized logistical migration', true, 31, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Miscellaneous', 'Florida', 22, '2016-09-03 02:16:41', '2016-10-11 23:23:35', 'User-centric 5th generation instruction set', false, 61, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Finance', 'Washington', 69, '2017-05-03 05:26:44', '2016-12-17 19:13:44', 'Inverse web-enabled leverage', false, 72, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('n/a', 'North Carolina', 80, '2017-04-01 13:45:33', '2017-03-23 02:33:27', 'Progressive mobile standardization', false, 30, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('n/a', 'Florida', 33, '2017-03-04 02:26:59', '2017-02-15 04:11:14', 'Horizontal disintermediate complexity', false, 3, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Consumer Services', 'Pennsylvania', 89, '2016-12-26 04:16:49', '2016-08-25 01:56:37', 'Profit-focused client-server help-desk', false, 50, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Transportation', 'Colorado', 83, '2016-08-27 17:53:07', '2016-09-20 08:45:09', 'Profound high-level access', false, 12, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Health Care', 'Illinois', 19, '2017-01-15 16:18:21', '2016-10-09 12:23:41', 'Diverse tertiary synergy', true, 45, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Capital Goods', 'Florida', 70, '2017-07-28 23:27:22', '2017-02-17 23:59:04', 'Quality-focused grid-enabled intranet', true, 68, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Energy', 'California', 22, '2017-07-02 20:25:37', '2017-08-02 08:51:45', 'Fundamental 3rd generation algorithm', false, 82, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Technology', 'Virginia', 14, '2016-09-27 00:39:28', '2017-07-23 06:00:30', 'Multi-lateral foreground service-desk', false, 15, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Finance', 'Oklahoma', 27, '2017-02-27 01:41:31', '2017-06-01 15:55:25', 'Profit-focused coherent middleware', true, 40, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Technology', 'Texas', 14, '2017-04-03 04:56:32', '2016-09-14 03:17:44', 'Grass-roots well-modulated hub', true, 73, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Consumer Services', 'Tennessee', 96, '2017-01-09 18:10:21', '2017-07-23 04:44:47', 'Business-focused content-based implementation', true, 98, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Consumer Non-Durables', 'New York', 70, '2017-07-21 20:41:31', '2016-10-01 18:22:39', 'Universal impactful structure', false, 59, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Basic Industries', 'Texas', 5, '2017-04-25 02:51:16', '2016-08-31 12:59:12', 'Devolved well-modulated protocol', false, 83, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Finance', 'Wisconsin', 14, '2016-10-26 14:07:28', '2017-05-29 18:02:02', 'Visionary eco-centric hierarchy', false, 87, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('n/a', 'Louisiana', 87, '2016-12-30 23:16:41', '2016-10-16 19:48:09', 'Synergistic dynamic synergy', false, 53, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Consumer Durables', 'Washington', 80, '2016-10-06 01:07:25', '2016-11-10 19:03:49', 'Automated mission-critical contingency', true, 49, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Miscellaneous', 'New York', 94, '2016-11-19 21:46:57', '2017-02-12 12:34:41', 'Synergistic transitional success', false, 50, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Health Care', 'Texas', 78, '2016-09-19 09:48:47', '2017-07-02 21:12:03', 'Adaptive stable flexibility', false, 28, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Basic Industries', 'California', 50, '2017-01-25 14:57:55', '2016-11-20 15:42:45', 'Visionary human-resource toolset', false, 46, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('n/a', 'Nebraska', 20, '2017-05-18 04:06:31', '2016-11-04 12:10:52', 'Programmable next generation flexibility', true, 42, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Finance', 'New York', 83, '2016-09-08 13:20:36', '2017-05-11 14:24:00', 'Persevering dedicated success', true, 46, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Finance', 'Michigan', 11, '2016-10-28 12:16:09', '2017-07-31 03:51:06', 'Synergistic local throughput', false, 61, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Energy', 'Missouri', 56, '2017-01-14 08:38:07', '2017-06-26 02:16:01', 'Progressive tertiary focus group', false, 44, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Consumer Services', 'Alabama', 23, '2017-07-25 04:23:02', '2017-03-29 01:55:42', 'Universal well-modulated throughput', false, 43, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Consumer Services', 'Alabama', 34, '2017-05-08 06:53:05', '2017-07-16 04:31:37', 'Versatile 6th generation archive', true, 40, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Technology', 'Iowa', 29, '2016-11-02 02:40:29', '2016-09-26 21:16:41', 'Object-based systemic moderator', true, 56, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('n/a', 'New York', 12, '2016-08-28 18:18:59', '2017-07-11 19:24:54', 'Programmable exuding protocol', true, 33, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Finance', 'Texas', 89, '2016-10-13 02:24:58', '2017-07-23 05:29:17', 'Quality-focused scalable conglomeration', false, 61, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Consumer Services', 'Georgia', 29, '2017-01-15 13:14:33', '2017-04-28 00:21:25', 'Persevering upward-trending orchestration', true, 54, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Miscellaneous', 'Pennsylvania', 80, '2017-08-05 04:14:17', '2017-02-22 19:48:16', 'Grass-roots 24 hour alliance', true, 23, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('n/a', 'Louisiana', 34, '2016-12-17 01:13:31', '2016-11-09 22:11:36', 'Front-line solution-oriented matrices', true, 2, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Health Care', 'Virginia', 45, '2017-06-05 01:52:44', '2016-10-21 07:51:03', 'Upgradable radical Graphic Interface', true, 76, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Finance', 'Georgia', 37, '2017-05-19 19:34:12', '2017-04-06 22:52:49', 'Vision-oriented web-enabled functionalities', false, 62, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Capital Goods', 'Texas', 74, '2017-07-14 11:38:48', '2017-07-27 17:44:59', 'Synergized optimizing archive', false, 37, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Technology', 'Missouri', 82, '2017-08-07 18:53:45', '2017-06-23 18:18:52', 'Extended maximized contingency', false, 30, false);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Health Care', 'Louisiana', 51, '2017-06-20 07:34:42', '2017-08-21 17:53:22', 'Upgradable context-sensitive hierarchy', true, 66, true);
insert into appointment (title, location, group_id, start_time, end_time, details, whole_day, reminder_interval, alarm_reminder) values ('Energy', 'Arizona', 78, '2017-07-04 04:33:13', '2017-07-03 08:45:20', 'Re-engineered responsive product', false, 95, false);