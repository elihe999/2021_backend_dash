<?php
/**
 * Created by PhpStorm.
 * User: mbrzuchalski
 * Date: 02.09.16
 * Time: 10:20
 */
use Doctrine\DBAL\DriverManager;
use SpeciticationTest\Repository\Specification\User\CreatedAfter;
use SpeciticationTest\Repository\Specification\User\IsAdmin;
use SpeciticationTest\Repository\UserRepository;

require_once 'vendor/autoload.php';

$conn = DriverManager::getConnection([
    'dbname' => '',
    'user' => 'postgres',
    'password' => '123',
    'host' => '192.168.10.131',
    'driver' => 'pdo_oci',
    'port' => '5432'
]);

$userRepository = new UserRepository($conn);

$isAdmin = new IsAdmin();

$dateTime = DateTime::createFromFormat('Y-m-d H:i:s', '2016-09-02 08:38:41');
$createdAfter = new CreatedAfter($dateTime);

$results = $userRepository->findAllBySpecification($isAdmin->and($createdAfter));

var_dump($results);
