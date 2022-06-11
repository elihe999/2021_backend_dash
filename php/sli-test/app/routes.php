<?php
declare(strict_types=1);

use App\Application\Actions\User\ListUsersAction;
use App\Application\Actions\User\ViewUserAction;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\App;
use Slim\Interfaces\RouteCollectorProxyInterface as Group;

use ClickHouseDB\Client;
use ClickHouseDB\Transport;

return function (App $app) {
    $app->options('/{routes:.*}', function (Request $request, Response $response) {
        // CORS Pre-Flight OPTIONS Request Handler
        return $response;
    });

    $app->get('/', function (Request $request, Response $response) {
	    $db = new ClickHouseDB\Client([
		'host' => '192.168.99.71',
	        'port' => '8123',
		'username' => 'default',
		'password' => 'Secxun@2021'
	    ]);
	if (!$db->ping()) {
            $response->getBody()->write('Not connect');
	} else {
		$response->getBody()->write('Hello world!');
	       var_dump($db->showTables());
	}


        return $response;
    });

    $app->group('/users', function (Group $group) {
        $group->get('', ListUsersAction::class);
        $group->get('/{id}', ViewUserAction::class);
    });
};
