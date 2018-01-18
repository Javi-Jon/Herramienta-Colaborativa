<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInite61454bc74cfd1701e655489f3e01c1a
{
    public static $files = array (
        '0e6d7bf4a5811bfa5cf40c5ccd6fae6a' => __DIR__ . '/..' . '/symfony/polyfill-mbstring/bootstrap.php',
    );

    public static $prefixLengthsPsr4 = array (
        'T' => 
        array (
            'Twig\\' => 5,
        ),
        'S' => 
        array (
            'Symfony\\Polyfill\\Mbstring\\' => 26,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'Twig\\' => 
        array (
            0 => __DIR__ . '/..' . '/twig/twig/src',
        ),
        'Symfony\\Polyfill\\Mbstring\\' => 
        array (
            0 => __DIR__ . '/..' . '/symfony/polyfill-mbstring',
        ),
    );

    public static $prefixesPsr0 = array (
        'T' => 
        array (
            'Twig_' => 
            array (
                0 => __DIR__ . '/..' . '/twig/twig/lib',
            ),
        ),
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInite61454bc74cfd1701e655489f3e01c1a::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInite61454bc74cfd1701e655489f3e01c1a::$prefixDirsPsr4;
            $loader->prefixesPsr0 = ComposerStaticInite61454bc74cfd1701e655489f3e01c1a::$prefixesPsr0;

        }, null, ClassLoader::class);
    }
}
