<?php

function tanggalIndo($time, $pakaiWaktu = false)
{
    $arr_hari = array_hari();

    $time = strtotime($time);
    $hari = date('N', $time) - 1;
    $tanggal = date('d', $time);
    $bulan = date('n', $time) - 1;
    $tahun = date('Y', $time);
    $waktu = date('H:i', $time);

    return $arr_hari[$hari].', '.$tanggal.' '.array_bulan($bulan).' '.$tahun.($pakaiWaktu ? ' '.$waktu : '');
}

function array_hari()
{
    return ['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jum\'at', 'Sabtu', 'Minggu'];
}

function array_bulan($index)
{
    $arr = [
        'Januari',
        'Februari',
        'Maret',
        'April',
        'Mei',
        'Juni',
        'Juli',
        'Agustus',
        'September',
        'Oktober',
        'November',
        'Desember'
    ];

    return $arr[$index];
}