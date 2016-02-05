<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2015 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Application;

return array(
    'router' => array(
        'routes' => array(
            'home' => array(
                'type' => 'Zend\Mvc\Router\Http\Literal',
                'options' => array(
                    'route'    => '/',
                    'defaults' => array(
//                        'controller' => 'Application\Controller\Index',
                        'controller' => 'Pms\Controller\Index',
                        'action'     => 'index',
                    ),
                ),
            ),
            'entity-types' => array(
                'type' => 'Zend\Mvc\Router\Http\Literal',
                'options' => array(
                    'route' => '/pms/entity-type',
                    'defaults' => array(
                        'controller' => 'Pms\Controller\EntityType',
                        'action' => 'index',
                    )
                ),
            ),
            'entity-definitions' => array(
                'type' => 'Zend\Mvc\Router\Http\Literal',
                'options' => array(
                    'route' => '/pms/entity-definition',
                    'defaults' => array(
                        'controller' => 'Pms\Controller\EntityDefinition',
                        'action' => 'index',
                    )
                ),
            ),
            'entities' => array(
                'type' => 'Zend\Mvc\Router\Http\Literal',
                'options' => array(
                    'route' => '/pms/entity',
                    'defaults' => array(
                        'controller' => 'Pms\Controller\Entity',
                        'action' => 'index',
                    )
                ),
            ),            
            'reservations' => array(
                'type' => 'Zend\Mvc\Router\Http\Literal',
                'options' => array(
                    'route' => '/pms/reservation',
                    'defaults' => array(
                        'controller' => 'Pms\Controller\Reservation',
                        'action' => 'index',
                    )
                ),
            ),
            'reports' => array(
                'type' => 'Zend\Mvc\Router\Http\Literal',
                'options' => array(
                    'route' => 'pms',
                    'defaults' => array(
                        'controller' => 'Pms\Controller\Reports',
                        'action' => 'completeUsage',
                    )
                ),
            ),            
            'logout' => array(
                'type' => 'Zend\Mvc\Router\Http\Literal',
                'options' => array(
                    'route'    => '/pms/index/logout',
                    'defaults' => array(
//                        'controller' => 'Application\Controller\Index',
                        'controller' => 'Pms\Controller\Index',
                        'action'     => 'index',
                    ),
                ),
            ),
            // The following is a route to simplify getting started creating
            // new controllers and actions without needing to create a new
            // module. Simply drop new controllers in, and you can access them
            // using the path /application/:controller/:action
            'application' => array(
                'type'    => 'Literal',
                'options' => array(
                    'route'    => '/application',
                    'defaults' => array(
                        '__NAMESPACE__' => 'Application\Controller',
                        'controller'    => 'Index',
                        'action'        => 'index',
                    ),
                ),
                'may_terminate' => true,
                'child_routes' => array(
                    'default' => array(
                        'type'    => 'Segment',
                        'options' => array(
                            'route'    => '/[:controller[/:action]]',
                            'constraints' => array(
                                'controller' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'action'     => '[a-zA-Z][a-zA-Z0-9_-]*',
                            ),
                            'defaults' => array(
                            ),
                        ),
                    ),
                ),
            ),
        ),
    ),
    'service_manager' => array(
        'abstract_factories' => array(
            'Zend\Cache\Service\StorageCacheAbstractServiceFactory',
            'Zend\Log\LoggerAbstractServiceFactory',
        ),
        'factories' => array(
            'translator' => 'Zend\Mvc\Service\TranslatorServiceFactory',
            'navigation' => 'Zend\Navigation\Service\DefaultNavigationFactory',
        ),
    ),
    'translator' => array(
        'locale' => 'en_US',
        'translation_file_patterns' => array(
            array(
                'type'     => 'gettext',
                'base_dir' => __DIR__ . '/../language',
                'pattern'  => '%s.mo',
            ),
        ),
    ),
    'controllers' => array(
        'invokables' => array(
            'Application\Controller\Index' => Controller\IndexController::class
        ),
    ),
    'view_manager' => array(
        'display_not_found_reason' => true,
        'display_exceptions'       => true,
        'doctype'                  => 'HTML5',
        'not_found_template'       => 'error/404',
        'exception_template'       => 'error/index',
        'template_map' => array(
            'layout/layout'           => __DIR__ . '/../view/layout/layout.phtml',
            'application/index/index' => __DIR__ . '/../view/application/index/index.phtml',
            'error/404'               => __DIR__ . '/../view/error/404.phtml',
            'error/index'             => __DIR__ . '/../view/error/index.phtml',
        ),
        'template_path_stack' => array(
            __DIR__ . '/../view',
        ),
    ),
    // Placeholder for console routes
    'console' => array(
        'router' => array(
            'routes' => array(
            ),
        ),
    ),
    'navigation' => array(
        'default' => array(
            array(
                'label' => 'Home',
                'route' => 'home',
            ),
//            array(
//                'label' => 'Types',
//                'route' => 'pms/entity-type',
//            ),
//            array(
//                'label' => 'Definitions',
//                'route' => 'pms/entity-definition',
//            ),
//            array(
//                'label' => 'Objects',
//                'route' => 'pms/entity',
//            ),
            array(
                'label' => 'Reservations',
                'route' => 'reservations',                
            ),
            array(
                'label' => 'Availability',
                'route' => 'pms/entity',                
                'action' => 'fullList',
            ),
//            array(
//                'label' => 'Reports',
//                'route' => 'reports',
//            ),
            array(
                'label' => 'Log Out',
                'route' => 'logout',
            ),
        ),
        
    ),
);
