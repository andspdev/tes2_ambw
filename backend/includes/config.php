<?php

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header("Access-Control-Allow-Headers: X-Requested-With, Content-Type");

try {
    $pdo = new PDO('mysql:host=localhost;dbname=', 'root', '');
} catch(\PDOException $error) {
    die('Error database: '.$error->getMessage());
}

include 'functions.php';