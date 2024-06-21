<?php

require_once './includes/config.php';


$id = $_GET['berita_id'] ?? '';

$check_thumbnail = $pdo->prepare(
    "SELECT thumbnail FROM `berita` WHERE id = ?"
);
$check_thumbnail->execute([ $id ]);

$fetch_thumb = $check_thumbnail->fetch(PDO::FETCH_OBJ);
$loc = './foto/'.$fetch_thumb->thumbnail;

readfile($loc);