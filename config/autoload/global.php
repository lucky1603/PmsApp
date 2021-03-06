<?php
/**
 * Global Configuration Override
 *
 * You can use this file for overriding configuration values from modules, etc.
 * You would place values in here that are agnostic to the environment and not
 * sensitive to security.
 *
 * @NOTE: In practice, this file will typically be INCLUDED in your source
 * control, so do not include passwords or other sensitive information in this
 * file.
 */

return array(
//    'db' => [
//        'driver' => 'Pdo',
//        'dsn' => 'pgsql:dbname=hotel;host=192.168.0.7',
//        'username' => 'hotel',
//        'password' => 'BiloKoji12',        
//        'charset' => 'utf8',
//    ],
    'db' => [
        'driver' => 'Pdo',
        'dsn' => 'pgsql:dbname=hotel;host=localhost',
        'username' => 'postgres',
        'password' => 'BiloKoji12',        
        'charset' => 'utf8',
    ],
//    'db' => [git 
//        'driver' => 'Pdo',
//        'dsn' => 'mysql:dbname=hotel;host=127.0.0.1',
//        'username' => 'hotel',
//        'password' => 'BiloKoji12',        
//        'charset' => 'utf8',
//    ],
    'service_manager' => [
        'factories' => [
            'Zend\Db\Adapter\Adapter' => 'Zend\Db\Adapter\AdapterServiceFactory'
        ]
    ]    
);
