<?php

header('Content-Type: application/json');

include './includes/config.php';

$act = $_GET['act'] ?? null;

switch($act)
{
    case 'add':
        $status_code = 200;
        if (strtolower($_SERVER['REQUEST_METHOD']) == 'post')
        {
            $user_id = $_POST['user_id'] ?? null;
            $berita_id = $_POST['berita_id'] ?? null;
            $check_tambah = $pdo->prepare(
                "SELECT id FROM bookmark WHERE users_id = ? AND berita_id = ?"
            );
            $check_tambah->execute([ $user_id, $berita_id ]);

            if ($check_tambah->rowCount() == 0)
            {
                $output = [
                    'messages' => [
                        'errors' => 'Berita ini telah ditambahkan'
                    ]
                ];
            }
            else
            {
                $insert_data = $pdo->prepare(
                    "INSERT INTO bookmark SET users_id = ? AND berita_id = ?"
                );
                $insert_data->execute([ $user_id, $berita_id ]);

                $output = [
                    'success' => true
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
        break;
        
    default: 
        $status_code = 200;
        if (strtolower($_SERVER['REQUEST_METHOD']) == 'get')
        {
            $user_id = $_GET['user_id'] ?? null;
            $select_berita = $pdo->prepare(
                "SELECT
                    br.id, 
                    br.judul, 
                    br.created_at,
                    br.thumbnail,
                    k.nama as nama_kategori
                FROM bookmark as bk
                INNER JOIN berita as br
                ON br.id = bk.berita_id
                LEFT JOIN kategori as k
                ON k.id = br.kategori_id AND k.deleted_at IS NULL
                WHERE br.deleted_at IS NULL
                ORDER BY br.created_at DESC"
            );
            $select_berita->execute();

            $berita_terbaru = [];
            while($berita = $select_berita->fetch(PDO::FETCH_OBJ))
                $berita_terbaru[] = [
                    'id' => htmlspecialchars($berita->id),
                    'judul_berita' => htmlspecialchars($berita->judul),
                    'thumbnail' => './foto/'.htmlspecialchars($berita->thumbnail),
                    'dibuat_pada' => htmlspecialchars($berita->created_at),
                    'nama_kategori' => htmlspecialchars($berita->nama_kategori)
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
}


$output = array_merge([
    'status' => $status_code,
    'error' => $status_code
], $output);


http_response_code($status_code);
echo json_encode($output, JSON_PRETTY_PRINT);


$pdo = null;