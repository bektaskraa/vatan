CREATE TABLE `user`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `username` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(255) NOT NULL,
    `type` INT NOT NULL AUTO_INCREMENT
);
CREATE TABLE `cart_payment`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `cartId` INT NOT NULL,
    `creditCardId` INT NOT NULL,
    `installmentMonth` INT NULL AUTO_INCREMENT
);
CREATE TABLE `product_stock`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `dealerId` INT NOT NULL,
    `productOptionId` INT NOT NULL,
    `amount` INT NOT NULL,
    `date` DATETIME NOT NULL
);
CREATE TABLE `product_options`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `categoryId` INT NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `extra_price` DOUBLE NOT NULL
);
CREATE TABLE `category`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(255) NOT NULL,
    `parentId` INT NULL
);
CREATE TABLE `favorite`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `productId` INT NOT NULL,
    `userId` INT NOT NULL
);
CREATE TABLE `dealer`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL
);
CREATE TABLE `product`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `categoryId` INT NOT NULL,
    `release_date` DATE NOT NULL
);
CREATE TABLE `product_options_category`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(255) NOT NULL,
    `productId` INT NOT NULL
);
CREATE TABLE `product_images`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `src` VARCHAR(255) NOT NULL,
    `productId` INT NOT NULL
);
CREATE TABLE `cart`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `userId` INT NOT NULL,
    `totalPrice` DOUBLE NOT NULL,
    `checked` INT NOT NULL AUTO_INCREMENT
);
CREATE TABLE `product_feature`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(255) NOT NULL,
    `value` VARCHAR(255) NOT NULL,
    `productId` INT NOT NULL
);
CREATE TABLE `credit_cards`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(255) NULL,
    `number` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `cvv` VARCHAR(255) NOT NULL,
    `userId` INT NOT NULL
);
CREATE TABLE `product_rating`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `rate` DOUBLE NULL,
    `comment` VARCHAR(255) NULL,
    `userId` INT NOT NULL,
    `productId` INT NOT NULL,
    `dealerId` INT NOT NULL
);
CREATE TABLE `cart_items`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `productId` INT NOT NULL,
    `cartId` INT NOT NULL,
    `amount` INT NOT NULL
);
ALTER TABLE
    `cart_payment` ADD CONSTRAINT `cart_payment_cartid_foreign` FOREIGN KEY(`cartId`) REFERENCES `cart`(`id`);
ALTER TABLE
    `product_rating` ADD CONSTRAINT `product_rating_productid_foreign` FOREIGN KEY(`productId`) REFERENCES `product`(`id`);
ALTER TABLE
    `product` ADD CONSTRAINT `product_categoryid_foreign` FOREIGN KEY(`categoryId`) REFERENCES `category`(`id`);
ALTER TABLE
    `product_stock` ADD CONSTRAINT `product_stock_productoptionid_foreign` FOREIGN KEY(`productOptionId`) REFERENCES `product_options`(`id`);
ALTER TABLE
    `product_images` ADD CONSTRAINT `product_images_productid_foreign` FOREIGN KEY(`productId`) REFERENCES `product`(`id`);
ALTER TABLE
    `product_rating` ADD CONSTRAINT `product_rating_dealerid_foreign` FOREIGN KEY(`dealerId`) REFERENCES `dealer`(`id`);
ALTER TABLE
    `cart_items` ADD CONSTRAINT `cart_items_productid_foreign` FOREIGN KEY(`productId`) REFERENCES `product`(`id`);
ALTER TABLE
    `favorite` ADD CONSTRAINT `favorite_userid_foreign` FOREIGN KEY(`userId`) REFERENCES `user`(`id`);
ALTER TABLE
    `credit_cards` ADD CONSTRAINT `credit_cards_userid_foreign` FOREIGN KEY(`userId`) REFERENCES `user`(`id`);
ALTER TABLE
    `product_stock` ADD CONSTRAINT `product_stock_dealerid_foreign` FOREIGN KEY(`dealerId`) REFERENCES `dealer`(`id`);
ALTER TABLE
    `category` ADD CONSTRAINT `category_parentid_foreign` FOREIGN KEY(`parentId`) REFERENCES `category`(`id`);
ALTER TABLE
    `product_options` ADD CONSTRAINT `product_options_categoryid_foreign` FOREIGN KEY(`categoryId`) REFERENCES `product_options_category`(`id`);
ALTER TABLE
    `cart_payment` ADD CONSTRAINT `cart_payment_creditcardid_foreign` FOREIGN KEY(`creditCardId`) REFERENCES `credit_cards`(`id`);
ALTER TABLE
    `cart` ADD CONSTRAINT `cart_userid_foreign` FOREIGN KEY(`userId`) REFERENCES `user`(`id`);
ALTER TABLE
    `favorite` ADD CONSTRAINT `favorite_productid_foreign` FOREIGN KEY(`productId`) REFERENCES `product`(`id`);
ALTER TABLE
    `product_rating` ADD CONSTRAINT `product_rating_userid_foreign` FOREIGN KEY(`userId`) REFERENCES `user`(`id`);
ALTER TABLE
    `product_options_category` ADD CONSTRAINT `product_options_category_productid_foreign` FOREIGN KEY(`productId`) REFERENCES `product`(`id`);
ALTER TABLE
    `product_feature` ADD CONSTRAINT `product_feature_productid_foreign` FOREIGN KEY(`productId`) REFERENCES `product`(`id`);
ALTER TABLE
    `cart_items` ADD CONSTRAINT `cart_items_cartid_foreign` FOREIGN KEY(`cartId`) REFERENCES `cart`(`id`);