<?php

header('Content-Type: application/json');

include './includes/config.php';


if (strtolower($_SERVER['REQUEST_METHOD']) == 'get')
{
    $status_code = 200;

    $list_kategori = $pdo->prepare(
        "SELECT
            id,
            nama
        FROM kategori
        WHERE deleted_at IS NULL
        ORDER BY nama ASC
        "
    );
    $list_kategori->execute();

    $kategori_arr = [];
    while($kategori = $list_kategori->fetch(PDO::FETCH_OBJ))
        $kategori_arr[] = [
            'id' => htmlspecialchars($kategori->id),
            'nama' => htmlspecialchars($kategori->nama)
        ];

    $output = [
        'kategori' => $kategori_arr
    ];
}
else
{
    $status_code = 400;

    $output = [
        'messages' => [
            'errors' => 'Method tidak didukung!'
        ]
    ];
}


$output = array_merge([
    'status' => $status_code,
    'error' => $status_code
], $output);


echo json_encode($output, JSON_PRETTY_PRINT);

$pdo = null;