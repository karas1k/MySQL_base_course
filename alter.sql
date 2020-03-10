ALTER TABLE `geodata`.`_countries` CHANGE country_id id int(11) NOT NULL;
ALTER TABLE `geodata`.`_countries` CHANGE title_ru title varchar(150) NOT NULL;
ALTER TABLE `geodata`.`_countries`
DROP COLUMN `title_cz`,
DROP COLUMN `title_lv`,
DROP COLUMN `title_lt`,
DROP COLUMN `title_ja`,
DROP COLUMN `title_pl`,
DROP COLUMN `title_it`,
DROP COLUMN `title_fr`,
DROP COLUMN `title_de`,
DROP COLUMN `title_pt`,
DROP COLUMN `title_es`,
DROP COLUMN `title_en`,
DROP COLUMN `title_be`,
DROP COLUMN `title_ua`,
MODIFY COLUMN id int(11) auto_increment,
ADD PRIMARY KEY (`id`),
ADD INDEX `_countries_title_ru_IDX` (`title` ASC) VISIBLE;
;


ALTER TABLE `geodata`.`_regions` CHANGE region_id id int(11) NOT NULL;
ALTER TABLE `geodata`.`_regions` CHANGE title_ru title varchar(150) NOT NULL;
ALTER TABLE `geodata`.`_regions`
DROP COLUMN `title_cz`,
DROP COLUMN `title_lv`,
DROP COLUMN `title_lt`,
DROP COLUMN `title_ja`,
DROP COLUMN `title_pl`,
DROP COLUMN `title_it`,
DROP COLUMN `title_fr`,
DROP COLUMN `title_de`,
DROP COLUMN `title_pt`,
DROP COLUMN `title_es`,
DROP COLUMN `title_en`,
DROP COLUMN `title_be`,
DROP COLUMN `title_ua`,
MODIFY COLUMN id int(11) auto_increment,
ADD PRIMARY KEY (`id`),
ADD CONSTRAINT `_regions_FK` FOREIGN KEY (country_id) REFERENCES geodata.`_countries`(`id`),
ADD INDEX `_regions_title_ru_IDX` (`title` ASC) VISIBLE;
;


ALTER TABLE `geodata`.`_cities` CHANGE city_id id int(11) NOT NULL;
ALTER TABLE `geodata`.`_cities` CHANGE title_ru title varchar(150) NOT NULL;
ALTER TABLE `geodata`.`_cities` 
DROP COLUMN `region_cz`,
DROP COLUMN `area_cz`,
DROP COLUMN `title_cz`,
DROP COLUMN `region_lv`,
DROP COLUMN `area_lv`,
DROP COLUMN `title_lv`,
DROP COLUMN `region_lt`,
DROP COLUMN `area_lt`,
DROP COLUMN `title_lt`,
DROP COLUMN `region_ja`,
DROP COLUMN `area_ja`,
DROP COLUMN `title_ja`,
DROP COLUMN `region_pl`,
DROP COLUMN `area_pl`,
DROP COLUMN `title_pl`,
DROP COLUMN `region_it`,
DROP COLUMN `area_it`,
DROP COLUMN `title_it`,
DROP COLUMN `region_fr`,
DROP COLUMN `area_fr`,
DROP COLUMN `title_fr`,
DROP COLUMN `region_de`,
DROP COLUMN `area_de`,
DROP COLUMN `title_de`,
DROP COLUMN `region_pt`,
DROP COLUMN `area_pt`,
DROP COLUMN `title_pt`,
DROP COLUMN `region_es`,
DROP COLUMN `area_es`,
DROP COLUMN `title_es`,
DROP COLUMN `region_en`,
DROP COLUMN `area_en`,
DROP COLUMN `title_en`,
DROP COLUMN `region_be`,
DROP COLUMN `area_be`,
DROP COLUMN `title_be`,
DROP COLUMN `region_ua`,
DROP COLUMN `area_ua`,
DROP COLUMN `title_ua`,
DROP COLUMN `region_ru`,
DROP COLUMN `area_ru`,
MODIFY COLUMN id int(11) auto_increment,
ADD PRIMARY KEY (`id`),
ADD CONSTRAINT `_cities_FK_to_countries` FOREIGN KEY (country_id) REFERENCES geodata.`_countries`(id),
ADD CONSTRAINT `_cities_FK_to_regions` FOREIGN KEY (region_id) REFERENCES geodata.`_regions`(id),
ADD INDEX `_cities_title_ru_IDX` (`title` ASC) VISIBLE;
;
