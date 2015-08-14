<?php

$LOG_FILE = dirname(__FILE__).'/hook.log';

$payload_string = $_POST['payload'];
// test
//$payload_string = '{"ref":"refs/heads/master"}';


if ( isset($payload_string) ) {
    $payload = json_decode($payload_string, true);
    var_dump($payload);
    if ($payload['ref'] === 'refs/heads/master') {
        `cd /var/www/html/website; git pull origin master; wintersmith build`;
        file_put_contents($LOG_FILE, date("[Y-m-d H:i:s]")." ".$_SERVER['REMOTE_ADDR']." git pulled: ".$payload['head_commit']['message']."\n", FILE_APPEND|LOCK_EX);
    }
    else if ($payload['ref'] === 'refs/heads/develop') {
        `cd /var/www/dev/website; git pull origin master; wintersmith build`;
        file_put_contents($LOG_FILE, date("[Y-m-d H:i:s]")." ".$_SERVER['REMOTE_ADDR']." git pulled: ".$payload['head_commit']['message']."\n", FILE_APPEND|LOCK_EX);
    }
} else {
    file_put_contents($LOG_FILE, date("[Y-m-d H:i:s]")." invalid access: ".$_SERVER['REMOTE_ADDR']."\n", FILE_APPEND|LOCK_EX);
}

