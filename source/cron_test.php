<?php

ini_set( 'display_errors', 1 );
error_reporting( E_ALL );
$from = "emailtest@test.test";
$to = "test@test.test";
$subject = "PHP Mail Test script";
$message = "This is a test to check the PHP Mail functionality";
$headers = "From:" . $from;

if (mail($to, $subject, $message, $headers)) {
    echo "CRON-DAEMON: Success! test email sent." . PHP_EOL;
}
