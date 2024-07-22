sudo apt-get update
sudo apt-get install -y build-essential autoconf bison re2c libxml2-dev libssl-dev libcurl4-openssl-dev pkg-config sqlite3 libsqlite3-dev libonig-dev

# Baixe o código-fonte do PHP
wget https://www.php.net/distributions/php-$PHP_VERSION.tar.gz
tar -xzf php-$PHP_VERSION.tar.gz
cd php-$PHP_VERSION

export PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig

# Configure a compilação com ZTS
./configure --prefix=/usr/local/php --enable-zts --enable-mbstring --enable-pcntl --enable-sockets --with-openssl --with-curl

# Compile e instale o PHP
make -j$(nproc)
sudo make install

# Instalar o PECL, se ainda não estiver instalado
sudo /usr/local/php/bin/pecl install swoole

# Ativar a extensão Swoole
echo "extension=swoole.so" | sudo tee -a /usr/local/php/lib/php.ini