# PHP ZTS INSTALLER

Change PHP version if needed:

```bash
# Defina a versão do PHP que deseja instalar
$ PHP_VERSION=8.3.0
$ ./install.sh
```

After this installation you should see:

```
Build complete.
Don't forget to run 'make test'.

Installing shared extensions:     /usr/local/php/lib/php/extensions/no-debug-zts-20230831/
Installing PHP CLI binary:        /usr/local/php/bin/
Installing PHP CLI man page:      /usr/local/php/php/man/man1/
Installing phpdbg binary:         /usr/local/php/bin/
Installing phpdbg man page:       /usr/local/php/php/man/man1/
Installing PHP CGI binary:        /usr/local/php/bin/
Installing PHP CGI man page:      /usr/local/php/php/man/man1/
Installing build environment:     /usr/local/php/lib/php/build/
Installing header files:          /usr/local/php/include/php/
Installing helper programs:       /usr/local/php/bin/
  program: phpize
  program: php-config
Installing man pages:             /usr/local/php/php/man/man1/
  page: phpize.1
  page: php-config.1
Installing PDO headers:           /usr/local/php/include/php/ext/pdo/
sudo: /usr/local/php/bin/pecl: command not found
extension=swoole.so
```

# Make Test

```
$ cd $PHP_VERSION && make test
```

Possible output:

```
=====================================================================
FAILED TEST SUMMARY
---------------------------------------------------------------------
openssl_error_string() tests (OpenSSL >= 3.0) [ext/openssl/tests/openssl_error_string_basic_openssl3.phpt]
openssl_private_decrypt() tests [ext/openssl/tests/openssl_private_decrypt_basic.phpt]
Bug #60120 (proc_open hangs when data in stdin/out/err is getting larger or equal to 2048) [ext/standard/tests/file/bug60120.phpt]
Using proc_open() with a command array (no shell) [ext/standard/tests/general_functions/proc_open_array.phpt]
Null pipes in proc_open() [ext/standard/tests/general_functions/proc_open_null.phpt]
Redirection support in proc_open [ext/standard/tests/general_functions/proc_open_redirect.phpt]
proc_open() with output socketpairs [ext/standard/tests/general_functions/proc_open_sockets1.phpt]
proc_open() with IO socketpairs [ext/standard/tests/general_functions/proc_open_sockets2.phpt]
proc_open() with socket and pipe [ext/standard/tests/general_functions/proc_open_sockets3.phpt]
Test setlocale() function : usage variations - setting system locale = 0 [ext/standard/tests/strings/setlocale_variation3.phpt]
Test setlocale() function : usage variations - setting system locale as null [ext/standard/tests/strings/setlocale_variation4.phpt]
Test setlocale() function : usage variations - Setting system locale as empty string [ext/standard/tests/strings/setlocale_variation5.phpt]
Bug #78323 Test exit code and error message for invalid parameters [sapi/cgi/tests/bug78323.phpt]
Bug #78323 Test exit code and error message for invalid parameters [sapi/cli/tests/bug78323.phpt]
=====================================================================

You may have found a problem in PHP.
This report can be saved and used to open an issue on the bug tracker at
https://github.com/php/php-src/issues
This gives us a better understanding of PHP's behavior.
Do you want to save this report in a file? [Yn]: Y
Report saved to: /home/antonio/sources/amqf/php-zts-installer/php-8.3.0/php_test_results_20240722_0537.txt
make: *** [Makefile:211: test] Error 1
```

## Enable extension:

PHP_ENV can be `apache2`, `cli` or `fpm`:

```bash
$ PHP_ENV=cli echo "extension=/usr/lib/php/20190902/openswoole.so" > /etc/php/$PHP_VERSION/cli/conf.d/openswoole.so
```

## Check installation success: 

```bash
$ php -m | grep swoole
```