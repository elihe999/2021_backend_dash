<?php
  $Input = "123123123123";
  // Encrypt it with the MD4 hash
  $MD4Hash=hash('md4', $Input);
  $MD5Hash=hash('md5', $Input);

  $oldHash = md5($Input);
  echo $MD5Hash;
  echo "\n";
  echo $oldHash;
?>
