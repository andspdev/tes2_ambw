<?php

header('Content-Type: application/json');

include './includes/config.php';


if (strtolower($_SERVER['REQUEST_METHOD']) == 'get')
{
    $status_code = 200;


    // Berita highlight
    $query_berita_h = $pdo->prepare(
        "SELECT 
            b.id, 
            judul, 
            b.created_at,
            thumbnail,
            k.nama as nama_kategori
        FROM berita as b
        LEFT JOIN kategori as k
        ON k.id = b.kategori_id AND k.deleted_at IS NULL
        WHERE is_highlight = 1 AND b.deleted_at IS NULL
        ORDER BY rand() LIMIT 1;"
    );
    $query_berita_h->execute();

    $berita_highlight = [];
    while($berita = $query_berita_h->fetch(PDO::FETCH_OBJ))
        $berita_highlight = [
            'id' => htmlspecialchars($berita->id),
            'judul_berita' => htmlspecialchars($berita->judul),
            'thumbnail' => htmlspecialchars($berita->thumbnail),
            'dibuat_pada' => htmlspecialchars($berita->created_at),
            'nama_kategori' => htmlspecialchars($berita->nama_kategori)
        ];
    // End berita highlight



    // Paling banyak dilihat
    $query_berita_bd = $pdo->prepare(
        "SELECT 
            b.id, 
            judul, 
            b.created_at,
            thumbnail,
            k.nama as nama_kategori
        FROM berita as b
        LEFT JOIN kategori as k
        ON k.id = b.kategori_id AND k.deleted_at IS NULL
        WHERE is_highlight = 1 AND b.deleted_at IS NULL
        ORDER BY views DESC LIMIT 1;"
    );
    $query_berita_bd->execute();

    $berita_bd = [];
    while($berita = $query_berita_bd->fetch(PDO::FETCH_OBJ))
        $berita_bd = [
            'id' => htmlspecialchars($berita->id),
            'judul_berita' => htmlspecialchars($berita->judul),
            'thumbnail' => htmlspecialchars($berita->thumbnail),
            'dibuat_pada' => htmlspecialchars($berita->created_at),
            'nama_kategori' => htmlspecialchars($berita->nama_kategori)
        ];
    // End Paling banyak dilihat
    


    // Berita terbaru
    $query_berita = $pdo->prepare(
        "SELECT 
            b.id, 
            judul, 
            b.created_at,
            thumbnail,
            k.nama as nama_kategori
        FROM berita as b
        LEFT JOIN kategori as k
        ON k.id = b.kategori_id AND k.deleted_at IS NULL
        WHERE b.deleted_at IS NULL
        ORDER BY b.created_at DESC LIMIT 10;"
    );
    $query_berita->execute();

    $berita_terbaru = [];
    while($berita = $query_berita->fetch(PDO::FETCH_OBJ))
        $berita_terbaru = [
            'id' => htmlspecialchars($berita->id),
            'judul_berita' => htmlspecialchars($berita->judul),
            'thumbnail' => htmlspecialchars($berita->thumbnail),
            'dibuat_pada' => htmlspecialchars($berita->created_at),
            'nama_kategori' => htmlspecialchars($berita->nama_kategori)
        ];
    // End berita terbaru

    

    $output = [
        'berita' => [
            'highlight' => $berita_highlight,
            'banyak_dilihat' => $berita_bd,
            'terbaru' => $berita_terbaru,
        ]
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