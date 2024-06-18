<?php

header('Content-Type: application/json');

include './includes/config.php';


if (strtolower($_SERVER['REQUEST_METHOD']) == 'get')
{
    $status_code = 200;
    $user_id = $_GET['user_id'] ?? null;
    $check_user = $pdo->prepare(
        "SELECT 
            id,
            nama, 
            email, 
            jurusan, 
            profile_pic, 
            login_terakhir,
            password
        FROM `users` WHERE id = ? AND deleted_at IS NULL"
    );
    $check_user->execute([ $user_id ]);

    if ($check_user->rowCount() == 0)
        $output = [
            'messages' => [
                'errors' => 'Pengguna tidak dapat ditemukan.'
            ]
        ];
    else
    {
        $fetch_user = $check_user->fetch(PDO::FETCH_OBJ);

        $output = [
            'data_user' => [
                'id' => htmlspecialchars($fetch_user->id),
                'nama' => htmlspecialchars($fetch_user->nama),
                'email' => htmlspecialchars($fetch_user->email),
                'jurusan' => htmlspecialchars($fetch_user->jurusan),
                'profile_pic' => htmlspecialchars($fetch_user->profile_pic),
                'login_terakhir' => htmlspecialchars($fetch_user->login_terakhir)
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


http_response_code($status_code);
echo json_encode($output, JSON_PRETTY_PRINT);


$pdo = null;