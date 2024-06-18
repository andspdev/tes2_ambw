<?php

header('Content-Type: application/json');

include './includes/config.php';


if (strtolower($_SERVER['REQUEST_METHOD']) == 'post')
{
    $status_code = 200;
    $email = $_POST['email'] ?? null;
    $password = $_POST['password'] ?? null;
    $check_user = $pdo->prepare(
        "SELECT 
            id,
            nama, 
            email, 
            jurusan, 
            profile_pic, 
            login_terakhir,
            password
        FROM `users` WHERE email = ? AND deleted_at IS NULL"
    );
    $check_user->execute([ $email ]);
    $fetch_user = $check_user ? $check_user->fetch(PDO::FETCH_OBJ) : null;

    $error = true;
    $error_val = [];
    if ($check_user->rowCount() == 0)
        $error_val['email'] = 'Email tidak ditemukan.';

    if ($check_user && !password_verify($password, $fetch_user->password))
        $error_val['password'] = 'Kata sandi salah.';

    $error = count($error_val) > 0;

    if ($error) 
    {
        $output = [
            'messages' => [
                'errors' => $error_val
            ]
        ];
    }
    else
    {
        $update_profil = $pdo->prepare("UPDATE `users` SET login_terakhir = ? WHERE id = ?");
        $update_profil->execute([ 
            date('Y-m-d H:i:s'), 
            $fetch_user->id 
        ]);

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


echo json_encode($output, JSON_PRETTY_PRINT);

$pdo = null;