<?php

try {
    $pdo = new PDO('mysql:host=localhost;dbname=test2_ambw', 'root', '');
} catch(\PDOException $error) {
    die('Error database: '.$error->getMessage());
}