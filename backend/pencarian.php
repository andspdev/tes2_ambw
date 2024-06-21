<?php

header('Content-Type: application/json');

include './includes/config.php';


if (strtolower($_SERVER['REQUEST_METHOD']) == 'get')
{
    $status_code = 200;

    $search = $_GET['q'] ?? null;
    $query_berita = $pdo->prepare(
        "SELECT 
            b.id, 
            judul, 
            b.created_at,
            thumbnail
        FROM berita as b
        WHERE b.deleted_at IS NULL AND judul LIKE ?
        ORDER BY b.created_at DESC LIMIT 10;"
    );
    $query_berita->execute([ '%'.$search.'%' ]);

    $berita_terbaru = [];
    while($berita = $query_berita->fetch(PDO::FETCH_OBJ))
        $berita_terbaru[] = [
            'id' => htmlspecialchars($berita->id),
            'judul_berita' => htmlspecialchars($berita->judul),
            'thumbnail' => 'https://ambw.andsp.id/test-2/thumbnail.php?berita_id='.htmlspecialchars($berita->id),
            'dibuat_pada' => htmlspecialchars(tanggalIndo($berita->created_at, true))
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