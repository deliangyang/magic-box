<?php

$a = false ?: [];
var_dump($a);

exit;

$content = file_get_contents('3333.txt');


$data = [];
foreach (explode("\n", $content) as $line) {
    if (preg_match("#code\":(\d{6}|404|405)#", $line)) {
        continue;
    }
    if (preg_match('#libcurl-errors.html#', $line)) {
        continue;
    }
    $line = preg_replace('#(^\s+\d+)#', '', $line);
    $items = explode(':', $line);
    unset($items[0]);
    $md5 = md5(implode('', $items));
    if (isset($data[$md5])) {
        continue;
    } else {
        $data[$md5] = $line;
    }
}

foreach ($data as $md5 => $line) {
    echo $line, PHP_EOL;

}