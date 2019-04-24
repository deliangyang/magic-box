<?php

$filename = '/mnt/tmp/fix_daily_task/cleaning_data.log';

function iterator_file() {
    global $filename;
    $f = fopen($filename, 'r');
    while (!feof($f)) {
        $line = fgets($f);
        yield$line;
    }
}

foreach (iterator_file() as $line) {
    if (empty($line)) {
        continue;
    }
    $data = json_decode($line, true);
    if (!isset($data['error']['extra']['queueName'])
        || $data['error']['extra']['queueName'] != 'multiSendGiftStat') {
        continue;
    }
    $extra = json_decode($data['error']['extra']['body'], true);
    $total = 0;
    foreach ($extra['multiGifts'] as $giftId => $data) {
        foreach ($data as $datum) {
            $total += $datum['sendDetail']['total']['changeKdNum'];
        }
    }
    echo sprintf("%s,%s,%s,%s\n", $extra['sendUserId'], $extra['acceptUserId'], $extra['roomId'], $total);
}