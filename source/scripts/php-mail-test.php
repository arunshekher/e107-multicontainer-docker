<?php

$to      = 'nobody@example.com';
$subject = 'the subject';
$message = 'hello';
$headers = array(
    'From' => 'webmaster@example.com',
    'Reply-To' => 'webmaster@example.com',
    'X-Mailer' => 'PHP/' . phpversion()
);

if (mail($to, $subject, $message, $headers)) {
    echo "CRON-MAIL-TEST: Success! test email sent at " . date('d-m-Y H:i:s A') . PHP_EOL;
}


