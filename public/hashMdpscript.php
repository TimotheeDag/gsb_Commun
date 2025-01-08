<?php

require '../src/Modeles/PdoGsb.php';

$pdo = Modeles\PdoGsb::getPdoGsb();
$pdo->setMdpHash();