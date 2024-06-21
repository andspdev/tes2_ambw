<?php

header('Content-Type: application/json');

include './includes/config.php';


if (strtolower($_SERVER['REQUEST_METHOD']) == 'get')
{
    $status_code = 200;

    $id = $_GET['id'] ?? null;
    $query_berita = $pdo->prepare(
        "SELECT 
            b.id, 
            judul, 
            b.created_at,
            thumbnail
        FROM berita as b
        WHERE b.deleted_at IS NULL AND kategori_id = ?
        ORDER BY b.created_at DESC LIMIT 10;"
    );
    $query_berita->execute([ $id ]);

    $berita_terbaru = [];
    while($berita = $query_berita->fetch(PDO::FETCH_OBJ))
        $berita_terbaru[] = [
            'id' => htmlspecialchars($berita->id),
            'judul_berita' => htmlspecialchars($berita->judul),
            'thumbnail' => './foto/'.htmlspecialchars($berita->thumbnail),
            'dibuat_pada' => htmlspecialchars($berita->created_at)
        ];

    $output = [
        'berita' => $berita_terbaru
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


http_response_code($status_code);
echo json_encode($output, JSON_PRETTY_PRINT);


$pdo = null;