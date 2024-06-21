<?php

require_once './includes/config.php';


$id = $_GET['berita_id'] ?? '';

$check_thumbnail = $pdo->prepare(
    "SELECT thumbnail FROM `berita` WHERE id = ?"
);
$check_thumbnail->execute([ $id ]);

$loc = './foto/lainnya/thumbnail-404.jpg';
if ($check_thumbnail->rowCount() > 0)
{
    $fetch_thumb = $check_thumbnail->fetch(PDO::FETCH_OBJ);
    $loc = './foto/'.$fetch_thumb->thumbnail;

    if (!file_exists($loc) && !is_dir($loc))
        $loc = './foto/lainnya/thumbnail-404.jpg';
}


readfile($loc);