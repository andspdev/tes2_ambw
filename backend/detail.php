<?php

header('Content-Type: application/json');

include './includes/config.php';


if (strtolower($_SERVER['REQUEST_METHOD']) == 'get')
{
    $status_code = 200;
    $id = $_GET['id'] ?? null;
    $user_id = $_GET['user_id'] ?? null;

    $fetch_detail = $pdo->prepare(
        "SELECT
            judul,
            deskripsi,
            views,
            thumbnail,
            b.created_at as dibuat_pada,
            k.nama as nama_kategori,
            k.id as kategori_id,
            IFNULL(bk.id, 'tidak') as tersimpan_bookmark
        FROM `berita` as b
        LEFT JOIN `kategori` as k
        ON k.id = b.kategori_id AND k.deleted_at IS NULL
        LEFT JOIN `bookmark` as bk
        ON bk.berita_id = b.id AND users_id = \"".addslashes($user_id)."\"
        WHERE b.deleted_at IS NULL AND b.id = ?"
    );

    $fetch_detail->execute([ $id ]);

    if ($fetch_detail->rowCount() > 0)
    {
        $fetch_detail = $fetch_detail->fetch(PDO::FETCH_OBJ);

        $output = [
            'detail_berita' => [
                'judul' => htmlspecialchars($fetch_detail->judul),
                'deskripsi' => htmlspecialchars($fetch_detail->deskripsi),
                'views' => htmlspecialchars($fetch_detail->views),
                'dibuat_pada' => htmlspecialchars(tanggalIndo($fetch_detail->dibuat_pada, true)),
                'kategori' => [
                    'id' => htmlspecialchars($fetch_detail->kategori_id),
                    'nama' => htmlspecialchars($fetch_detail->nama_kategori)
                ],
                'dibookmark' => !($fetch_detail->tersimpan_bookmark == 'tidak')
            ]
        ];
    }
    else
    {
        $output = [
            'messages' => [
                'errors' => 'Berita tidak ditemukan.'
            ]
        ];
    }
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