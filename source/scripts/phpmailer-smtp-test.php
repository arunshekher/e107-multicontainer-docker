<?php
use PHPMailer\PHPMailer\PHPMailer;
require __DIR__ . '/vendor/autoload.php';
$mail = new PHPMailer;

$mail->isSMTP();
$mail->SMTPDebug = 2;
$mail->Host = 'mailhog';
$mail->Port = 1025;
$mail->SMTPAuth = false;
$mail->setFrom('mymail@myawesomedomain.tld', 'Your Name');
$mail->addReplyTo('mymail@myawesomedomain.tld', 'Your Name');
$mail->addAddress('recipient@domain.tld', 'Receiver Name');
$mail->Subject = 'Checking if PHPMailer works';
$mail->Body = 'This is just a plain text message body';

if (!$mail->send()) {
    echo 'Mailer Error: ' . $mail->ErrorInfo . PHP_EOL;
} else {
    echo 'The email message was sent!' . PHP_EOL;
}
// todo: findout why this implementation of PHPMailer SMTP works but not e107
