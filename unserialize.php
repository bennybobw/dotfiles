#!/usr/bin/env php
<?php

// Default file path
$default_file = '/tmp/unserialize.txt';

// Use first CLI argument if provided, otherwise default
$filename = $argv[1] ?? $default_file;

if (!file_exists($filename)) {
    fwrite(STDERR, "Error: File not found: $filename\n");
    exit(1);
}

$contents = file_get_contents($filename);

if ($contents === false) {
    fwrite(STDERR, "Error: Unable to read file: $filename\n");
    exit(1);
}

// Trim in case there's trailing whitespace/newlines
$contents = trim($contents);

$data = @unserialize($contents);

if ($data === false && $contents !== serialize(false)) {
    fwrite(STDERR, "Error: Failed to unserialize data.\n");
    exit(1);
}

print_r($data);
